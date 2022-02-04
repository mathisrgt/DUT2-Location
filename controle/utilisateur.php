<?php
    function ident(){
        $pseudo=isset($_POST['pseudo'])?trim($_POST['pseudo']):'';
		$mdp=isset($_POST['mdp'])?trim($_POST['mdp']):'';
		$msgError="";
		$msgSuccess="";

		if ($pseudo=='' || $mdp=='') {
			$msgError = (count($_POST)>0)?'Champs manquant(s)':'';
		}
		else {
            
			require ("./modele/utilisateurBD.php");
			
			if (verif_bd($pseudo, $mdp, $profil)) {
				$_SESSION['profil'] = $profil;
				$nexturl = "index.php?controle=vehicule&action=accueil";
				header ("Location:" . $nexturl);
			}
			else {
				$msgError = "Utilisateur inconnu !";
			}
        }
		require("./vue/utilisateur/ident.tpl");
    }
    
	function deco() {
		session_destroy();
		
		$nexturl = "index.php?controle=vehicule&action=accueil";
		header ("Location:" . $nexturl);
	}

	function ajoutUtilisateur()  {
		$pseudo = isset($_POST['pseudo'])?trim($_POST['pseudo']):'';
		$mdp = isset($_POST['mdp'])?trim($_POST['mdp']):'';
		$adresse = isset($_POST['adresse'])?trim($_POST['adresse']):'';
		$email = isset($_POST['email'])?trim($_POST['email']):'';
		$msgError="";
		$msgSuccess="";

		if ($pseudo=='' || $mdp==''||$adresse=='' ||$email=='')
			$msgError = (count($_POST)>0)?'Champs manquant(s)':'';

		else { 
			require ("./modele/utilisateurBD.php");
			
			if(verifEmail($email)) $msgError = 'Un compte existe déjà pour cette adresse mail.';

			else if(verifPseudo($pseudo)) $msgError = 'Ce pseudo est déjà utilisé.';

			else {	
				if (enrg_bd($pseudo, $mdp, $adresse, $email) && verif_bd($pseudo, $mdp, $profil)) {
					$_SESSION['profil'] = $profil;
					setcookie('user_id', $_SESSION['profil']['idUtil']);
					$nexturl = "index.php?controle=vehicule&action=accueil";
					header ("Location:" . $nexturl);
				}
				else {
					$msgError = "Erreur de saisie";
				}
			}
		}
		
		require("./vue/utilisateur/inscription.tpl");
	}

	function compt() {

		require("./vue/layout/layout.tpl");
	}

	function panier(){
		$msgSuccess = isset($_GET['msgSuccess'])?trim($_GET['msgSuccess']):'';
		$msgError= isset($_POST['msgError'])?trim($_POST['msgError']):'';
		
		if(empty( $_SESSION['panier']["idu"])) $msgError="Votre panier est vide.";
		
		require("./vue/layout/layout.tpl");
	}

?>