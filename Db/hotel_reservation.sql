-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 16, 2019 at 02:07 AM
-- Server version: 5.7.24
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel_reservation`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
CREATE TABLE IF NOT EXISTS `bookings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `date_debut_sejour` date DEFAULT NULL,
  `date_fin_sejour` date DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `date_debut_sejour`, `date_fin_sejour`, `created`, `modified`) VALUES
(1, 25, '2019-10-17', '2019-10-21', '2019-10-12 23:08:52', '2019-10-12 23:08:52'),
(2, 26, '2019-10-16', '2019-10-18', '2019-10-13 22:29:54', '2019-10-13 22:29:54');

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
CREATE TABLE IF NOT EXISTS `files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = Active, 0 = Inactive',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `name`, `path`, `created`, `modified`, `status`) VALUES
(3, 'hotelSheraton.jpg', 'Files/', '2019-10-08 17:28:51', '2019-10-08 17:28:51', 1),
(4, 'hotelDubai.jpeg', 'Files/', '2019-10-09 16:17:54', '2019-10-09 16:17:54', 1),
(5, 'm.jpg', 'Files/', '2019-10-13 23:29:46', '2019-10-13 23:29:46', 0);

-- --------------------------------------------------------

--
-- Table structure for table `hotels`
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hotels`
--

INSERT INTO `hotels` (`id`, `hotel_name`, `hotel_address`, `hotel_postcode`, `url`, `created`, `modified`) VALUES
(4, 'Sheraton Hotels & Resorts', '2440 Autoroute des Laurentides, Laval, QC', 'H7T 1X5', 'https://www.marriott.com/hotels/travel/yulls-sheraton-laval-hotel/?scid=bb1a189a-fec3-4d19-a255-54ba596febe2', '2019-10-06 18:05:51', '2019-10-06 18:05:51'),
(5, 'Le St-Martin Hotel & Suites', '1400 Rue Maurice-Gauvin, Laval, QC', 'H7S 2P1', 'https://lestmartinlaval.com/fr/', '2019-10-06 18:08:15', '2019-10-06 18:08:15');

-- --------------------------------------------------------

--
-- Table structure for table `hotels_files`
--

DROP TABLE IF EXISTS `hotels_files`;
CREATE TABLE IF NOT EXISTS `hotels_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hotels_files`
--

INSERT INTO `hotels_files` (`id`, `hotel_id`, `file_id`) VALUES
(1, 5, 4),
(2, 4, 5);

-- --------------------------------------------------------

