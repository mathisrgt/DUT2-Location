<?php
function ajoutVehicule()
{
	$modele = isset($_POST['nomModele']) ? trim($_POST['nomModele']) : '';
	$caract = isset($_POST['caract']) ? trim($_POST['caract']) : '';
	$prix = isset($_POST['prix']) ? trim($_POST['prix']) : '';
	$msgError = "";
	$msgSuccess = "";
	$taillemax = 20000000;
	
	if (isset($_FILES['file'])) {
		$tmpname = $_FILES['file']['tmp_name'];
		$name = $_FILES['file']['name'];
		$type = $_FILES['file']['type'];
		$error = $_FILES['file']['error'];
		$size = $_FILES['file']['size'];
		$tabextension = explode('.', $name);
		$extension = end($tabextension);
	}

	if ($modele == '' || $caract == '' || $name == '' || $prix == '')
		$msgError = (count($_POST) > 0) ? 'Champs manquant(s)' : '';
	else {
		require("./modele/vehiculeBD.php");

		if (($extension == "jpg" || $extension == "png") && ($size <= $taillemax) && ($error == 0)) {
			$nomunique = uniqid('', true);
			$name = $nomunique . "." . $extension;
			if (enrgBD($modele, $caract, $name, $prix)) {
				move_uploaded_file($tmpname, './vue/img/' . $name);
				$msgSuccess = $modele . ' ajouté !';
				$nexturl = "index.php?controle=vehicule&action=ajoutVehicule";
				header("Location:" . $nexturl);
			} else $msgError = 'Erreur de saisie';
		} else {
			$msgError = "Impossible d'ajouter un fichier avec cette extension";
		}
	}
	require("./vue/vehicule/ajoutVehicule.tpl");
}
function retrait()
{
	if (!isset($_GET['idVeh']))
		$msgError = 'Véhicule inconnu';
	else {
		require("./modele/vehiculeBD.php");
		if (!vehiculeDejaEnLocation($_GET['idVeh']))
			$msgError = 'Impossible de supprimer un véhicule en cours de location.';
		else if (retrBD($_GET['idVeh']))
			$msgError = 'Véhicule supprimé !';
		else
			$msgError = 'Impossible de supprimer le véhicule.';
	}
	$nexturl = "index.php?controle=vehicule&action=afficherStock&msgError=$msgError";
	header("Location:" . $nexturl);
}

function accueil()
{
	require("./modele/vehiculeBD.php");
	$vehicules = array();
	$vehicules = getDispo();
	require("./vue/layout/layout.tpl");
}

function compte()
{
	require("./modele/vehiculeBD.php");
	require("./vue/layout/layout.tpl");
}

function detailVehicule()
{
	$idVeh = $_GET['idVeh'];
	$dDebut = isset($_POST['dateDebut']) ? trim($_POST['dateDebut']) : '';
	$dFin = isset($_POST['dateFin']) ? trim($_POST['dateFin']) : '';
	$msgError = '';
	$msgSuccess = '';

	require("./modele/vehiculeBD.php");
	$vehiculeChoisit = array();
	$vehiculeChoisit = recupVeh($idVeh);

	if ($dDebut == '' || $dFin == '') {
		$msgError = (count($_POST) > 0) ? 'Champs manquant(s)' : '';
	} else {
		if ($dFin < $dDebut) {
			$msgError = "La date de début peux pas être supérieur à la date de fin";
		} else {
			//vérfi si les dates sont ok ou non
			if (verifdate($dDebut, $dFin, $idVeh)) {
				// initialisation d'un tableau pour le panier
				if (!isset($_SESSION['panier'])) {
					$_SESSION['panier'] = array();
					$_SESSION['panier']['idu'] = array();
					$_SESSION['panier']['idv'] = array();
					$_SESSION['panier']['dateD'] = array();
					$_SESSION['panier']['dateF'] = array();
					$_SESSION['panier']['valeur'] = array();
				}
				// vérifie si la voiture sélectionner est déja dans le panier si c le cas on bloque le fait de le rajouter (si il c tromper de date il pourras le modifier dans le panier plus tard)
				if (array_search($idVeh, $_SESSION['panier']['idv']) !== false) {
					$msgError = "Vous pouvez pas refaire une commande pour le même véhicule";
				} else {
					$dDebutTAB = explode("-", $dDebut);
					$dFinTAB = explode("-", $dFin);
					date_default_timezone_set("Europe/Paris");
					$resultatDate = mktime(0, 0, 0, $dFinTAB[1], $dFinTAB[2], $dFinTAB[0]) - mktime(0, 0, 0, $dDebutTAB[1], $dDebutTAB[2], $dDebutTAB[0]);
					$resultatDate = ($resultatDate / 86400) + 1;
					round($resultatDate, 2);
					array_push($_SESSION['panier']['idu'], $_SESSION['profil']['idUtil']);
					array_push($_SESSION['panier']['idv'], $idVeh);
					array_push($_SESSION['panier']['dateD'], $dDebut);
					array_push($_SESSION['panier']['dateF'], $dFin);
					array_push($_SESSION['panier']['valeur'], $vehiculeChoisit[0]['prix'] * $resultatDate);
					$msgSuccess = "Véhicule ajouté au panier";
				}
			} else {
				$msgError = "Nous sommes désolés... Le véhicule est déjà loué pendant les dates sélectionnées.";
			}
		}
	}

	require("./vue/layout/layout.tpl");
}


