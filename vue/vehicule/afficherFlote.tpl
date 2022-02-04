<!doctype html>
<html>

<head>
	<meta charset="utf-8">
	<title>Flote de véhicule</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

	<link rel="stylesheet" href="vue/style/afficherFlote.css">
	<link rel="stylesheet" href="vue/style/menu.css">
</head>

<body>
	<div class="container col-10 col-lg-8 col-xl-6">
		<div class="row my-5">
			<h1 class="h1">Mes locations</h1>
		</div>
		<div class="row my-5">
			<?php
			echo ('<table class="table"><thead><tr><th scope="col">Photo</th><th scope="col">Modèle</th><th scope="col">Caractéristiques</th><th scope="col">Tarif</th><th>Date de début</th><th>Date de fin</th></tr></thead><tbody>');
			foreach ($allvehicule as $v) {
				echo ("<tr>");
				echo ('<td scope="row" class="col-2"><img class="img-thumbnail" src="./vue/img/' . utf8_encode($v['photo']) . '"> </td>');
				echo ('<td class="col-2">' . utf8_encode($v['nomModele']) . '</td>');
				echo ('<td class="col-2">' . utf8_encode($v['caract']) . '</td>');
				echo ('<td class="col-2">' . utf8_encode($v['prix']) . '€ </td>');
				echo ('<td class="col-2">' . utf8_encode($v['dateD']) . '</td>');
				echo ('<td class="col-2">' . utf8_encode($v['dateF']) . '</td>');
				echo ('</tr>');
			}
			echo ("</tbody></table>");
			?>
		</div>
	</div>
</body>

</html>