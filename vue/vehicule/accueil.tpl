<!doctype html>
<html>

<head>
	<meta charset="utf-8">
	<title>Accueil</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>

<body>
	<div class="album pt-5">
	<div class="container col-10">
		<div class="row">
			<?php

			foreach ($vehicules as $v) {
				echo '<div class="mx-auto d-flex flex-wrap">';
				echo '<div class="card mb-4 box-shadow mx-auto" style="width: 21rem;">';
				echo '<img class="card-img-top" data-src="holder.js/100px225?theme=thumb&amp;bg=55595c&amp;fg=eceeef&amp;text=Thumbnail" alt="Thumbnail [100%x225]" style="height: 12rem; width: 100%; display: block;" src="./vue/img/' . utf8_encode($v['photo']) . '" alt="Card image cap" data-holder-rendered="true">';
				echo '<div class="card-body">';
				echo '<h5 class="card-title">' . utf8_encode($v['nomModele']) . '</h5>';
				echo '<p class="card-text">' . utf8_encode($v['caract']) . '</p>';

				echo '<div class="d-flex justify-content-between align-items-center">';

				if (isset($_SESSION['profil']))
					$nexturl = './index.php?controle=vehicule&action=detailVehicule&idVeh=' . $v['idVehic'];
				else
					$nexturl = './index.php?controle=utilisateur&action=ident';

				echo '<a href="' . $nexturl . '" class="btn btn-primary">Réserver</a>';

				echo '<small class="text-muted">' . utf8_encode($v['prix']) . '€ | mois</small>';
				echo ("</div></div></div></div>");
			}
			?>
			
		</div>

		<div class="row mt-4">
			<nav class="mx-auto">
				<ul class="pagination">
					<li class="page-item disabled">
						<a class="page-link" href="#" tabindex="-1">
							<span aria-hidden="true">&laquo;</span>
							<span class="sr-only">Précédent</span>
						</a>
					</li>
					<li class="page-item active">
						<a class="page-link" href="#">1 <span class="sr-only">(current)</span></a>
					</li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item">
						<a class="page-link" href="#">
							<span aria-hidden="true">&raquo;</span>
							<span class="sr-only">Suivant</span>
						</a>
					</li>
				</ul>
			</nav>
		</div>
		</div>
	</div>
</body>

</html>