<!doctype html>
<html>

<head>
	<meta charset="utf-8">
	<title>Mon Compte</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>

<body>

	<div class="container col-10 col-lg-8 col-xl-6">

		<div class="row my-5">
			<h1 class="h1">Mon compte</h1>
		</div>
		
		<div class="row my-5">
			<div class="card" style="width: 20rem;">
				<ul class="list-group list-group-flush">
					<?php
					if ($_SESSION['profil']['roles'] == "admin") {
						echo '<li class="list-group-item"><a href="./index.php?controle=vehicule&action=afficherStock">Afficher le stock des voitures ></a></li><br/>';
						echo '<li class="list-group-item"><a href="./index.php?controle=vehicule&action=afficherLocationEntreprise">Afficher les locations des entreprises ></a></li>';
						echo '<li class="list-group-item"><a href="./index.php?controle=vehicule&action=ajoutVehicule">Ajouter un véhicule ></a></li>';
					} else
						echo '<li class="list-group-item"><a href="./index.php?controle=vehicule&action=afficherFlote">Afficher les locations en cours ></li></a>';
					?>
				</ul>
			</div>
		</div>

		<div class="row">
			<a href="./index.php?controle=utilisateur&action=deco" class="btn btn-outline-danger">Se déconnecter</a>
		</div>

	</div>

</body>

</html>