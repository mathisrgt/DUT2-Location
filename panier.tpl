<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Panier</title>
		<link rel="stylesheet" href="vue/style/panier.css"/>
		<link rel="stylesheet" href="vue/style/menu.css">
	</head>
	<body>
		<?php
			echo("<table>");
			$motant=0;
			if(isset($_SESSION['panier'])){
				for($i=0;$i<count($_SESSION['panier']['idu']);$i++){
					$motant+=$_SESSION['panier']['valeur'][$i];
				echo ("<tr class='panier'>");
				echo ("<td>" . utf8_encode($_SESSION['panier']['idu'][$i]) . "</td>"); 
				echo ("<td>" . utf8_encode($_SESSION['panier']['idv'][$i]) . "</td>"); 
				echo ("<td>" . utf8_encode($_SESSION['panier']['dateD'][$i]) . "</td>"); 
				echo ("<td>" . utf8_encode($_SESSION['panier']['dateF'][$i]) . "</td>"); 
				echo ("<td>" . utf8_encode($_SESSION['panier']['valeur'][$i]) ."€ </td>"); 
				echo("<td><a href='./index.php?controle=vehicule&action=supprimer&i=$i'> Supprimer </a></td>");
				echo ("</tr>");
				echo("</table>");

				 }
			}
			echo ($msgPrixTotal.$motant." €");
				if($msgError!='')echo '<div class="alert alert-danger alert-dismissible fade show" role="alert"><strong>Erreur : </strong>' . $msgError . '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>';
			  if ($msgSuccess!="Tous les éléments vous ont bien été attribués." && $msgError!="Votre panier ne possède aucun élément"){
				echo("<a href='./index.php?controle=vehicule&action=validerPanier'> Valider le panier </a>");
			  }
		?>
        
	</body>
</html>