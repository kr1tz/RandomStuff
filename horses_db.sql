-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 21, 2019 at 11:59 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `horses_db`
--
CREATE DATABASE IF NOT EXISTS `horses_db` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `horses_db`;

-- --------------------------------------------------------

--
-- Table structure for table `assetphotos`
--

DROP TABLE IF EXISTS `assetphotos`;
CREATE TABLE IF NOT EXISTS `assetphotos` (
  `assetid` int(100) NOT NULL,
  `assettablename` varchar(100) NOT NULL,
  `photourl` varchar(1000) NOT NULL,
  UNIQUE KEY `assetid` (`assetid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assetphotos`
--

INSERT INTO `assetphotos` (`assetid`, `assettablename`, `photourl`) VALUES
(200, 'Horse', 'Arabian'),
(201, 'Horse', 'Shire'),
(202, 'Horse', '\"/default.png\"');

-- --------------------------------------------------------

--
-- Table structure for table `horse`
--

DROP TABLE IF EXISTS `horse`;
CREATE TABLE IF NOT EXISTS `horse` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `action` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `breed` varchar(100) NOT NULL,
  `height` int(100) NOT NULL,
  `weight` int(100) NOT NULL,
  `age` int(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `horse`
--

INSERT INTO `horse` (`id`, `action`, `name`, `breed`, `height`, `weight`, `age`) VALUES
(3, 'Horse', 'Bojangles', 'Clydesdale', 17, 757, 7),
(4, 'Horse', 'Bojo', 'Stallion', 18, 740, 6),
(5, 'Horse', 'Momo', 'Mustang', 17, 755, 8),
(6, 'Horse', 'Halo', 'Shire', 20, 760, 5),
(23, 'Horse', 'Lightning', 'Mustang', 19, 800, 7);

-- --------------------------------------------------------

--
-- Table structure for table `jockey`
--

DROP TABLE IF EXISTS `jockey`;
CREATE TABLE IF NOT EXISTS `jockey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `build` varchar(100) NOT NULL,
  `height` int(100) NOT NULL,
  `weight` int(100) NOT NULL,
  `age` int(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jockey`
--

INSERT INTO `jockey` (`id`, `action`, `name`, `build`, `height`, `weight`, `age`) VALUES
(155, 'Jockey', 'Martin Lawrence', 'Average', 171, 180, 23),
(156, 'Jockey', 'Kristian Velasques', 'Average', 171, 186, 25),
(157, 'Jockey', 'Larry Johnson', 'Athletic', 190, 210, 26),
(158, 'Jockey', 'Gabriel Bannister', 'Average', 182, 190, 27),
(159, 'Jockey', 'Leo Bello', 'Athletic', 175, 155, 23);

-- --------------------------------------------------------

--
-- Table structure for table `jockeyonhorse`
--

DROP TABLE IF EXISTS `jockeyonhorse`;
CREATE TABLE IF NOT EXISTS `jockeyonhorse` (
  `jockeyid` int(100) NOT NULL,
  `horseid` int(100) NOT NULL,
  UNIQUE KEY `jockeyid` (`jockeyid`,`horseid`),
  KEY `fk_horse` (`horseid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jockeyonhorse`
--

INSERT INTO `jockeyonhorse` (`jockeyid`, `horseid`) VALUES
(155, 3),
(156, 4),
(157, 5);

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
CREATE TABLE IF NOT EXISTS `owner` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `action` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `company` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1237 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `owner`
--

INSERT INTO `owner` (`id`, `action`, `name`, `company`, `address`, `phone`, `email`) VALUES
(1234, 'Owner', 'Rex Richard', 'NorthOrca', '1293 Main St.', '555-555-5555', 'careers@northorca.com'),
(1235, 'Owner', 'Sam Maxine', 'Pepsi', '2222 Victoria St.', '661-222-3456', 'sammaxine@pepsi.com'),
(1236, 'Owner', 'Bob Saget', 'Full House Inc.', '123 San Francisco Bay ', '555-569-8888', 'bob_saget@fullhouse.com');

-- --------------------------------------------------------

--
-- Table structure for table `owneronhorse`
--

DROP TABLE IF EXISTS `owneronhorse`;
CREATE TABLE IF NOT EXISTS `owneronhorse` (
  `ownerid` int(100) DEFAULT NULL,
  `horseid` int(100) DEFAULT NULL,
  UNIQUE KEY `ownerid` (`ownerid`,`horseid`),
  KEY `fk_horseid` (`horseid`) USING BTREE,
  KEY `fk_ownerid` (`ownerid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `owneronhorse`
--

INSERT INTO `owneronhorse` (`ownerid`, `horseid`) VALUES
(1234, 3),
(1235, 4),
(1235, 23);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jockeyonhorse`
--
ALTER TABLE `jockeyonhorse`
  ADD CONSTRAINT `fk_horse` FOREIGN KEY (`horseid`) REFERENCES `horse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_jockey` FOREIGN KEY (`jockeyid`) REFERENCES `jockey` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `owneronhorse`
--
ALTER TABLE `owneronhorse`
  ADD CONSTRAINT `fk_horseid` FOREIGN KEY (`horseid`) REFERENCES `horse` (`id`),
  ADD CONSTRAINT `fk_ownerid` FOREIGN KEY (`ownerid`) REFERENCES `owner` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
