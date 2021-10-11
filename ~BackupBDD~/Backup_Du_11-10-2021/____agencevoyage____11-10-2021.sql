-- MySQL dump 10.13  Distrib 5.7.31, for Win64 (x86_64)
--
-- Host: localhost    Database: agencevoyage
-- ------------------------------------------------------
-- Server version	5.7.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `agencevoyage`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `agencevoyage` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `agencevoyage`;

--
-- Table structure for table `achete`
--

DROP TABLE IF EXISTS `achete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `achete` (
  `idAchete` int(11) NOT NULL AUTO_INCREMENT,
  `idPrestation` int(11) DEFAULT NULL,
  `idClient` int(11) DEFAULT NULL,
  `prix` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`idAchete`),
  KEY `FK_Achete_Prestations` (`idPrestation`),
  KEY `FK_Achete_Clients` (`idClient`),
  CONSTRAINT `FK_Achete_Clients` FOREIGN KEY (`idClient`) REFERENCES `clients` (`idClient`),
  CONSTRAINT `FK_Achete_Prestations` FOREIGN KEY (`idPrestation`) REFERENCES `prestations` (`idPrestation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achete`
--

LOCK TABLES `achete` WRITE;
/*!40000 ALTER TABLE `achete` DISABLE KEYS */;
/*!40000 ALTER TABLE `achete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `idClient` int(11) NOT NULL AUTO_INCREMENT,
  `numClient` int(11) DEFAULT NULL,
  `nomClient` varchar(50) DEFAULT NULL,
  `prenomClient` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idClient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gite`
--

DROP TABLE IF EXISTS `gite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gite` (
  `idGite` int(11) NOT NULL AUTO_INCREMENT,
  `nomGite` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idGite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gite`
--

LOCK TABLES `gite` WRITE;
/*!40000 ALTER TABLE `gite` DISABLE KEYS */;
/*!40000 ALTER TABLE `gite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotels`
--

DROP TABLE IF EXISTS `hotels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotels` (
  `idHotel` int(11) NOT NULL AUTO_INCREMENT,
  `nomHotel` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idHotel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotels`
--

LOCK TABLES `hotels` WRITE;
/*!40000 ALTER TABLE `hotels` DISABLE KEYS */;
/*!40000 ALTER TABLE `hotels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `idLocation` int(11) NOT NULL AUTO_INCREMENT,
  `libelleLocation` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idLocation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestations`
--

DROP TABLE IF EXISTS `prestations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prestations` (
  `idPrestation` int(11) NOT NULL AUTO_INCREMENT,
  `codePrestation` int(11) DEFAULT NULL,
  `intitule` varchar(50) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `lieu` varchar(100) DEFAULT NULL,
  `niveauPrestation` int(11) DEFAULT NULL,
  `PrixPublic` decimal(15,2) DEFAULT NULL,
  `photo` varchar(50) DEFAULT NULL,
  `idGite` int(11) DEFAULT NULL,
  `idLocation` int(11) NOT NULL,
  `idHotel` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPrestation`),
  KEY `FK_Prestations_Gite` (`idGite`),
  KEY `FK_Prestations_Location` (`idLocation`),
  KEY `FK_Prestations_Hotels` (`idHotel`),
  CONSTRAINT `FK_Prestations_Gite` FOREIGN KEY (`idGite`) REFERENCES `gite` (`idGite`),
  CONSTRAINT `FK_Prestations_Hotels` FOREIGN KEY (`idHotel`) REFERENCES `hotels` (`idHotel`),
  CONSTRAINT `FK_Prestations_Location` FOREIGN KEY (`idLocation`) REFERENCES `location` (`idLocation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestations`
--

LOCK TABLES `prestations` WRITE;
/*!40000 ALTER TABLE `prestations` DISABLE KEYS */;
/*!40000 ALTER TABLE `prestations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-11 12:20:14
