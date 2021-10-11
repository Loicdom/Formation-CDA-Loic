-- MySQL dump 10.13  Distrib 5.7.31, for Win64 (x86_64)
--
-- Host: localhost    Database: poste
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
-- Current Database: `poste`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `poste` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `poste`;

--
-- Table structure for table `acheminements`
--

DROP TABLE IF EXISTS `acheminements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acheminements` (
  `idAcheminement` int(11) NOT NULL AUTO_INCREMENT,
  `idBureau` int(11) DEFAULT NULL,
  `idTransport` int(11) DEFAULT NULL,
  `idCentresDeTri` int(11) DEFAULT NULL,
  PRIMARY KEY (`idAcheminement`),
  KEY `FK_Acheminements_Bureaux` (`idBureau`),
  KEY `FK_Acheminements_Transports` (`idTransport`),
  KEY `FK_Acheminements_CentresDeTri` (`idCentresDeTri`),
  CONSTRAINT `FK_Acheminements_Bureaux` FOREIGN KEY (`idBureau`) REFERENCES `bureaux` (`idBureau`),
  CONSTRAINT `FK_Acheminements_CentresDeTri` FOREIGN KEY (`idCentresDeTri`) REFERENCES `centresdetri` (`idCentresDeTri`),
  CONSTRAINT `FK_Acheminements_Transports` FOREIGN KEY (`idTransport`) REFERENCES `transports` (`idTransport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acheminements`
--

LOCK TABLES `acheminements` WRITE;
/*!40000 ALTER TABLE `acheminements` DISABLE KEYS */;
/*!40000 ALTER TABLE `acheminements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bureaux`
--

DROP TABLE IF EXISTS `bureaux`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bureaux` (
  `idBureau` int(11) NOT NULL AUTO_INCREMENT,
  `codePostal` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`idBureau`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bureaux`
--

LOCK TABLES `bureaux` WRITE;
/*!40000 ALTER TABLE `bureaux` DISABLE KEYS */;
/*!40000 ALTER TABLE `bureaux` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `centresdetri`
--

DROP TABLE IF EXISTS `centresdetri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `centresdetri` (
  `idCentresDeTri` int(11) NOT NULL AUTO_INCREMENT,
  `nomCentreDeTri` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idCentresDeTri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centresdetri`
--

LOCK TABLES `centresdetri` WRITE;
/*!40000 ALTER TABLE `centresdetri` DISABLE KEYS */;
/*!40000 ALTER TABLE `centresdetri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courriers`
--

DROP TABLE IF EXISTS `courriers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courriers` (
  `idCourrier` int(11) NOT NULL AUTO_INCREMENT,
  `rueDestinataire` varchar(150) NOT NULL,
  `numDestintaire` varchar(5) NOT NULL,
  `rueEmetteur` varchar(150) DEFAULT NULL,
  `numEmetteur` varchar(50) DEFAULT NULL,
  `idType` int(11) NOT NULL,
  PRIMARY KEY (`idCourrier`),
  KEY `FK_Courriers_Types` (`idType`),
  CONSTRAINT `FK_Courriers_Types` FOREIGN KEY (`idType`) REFERENCES `types` (`idType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courriers`
--

LOCK TABLES `courriers` WRITE;
/*!40000 ALTER TABLE `courriers` DISABLE KEYS */;
/*!40000 ALTER TABLE `courriers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestions`
--

DROP TABLE IF EXISTS `gestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gestions` (
  `idGestion` int(11) NOT NULL AUTO_INCREMENT,
  `idBureau` int(11) DEFAULT NULL,
  `idCourrier` int(11) DEFAULT NULL,
  `dateEnvoi` date DEFAULT NULL,
  `dateReception` date DEFAULT NULL,
  PRIMARY KEY (`idGestion`),
  KEY `FK_Gestions_Bureaux` (`idBureau`),
  KEY `FK_Gestions_Courriers` (`idCourrier`),
  CONSTRAINT `FK_Gestions_Bureaux` FOREIGN KEY (`idBureau`) REFERENCES `bureaux` (`idBureau`),
  CONSTRAINT `FK_Gestions_Courriers` FOREIGN KEY (`idCourrier`) REFERENCES `courriers` (`idCourrier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestions`
--

LOCK TABLES `gestions` WRITE;
/*!40000 ALTER TABLE `gestions` DISABLE KEYS */;
/*!40000 ALTER TABLE `gestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transports`
--

DROP TABLE IF EXISTS `transports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transports` (
  `idTransport` int(11) NOT NULL AUTO_INCREMENT,
  `libelleTransport` varchar(50) DEFAULT NULL,
  `taxeCarbonne` int(11) DEFAULT NULL,
  PRIMARY KEY (`idTransport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transports`
--

LOCK TABLES `transports` WRITE;
/*!40000 ALTER TABLE `transports` DISABLE KEYS */;
/*!40000 ALTER TABLE `transports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `types` (
  `idType` int(11) NOT NULL AUTO_INCREMENT,
  `libelleType` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types`
--

LOCK TABLES `types` WRITE;
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
/*!40000 ALTER TABLE `types` ENABLE KEYS */;
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
