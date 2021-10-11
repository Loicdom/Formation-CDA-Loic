-- MySQL dump 10.13  Distrib 5.7.31, for Win64 (x86_64)
--
-- Host: localhost    Database: cuisineitalienne
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
-- Current Database: `cuisineitalienne`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `cuisineitalienne` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `cuisineitalienne`;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `Idclient` int(11) NOT NULL AUTO_INCREMENT,
  `nomClient` varchar(50) DEFAULT NULL,
  `prenomCLient` varchar(50) DEFAULT NULL,
  `dateNaissance` date DEFAULT NULL,
  `adresseMail` varchar(100) DEFAULT NULL,
  `NumTel` varchar(50) DEFAULT NULL,
  `idTicket` int(11) NOT NULL,
  PRIMARY KEY (`Idclient`),
  KEY `FK_Clients_Tickets` (`idTicket`),
  CONSTRAINT `FK_Clients_Tickets` FOREIGN KEY (`idTicket`) REFERENCES `tickets` (`idTicket`)
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
-- Table structure for table `compose`
--

DROP TABLE IF EXISTS `compose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compose` (
  `idCompose` int(11) NOT NULL AUTO_INCREMENT,
  `idTicket` int(11) NOT NULL,
  `idmet` int(11) NOT NULL,
  PRIMARY KEY (`idCompose`),
  KEY `FK_Compose_Tickets` (`idTicket`),
  KEY `FK_Compose_Met` (`idmet`),
  CONSTRAINT `FK_Compose_Met` FOREIGN KEY (`idmet`) REFERENCES `met` (`idmet`),
  CONSTRAINT `FK_Compose_Tickets` FOREIGN KEY (`idTicket`) REFERENCES `tickets` (`idTicket`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compose`
--

LOCK TABLES `compose` WRITE;
/*!40000 ALTER TABLE `compose` DISABLE KEYS */;
/*!40000 ALTER TABLE `compose` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `met`
--

DROP TABLE IF EXISTS `met`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `met` (
  `idmet` int(11) NOT NULL AUTO_INCREMENT,
  `nomMet` varchar(50) DEFAULT NULL,
  `prix` double DEFAULT NULL,
  PRIMARY KEY (`idmet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `met`
--

LOCK TABLES `met` WRITE;
/*!40000 ALTER TABLE `met` DISABLE KEYS */;
/*!40000 ALTER TABLE `met` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tables`
--

DROP TABLE IF EXISTS `tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tables` (
  `idTable` int(11) NOT NULL AUTO_INCREMENT,
  `numTable` int(11) DEFAULT NULL,
  `capaciteMax` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `supplement` double DEFAULT NULL,
  `idTicket` int(11) NOT NULL,
  PRIMARY KEY (`idTable`),
  KEY `FK_Tables_Tickets` (`idTicket`),
  CONSTRAINT `FK_Tables_Tickets` FOREIGN KEY (`idTicket`) REFERENCES `tickets` (`idTicket`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tables`
--

LOCK TABLES `tables` WRITE;
/*!40000 ALTER TABLE `tables` DISABLE KEYS */;
/*!40000 ALTER TABLE `tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tickets` (
  `idTicket` int(11) NOT NULL AUTO_INCREMENT,
  `numTicket` int(11) DEFAULT NULL,
  `nombreCouvert` int(11) DEFAULT NULL,
  `montantAddition` double DEFAULT NULL,
  `dateTicket` date DEFAULT NULL,
  PRIMARY KEY (`idTicket`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
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
