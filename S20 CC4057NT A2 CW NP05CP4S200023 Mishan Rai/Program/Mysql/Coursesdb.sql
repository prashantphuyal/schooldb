-- MariaDB dump 10.17  Distrib 10.4.11-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: Musicstore
-- ------------------------------------------------------
-- Server version	10.4.11-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artists` (
  `ArtistID` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(225) DEFAULT NULL,
  `LastName` varchar(225) DEFAULT NULL,
  `Song` int(11) DEFAULT NULL,
  PRIMARY KEY (`ArtistID`),
  KEY `Song` (`Song`),
  CONSTRAINT `artists_ibfk_1` FOREIGN KEY (`Song`) REFERENCES `songs` (`SongId`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO `artists` VALUES (12,'John','Denver',10),(23,'JOhn','Lennon',20),(34,'Maeshall','Mathers',30),(45,'Louis','Armstrong',40),(56,'Wiz','khalifa',50),(67,'Alan','Walker',60),(71,'Zayn','Malik',70);
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bills` (
  `BillId` int(11) NOT NULL AUTO_INCREMENT,
  `Customer` int(11) DEFAULT NULL,
  PRIMARY KEY (`BillId`),
  KEY `Customer` (`Customer`),
  CONSTRAINT `bills_ibfk_1` FOREIGN KEY (`Customer`) REFERENCES `customers` (`CustomerId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
INSERT INTO `bills` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7);
/*!40000 ALTER TABLE `bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `CustomerId` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(225) DEFAULT NULL,
  `Lastname` varchar(225) DEFAULT NULL,
  `Contact` int(11) DEFAULT NULL,
  `Artist` int(11) DEFAULT NULL,
  PRIMARY KEY (`CustomerId`),
  UNIQUE KEY `Contact` (`Contact`),
  KEY `Artist` (`Artist`),
  CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`Artist`) REFERENCES `artists` (`ArtistID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Snoop','Dog',422,12),(2,'Charlie','Puth',-567,23),(3,'Ice','Cube',655,34),(4,'Pink','Guy',-345,45),(5,'Rich','Brian',531,56),(6,'John','Legend',-112,67),(7,'Kevin','Hart',-218,71);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genres` (
  `GenreId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`GenreId`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (22,'Classic'),(11,'Country'),(66,'Electronic'),(33,'Hip-Hop'),(44,'Jazz'),(77,'Pop'),(55,'R&B');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `songs`
--

DROP TABLE IF EXISTS `songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `songs` (
  `SongId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(225) DEFAULT NULL,
  `Price` int(11) DEFAULT NULL,
  `ReleaseDate` date DEFAULT NULL,
  `Genre` int(11) DEFAULT NULL,
  PRIMARY KEY (`SongId`),
  KEY `Genre` (`Genre`),
  CONSTRAINT `songs_ibfk_1` FOREIGN KEY (`Genre`) REFERENCES `genres` (`GenreId`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs`
--

LOCK TABLES `songs` WRITE;
/*!40000 ALTER TABLE `songs` DISABLE KEYS */;
INSERT INTO `songs` VALUES (10,'Take me home',90,'1971-04-10',11),(20,'Stand by me',50,'1961-04-24',22),(30,'Lose yourself',110,'2002-10-28',33),(40,'What a wonderful world',55,'1968-01-01',44),(50,'See you again',130,'2015-03-10',55),(60,'Faded',120,'2015-12-03',66),(70,'Dusk till dawn',100,'2017-09-07',77);
/*!40000 ALTER TABLE `songs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-14 19:38:18
