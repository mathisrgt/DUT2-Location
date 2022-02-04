<!doctype html>
<html>

<head>
	<meta charset="utf-8">
	<title>Panier</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>

<body>
	<div class="container col-10 col-lg-8 col-xl-6">
		<div class="row my-5">
			<h1 class="h1">Mon panier</h1>
		</div>
		<?php
		$montant = 0;
		if ($msgSuccess != '') echo '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Succès : </strong>' . $msgSuccess . '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>';
		if (isset($_SESSION['panier']) && count($_SESSION['panier']['idu']) > 0) {
			echo '<div class="row">';
			echo ('<table class="table"><thead><tr><th scope="col">Numéro du véhicule</th><th scope="col">Date de début</th><th scope="col">Date de fin</th><th scope="col">Tarif</th><th></th></tr></thead><tbody>');

			for ($i = 0; $i < count($_SESSION['panier']['idu']); $i++) {

				$montant += $_SESSION['panier']['valeur'][$i];

				echo ("<tr>");
				//echo ("<td>" . utf8_encode($_SESSION['panier']['idu'][$i]) . "</td>"); 
				echo ('<th scope="row">' . utf8_encode($_SESSION['panier']['idv'][$i]) . '</th>');
				echo ("<td>" . utf8_encode($_SESSION['panier']['dateD'][$i]) . "</td>");
				echo ("<td>" . utf8_encode($_SESSION['panier']['dateF'][$i]) . "</td>");
				echo ("<td>" . utf8_encode($_SESSION['panier']['valeur'][$i]) . "€ </td>");
				echo ('<td><a href="./index.php?controle=vehicule&action=supprimer&i=' . $i . '"><svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="#000000"><path d="M0 0h24v24H0z" fill="none"/><path d="M6 19c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V7H6v12zM19 4h-3.5l-1-1h-5l-1 1H5v2h14V4z"/></svg></a></td>');
				echo ("</tr>");
			}
			echo ('<tr><th scope="row" colspan="3">Montant total</th><td>' . $montant . ' €</td><td><svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="#000000"><path d="M0 0h24v24H0z" fill="none"/><path d="M0 0h24v24H0V0z" fill="none"/><path d="M6 19c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V7H6v12zm2.46-7.12l1.41-1.41L12 12.59l2.12-2.12 1.41 1.41L13.41 14l2.12 2.12-1.41 1.41L12 15.41l-2.12 2.12-1.41-1.41L10.59 14l-2.13-2.12zM15.5 4l-1-1h-5l-1 1H5v2h14V4z"/></svg></td></tr>');
			echo ("</tbody></table>");

			echo '<div class="row mx-auto">';

			echo ('<a href="./index.php?controle=vehicule&action=validerPanier" class="btn btn-outline-success mt-2">Valider le panier</a>');
			echo '</div>';
		}

		if ($msgError != '') {
			echo '<p>' . $msgError . '</p>';
			echo ('<a href="./index.php?controle=vehicule&action=accueil" class="btn btn-outline-secondary my-4">Retour à l\'accueil</a>');
		}

		?>
	</div>

</body>

</html>