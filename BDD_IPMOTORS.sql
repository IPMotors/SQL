-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mer 21 Mai 2014 à 11:41
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `ipmotors_grp4`
--
CREATE DATABASE IF NOT EXISTS `ipmotors_grp4` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `ipmotors_grp4`;

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

DROP TABLE IF EXISTS `clients`;
CREATE TABLE IF NOT EXISTS `clients` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `cp` char(5) NOT NULL,
  `ville` varchar(200) NOT NULL,
  `telephone` char(10) NOT NULL,
  `dateNaissance` date DEFAULT NULL,
  `mail` varchar(255) NOT NULL,
  `idVehicule` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idVehicule` (`idVehicule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vider la table avant d'insérer `clients`
--

TRUNCATE TABLE `clients`;
--
-- Contenu de la table `clients`
--

INSERT INTO `clients` (`id`, `nom`, `prenom`, `adresse`, `cp`, `ville`, `telephone`, `dateNaissance`, `mail`, `idVehicule`) VALUES
(1, 'Da Silva', 'Gil', '10 av. maur.Utrillo', '95100', 'Argenteuil', '0699723335', '1991-10-05', 'gil@truk.com', 8),
(2, 'Diradourian', 'Lucille', '50 rue de quelque part', '27000', 'ville du 27', '0680756824', NULL, 'l.diradourian@ip-formation.net', 5),
(3, 'Andreo', 'Mickael', '123 ave du bordel', '77950', 'loinloin', '0198552454', NULL, 'mika@autretruk.net', 15),
(4, 'Bey', 'Sofiene', '150 boulevard des poufs', '92120', 'Boulogne', '0638515876', NULL, 'sofiene@machin.com', 23),
(5, 'Fauchoux', 'Simon', '26 place des nuls', '93620', 'Aulnay', '0954354896', NULL, 'simon@truk.fr', 14),
(6, 'Maurin', 'Antony', '140 avenue du fou', '91120', 'Palaiseau', '0785456030', NULL, 'antony@autremachin.de', 1);

-- --------------------------------------------------------

--
-- Structure de la table `groupes`
--