function afficherFlote()
{
	$idu = $_SESSION['profil']['idUtil'];
	require("./modele/vehiculeBD.php");
	$allvehicule = recupAllVehicule($idu);
	require("./vue/layout/layout.tpl");
}

function validerPanier()
{
	require("./modele/vehiculeBD.php");
	for ($i = 0; $i < count($_SESSION['panier']['idu']); $i++) {
		$idu = $_SESSION['panier']['idu'][$i];
		$idv = $_SESSION['panier']['idv'][$i];
		$dateD = $_SESSION['panier']['dateD'][$i];
		$dateF = $_SESSION['panier']['dateF'][$i];
		$valeur = $_SESSION['panier']['valeur'][$i];
		if (louerBD($idu, $idv, $dateD, $dateF, $valeur)) {
			$msgSuccess = "Tous les éléments vous ont bien été attribués.";
		} else {
			$msgError = "Une erreur est survenue au moment d'ajouter le produit numéro " . $i . "!";
		}
		// si tout vas bien on vas supprimer tout les éléments du panier vus qu'il on été pris en compte
		if ($msgSuccess == "Tous les éléments vous ont bien été attribués.") {
			for ($i = 0; $i < count($_SESSION['panier']['idu']); $i++) {
				unset($_SESSION['panier']['idu'][$i]);
				unset($_SESSION['panier']['idv'][$i]);
				unset($_SESSION['panier']['dateD'][$i]);
				unset($_SESSION['panier']['dateF'][$i]);
				unset($_SESSION['panier']['valeur'][$i]);
			}
		}
	}
	$nexturl = "index.php?controle=utilisateur&action=panier&msgSuccess=$msgSuccess";
	header("Location:" . $nexturl);
}

function supprimer()
{
	var_dump($_SESSION['panier']);
	$indiceASupprimer = $_GET['i'];
	$_SESSION['panier_tmp'] = array();
	$_SESSION['panier_tmp']['idu'] = array();
	$_SESSION['panier_tmp']['idv'] = array();
	$_SESSION['panier_tmp']['dateD'] = array();
	$_SESSION['panier_tmp']['dateF'] = array();
	$_SESSION['panier_tmp']['valeur'] = array();
	for ($i = 0; $i < count($_SESSION['panier']['idu']); $i++) {
		if ($i != $indiceASupprimer) {
			array_push($_SESSION['panier_tmp']['idu'], $_SESSION['panier']['idu'][$i]);
			array_push($_SESSION['panier_tmp']['idv'], $_SESSION['panier']['idv'][$i]);
			array_push($_SESSION['panier_tmp']['dateD'], $_SESSION['panier']['dateD'][$i]);
			array_push($_SESSION['panier_tmp']['dateF'], $_SESSION['panier']['dateF'][$i]);
			array_push($_SESSION['panier_tmp']['valeur'], $_SESSION['panier']['valeur'][$i]);
			$msgSuccess = "Votre commande a été supprimée du panier.";
		}
	}
	$_SESSION['panier'] = $_SESSION['panier_tmp'];
	unset($_SESSION['panier_tmp']);
	var_dump($_SESSION['panier']);
	$nexturl = "index.php?controle=utilisateur&action=panier&msgSuccess=$msgSuccess";
	header("Location:" . $nexturl);
}

function afficherLocationEntreprise()
{
	$msgError = "";
	$msgSuccess = "";
	$idUSelectionner = isset($_POST['idChoisit']) ? trim($_POST['idChoisit']) : '';
	require("./modele/vehiculeBD.php");
	$idU = recupAllUtilisateur();
	if ($idUSelectionner == '') {
		$msgError = (count($_POST) > 0) ? 'Champs manquant(s)' : '';
	} else {
		$voitureUtilisateur = recupAllVoitureDeUtilisateur($idUSelectionner);
		if (empty($voitureUtilisateur)) {
			$msgError = "Pas de location en cours pour cet utilisateur.";
		}
	}
	require("./vue/layout/layout.tpl");
}

function afficherStock()
{
	$msgError = isset($_GET['msgError']) ? trim($_GET['msgError']) : '';
	$msgSuccess = isset($_GET['msgSuccess']) ? trim($_GET['msgSuccess']) : '';
	require("./modele/vehiculeBD.php");
	$voiture = recupAllVehiculeStock();
	require("./vue/layout/layout.tpl");
}

function rendreIndisponibleVehicule()
{
	$idVeh = $_GET['idVeh'];
	$dDebut = isset($_POST['dateDebut']) ? trim($_POST['dateDebut']) : '';
	$dFin = isset($_POST['dateFin']) ? trim($_POST['dateFin']) : '';
	require("./modele/vehiculeBD.php");
	if ($dDebut == '' || $dFin == '') {
		$msgError = (count($_POST) > 0) ? 'Champs manquant(s)' : '';
	} else {
		if ($dFin < $dDebut) {
			$msgError = "La date de début peux pas être supérieur à la date de fin";
		} else {
			if (verifdate($dDebut, $dFin, $idVeh)) {
				if (louerBD($_SESSION['profil']['idUtil'], $idVeh, $dDebut, $dFin, 0)) $msgSuccess = "Le véhicule à été rendus indisponible pendant vos dates choisit";
			} else {
				$msgError = "Le véhciule est déja pris pendant ces dates la merci de sélectionner des autres";
			}
		}
	}
	$nexturl = "index.php?controle=vehicule&action=afficherStock&msgError=$msgError&msgSuccess=$msgSuccess";
	header("Location:" . $nexturl);
}
