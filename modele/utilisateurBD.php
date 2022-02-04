<?php
    function crypter($str){
        return md5($str);
    }

    function verif_bd($pseudo, $mdp,&$profil){
        require('modele/connectBD.php');
        $sql="SELECT * FROM `utilisateur` WHERE pseudo=:pseudo AND mdp=:mdp";
        try {
			$mdp=crypter($mdp);

			$commande = $pdo->prepare($sql);
			$commande->bindParam('pseudo', $pseudo);
			$commande->bindParam('mdp', $mdp);
			$bool = $commande->execute();
			if ($bool) {
				$resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
			}
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die(); // On arrête tout.
		}
        if (count($resultat) == 0) {
			$profil=array(); // Pour qu'il y ait quand même quelque chose...
			return false; 
		}
		else {
			$profil = $resultat[0];
			return true;
		}
    }

	function enrg_bd($pseudo, $mdp, $adresse, $email) {
		require('modele/connectBD.php');
		$sql="INSERT INTO utilisateur(pseudo, mdp, adresse, email,roles) VALUES (:pseudo, :mdp, :adresse, :email,'user')";
		try {
			$mdp=crypter($mdp);

			$commande = $pdo->prepare($sql);
			$commande->bindParam(':pseudo', $pseudo);
			$commande->bindParam(':mdp', $mdp);
			$commande->bindParam(':adresse', $adresse);
			$commande->bindParam(':email', $email);
			return $commande->execute();
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de l'insertion : " . $e->getMessage() . "\n");
			die();
		}
	}

	function verifEmail($email){
		require('modele/connectBD.php');
        $sql="SELECT * FROM `utilisateur` WHERE email=:email";
        try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam('email', $email);
			$bool = $commande->execute();
			if ($bool) {
				$resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
			}
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die(); // On arrête tout.
		}
        return count($resultat) != 0;
	}

	function verifPseudo($pseudo){
		require('modele/connectBD.php');
        $sql="SELECT * FROM `utilisateur` WHERE pseudo=:pseudo";
        try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam('pseudo', $pseudo);
			$bool = $commande->execute();
			if ($bool) {
				$resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
			}
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die(); // On arrête tout.
		}
        return count($resultat) != 0;
	}

	
?>