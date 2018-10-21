-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: classmysql.engr.oregonstate.edu:3306
-- Generation Time: Oct 14, 2018 at 10:01 PM
-- Server version: 10.1.22-MariaDB
-- PHP Version: 7.0.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cs340_mccallm`
--

-- --------------------------------------------------------

--
-- Table structure for table `animal`
--

DROP TABLE IF EXISTS `animal`;
CREATE TABLE `animal` (
  `animalID` int(11) NOT NULL AUTO_INCREMENT,
  `age` int(3) NOT NULL,
  `speciesID` int(11) NOT NULL,
  `biomeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `animal`:
--

-- --------------------------------------------------------

--
-- Table structure for table `biome`
--

DROP TABLE IF EXISTS `biome`;
CREATE TABLE `biome` (
  `biomeID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `lat_1` float NOT NULL,
  `long_1` float NOT NULL,
  `lat_2` float NOT NULL,
  `long_2` float NOT NULL,
  `temperature` float NOT NULL,
  `elevation` float NOT NULL,
  `rainfall` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `biome`:
--

-- --------------------------------------------------------

--
-- Table structure for table `interaction`
--

DROP TABLE IF EXISTS `interaction`;
CREATE TABLE `interaction` (
  `species_1` int(11) NOT NULL,
  `behavior` varchar(50) NOT NULL,
  `species_2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `interaction`:
--   `species_1`
--       `animal` -> `animalID`
--   `species_2`
--       `animal` -> `animalID`
--

-- --------------------------------------------------------

--
-- Table structure for table `researcher`
--

DROP TABLE IF EXISTS `researcher`;
CREATE TABLE `researcher` (
  `researcherID` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `position` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `researcher`:
--

-- --------------------------------------------------------

--
-- Table structure for table `sighting`
--

DROP TABLE IF EXISTS `sighting`;
CREATE TABLE `sighting` (
  `researcherID` int(11) NOT NULL,
  `animalID` int(11) NOT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL,
  `sight_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `sighting`:
--   `researcherID`
--       `researcher` -> `researcherID`
--   `animalID`
--       `animal` -> `animalID`
--

-- --------------------------------------------------------

--
-- Table structure for table `speciality`
--

DROP TABLE IF EXISTS `speciality`;
CREATE TABLE `speciality` (
  `researcherID` int(11) NOT NULL,
  `speciesID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `speciality`:
--   `researcherID`
--       `researcher` -> `researcherID`
--   `speciesID`
--       `species` -> `speciesID`
--

-- --------------------------------------------------------

--
-- Table structure for table `species`
--

DROP TABLE IF EXISTS `species`;
CREATE TABLE `species` (
  `speciesID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `feeding_type` varchar(50) NOT NULL,
  `native` tinyint(1) NOT NULL,
  `domesticated` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `species`:
--

--
-- Indexes for dumped tables
--

--
-- Indexes for table `animal`
--
ALTER TABLE `animal`
  ADD PRIMARY KEY (`animalID`);

--
-- Indexes for table `biome`
--
ALTER TABLE `biome`
  ADD PRIMARY KEY (`biomeID`);

--
-- Indexes for table `interaction`
--
ALTER TABLE `interaction`
  ADD KEY `species_1` (`species_1`),
  ADD KEY `species_2` (`species_2`);

--
-- Indexes for table `researcher`
--
ALTER TABLE `researcher`
  ADD PRIMARY KEY (`researcherID`);

--
-- Indexes for table `sighting`
--
ALTER TABLE `sighting`
  ADD KEY `researcherID` (`researcherID`),
  ADD KEY `animalID` (`animalID`);

--
-- Indexes for table `speciality`
--
ALTER TABLE `speciality`
  ADD KEY `researcherID` (`researcherID`),
  ADD KEY `speciesID` (`speciesID`);

--
-- Indexes for table `species`
--
ALTER TABLE `species`
  ADD PRIMARY KEY (`speciesID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `interaction`
--
ALTER TABLE `interaction`
  ADD CONSTRAINT `interaction_ibfk_1` FOREIGN KEY (`species_1`) REFERENCES `animal` (`animalID`),
  ADD CONSTRAINT `interaction_ibfk_2` FOREIGN KEY (`species_2`) REFERENCES `animal` (`animalID`);

--
-- Constraints for table `sighting`
--
ALTER TABLE `sighting`
  ADD CONSTRAINT `sighting_ibfk_1` FOREIGN KEY (`researcherID`) REFERENCES `researcher` (`researcherID`),
  ADD CONSTRAINT `sighting_ibfk_2` FOREIGN KEY (`animalID`) REFERENCES `animal` (`animalID`);

--
-- Constraints for table `speciality`
--
ALTER TABLE `speciality`
  ADD CONSTRAINT `speciality_ibfk_1` FOREIGN KEY (`researcherID`) REFERENCES `researcher` (`researcherID`),
  ADD CONSTRAINT `speciality_ibfk_2` FOREIGN KEY (`speciesID`) REFERENCES `species` (`speciesID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
