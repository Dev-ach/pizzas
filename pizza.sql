-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 03 juil. 2018 à 18:58
-- Version du serveur :  5.7.19
-- Version de PHP :  7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `pizza`
--

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adresse` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numt` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id`, `adresse`, `nom`, `numt`) VALUES
(1, 'rue bachir ibrahim el jadia', 'achraf', '0603050545'),
(2, 'rue 16  casablanca ', 'nabile', '0603025287');

-- --------------------------------------------------------

--
-- Structure de la table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
CREATE TABLE IF NOT EXISTS `ingredient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ingredient`
--

INSERT INTO `ingredient` (`id`, `name`) VALUES
(4, 'mozarella'),
(5, 'parmesan'),
(6, 'olives noires'),
(7, 'origan');

-- --------------------------------------------------------

--
-- Structure de la table `pizza`
--

DROP TABLE IF EXISTS `pizza`;
CREATE TABLE IF NOT EXISTS `pizza` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `pizza`
--

INSERT INTO `pizza` (`id`, `name`, `description`, `price`) VALUES
(4, '4 fromages', 'Pour les fans de fromage', 32.2),
(6, 'Marinara', 'La Marinara est souvent confondue à tort avec la pizza aux fruits de mer. Elles n\'ont pourtant rien en commun, tant au niveau de leurs ...', 45),
(7, 'Napolitaine', 'Excellence gastronomique célèbre dans le monde entier, la vraie pizza napolitaine possède une histoire qui en a fait une véritable icône du ...', 45),
(8, 'Reine', 'Une pizza reine légère et gourmande! Découvrez notre recette minceur pour une pizza reine maison allégée et réussie.', 30);

-- --------------------------------------------------------

--
-- Structure de la table `pizza_ingredient`
--

DROP TABLE IF EXISTS `pizza_ingredient`;
CREATE TABLE IF NOT EXISTS `pizza_ingredient` (
  `pizza_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  PRIMARY KEY (`pizza_id`,`ingredient_id`),
  KEY `IDX_6FF6C03FD41D1D42` (`pizza_id`),
  KEY `IDX_6FF6C03F933FE08C` (`ingredient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `pizza_ingredient`
--

INSERT INTO `pizza_ingredient` (`pizza_id`, `ingredient_id`) VALUES
(4, 4),
(4, 5);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `pizza_ingredient`
--
ALTER TABLE `pizza_ingredient`
  ADD CONSTRAINT `FK_6FF6C03F933FE08C` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_6FF6C03FD41D1D42` FOREIGN KEY (`pizza_id`) REFERENCES `pizza` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