--
-- Table structure for table `i18n`
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
-- Table structure for table `room_bookings`
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
  KEY `fk_hotel_room_bookings` (`hotel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `room_bookings`
--

INSERT INTO `room_bookings` (`id`, `booking_id`, `hotel_id`, `number_room`, `room_type`, `created`, `modified`) VALUES
(1, 1, 4, 102, 'double', '2019-10-13 22:18:10', '2019-10-13 22:18:10');

-- --------------------------------------------------------

--
-- Table structure for table `users`
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
  `confirmed` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `role`, `address`, `phone`, `email`, `password`, `created`, `modified`, `confirmed`) VALUES
(19, 'Caramel Ola', 'other', '9863 rue laval X', '(438) 221-7654', 'caramelola@gmail.com', '$2y$10$ovG8iuMY2lo0CM0.Qs.umOFpZWrrEQ85e8raJuKPqYfPmtPv5HH72', '2019-10-06 22:24:54', '2019-10-12 19:16:06', NULL),
(20, 'Amina Atm', '', '9 rue Saint-Hubert', '(514) 123-7772', 'aminaatm16@gmail.com', '$2y$10$Yo3YA4haPjK7lxTfWLfz8u42WFrOnEOCa6hBCGFzsFY3KSQrEgPTq', '2019-10-06 22:27:55', '2019-10-06 22:27:55', NULL),
(21, 'admin ad', '', '78 rue Saint-Francois,Laval,QC', '(438) 779-9012', 'admin.ad@gmail.com', '$2y$10$aCel60siP8eyGYXNEs9fvO8ezrQpr7NY6LavRwa67lbHkmw1okxc2', '2019-10-06 22:40:33', '2019-10-06 22:43:58', NULL),
(22, 'Charlottee', '', '9 rue Saint-Hubert', '(438) 123-0967', 'charlotte@gmail.com', '$2y$10$Wg0kduiikycX6icebvvQLOyGE33ZE2BLPJq73tyMUkoQnW50OSWoi', '2019-10-07 12:21:59', '2019-10-07 12:26:59', NULL),
(24, 'Amina At', '', '9801 rue Saint-Leonard,Montreal,QC', '(438) 779-1111', 'amina.atmane@hotmail.com', '$2y$10$dIycwDkNQlESzWI.WjzIxuKTrQYWivgpgP6OGoeB4aORdU.jjWnAC', '2019-10-08 13:27:47', '2019-10-08 13:30:37', NULL),
(25, 'user4', 'admin', '4565 ddddd', '1111111', 'user4@hotmail.com', '$2y$10$amlG.J5EdMg41xvHzirT7uLB4j1W600Yx.hIm7bicR0QnfzP5i1BS', '2019-10-12 16:25:40', '2019-10-12 23:28:41', NULL),
(26, 'user5', 'other', '567 hhhhhhhhhh', '22222222', 'user5@hotmail.com', '$2y$10$Eq/z5BpY5PJNIrx4iSxmH.k27EbWCPgRu933rp4xxeNluY6ZqtrAG', '2019-10-12 22:02:12', '2019-10-12 22:02:12', NULL),
(27, 'user6', 'author', '235663634 a afsfafas', '22222222', 'user6@hotmail.com', '$2y$10$cZgya56.UkhtUifEDRR6ouX39sLRj2IMrFjv6g51Hi2AyDWOeAlu.', '2019-10-12 23:18:15', '2019-10-12 23:18:15', NULL),
(28, 'user7', 'other', 'Rue Beauchesne 4543', '22222222', 'user7@hotmail.com', '$2y$10$db1taxGRY9ZeM5L4uFsbxeuqZs6ucgO6eWkZJxvB6O1EVNXbO8ebW', '2019-10-12 23:46:50', '2019-10-12 23:46:50', NULL),
(29, 'user8', 'other', 'Rue Beauchesne 4543', '22222222', 'user8@hotmail.com', '$2y$10$pUSOJQkPpNcNMEIdtc/Mt..meL5s6pejyk/GYFu4.3gXy9rlaH2Hu', '2019-10-12 23:48:57', '2019-10-12 23:48:57', 0),
(30, 'user10', 'super_utilisateur', 'Rue Beauchesne 4543', '12233444', 'user10@hotmail.com', '$2y$10$TdoZGODX4Lr759Pex477cuLWTCrXO3/KoIpZg41AsAU113ac3SqD2', '2019-10-13 23:12:31', '2019-10-13 23:12:31', 0),
(31, 'x1', 'admin', 'Rue Beauchesne 4543', '22222222', 'x1@hotmail.com', '$2y$10$G8FBqxPJsFZpUOnB1ZkzHeLGiAq8YuqZGDw3X3GEFH9joR5vqCGqK', '2019-10-15 21:52:50', '2019-10-15 21:52:50', 0),
(32, 'x2', 'admin', 'Rue Beauchesne 4543', '1111111', 'x2@hotmail.com', '$2y$10$tYwqdrQHLwM1Wr0hOIsuRuSnqrzDT/GucWu230gfifs17cYZFnZXq', '2019-10-15 21:54:23', '2019-10-15 21:54:23', 0),
(33, 'x3', 'toto123', 'aslksa', '122333', 'x3@hotmail.cm', '$2y$10$RxxAqbFvmvgPVRxqFj5uQ.uVyXtWFDWBprYNik4nHcO/DTxPiC.SK', '2019-10-15 21:56:39', '2019-10-15 22:39:40', 1),
(34, 'x4', 'admin', 'ffsfsd', '1233333', 'x4@hotmail.com', '$2y$10$zKlIc3y6CSofTha6nHvj9O6Q7D5LvKPYr19yTSW3kw27HWqgWOnNm', '2019-10-15 22:01:40', '2019-10-15 22:36:19', 0),
(35, 'x8', 'Super-Utilisateur', 'Rue Beauchesne 4543', '12233444', 'x8@hotmail.com', '$2y$10$bhywOvYYvwTnuculBLXbZuh42JDhcK.Ud2rusGUZiTvwyGrS20VUO', '2019-10-15 22:42:34', '2019-10-15 22:42:34', NULL),
(36, 'u18', 'Super-Utilisateur', '4523 ddd', '1234555', 'u18@hotmail.com', '$2y$10$hFvKql2Zkrdry3RghpIbh.PeRUKAu52LQ9/zO8dMkTuTlPLMcBcku', '2019-10-15 22:46:33', '2019-10-15 22:46:33', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
