<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <title>Vehicule en stock</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>

<body>
    <div class="container col-10 col-lg-8 col-xl-6">

        <div class="row my-5">
            <h1 class="h1">Stock</h1>
        </div>

        <div class="row">

            <div class="alert alert-warning alert-dismissible fade show col-12 d-xs-block d-sm-block d-md-none" role="alert"><strong>Attention : </strong> Cette page n'est pas adaptée à la taille de l'écran.<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>

            <?php

            if ($msgError != '') echo '<div class="alert alert-danger alert-dismissible fade show" role="alert"><strong>Erreur : </strong>' . $msgError . '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>';
            if ($msgSuccess != '') echo '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Succès : </strong>' . $msgSuccess . '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>';

            echo ('<table class="table"><thead><tr><th scope="col">Photo</th><th scope="col">Modèle</th><th scope="col">Caractéristiques</th><th scope="col">Prix</th><th scope="col">Indisponible</th><th></th></tr></thead><tbody>');

            foreach ($voiture as $v) {
                $idVeh = $v['idVehic'];

                echo ("<tr>");
                echo ('<td class="col-2"><img class="img-thumbnail" src="./vue/img/' . utf8_encode($v['photo']) . '"> </td>');
                echo ('<td class="col-2">' . utf8_encode($v['nomModele']) . '</td>');
                echo ('<td class="col-2">' . utf8_encode($v['caract']) . '</td>');
                echo ('<td class="col-1">' . utf8_encode($v['prix']) . '€ </td>');

                echo ('<td class="col-4"><form class="form-vertical border rounded col-11 py-2 px-3" action="index.php?controle=vehicule&action=rendreIndisponibleVehicule&idVeh=$idVeh" method="post"><div class="form-group mt-2"><label for="dateDebut">Date de début</label><input name="dateDebut" type="date" class="form-control" required></div><div class="form-group"><label for="dateFin">Date de fin</label><input name="dateFin" type="date" class="form-control" required></div><div class="form-group text-center"><input type="submit" class="btn btn-outline-secondary" value="Mettre indisponible" /></div></form></td>');

                echo ("<td scope='row' class='col-1'><a href='./index.php?controle=vehicule&action=retrait&idVeh=$idVeh'><svg xmlns='http://www.w3.org/2000/svg' height='24px' viewBox='0 0 24 24' width='24px' fill='#000000'><path d='M0 0h24v24H0z' fill='none'/><path d='M6 19c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V7H6v12zM19 4h-3.5l-1-1h-5l-1 1H5v2h14V4z'/></svg></a></td>");
                echo ("</tr>");
            }
            echo ("</tbody></table>");
            ?>
        </div>
    </div>
</body>

</html>