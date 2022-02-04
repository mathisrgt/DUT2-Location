<?php
	function enrgBD($modele, $caract, $photo,$prix) {
		require('modele/connectBD.php');
		$sql="INSERT INTO vehicule(nomModele, caract, photo, prix VALUES (:modele, :caract, :photo, :prix)";
		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':modele', $modele);
			$commande->bindParam(':caract', $caract);
			$commande->bindParam(':photo', $photo);
			$commande->bindParam(':prix', $prix);
			return ($commande->execute()) ;
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de l'insertion : " . $e->getMessage() . "\n");
			die();
		}
	}

	function retrBD($idVehicule) {
		require('modele/connectBD.php');

		$sql = "DELETE FROM vehicule WHERE idVehic = :id";

		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':id', $idVehicule);
		
			return $commande->execute();
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de la suppression : " . $e->getMessage() . "\n");
			die();
		}
	}

	function getDispo(){
		require('modele/connectBD.php');
		$sql="select idVehic,nomModele, caract, photo,prix from vehicule;";
		$resultat = array();
		try{
			$commande = $pdo->prepare($sql);
			$bool = $commande->execute();
			if ($bool) $resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
		} catch (PDOException $e){
			$msg = utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die($msg);
		}
		return $resultat;
	}

	function recupVeh($idVeh){
		require("modele/connectBD.php");
		$sql="SELECT idVehic,nomModele,caract,photo,prix FROM vehicule WHERE idVehic=:idVeh";
		$resultat=array();
		  try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':idVeh', $idVeh);
			$bool= $commande->execute();
			if($bool) $resultat=$commande->fetchAll(PDO::FETCH_ASSOC);
		  }
		  catch (PDOException $e) {
			echo utf8_encode("Echec de l'affichage du véhicule : " . $e->getMessage() . "\n");
			die();
		  }
		  return $resultat;
	  }

	  function louerBD($idu,$idv,$dateD,$dateF,$valeur){
		  require("modele/connectBD.php");
		  if(verifdate($dateD,$dateF,$idv)){
			  $sql="INSERT INTO facture(idUtil,idVehic,dateD,dateF,valeur) VALUES(:idu,:idv,:dateD,:dateF,:valeur)";
			  try{
				  $commande=$pdo->prepare($sql);
				  $commande->bindParam(':idu', $idu);
				  $commande->bindParam(':idv', $idv);
				  $commande->bindParam(':dateD', $dateD);
				  $commande->bindParam(':dateF', $dateF);
				  $commande->bindParam(':valeur', $valeur);
				  $bool= $commande->execute();
				  if($bool)	return true;
				} catch(PDOException $e){
				echo utf8_encode("Echec lors de l'ajout dans la table facture : " . $e->getMessage() . "\n");
				die();
			  }
		  } else{
			  return false;
		  }
	  }

	   function verifdate($dateD,$dateF,$idv){
		  require("modele/connectBD.php");
		  //$sql="SELECT dateD,dateF FROM facture WHERE idVehic=:idv AND :dateDebut<dateD AND :dateFin>dateF";
		  $sql="SELECT dateD,dateF FROM facture WHERE idVehic=:idv AND dateD BETWEEN :dateDebut AND :dateFin OR dateF BETWEEN :dateDebut AND :dateFin AND :dateDebut<dateD AND :dateFin>dateF";
		  try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':idv', $idv);
			$commande->bindParam(':dateDebut', $dateD);
			$commande->bindParam(':dateFin', $dateF);
			$bool= $commande->execute();
			if($bool){
				$resultat=$commande->fetchAll(PDO::FETCH_ASSOC);
				if(empty($resultat)){
					return true; //on peux mettre une voiture dans cette date
				}
				else{
					return false; // on peux pas mettre de voiture dans cette date
				}
				}
			}
		  catch (PDOException $e) {
			echo utf8_encode("Echec de la vérification des dates " . $e->getMessage() . "\n");
			die();
		  }
	  }

	  function recupAllVehicule($idu){
		require("modele/connectBD.php");
		$sql="SELECT v.nomModele,v.caract,v.photo,v.prix,f.dateD,f.dateF FROM vehicule as v, facture as f WHERE v.idVehic=f.idVehic AND f.idUtil=:idu";
		$resultat=array();
		  try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':idu', $idu);
			$bool= $commande->execute();
			if($bool) $resultat=$commande->fetchAll(PDO::FETCH_ASSOC);
		  }
		  catch (PDOException $e) {
			echo utf8_encode("Echec de l'affichage des véhicule : " . $e->getMessage() . "\n");
			die();
		  }
		  return $resultat;
	}

	function recupAllUtilisateur(){
		require("modele/connectBD.php");
		$sql="SELECT idUtil,pseudo FROM utilisateur";
		$resultat=array();
		try {
			$commande = $pdo->prepare($sql);
			$bool= $commande->execute();
			if($bool) $resultat=$commande->fetchAll(PDO::FETCH_ASSOC);
		  }
		  catch (PDOException $e) {
			echo utf8_encode("Echec lors de la récuperation des utilisateurs : " . $e->getMessage() . "\n");
			die();
		  }
		  return $resultat;
	}

	function recupAllVoitureDeUtilisateur($idUSelectionner){
		require("modele/connectBD.php");
		$sql="SELECT idVehic,dateD,dateF,valeur FROM facture WHERE idUtil=:idu";
		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':idu', $idUSelectionner);
			$bool= $commande->execute();
			if($bool) $resultat=$commande->fetchAll(PDO::FETCH_ASSOC);
		  }
		  catch (PDOException $e) {
			echo utf8_encode("Echec lors de la récuperation des utilisateurs : " . $e->getMessage() . "\n");
			die();
		  }
		  return $resultat;
	}

	function recupAllVehiculeStock(){
		require("modele/connectBD.php");
		$sql="SELECT idVehic,nomModele,caract,photo,prix FROM vehicule";
		try {
			$commande = $pdo->prepare($sql);
			$bool= $commande->execute();
			if($bool) $resultat=$commande->fetchAll(PDO::FETCH_ASSOC);
		  }
		  catch (PDOException $e) {
			echo utf8_encode("Echec lors de la récuperation des véhicule du stock : " . $e->getMessage() . "\n");
			die();
		  }
		  return $resultat;
	}


	function vehiculeDejaEnLocation($idv){
		require("modele/connectBD.php");
		date_default_timezone_set("Europe/Paris");
		$dayDate=date("Y-m-d");
		$sql="SELECT idFac FROM facture WHERE idVehic=:idv AND dateD>:dayDate OR dateF>:dayDate";
		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':idv', $idv);
			$commande->bindParam(':dayDate', $dayDate);
			$bool= $commande->execute();
			if($bool){
				$resultat=$commande->fetchAll(PDO::FETCH_ASSOC);
				if(empty($resultat)){
					return true; //on peux supprimer la voiture
				}
				else{
					return false; // on peux pas supprimer la voiture
				}
				}
			}
		  catch (PDOException $e) {
			echo utf8_encode("Echec de la vérification des dates " . $e->getMessage() . "\n");
			die();
		  }
	}
	
	?> 