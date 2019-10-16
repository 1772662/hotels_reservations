-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 16 oct. 2019 à 02:08
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `hotel_reservation`
--

-- --------------------------------------------------------

--
-- Structure de la table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
CREATE TABLE IF NOT EXISTS `bookings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `date_debut_sejour` date DEFAULT NULL,
  `date_fin_sejour` date DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `date_debut_sejour`, `date_fin_sejour`, `created`, `modified`) VALUES
(1, 20, '2019-05-02', '2019-05-09', '2019-10-11 04:03:37', '2019-10-11 04:03:37');

-- --------------------------------------------------------

--
-- Structure de la table `files`
--

DROP TABLE IF EXISTS `files`;
CREATE TABLE IF NOT EXISTS `files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = Active, 0 = Inactive',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `files`
--

INSERT INTO `files` (`id`, `name`, `path`, `created`, `modified`, `status`) VALUES
(3, 'hotelSheraton.jpg', 'Files/', '2019-10-08 17:28:51', '2019-10-08 17:28:51', 1),
(4, 'hotelDubai.jpeg', 'Files/', '2019-10-09 16:17:54', '2019-10-09 16:17:54', 1),
(5, '1280px-TeamViewer_logo.svg.png', 'Files/', '2019-10-11 17:12:38', '2019-10-11 17:12:38', 1);

-- --------------------------------------------------------

--
-- Structure de la table `hotels`
--

DROP TABLE IF EXISTS `hotels`;
CREATE TABLE IF NOT EXISTS `hotels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hotel_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hotel_postcode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `id_2` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `hotels`
--

INSERT INTO `hotels` (`id`, `hotel_name`, `hotel_address`, `hotel_postcode`, `url`, `created`, `modified`) VALUES
(4, 'Sheraton Hotels & Resorts', '2440 Autoroute des Laurentides, Laval, QC', 'H7T 1X5', 'https://www.marriott.com/hotels/travel/yulls-sheraton-laval-hotel/?scid=bb1a189a-fec3-4d19-a255-54ba596febe2', '2019-10-06 18:05:51', '2019-10-06 18:05:51'),
(5, 'Le St-Martin Hotel & Suites', '1400 Rue Maurice-Gauvin, Laval, QC', 'H7S 2P1', 'https://lestmartinlaval.com/fr/', '2019-10-06 18:08:15', '2019-10-06 18:08:15'),
(6, 'Sheraton Hotels LAVAL', '2440 Autoroute des Laurentides, Laval, QC', 'H7T 1X5', 'https://www.marriott.com/hotels/travel/yulls-sheraton-laval-hotel/?scid=bb1a189a-fec3-4d19-a255-54ba596febe2', '2019-10-11 03:05:49', '2019-10-11 03:05:49');

-- --------------------------------------------------------

--
-- Structure de la table `hotels_files`
--

DROP TABLE IF EXISTS `hotels_files`;
CREATE TABLE IF NOT EXISTS `hotels_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`,`hotel_id`,`file_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `hotels_files`
--

INSERT INTO `hotels_files` (`id`, `hotel_id`, `file_id`) VALUES
(1, 5, 4),
(2, 6, 4),
(3, 6, 5);

-- --------------------------------------------------------

--
-- Structure de la table `i18n`
--

