-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 19 Mars 2019 à 10:22
-- Version du serveur :  5.6.16
-- Version de PHP :  5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `g9`
--

-- --------------------------------------------------------

--
-- Structure de la table `info_user`
--

CREATE TABLE IF NOT EXISTS `info_user` (
  `user_login` varchar(30) NOT NULL,
  `id_partie` int(30) NOT NULL AUTO_INCREMENT,
  `nb_coup` int(30) NOT NULL,
  `combinaisons` varchar(60) NOT NULL,
  PRIMARY KEY (`user_login`,`id_partie`),
  UNIQUE KEY `id_partie` (`id_partie`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=692 ;

--
-- Contenu de la table `info_user`
--

INSERT INTO `info_user` (`user_login`, `id_partie`, `nb_coup`, `combinaisons`) VALUES
('admin', 543, 10, 'B,A,B,A,B,A,B,A,B,C'),
('admin', 544, 2, 'B,C'),
('admin', 545, 2, 'D,C'),
('admin', 546, 2, 'B,C'),
('admin', 547, 4, 'B,A,B,C'),
('admin', 548, 2, 'D,C'),
('admin', 549, 2, 'D,C'),
('admin', 550, 2, 'B,C'),
('admin', 551, 2, 'D,C'),
('admin', 552, 8, 'D,A,D,A,B,A,B,C'),
('admin', 553, 2, 'B,C'),
('admin', 554, 2, 'D,C'),
('admin', 555, 2, 'B,C'),
('admin', 556, 10, 'B,A,D,A,D,A,B,A,B,C'),
('admin', 557, 6, 'B,A,B,A,B,C'),
('admin', 558, 2, 'D,C'),
('admin', 559, 2, 'D,C'),
('admin', 560, 2, 'B,C'),
('admin', 561, 4, 'B,A,B,C'),
('admin', 562, 8, 'D,A,B,A,B,A,D,C'),
('admin', 563, 2, 'D,C'),
('admin', 564, 2, 'B,C'),
('admin', 565, 6, 'D,A,D,A,D,C'),
('admin', 581, 2, 'D,C'),
('admin', 582, 4, 'B,A,B,C'),
('admin', 583, 2, 'D,C'),
('admin', 584, 6, 'B,A,B,A,B,C'),
('admin', 585, 4, 'B,A,B,C'),
('admin', 586, 2, 'B,C'),
('admin', 587, 2, 'B,C'),
('admin', 588, 2, 'B,C'),
('admin', 589, 6, 'D,A,B,A,B,C'),
('admin', 590, 8, 'D,A,B,A,B,A,B,C'),
('admin', 591, 10, 'B,A,D,A,B,A,D,A,D,C'),
('admin', 592, 2, 'D,C'),
('admin', 593, 4, 'D,A,D,C'),
('admin', 594, 2, 'B,C'),
('admin', 595, 8, 'B,A,B,A,D,A,B,C'),
('admin', 596, 4, 'D,A,D,C'),
('admin', 597, 2, 'B,C'),
('admin', 598, 2, 'B,C'),
('admin', 599, 2, 'D,C'),
('admin', 600, 2, 'D,C'),
('user', 566, 6, 'B,A,B,A,D,C'),
('user', 567, 2, 'B,C'),
('user', 568, 4, 'B,A,B,C'),
('user', 569, 4, 'D,A,D,C'),
('user', 570, 4, 'D,A,D,C'),
('user', 571, 4, 'B,A,D,C'),
('user', 572, 6, 'D,A,B,A,B,C'),
('user', 573, 6, 'B,A,B,A,D,C'),
('user', 574, 4, 'B,A,D,C'),
('user', 575, 2, 'D,C'),
('user', 576, 8, 'D,A,D,A,D,A,B,C'),
('user', 577, 6, 'B,A,B,A,B,C'),
('user', 578, 2, 'B,C'),
('user', 579, 2, 'D,C'),
('user', 580, 4, 'B,A,D,C'),
('user', 601, 4, 'D,A,B,C'),
('user', 602, 4, 'B,A,D,C'),
('user', 603, 2, 'B,C'),
('user', 604, 2, 'D,C'),
('user', 605, 2, 'D,C'),
('user', 606, 12, 'D,A,D,A,B,A,D,A,D,A,B,C'),
('user', 607, 6, 'D,A,B,A,B,C'),
('user', 608, 4, 'B,A,D,C'),
('user', 609, 2, 'D,C'),
('user', 610, 2, 'B,C'),
('user', 611, 8, 'B,A,D,A,D,A,B,C'),
('user', 612, 4, 'D,A,D,C'),
('user', 613, 2, 'B,C'),
('user', 614, 4, 'B,A,B,C'),
('user', 615, 2, 'D,C'),
('user', 616, 8, 'D,A,D,A,B,A,B,C'),
('user', 617, 2, 'D,C'),
('user', 618, 4, 'B,A,D,C'),
('user', 619, 2, 'D,C'),
('user', 620, 4, 'B,A,D,C'),
('user', 621, 4, 'B,A,D,C'),
('user', 622, 2, 'B,C'),
('user', 623, 2, 'B,C'),
('user', 624, 2, 'D,C'),
('user', 625, 8, 'B,A,D,A,B,A,B,C'),
('user', 626, 2, 'D,C'),
('user', 627, 2, 'B,C'),
('user', 628, 4, 'D,A,D,C'),
('user', 629, 6, 'B,A,D,A,B,C'),
('user', 630, 14, 'B,A,D,A,D,A,D,A,B,A,D,A,D,C'),
('user', 631, 6, 'D,A,D,A,D,C'),
('user', 632, 2, 'B,C'),
('user', 633, 2, 'B,C'),
('user', 634, 6, 'B,A,B,A,B,C'),
('user', 635, 4, 'B,A,D,C'),
('user', 636, 4, 'B,A,D,C'),
('user', 637, 6, 'D,A,B,A,D,C'),
('user', 638, 2, 'D,C'),
('user', 639, 4, 'B,A,D,C'),
('user', 640, 2, 'B,C'),
('user', 641, 4, 'D,A,D,C'),
('user', 642, 10, 'B,A,D,A,D,A,D,A,D,C'),
('user', 643, 2, 'B,C'),
('user', 644, 6, 'D,A,D,A,D,C'),
('user', 645, 6, 'B,A,B,A,B,C'),
('user', 646, 2, 'D,C'),
('user', 647, 6, 'B,A,B,A,B,C'),
('user', 648, 2, 'D,C'),
('user', 649, 10, 'D,A,D,A,B,A,D,A,D,C'),
('user', 650, 4, 'B,A,B,C'),
('user', 651, 6, 'D,A,B,A,D,C'),
('user', 652, 4, 'D,A,B,C'),
('user', 653, 4, 'D,A,D,C'),
('user', 654, 4, 'B,A,D,C'),
('user', 655, 2, 'D,C'),
('user', 656, 4, 'B,A,D,C'),
('user', 657, 2, 'D,C'),
('user', 658, 2, 'B,C'),
('user', 659, 4, 'D,A,B,C'),
('user', 660, 4, 'D,A,B,C'),
('user', 661, 12, 'B,A,B,A,B,A,D,A,D,A,B,C'),
('user', 662, 6, 'B,A,D,A,D,C'),
('user', 663, 6, 'B,A,B,A,B,C'),
('user', 664, 4, 'D,A,D,C'),
('user', 665, 4, 'B,A,B,C'),
('user', 666, 4, 'D,A,B,C'),
('user', 667, 4, 'B,A,B,C'),
('user', 668, 2, 'D,C'),
('user', 669, 8, 'D,A,D,A,D,A,D,C'),
('user', 670, 4, 'D,A,B,C'),
('user', 671, 2, 'B,C'),
('user', 672, 2, 'B,C'),
('user', 673, 2, 'B,C'),
('user', 674, 6, 'D,A,B,A,D,C'),
('user', 675, 2, 'B,C'),
('user', 676, 2, 'D,C'),
('user', 677, 2, 'D,C'),
('user', 678, 6, 'B,A,D,A,D,C'),
('user', 679, 2, 'B,C'),
('user', 680, 2, 'B,C'),
('user', 681, 4, 'B,A,B,C'),
('user', 682, 2, 'B,C'),
('user', 683, 2, 'B,C'),
('user', 684, 2, 'D,C'),
('user', 685, 6, 'D,A,B,A,D,C'),
('user', 686, 2, 'B,C'),
('user', 687, 4, 'D,A,B,C'),
('user', 688, 8, 'B,A,B,A,D,A,D,C'),
('user', 689, 2, 'D,C'),
('user', 690, 14, 'D,A,B,A,B,A,B,A,B,A,B,A,D,C'),
('user', 691, 2, 'B,C');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE IF NOT EXISTS `utilisateur` (
  `login` varchar(30) NOT NULL,
  `mdp` varchar(64) NOT NULL,
  `droit` varchar(30) NOT NULL,
  PRIMARY KEY (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`login`, `mdp`, `droit`) VALUES
('admin', 'admin', 'admin'),
('user', 'user', 'user');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