DROP TABLE IF EXISTS `groupes`;
CREATE TABLE IF NOT EXISTS `groupes` (
  `id` char(1) NOT NULL,
  `groupe` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vider la table avant d'insérer `groupes`
--

TRUNCATE TABLE `groupes`;
--
-- Contenu de la table `groupes`
--

INSERT INTO `groupes` (`id`, `groupe`) VALUES
('A', 'Administrateur'),
('U', 'Utilisateur');

-- --------------------------------------------------------

--
-- Structure de la table `marques`
--

DROP TABLE IF EXISTS `marques`;
CREATE TABLE IF NOT EXISTS `marques` (
  `id` int(11) NOT NULL,
  `marque` varchar(175) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vider la table avant d'insérer `marques`
--

TRUNCATE TABLE `marques`;
--
-- Contenu de la table `marques`
--

INSERT INTO `marques` (`id`, `marque`) VALUES
(1, 'Renault'),
(2, 'Peugeot'),
(3, 'Citroen'),
(4, 'Volkswagen'),
(5, 'Ford'),
(6, 'Dacia'),
(7, 'BMW'),
(8, 'Opel'),
(9, 'Audi'),
(10, 'Mercedes'),
(11, 'Nissan'),
(12, 'Toyota'),
(13, 'Fiat');

-- --------------------------------------------------------

--
-- Structure de la table `pointfort`
--

DROP TABLE IF EXISTS `pointfort`;
CREATE TABLE IF NOT EXISTS `pointfort` (
  `id` int(11) NOT NULL,
  `designation` varchar(175) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vider la table avant d'insérer `pointfort`
--

TRUNCATE TABLE `pointfort`;
--
-- Contenu de la table `pointfort`
--

INSERT INTO `pointfort` (`id`, `designation`) VALUES
(1, 'Sécurité'),
(2, 'Confort'),
(3, 'Vitesse'),
(4, 'Acceleration'),
(5, 'Comportement');

-- --------------------------------------------------------

--
-- Structure de la table `posseder`
--

DROP TABLE IF EXISTS `posseder`;
CREATE TABLE IF NOT EXISTS `posseder` (
  `idClient` int(11) NOT NULL,
  `idPointFort` int(11) NOT NULL,
  `futur` tinyint(1) NOT NULL,
  `ordre` int(11) NOT NULL,
  PRIMARY KEY (`idClient`,`idPointFort`,`futur`),
  KEY `idPointFort` (`idPointFort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vider la table avant d'insérer `posseder`
--

TRUNCATE TABLE `posseder`;
-- --------------------------------------------------------

--
-- Structure de la table `types`
--

DROP TABLE IF EXISTS `types`;
CREATE TABLE IF NOT EXISTS `types` (
  `id` int(11) NOT NULL,
  `type` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vider la table avant d'insérer `types`
--

TRUNCATE TABLE `types`;
--
-- Contenu de la table `types`
--

INSERT INTO `types` (`id`, `type`) VALUES
(1, 'Utilitaires'),
(2, 'Cabriolets'),
(3, 'Coupés'),
(4, 'Monospaces'),
(5, 'Breaks'),
(6, 'Grandes berlines'),
(7, 'Moyennes berlines'),
(8, 'Citadines'),
(9, '4x4');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `login` varchar(35) NOT NULL,
  `mdp` varchar(32) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `idGroupe` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idGroupe` (`idGroupe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vider la table avant d'insérer `utilisateurs`
--

TRUNCATE TABLE `utilisateurs`;
--
-- Contenu de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `nom`, `prenom`, `login`, `mdp`, `mail`, `idGroupe`) VALUES
(1, 'nom admin', 'son prénom', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@ipmotors.com', 'A'),
(2, 'user', 'user prenom', 'user1', 'ee11cbb19052e40b07aac0ca060c23ee', 'user@truk.com', 'U');

-- --------------------------------------------------------

--
-- Structure de la table `vehicules`
--

DROP TABLE IF EXISTS `vehicules`;
CREATE TABLE IF NOT EXISTS `vehicules` (
  `id` int(11) NOT NULL,
  `idtype` int(11) NOT NULL,
  `idmarque` int(11) NOT NULL,
  `modele` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idtype` (`idtype`),
  KEY `idmarque` (`idmarque`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vider la table avant d'insérer `vehicules`
--

TRUNCATE TABLE `vehicules`;
--
-- Contenu de la table `vehicules`
--

INSERT INTO `vehicules` (`id`, `idtype`, `idmarque`, `modele`) VALUES
(1, 1, 1, 'Kangoo'),
(2, 1, 13, 'Ducato'),
(3, 2, 2, '308'),
(4, 2, 2, '207'),
(5, 2, 4, 'Eos'),
(6, 3, 2, 'Rcz'),
(7, 3, 4, 'Scirocco'),
(8, 3, 9, 'A5'),
(9, 3, 1, 'Laguna'),
(10, 9, 6, 'Duster'),
(11, 9, 11, 'Qashqai'),
(12, 4, 1, 'Scenic'),
(13, 4, 3, 'C3'),
(14, 4, 3, 'C4'),
(15, 5, 2, '3008'),
(16, 5, 1, 'Megane 3'),
(17, 6, 8, 'Insignia'),
(18, 6, 2, '508'),
(19, 6, 3, 'C5'),
(20, 7, 7, 'Serie 1'),
(21, 7, 9, 'A3'),
(22, 7, 5, 'Focus'),
(23, 8, 1, 'Clio 3'),
(24, 8, 6, 'Sandero'),
(25, 8, 2, '207'),
(26, 8, 3, 'C3'),
(27, 8, 4, 'Polo 5');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`idVehicule`) REFERENCES `vehicules` (`id`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `posseder`
--
ALTER TABLE `posseder`
  ADD CONSTRAINT `posseder_ibfk_1` FOREIGN KEY (`idClient`) REFERENCES `clients` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `posseder_ibfk_2` FOREIGN KEY (`idPointFort`) REFERENCES `pointfort` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Contraintes pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD CONSTRAINT `utilisateurs_ibfk_1` FOREIGN KEY (`idGroupe`) REFERENCES `groupes` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Contraintes pour la table `vehicules`
--
ALTER TABLE `vehicules`
  ADD CONSTRAINT `vehicules_ibfk_2` FOREIGN KEY (`idmarque`) REFERENCES `marques` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `vehicules_ibfk_1` FOREIGN KEY (`idtype`) REFERENCES `types` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
