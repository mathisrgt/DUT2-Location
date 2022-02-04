<!doctype html>
<html>

<head>
	<meta charset="utf-8">
	<title>Accueil</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>

<body>

	<div class="container col-11">
		<div class="row col-12">
			<a href="./index.php?controle=vehicule&action=accueil" class="btn btn-outline-secondary my-4">Retour à l'accueil</a>
		</div>

		<div class="row col-12 d-flex justify-content-center">
			<div class="col-12 col-xl-6 m-2">
				<div class="card col-12 p-0 mx-auto">
					<?php
					foreach ($vehiculeChoisit as $v) {
						echo ('<img class="card-img-top" src="./vue/img/' . utf8_encode($v['photo']) . '"/>');
						echo ('<div class="card-body"><h5 class="card-title font-weight-bold">' . utf8_encode($v['nomModele']) . '</h5>');
						echo ('<p class="card-text">' . utf8_encode($v['caract']) . '</p>');
						echo ('<p class="card-text">' . utf8_encode($v['prix']) . ' €</p></div>');
					}
					?>
				</div>
			</div>

			<div class="col-lg-12 col-xl-5 m-2">
				<div class="card col-sm-12 col-md-8 col-lg-5 col-xl-8 p-0 mx-auto">
					<div class="card-header">
						<strong>Réserver</strong>
					</div>

					<div class="card-body">
						<?php
						foreach ($vehiculeChoisit as $v) {
							$idVehic = $v["idVehic"];
						}
						if ($msgError != '') echo '<div class="alert alert-danger alert-dismissible fade show" role="alert"><strong>Erreur : </strong>' . $msgError . '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>';
						if ($msgSuccess != '') echo '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Erreur : </strong>' . $msgSuccess . '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>';
						?>

						<form class="form-vertical" action="index.php?controle=vehicule&action=detailVehicule&idVeh=<?php echo $idVehic; ?>" method="post">
							<div class="form-group d-flex justify-content-between">
								<label for="dateDebut">Date de début</label>
								<input type="date" name="dateDebut">
							</div>

							<div class="form-group d-flex justify-content-between">
								<label for="dateFin">Date de fin</label>
								<input type="date" name="dateFin">
							</div>

							<div class="form-group">
								<input type="submit" class="btn btn-primary btn-block" value="Réserver le véhicule">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>