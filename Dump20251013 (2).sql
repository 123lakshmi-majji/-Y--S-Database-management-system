-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: p3
-- ------------------------------------------------------
-- Server version	9.3.0

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
-- Table structure for table `boats`
--

DROP TABLE IF EXISTS `boats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boats` (
  `BID` int NOT NULL,
  `BNAME` varchar(50) DEFAULT NULL,
  `BCOLOR` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`BID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boats`
--

LOCK TABLES `boats` WRITE;
/*!40000 ALTER TABLE `boats` DISABLE KEYS */;
INSERT INTO `boats` VALUES (101,'Interlake','Blue'),(102,'Interlake','Red'),(103,'Clipper','Green'),(104,'Marine','Red');
/*!40000 ALTER TABLE `boats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fee`
--

DROP TABLE IF EXISTS `fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fee` (
  `rno` int DEFAULT NULL,
  `fee` int DEFAULT NULL,
  KEY `rno` (`rno`),
  CONSTRAINT `fee_ibfk_1` FOREIGN KEY (`rno`) REFERENCES `student` (`rno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fee`
--

LOCK TABLES `fee` WRITE;
/*!40000 ALTER TABLE `fee` DISABLE KEYS */;
INSERT INTO `fee` VALUES (1,20000),(2,18000),(3,22000),(5,15000);
/*!40000 ALTER TABLE `fee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `my_view`
--

DROP TABLE IF EXISTS `my_view`;
/*!50001 DROP VIEW IF EXISTS `my_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `my_view` AS SELECT 
 1 AS `rollno`,
 1 AS `name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `myview`
--

DROP TABLE IF EXISTS `myview`;
/*!50001 DROP VIEW IF EXISTS `myview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `myview` AS SELECT 
 1 AS `rollno`,
 1 AS `name`,
 1 AS `marks`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `reserves`
--

DROP TABLE IF EXISTS `reserves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserves` (
  `SID` int DEFAULT NULL,
  `BID` int DEFAULT NULL,
  `RDATE` date DEFAULT NULL,
  KEY `SID` (`SID`),
  KEY `BID` (`BID`),
  CONSTRAINT `reserves_ibfk_1` FOREIGN KEY (`SID`) REFERENCES `sailors` (`SID`),
  CONSTRAINT `reserves_ibfk_2` FOREIGN KEY (`BID`) REFERENCES `boats` (`BID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserves`
--

LOCK TABLES `reserves` WRITE;
/*!40000 ALTER TABLE `reserves` DISABLE KEYS */;
INSERT INTO `reserves` VALUES (22,101,'1998-10-10'),(22,102,'1998-10-10'),(22,103,'1998-10-08'),(31,104,'1998-11-07'),(31,103,'1998-11-06'),(31,104,'1998-11-12'),(64,101,'1998-09-05'),(64,102,'1998-09-08'),(74,103,'1998-09-08');
/*!40000 ALTER TABLE `reserves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sailors`
--

DROP TABLE IF EXISTS `sailors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sailors` (
  `SID` int NOT NULL,
  `SNAME` varchar(50) DEFAULT NULL,
  `AGE` float DEFAULT NULL,
  `RATING` int DEFAULT NULL,
  PRIMARY KEY (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sailors`
--

LOCK TABLES `sailors` WRITE;
/*!40000 ALTER TABLE `sailors` DISABLE KEYS */;
INSERT INTO `sailors` VALUES (22,'Dustin',45,7),(29,'Brutus',33,1),(31,'Lubber',55.5,8),(32,'Andy',25.5,8),(58,'Horatio',35,7),(64,'Horbal',35,9),(74,'Ravi',40,9),(85,'Art',26.5,3),(95,'Bob',63.5,5),(98,'Rusty',35,10);
/*!40000 ALTER TABLE `sailors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `source_table`
--

DROP TABLE IF EXISTS `source_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `source_table` (
  `rollno` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `marks` int DEFAULT NULL,
  PRIMARY KEY (`rollno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `source_table`
--

LOCK TABLES `source_table` WRITE;
/*!40000 ALTER TABLE `source_table` DISABLE KEYS */;
INSERT INTO `source_table` VALUES (501,'jyothi',90),(502,'sai',95),(503,'ravi',80),(504,'yamuna',70),(505,'padma',60);
/*!40000 ALTER TABLE `source_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st1`
--

DROP TABLE IF EXISTS `st1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st1` (
  `rollno` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `marks` int DEFAULT NULL,
  PRIMARY KEY (`rollno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st1`
--

LOCK TABLES `st1` WRITE;
/*!40000 ALTER TABLE `st1` DISABLE KEYS */;
INSERT INTO `st1` VALUES (501,'jyothi',90),(502,'sai',95),(503,'ravi',80),(504,'yamuna',70),(505,'padma',60);
/*!40000 ALTER TABLE `st1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `rno` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `marks` int DEFAULT NULL,
  PRIMARY KEY (`rno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Amit',85),(2,'Neha',90),(3,'Raj',75),(4,'Simran',95),(5,'Karan',60);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `my_view`
--

/*!50001 DROP VIEW IF EXISTS `my_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `my_view` AS select `source_table`.`rollno` AS `rollno`,`source_table`.`name` AS `name` from `source_table` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `myview`
--

/*!50001 DROP VIEW IF EXISTS `myview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `myview` AS select `st1`.`rollno` AS `rollno`,`st1`.`name` AS `name`,`st1`.`marks` AS `marks` from `st1` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-13 15:55:00