DROP TABLE IF EXISTS `i18n`;
CREATE TABLE IF NOT EXISTS `i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `foreign_key` int(10) NOT NULL,
  `field` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `I18N_LOCALE_FIELD` (`locale`,`model`,`foreign_key`,`field`),
  KEY `I18N_FIELD` (`model`,`foreign_key`,`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phinxlog`
--

DROP TABLE IF EXISTS `phinxlog`;
CREATE TABLE IF NOT EXISTS `phinxlog` (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `phinxlog`
--

INSERT INTO `phinxlog` (`version`, `migration_name`, `start_time`, `end_time`, `breakpoint`) VALUES
(20191011160421, 'Initial', '2019-10-11 20:04:22', '2019-10-11 20:04:22', 0),
(20191011164636, 'Initial', '2019-10-11 20:46:37', '2019-10-11 20:46:37', 0);

-- --------------------------------------------------------

--
-- Structure de la table `room_bookings`
--

DROP TABLE IF EXISTS `room_bookings`;
CREATE TABLE IF NOT EXISTS `room_bookings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `number_room` int(11) NOT NULL,
  `room_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_bookings_room_bookings` (`booking_id`),
  KEY `fk_hotel_room_bookings` (`hotel_id`),
  KEY `id` (`id`,`booking_id`,`hotel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `room_bookings`
--

INSERT INTO `room_bookings` (`id`, `booking_id`, `hotel_id`, `number_room`, `room_type`, `created`, `modified`) VALUES
(1, 1, 4, 4, 'Lit simple', '2019-10-11 04:04:12', '2019-10-11 04:04:12');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `role`, `address`, `phone`, `email`, `password`, `created`, `modified`) VALUES
(19, 'Caramel Ola', '', '9863 rue laval', '(438) 221-7654', 'caramelola@gmail.com', '$2y$10$ovG8iuMY2lo0CM0.Qs.umOFpZWrrEQ85e8raJuKPqYfPmtPv5HH72', '2019-10-06 22:24:54', '2019-10-06 22:24:54'),
(20, 'Amina Atm', '', '9 rue Saint-Hubert', '(514) 123-7772', 'aminaatm16@gmail.com', '$2y$10$Yo3YA4haPjK7lxTfWLfz8u42WFrOnEOCa6hBCGFzsFY3KSQrEgPTq', '2019-10-06 22:27:55', '2019-10-06 22:27:55'),
(21, 'admin ad', '', '78 rue Saint-Francois,Laval,QC', '(438) 779-9012', 'admin.ad@gmail.com', '$2y$10$aCel60siP8eyGYXNEs9fvO8ezrQpr7NY6LavRwa67lbHkmw1okxc2', '2019-10-06 22:40:33', '2019-10-06 22:43:58'),
(22, 'Charlottee', '', '9 rue Saint-Hubert', '(438) 123-0967', 'charlotte@gmail.com', '$2y$10$Wg0kduiikycX6icebvvQLOyGE33ZE2BLPJq73tyMUkoQnW50OSWoi', '2019-10-07 12:21:59', '2019-10-07 12:26:59'),
(24, 'Amina At', '', '9801 rue Saint-Leonard,Montreal,QC', '(438) 779-1111', 'amina.atmane@hotmail.com', '$2y$10$dIycwDkNQlESzWI.WjzIxuKTrQYWivgpgP6OGoeB4aORdU.jjWnAC', '2019-10-08 13:27:47', '2019-10-08 13:30:37'),
(25, 'amina2', 'admin', '9863 rue laval', '(438) 779-1111', 'amina2@hotmail.com', '$2y$10$B7sEkeAIuxpIrDy7q19RAOZ0/fJ.nxgQmcnH2D0LHzisCprkJYOPm', '2019-10-11 03:04:27', '2019-10-11 03:04:27'),
(26, 'aminaa', 'super-utilisateur', '9863 rue laval', '(438) 779-1111', 'ami0@gmail.com', '$2y$10$SY73xzAhx1VrEBj/GtSFC.f5YqDDZsXo3f/TIK.LJU6YDm4DRxGMa', '2019-10-14 22:12:52', '2019-10-14 22:12:52'),
(27, 'amina5', 'super-utilisateur', '9087 rue Saint-Leonard,Montreal,QC', '(514) 123-7772', 'amina.atmane00000@gmail.com', '$2y$10$fhVbMfttLnzsH4sKBo2R2e8MFS271pLDh6VbiTS4Q35rMr/MjDCLu', '2019-10-15 00:14:19', '2019-10-15 00:14:19'),
(28, 'user006', 'super-utilisateur', '9863 rue laval', '(438) 679-9000', 'user006@gmail.com', '$2y$10$aJ/1psTQcyPS1HDqDkfsjuebGUJVe6dn5ywyj.cYBWJ/f2qeAsRzm', '2019-10-15 00:21:58', '2019-10-15 00:21:58'),
(29, 'user007', 'super-utilisateur', '9 rue Saint-Hubert', '(514) 123-7772', 'user07@gmail.com', '$2y$10$KQxKWrF.qkzB5gEo/ZySy.XCbRo7NfGZh8WbQdJHXL/rp7pritnl.', '2019-10-15 00:22:43', '2019-10-15 00:22:43'),
(30, 'user009', 'super-utilisateur', '9 rue Saint-Hubert', '(438) 679-9000', 'user009@gmail.com', '$2y$10$jAOxDGof0n0Ce76MvK00wOGvH5YTjUVyYPlf.IJsKfHjxaJXqait.', '2019-10-15 00:25:02', '2019-10-15 00:25:02'),
(31, 'user123', 'super-utilisateur', '9087 rue Saint-Leonard,Montreal,QC', '(438) 679-9000', 'user123@gmail.com', '$2y$10$dX2sL0/vXIepGkxr0QpV5eV3bKDYUXedt.OmMw.zWwggnUCzeVfiO', '2019-10-15 00:28:31', '2019-10-15 00:28:31'),
(32, 'user35', 'super-utilisateur', '9087 rue Saint-Leonard,Montreal,QC', '(438)221-1912', 'user35@gmail.com', '$2y$10$67C/P1Jr12ylyEoBWIEhouJBDeyDen6sq.DEm7GBVg2o4pC7nlEYm', '2019-10-15 00:30:13', '2019-10-15 00:30:13'),
(33, 'amina1', 'super-utilisateur', '9801 rue Saint-Leonard,Montreal,QC', '(514) 123-7772', 'amina1@gmail.com', '$2y$10$oXPwyEpjAomp7QFpbXvWYerlPXjrHgdjcX6PUhVJldIW3wWiRWbK6', '2019-10-15 00:32:37', '2019-10-15 00:32:37'),
(34, 'user76', 'super-utilisateur', '9087 rue Saint-Leonard,Montreal,QC', '(438) 779-1111', 'u@gmail.com', '$2y$10$pdHgNBABikEIL4P.umRIzexjCou86rS8py7sI9IhLXRsz9SdrfQSG', '2019-10-15 00:34:34', '2019-10-15 00:34:34'),
(35, 'Justine Parqi', 'super-utilisateur', '78 rue Saint-Francois,Laval,QC', '(438)221-1912', 'j@gmail.com', '$2y$10$lWUAMVCfim6ClNjEtndy6Oeoi3bCU2KI6OFm.1EyBNKoiLxFDz916', '2019-10-15 00:37:15', '2019-10-15 00:37:15'),
(36, 'pera1', 'super-utilisateur', '3467 rue Saint-Martin,Laval,QC', '(438) 679-9000', 'pera1@gmail.com', '$2y$10$RiNlKHN5WO1GQg8cRrD0/u3gl3n9KsMFEU2WDyVrXjlLKLIutwvVq', '2019-10-15 00:43:17', '2019-10-15 00:43:17'),
(37, 'kioo', 'super-utilisateur', '9 rue Saint-Hubert', '(438) 779-1111', 'kioo@gmail.com', '$2y$10$kNf/xJffFfoyiNVr8Js8PeWkzCKbLU6.jHuUVRhfMo5jZfs7C4Mtq', '2019-10-15 00:49:12', '2019-10-15 00:49:12'),
(38, 'lion', 'super-utilisateur', '3467 rue Saint-Martin,Laval,QC', '(438) 001-1912', 'lion@gmail.com', '$2y$10$2YQLKhVGLUewZA65Q2fMdO3mDAp8t1qbgLBQyiPi1zdl9LFztrAf6', '2019-10-15 00:50:53', '2019-10-15 00:50:53'),
(39, 'Justine Parom', 'super-utilisateur', '3467 rue Saint-Martin,Laval,QC', '(438) 123-0985', 'justineparom@gmail.com', '$2y$10$u9.ZhPNwh6PzGmWNEYO3gOE8L2OU6CJOYofwBRBmIuW/dM8nO2nVO', '2019-10-15 00:53:42', '2019-10-15 00:53:42'),
(40, 'amin', 'super-utilisateur', '9863 rue laval', '(438) 123-0985', 'amin@gmail.com', '$2y$10$Ye0tq/AYyfHgZJalXAfY3O9LmnfaZgA1BehR1QgoIHfqw/VzYeH.e', '2019-10-15 00:59:15', '2019-10-15 00:59:15'),
(41, 'aminaau', 'super-utilisateur', '78 rue Saint-Francois,Laval,QC', '(438) 123-0985', 'abchj@gmail.com', '$2y$10$K84gxQqrRqppHA.9T7LdduYaf/9avr.DgBfa8LPl.z2yZPG8/TBv.', '2019-10-15 01:03:06', '2019-10-15 01:03:06'),
(42, 'aminaa23', 'super-utilisateur', '78 rue Saint-Francois,Laval,QC', '(438) 779-1111', 'charlot3te@gmail.com', '$2y$10$URJtCm.ohmer4.F7Joq3ie4RFELnVI0QyNGzVgSNV0VIAZ4PDupHC', '2019-10-15 01:06:02', '2019-10-15 01:06:02'),
(43, 'amina11111.atmane@hotmail.com', 'super-utilisateur', '9863 rue laval', '(438) 679-9000', 'ami11naatm16@gmail.com', '$2y$10$6y4Kgd5kw1xj/FxgbMGBq.UISgxgCnN6A0S.GvNIPZ1wxwvPzroSW', '2019-10-16 01:06:18', '2019-10-16 01:06:18'),
(44, 'amina atmtt', 'super-utilisateur', '78 rue Saint-Francois,Laval,QC', '(438) 221-1912', 'aminaatmm@gmail.com', '$2y$10$Qc1V.lAq0USL3SoVHbH87OCxn941BNdqTwspNizta9js3u3dZRGii', '2019-10-16 01:57:11', '2019-10-16 01:57:11');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `room_bookings`
--
ALTER TABLE `room_bookings`
  ADD CONSTRAINT `room_bookings_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`),
  ADD CONSTRAINT `room_bookings_ibfk_2` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
