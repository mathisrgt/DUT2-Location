<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <title>Nouveau véhicule</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>

<body>

  <div class="container">

    <div class="row mt-5">

      <form class="form-vertical col-10 col-lg-6 col-xl-4 mx-auto border rounded mt-5" action="index.php?controle=vehicule&action=ajoutVehicule" method="post" enctype="multipart/form-data">
        <fieldset>
          <legend class="font-weight-bold mt-3">Nouveau véhicule</legend>

          <div class="form-group">
            <div> <?php if ($msgError != '') echo '<div class="alert alert-danger alert-dismissible fade show" role="alert"><strong>Erreur : </strong>' . $msgError . '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>';
                  if ($msgSuccess != '') echo '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Succès : </strong>' . $msgSuccess . '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>'; ?> </div>
          </div>

          <div class="form-group">
            <label for="nomModele">Nom du modèle</label>
            <input name="nomModele" type="text" class="form-control" value="" placeholder="Ex : 206" required autofocus />
          </div>

          <div class="form-group">
            <label for="caract">Caractéristiques</label>
            <input name="caract" type="text" class="form-control" value="" placeholder="Ex : 200ch" required />
          </div>

          <div class="form-group">
            <label caract="prix">Prix (€)</label>
            <input name="prix" type="number" class="form-control" value="1000,00" step="0.01" required />
          </div>

          <div class="form-group">
            <label for="file">Image</label>
            <input name="file" type="file" class="form-control" />
          </div>

          <div class="form-group text-center my-4">
            <input type="submit" class="btn btn-success col-3" value="Ajouter" />
            <a href="./index.php?controle=utilisateur&action=compt" class="btn btn-danger col-3">Annuler</a>
          </div>

        </fieldset>
      </form>

    </div>
  </div>
</body>

</html>