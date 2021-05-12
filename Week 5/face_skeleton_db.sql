-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `AUTHOR_ID` decimal(7,0) NOT NULL,
  `AUTHOR_FNAME` varchar(20) DEFAULT NULL,
  `AUTHOR_LNAME` varchar(20) DEFAULT NULL,
  `AUTHOR_BIRTHYEAR` decimal(4,0) DEFAULT NULL,
  PRIMARY KEY (`AUTHOR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `BOOK_NUM` decimal(10,0) NOT NULL,
  `BOOK_TITLE` varchar(120) DEFAULT NULL,
  `BOOK_YEAR` decimal(4,0) DEFAULT NULL,
  `BOOK_COST` decimal(8,2) DEFAULT NULL,
  `BOOK_SUBJECT` varchar(120) DEFAULT NULL,
  `PATRON_ID` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`BOOK_NUM`),
  KEY `fk_BOOK_PATRON1_idx` (`PATRON_ID`),
  CONSTRAINT `fk_BOOK_PATRON1` FOREIGN KEY (`PATRON_ID`) REFERENCES `patron` (`PATRON_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkout`
--

DROP TABLE IF EXISTS `checkout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkout` (
  `CHECKOUT_NUM` decimal(15,0) NOT NULL,
  `BOOK_NUM` decimal(10,0) NOT NULL,
  `PATRON_ID` decimal(10,0) NOT NULL,
  `CHECK_OUT_DATE` date DEFAULT NULL,
  `CHECK_DUE_DATE` date DEFAULT NULL,
  `CHECK_IN_DATE` date DEFAULT NULL,
  PRIMARY KEY (`CHECKOUT_NUM`),
  KEY `fk_CHECKOUT_PATRON_idx` (`PATRON_ID`),
  KEY `fk_CHECKOUT_BOOK1_idx` (`BOOK_NUM`),
  CONSTRAINT `fk_CHECKOUT_BOOK1` FOREIGN KEY (`BOOK_NUM`) REFERENCES `book` (`BOOK_NUM`),
  CONSTRAINT `fk_CHECKOUT_PATRON` FOREIGN KEY (`PATRON_ID`) REFERENCES `patron` (`PATRON_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkout`
--

LOCK TABLES `checkout` WRITE;
/*!40000 ALTER TABLE `checkout` DISABLE KEYS */;
/*!40000 ALTER TABLE `checkout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patron`
--

DROP TABLE IF EXISTS `patron`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patron` (
  `PATRON_ID` decimal(10,0) NOT NULL,
  `PATRON_FNAME` varchar(20) DEFAULT NULL,
  `PATRON_LNAME` varchar(20) DEFAULT NULL,
  `PATRON_TYPE` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`PATRON_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patron`
--

LOCK TABLES `patron` WRITE;
/*!40000 ALTER TABLE `patron` DISABLE KEYS */;
/*!40000 ALTER TABLE `patron` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `writes`
--

DROP TABLE IF EXISTS `writes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `writes` (
  `BOOK_NUM` decimal(10,0) NOT NULL,
  `AUTHOR_ID` decimal(7,0) NOT NULL,
  PRIMARY KEY (`BOOK_NUM`,`AUTHOR_ID`),
  KEY `fk_WRITES_AUTHOR1_idx` (`AUTHOR_ID`),
  CONSTRAINT `fk_WRITES_AUTHOR1` FOREIGN KEY (`AUTHOR_ID`) REFERENCES `author` (`AUTHOR_ID`),
  CONSTRAINT `fk_WRITES_BOOK1` FOREIGN KEY (`BOOK_NUM`) REFERENCES `book` (`BOOK_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `writes`
--

LOCK TABLES `writes` WRITE;
/*!40000 ALTER TABLE `writes` DISABLE KEYS */;
/*!40000 ALTER TABLE `writes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-24 18:27:55
