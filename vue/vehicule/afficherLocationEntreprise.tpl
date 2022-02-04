<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <title>Location par entreprise</title>
</head>

<body>

    <div class="container col-10 col-lg-8 col-xl-6">
        
        <div class="row mt-4 mx-auto">
            <?php
            if ($msgError != '') echo '<div class="mx-auto alert alert-danger alert-dismissible fade show" role="alert"><strong>Erreur : </strong>' . $msgError . '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>';
            if ($msgSuccess != '') echo '<div class="mx-auto alert alert-success alert-dismissible fade show" role="alert"><strong>Succès : </strong>' . $msgSuccess . '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>';
            ?>
        </div>

        <div class="row mx-auto my-2 text-center">
            <form action="index.php?controle=vehicule&action=afficherLocationEntreprise" method="post" class="form-vertical col-10 col-lg-6 mx-auto border rounded">
                <fieldset>
                    <legend class="my-2">Afficher les locations par entreprise</legend>
                    <div class="form-group my-2">
                        <label for="idChoisit">Choisir un client</label><br/>
                        <select name="idChoisit">
                            <?php
                            foreach ($idU as $i) {
                                $idUtil = $i['idUtil'];
                                $pseudo = $i['pseudo'];
                                echo ("<option value='$idUtil'> $pseudo</option>");
                            }
                            ?>
                        </select>
                    </div>
                    
                    <div class="form-group my-4">
                        <input type="submit" class="btn btn-outline-primary" value="Afficher les locations" />
                    </div>
                </fieldset>
            </form>
        </div>

        <div class="row my-4">
            <?php
            $montant = 0;

            if (isset($voitureUtilisateur) && count($voitureUtilisateur)>0) {
                echo ('<table class="table"><thead><tr><th scope="col">Modèle</th><th>Caractéristiques</th><th>Date de début</th><th scope="col">Date de fin</th><th scope="col">Tarif</th></tr></thead><tbody>');
                foreach ($voitureUtilisateur as $vu) {
                    $montant += $vu['valeur'];
                    echo ("<tr>");
                    echo ('<td>' . utf8_encode($vu['idVehic']) . '</td>');
                    echo ('<td>' . utf8_encode($vu['caract']) . '</td>');
                    echo ("<td>" . utf8_encode($vu['dateD']) . "</td>");
                    echo ("<td>" . utf8_encode($vu['dateF']) . "</td>");
                    echo ("<td>" . utf8_encode($vu['valeur']) . "€ </td>");
                    echo ("</tr>");
                }
                echo ('<tr><th scope="row" colspan="4">Montant total</th><td>' . $montant . ' €</td></tr>');
                echo ("</tbody></table>");
            }
            ?>
        </div>
    </div>

</body>

</html>