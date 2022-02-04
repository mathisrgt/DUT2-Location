<nav class="navbar navbar-expand navbar-light bg-light flex-column flex-md-row bd-navbar">
	<a class="navbar-brand mr-0 mr-md-2 d-flex" href="./index.php?controle=vehicule&action=accueil" aria-label="Bootstrap">
		<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
			<path d="M23.5 7c.276 0 .5.224.5.5v.511c0 .793-.926.989-1.616.989l-1.086-2h2.202zm-1.441 3.506c.639 1.186.946 2.252.946 3.666 0 1.37-.397 2.533-1.005 3.981v1.847c0 .552-.448 1-1 1h-1.5c-.552 0-1-.448-1-1v-1h-13v1c0 .552-.448 1-1 1h-1.5c-.552 0-1-.448-1-1v-1.847c-.608-1.448-1.005-2.611-1.005-3.981 0-1.414.307-2.48.946-3.666.829-1.537 1.851-3.453 2.93-5.252.828-1.382 1.262-1.707 2.278-1.889 1.532-.275 2.918-.365 4.851-.365s3.319.09 4.851.365c1.016.182 1.45.507 2.278 1.889 1.079 1.799 2.101 3.715 2.93 5.252zm-16.059 2.994c0-.828-.672-1.5-1.5-1.5s-1.5.672-1.5 1.5.672 1.5 1.5 1.5 1.5-.672 1.5-1.5zm10 1c0-.276-.224-.5-.5-.5h-7c-.276 0-.5.224-.5.5s.224.5.5.5h7c.276 0 .5-.224.5-.5zm2.941-5.527s-.74-1.826-1.631-3.142c-.202-.298-.515-.502-.869-.566-1.511-.272-2.835-.359-4.441-.359s-2.93.087-4.441.359c-.354.063-.667.267-.869.566-.891 1.315-1.631 3.142-1.631 3.142 1.64.313 4.309.497 6.941.497s5.301-.184 6.941-.497zm2.059 4.527c0-.828-.672-1.5-1.5-1.5s-1.5.672-1.5 1.5.672 1.5 1.5 1.5 1.5-.672 1.5-1.5zm-18.298-6.5h-2.202c-.276 0-.5.224-.5.5v.511c0 .793.926.989 1.616.989l1.086-2z" />
		</svg>
		<h3 class="h5 font-weight-bold m-0">LocationFrance</h3>
	</a>

	<div class="navbar-nav-scroll mx-2">
		<ul class="navbar-nav bd-navbar-nav flex-row">
			<li class="nav-item <?php if ($action == "accueil") echo 'active'; ?>">
				<a href="./index.php?controle=vehicule&action=accueil" class="nav-link">Accueil</a>
			</li>

			<?php
			if (!isset($_SESSION['profil']))
				echo ('<li class="nav-item d-xs-block d-sm-block d-md-none ' . (($action == "ident") ? 'active' : '') . '"><a href="./index.php?controle=utilisateur&action=ident" class="nav-link">Se connecter</a></li>');
			else {
				echo ('<li class="nav-item d-xs-block d-sm-block d-md-none ' . (($action == "panier") ? 'active' : '') . '"><a href="./index.php?controle=utilisateur&action=panier" class="nav-link">Panier</a></li>');
				echo ('<li class="nav-item d-xs-block d-sm-block d-md-none ' . (($action == "compt") ? 'active' : '') . '"><a href="./index.php?controle=utilisateur&action=compt" class="nav-link">Mon Compte</a></li>');
			}
			?>

			<li class="nav-item">
				<a href="#" class="nav-link">Nous contacter</a>
			</li>
		</ul>
	</div>

	<ul class="navbar-nav flex-row ml-md-auto d-none d-md-flex">
		<?php
		if (!isset($_SESSION['profil']))
			echo ('<a href="./index.php?controle=utilisateur&action=ident" class="btn btn-outline-secondary d-none d-lg-inline-block mb-3 mb-md-0 ml-md-3">Se connecter</a>');
		else {
			if(isset($_SESSION['panier']['idv'])&&(count($_SESSION['panier']['idv'])>0))
				echo('<span class="badge badge-pill badge-light">' . count($_SESSION['panier']['idv']) . '</span>');
			echo '<a class="nav-item nav-link mr-md-2" href="./index.php?controle=utilisateur&action=panier" id="bd-versions" aria-haspopup="true" aria-expanded="false"><svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="#000000"><path d="M0 0h24v24H0z" fill="none" /><path d="M7 18c-1.1 0-1.99.9-1.99 2S5.9 22 7 22s2-.9 2-2-.9-2-2-2zM1 2v2h2l3.6 7.59-1.35 2.45c-.16.28-.25.61-.25.96 0 1.1.9 2 2 2h12v-2H7.42c-.14 0-.25-.11-.25-.25l.03-.12.9-1.63h7.45c.75 0 1.41-.41 1.75-1.03l3.58-6.49c.08-.14.12-.31.12-.48 0-.55-.45-1-1-1H5.21l-.94-2H1zm16 16c-1.1 0-1.99.9-1.99 2s.89 2 1.99 2 2-.9 2-2-.9-2-2-2z" /></svg></a>';
			echo '<li class="nav-item dropdown"><a class="nav-item nav-link dropdown-toggle mr-md-2" href="#" id="bd-versions" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="#000000"><path d="M0 0h24v24H0z" fill="none" /><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 3c1.66 0 3 1.34 3 3s-1.34 3-3 3-3-1.34-3-3 1.34-3 3-3zm0 14.2c-2.5 0-4.71-1.28-6-3.22.03-1.99 4-3.08 6-3.08 1.99 0 5.97 1.09 6 3.08-1.29 1.94-3.5 3.22-6 3.22z" /></svg></a><div class="dropdown-menu dropdown-menu-right" aria-labelledby="bd-versions"><a class="dropdown-item" href="./index.php?controle=utilisateur&action=panier">Mon panier</a><div class="dropdown-divider"></div><a class="dropdown-item" href="./index.php?controle=utilisateur&action=compt">Mon compte</a><a class="dropdown-item" href="./index.php?controle=vehicule&action=afficherFlote">Mes locations</a></div></li>';
		}
		?>
	</ul>

	<!--<a class="dropdown-item" href="https://getbootstrap.com/docs/3.3/">Location</a>
				<a class="dropdown-item" href="https://getbootstrap.com/docs/3.3/">Stock</a>
				<a class="dropdown-item" href="./index.php?controle=utilisateur&action=compt">Ajouter</a>
				<div class="dropdown-divider"></div>
				<a class="dropdown-item" href="./index.php?controle=utilisateur&action=compt">Loueurs</a>-->
</nav>