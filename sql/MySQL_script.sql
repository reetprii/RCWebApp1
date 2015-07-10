-- MySQL dump 10.13  Distrib 5.6.25, for Win64 (x86_64)
--
-- Host: localhost    Database: rcwebrp
-- ------------------------------------------------------
-- Server version	5.6.25-log

/*!40000 DROP DATABASE IF EXISTS `rcwebrp`*/;
 
CREATE DATABASE /*!32312 IF NOT EXISTS*/ `rcwebrp` /*!40100 DEFAULT CHARACTER SET utf8 */;
 
USE `rcwebrp`;


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
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `type_id` int(11) DEFAULT '1',
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'Argentiina Restoran','Parnu mnt 37, Tallinn',1),(2,'Margo','Vanatura kael 10, Tallinn',1),(3,'Black Taverna Lounge','Pirita tee 20, Tallinn',1),(4,'Munga Kelder','Vene 12, Tallinn',1),(5,'Baieri Kelder','Roosikrantsi 2a, Tallinn',1),(6,'Nõmme Pubi','Jaama 2, Tallinn',1),(8,'Solaris Kino','Estonia pst 9, Tallinn',4),(9,'Kosmos IMAX','Pärnu mnt 45, Tallinn',4),(10,'Kino Artis','Estonia pst 9, Tallinn',4),(11,'Cinamon','Turu 2, Tartu',4);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating` (
  `rating_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `comment` varchar(250) NOT NULL,
  `company_id` int(11) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `vote` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rating_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (1,'Test1','asdfa asf asdf',2,0,0),(2,'Test2','asfasdf sdaf asdf',2,0,0),(3,'Test3','asdflkj lkasjdf ',3,0,8),(4,'Teine test','Tõstame keskmist',3,0,10),(5,'Pessimist','Langetame keskmist!',3,0,1),(6,'','',2,0,0),(7,'Test4','',2,0,0),(8,'Test5 ÖÄÖÄöä','õüÜÕÄÖ ÖÄÖÄöä',3,0,7),(9,'Test8 õüüõüõü','öööäöäöä',3,0,0),(10,'Test7','asfd',3,0,0),(11,'Test6','asd asdf',2,0,4),(12,'Test8','asd',6,0,0),(13,'Test10','asdf asdf asdf',5,0,5),(14,'Test11','asdf asdf asdf ',4,0,5),(15,'Test12 aaaaaaaaaaa','aaaaaaaaaaaaaaaaa',2,0,6);
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-10
