-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Dim 07 Novembre 2021 à 23:28
-- Version du serveur :  5.7.11
-- Version de PHP :  5.6.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `projetlocation`
--

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

CREATE TABLE `facture` (
  `idFac` int(11) NOT NULL,
  `idUtil` int(11) DEFAULT NULL,
  `idVehic` int(11) DEFAULT NULL,
  `dateD` date NOT NULL,
  `dateF` date NOT NULL,
  `valeur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `facture`
--

INSERT INTO `facture` (`idFac`, `idUtil`, `idVehic`, `dateD`, `dateF`, `valeur`) VALUES
(1, 1, 1, '2021-11-08', '2021-11-12', 250);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `idUtil` int(11) NOT NULL,
  `pseudo` varchar(50) NOT NULL,
  `mdp` varchar(255) NOT NULL,
  `adresse` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `roles` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`idUtil`, `pseudo`, `mdp`, `adresse`, `email`, `roles`) VALUES
(1, 'greg', 'ea26b0075d29530c636d6791bb5d73f4', 'greg', 'greg@gmail.com', 'user'),
(3, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin', 'admin@gmail.com', 'admin');

-- --------------------------------------------------------

--
-- Structure de la table `vehicule`
--

CREATE TABLE `vehicule` (
  `idVehic` int(11) NOT NULL,
  `nomModele` varchar(50) NOT NULL,
  `caract` varchar(500) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `prix` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `vehicule`
--

INSERT INTO `vehicule` (`idVehic`, `nomModele`, `caract`, `photo`, `prix`) VALUES
(1, 'Renault Zoe', 'voiture electrique, 5 places, couleur bleu, voiture manuelle', '61884f6f005ed5.17911509.jpg', 50),
(2, 'Peugeot 208', 'voiture electrique, 5 places, couleur rouge, voiture manuelle', '61885019966068.94162470.jpg', 40),
(3, 'BMW Serie 1', 'voiture essence, 5 places, couleur blanche, voiture manuelle', '618850ba494c83.50095845.jpg', 60),
(4, 'Citroen DS7', 'voiture essence, 5 places, couleur noir, voiture automatique', '6188518c948098.66594073.jpg', 70),
(5, 'Audi A4 automatique', 'voiture essence, 5 places, couleur gris, voiture automatique', '61885216de7c80.19287625.jpg', 50),
(6, 'BMW X1', 'voiture essence, 5 places, couleur bleu, voiture manuelle', '618852b1c1eaa6.76636954.jpg', 80),
(7, 'Toyota Corolla', 'voiture hybride, 5 places, couleur blanc, voiture automatique', '618857031ce329.40523731.jpg', 60),
(9, 'Audi Q3', 'voiture essence, 5 places, couleur blanc, voiture manuelle', '61885f39e166b8.21133011.jpg', 70);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `facture`
--
ALTER TABLE `facture`
  ADD PRIMARY KEY (`idFac`),
  ADD UNIQUE KEY `facture_idUtil_idVehic_dateD` (`idUtil`,`idVehic`,`dateD`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`idUtil`),
  ADD UNIQUE KEY `pseudo` (`pseudo`),
  ADD UNIQUE KEY `adresse` (`adresse`);

--
-- Index pour la table `vehicule`
--
ALTER TABLE `vehicule`
  ADD PRIMARY KEY (`idVehic`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `facture`
--
ALTER TABLE `facture`
  MODIFY `idFac` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `idUtil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `vehicule`
--
ALTER TABLE `vehicule`
  MODIFY `idVehic` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
