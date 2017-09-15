-- phpMyAdmin SQL Dump
-- version 4.2.10.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Ven 15 Septembre 2017 à 14:12
-- Version du serveur :  5.6.17
-- Version de PHP :  5.6.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `SuiviProd`
--

-- --------------------------------------------------------

--
-- Structure de la table `TabSuiviProd`
--

CREATE TABLE IF NOT EXISTS `TabSuiviProd` (
`id` int(11) NOT NULL,
  `date_enregistrement` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nom_de_piece` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `etat_machine` int(11) DEFAULT NULL,
  `cycle_time` double DEFAULT NULL,
  `nb_de_pieces` int(11) DEFAULT NULL,
  `nb_de_pieces_a_produire` int(11) DEFAULT NULL,
  `defaut` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=352324264 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `TabSuiviProd`
--

INSERT INTO `TabSuiviProd` (`id`, `date_enregistrement`, `nom_de_piece`, `etat_machine`, `cycle_time`, `nb_de_pieces`, `nb_de_pieces_a_produire`, `defaut`) VALUES
(1, '2017-09-14 14:18:19', 'pièceN1', 0, 0, 250, 0, 'test'),
(2, '2017-09-14 14:18:33', 'pièceN2', 0, 0, 500, 1, 'test'),
(3, '2017-09-14 14:18:52', 'pièceN3', 0, 0, 300, 1, 'test'),
(4, '2017-09-14 14:19:08', 'pièceN4', 0, 0, 200, 100, 'test'),
(352324256, '2017-09-14 14:19:27', 'pièceN5', 0, 0, 2032, 1200, 'test'),
(352324257, '2017-09-14 14:19:42', 'pièceN6', NULL, NULL, 258, 1000, NULL),
(352324258, '2017-09-14 14:19:59', 'pièceN7', 0, 0, 2032, 1200, 'test'),
(352324259, '2017-09-14 14:20:15', 'pièceN8', 0, 0, 2032, 1400, 'test'),
(352324260, '2017-09-14 14:20:29', 'pièceN9', 0, 0, 0, 1400, 'test'),
(352324261, '2017-09-15 22:00:00', 'piece de fin de sema', NULL, NULL, 248, 300, NULL),
(352324262, '2017-10-26 22:00:00', 'piece de octobre', NULL, NULL, 500, 5000, NULL),
(352324263, '2017-09-29 22:00:00', 'piece de fin du mois', NULL, NULL, 900, 30000, NULL);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `TabSuiviProd`
--
ALTER TABLE `TabSuiviProd`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `TabSuiviProd`
--
ALTER TABLE `TabSuiviProd`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=352324264;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
