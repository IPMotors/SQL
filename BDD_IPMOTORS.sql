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
  `id` int(11) NOT NULL AUTO_INCREMENT,
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

INSERT INTO `clients` (`nom`, `prenom`, `adresse`, `cp`, `ville`, `telephone`, `dateNaissance`, `mail`, `idVehicule`) VALUES
('Da Silva', 'Gil', '10 av. maur.Utrillo', '95100', 'Argenteuil', '0699723335', '1991-10-05', 'gil@truk.com', 8),
('Diradourian', 'Lucille', '50 rue de quelque part', '27000', 'ville du 27', '0680756824', NULL, 'l.diradourian@ip-formation.net', 5),
('Andreo', 'Mickael', '123 ave du bordel', '77950', 'loinloin', '0198552454', NULL, 'mika@autretruk.net', 15),
('Bey', 'Sofiene', '150 boulevard des poufs', '92120', 'Boulogne', '0638515876', NULL, 'sofiene@machin.com', 23),
('Fauchoux', 'Simon', '26 place des nuls', '93620', 'Aulnay', '0954354896', NULL, 'simon@truk.fr', 14),
('Maurin', 'Antony', '140 avenue du fou', '91120', 'Palaiseau', '0785456030', NULL, 'antony@autremachin.de', 1);

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
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

INSERT INTO `marques` (`marque`) VALUES
('Renault'),
('Peugeot'),
('Citroen'),
('Volkswagen'),
('Ford'),
('Dacia'),
('BMW'),
('Opel'),
('Audi'),
('Mercedes'),
('Nissan'),
('Toyota'),
('Fiat');

-- --------------------------------------------------------

--
-- Structure de la table `pointfort`
--

DROP TABLE IF EXISTS `pointfort`;
CREATE TABLE IF NOT EXISTS `pointfort` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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

INSERT INTO `pointfort` (`designation`) VALUES
('Sécurité'),
('Confort'),
('Vitesse'),
('Acceleration'),
('Comportement');

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
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

INSERT INTO `types` (`type`) VALUES
('Utilitaires'),
('Cabriolets'),
('Coupés'),
('Monospaces'),
('Breaks'),
('Grandes berlines'),
('Moyennes berlines'),
('Citadines'),
('4x4');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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

INSERT INTO `utilisateurs` (`nom`, `prenom`, `login`, `mdp`, `mail`, `idGroupe`) VALUES
('nom admin', 'son prénom', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@ipmotors.com', 'A'),
('user', 'user prenom', 'user1', 'ee11cbb19052e40b07aac0ca060c23ee', 'user@truk.com', 'U');

-- --------------------------------------------------------

--
-- Structure de la table `vehicules`
--

DROP TABLE IF EXISTS `vehicules`;
CREATE TABLE IF NOT EXISTS `vehicules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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

INSERT INTO `vehicules` (`idtype`, `idmarque`, `modele`) VALUES
(1, 1, 'Kangoo'),
(1, 13, 'Ducato'),
(2, 2, '308'),
(2, 2, '207'),
(2, 4, 'Eos'),
(3, 2, 'Rcz'),
(3, 4, 'Scirocco'),
(3, 9, 'A5'),
(3, 1, 'Laguna'),
(9, 6, 'Duster'),
(9, 11, 'Qashqai'),
(4, 1, 'Scenic'),
(4, 3, 'C3'),
(4, 3, 'C4'),
(5, 2, '3008'),
(5, 1, 'Megane 3'),
(6, 8, 'Insignia'),
(6, 2, '508'),
(6, 3, 'C5'),
(7, 7, 'Serie 1'),
(7, 9, 'A3'),
(7, 5, 'Focus'),
(8, 1, 'Clio 3'),
(8, 6, 'Sandero'),
(8, 2, '207'),
(8, 3, 'C3'),
(8, 4, 'Polo 5');

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
