-- MySQL dump 10.13  Distrib 5.7.31, for Win64 (x86_64)
--
-- Host: localhost    Database: zerofaute
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
-- Current Database: `zerofaute`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `zerofaute` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `zerofaute`;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `idCategorie` int(11) NOT NULL AUTO_INCREMENT,
  `nomCategorie` varchar(50) DEFAULT NULL,
  `descriptionCategorie` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idCategorie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fautes`
--

DROP TABLE IF EXISTS `fautes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fautes` (
  `idFaute` int(11) NOT NULL AUTO_INCREMENT,
  `codeFaute` int(11) DEFAULT NULL,
  `dateReparation` date DEFAULT NULL,
  `titreFaute` varchar(50) DEFAULT NULL,
  `dateDetection` date DEFAULT NULL,
  `commentaire` varchar(100) DEFAULT NULL,
  `idSousCategorie` int(11) NOT NULL,
  PRIMARY KEY (`idFaute`),
  KEY `FK_Fautes_SousCategories` (`idSousCategorie`),
  CONSTRAINT `FK_Fautes_SousCategories` FOREIGN KEY (`idSousCategorie`) REFERENCES `souscategories` (`idSousCategorie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fautes`
--

LOCK TABLES `fautes` WRITE;
/*!40000 ALTER TABLE `fautes` DISABLE KEYS */;
/*!40000 ALTER TABLE `fautes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modeles`
--

DROP TABLE IF EXISTS `modeles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modeles` (
  `idModele` int(11) NOT NULL AUTO_INCREMENT,
  `codeModele` int(11) DEFAULT NULL,
  `nomModele` varchar(50) DEFAULT NULL,
  `dateMiseMarche` date DEFAULT NULL,
  PRIMARY KEY (`idModele`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modeles`
--

LOCK TABLES `modeles` WRITE;
/*!40000 ALTER TABLE `modeles` DISABLE KEYS */;
/*!40000 ALTER TABLE `modeles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produits`
--

DROP TABLE IF EXISTS `produits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produits` (
  `idProduit` int(11) NOT NULL AUTO_INCREMENT,
  `numSerie` int(11) DEFAULT NULL,
  `numProduit` int(11) DEFAULT NULL,
  `anneeProduction` int(11) DEFAULT NULL,
  `idCategorie` int(11) NOT NULL,
  `idModele` int(11) NOT NULL,
  PRIMARY KEY (`idProduit`),
  KEY `FK_Produits_Categories` (`idCategorie`),
  KEY `FK_Produits_Modeles` (`idModele`),
  CONSTRAINT `FK_Produits_Categories` FOREIGN KEY (`idCategorie`) REFERENCES `categories` (`idCategorie`),
  CONSTRAINT `FK_Produits_Modeles` FOREIGN KEY (`idModele`) REFERENCES `modeles` (`idModele`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produits`
--

LOCK TABLES `produits` WRITE;
/*!40000 ALTER TABLE `produits` DISABLE KEYS */;
/*!40000 ALTER TABLE `produits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `souscategories`
--

DROP TABLE IF EXISTS `souscategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `souscategories` (
  `idSousCategorie` int(11) NOT NULL AUTO_INCREMENT,
  `nomSousCategorie` varchar(50) DEFAULT NULL,
  `descriptionSousCategorie` varchar(100) DEFAULT NULL,
  `idCategorie` int(11) NOT NULL,
  PRIMARY KEY (`idSousCategorie`),
  KEY `FK_SousCategories_Categories` (`idCategorie`),
  CONSTRAINT `FK_SousCategories_Categories` FOREIGN KEY (`idCategorie`) REFERENCES `categories` (`idCategorie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `souscategories`
--

LOCK TABLES `souscategories` WRITE;
/*!40000 ALTER TABLE `souscategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `souscategories` ENABLE KEYS */;
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
