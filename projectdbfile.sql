-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: project
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bidding_details`
--

DROP TABLE IF EXISTS `bidding_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bidding_details` (
  `bid_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `startup_id` int(11) DEFAULT NULL,
  `bid_amount` double DEFAULT NULL,
  `bid_duration` varchar(50) DEFAULT NULL,
  `bid_status` varchar(50) DEFAULT NULL,
  `flag` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`bid_id`),
  KEY `fk_bd1` (`company_id`),
  KEY `fk_bd2` (`startup_id`),
  KEY `fk_bd3` (`project_id`),
  CONSTRAINT `fk_bd1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`),
  CONSTRAINT `fk_bd2` FOREIGN KEY (`startup_id`) REFERENCES `startup` (`startup_id`),
  CONSTRAINT `fk_bd3` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bidding_details`
--

LOCK TABLES `bidding_details` WRITE;
/*!40000 ALTER TABLE `bidding_details` DISABLE KEYS */;
INSERT INTO `bidding_details` VALUES (1,2,2,13,22000,'3 Weeks','applied','yes'),(2,3,2,13,25000,'4 Weeks','rejected','yes'),(3,3,2,19,20000,'4 Weeks','selected','yes'),(4,3,2,22,25000,'5 Weeks','rejected','yes'),(5,4,8,13,45000,'6 Weeks','selected','yes'),(6,4,8,22,40000,'6 Weeks','selected','yes'),(7,2,2,19,20000,'3 Weeks','selected','yes'),(8,2,2,23,22000,'3 Weeks','applied','yes'),(9,5,8,13,45000,'6 Weeks','rejected','yes'),(10,5,8,22,42000,'6 Weeks','rejected','yes'),(11,5,8,19,46000,'5 Weeks','selected','yes');
/*!40000 ALTER TABLE `bidding_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `description` varchar(100) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `flag` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`company_id`),
  KEY `fk_company` (`email`),
  CONSTRAINT `fk_company` FOREIGN KEY (`email`) REFERENCES `user` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES ('hiii','abc',1,'yes'),('dfkdm','xyz',2,'yes'),('java','atharva@gmail.com',4,'yes'),('java','vishal@gmail.com',6,'yes'),('dotnet','nago@gmail.com',7,'yes'),('MNC And IT Sector','mindtree@gmail.com',8,'yes'),('dbdkns','mayur',9,'yes'),('dbchbd','oracle@gmail.com',10,'yes');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funds`
--

DROP TABLE IF EXISTS `funds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funds` (
  `fund_id` int(11) NOT NULL AUTO_INCREMENT,
  `startup_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `fund_amount` double DEFAULT NULL,
  `fund_status` varchar(50) DEFAULT NULL,
  `fund_description` varchar(200) DEFAULT NULL,
  `flag` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`fund_id`),
  KEY `fk_fund1` (`company_id`),
  KEY `fk_fund2` (`startup_id`),
  CONSTRAINT `fk_fund1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`),
  CONSTRAINT `fk_fund2` FOREIGN KEY (`startup_id`) REFERENCES `startup` (`startup_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funds`
--

LOCK TABLES `funds` WRITE;
/*!40000 ALTER TABLE `funds` DISABLE KEYS */;
INSERT INTO `funds` VALUES (1,13,10,135777,'selected','To Add operations across county.','yes'),(2,19,NULL,150000,'Applied','To enter into Global Market.','yes'),(3,22,NULL,2000000,'Applied','To hire candidates and develope New teams and offices.','yes');
/*!40000 ALTER TABLE `funds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gst`
--

DROP TABLE IF EXISTS `gst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gst` (
  `gst_id` varchar(15) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `pan` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`gst_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gst`
--

LOCK TABLES `gst` WRITE;
/*!40000 ALTER TABLE `gst` DISABLE KEYS */;
INSERT INTO `gst` VALUES ('12345','mayur','12345'),('abcd','chaitu','abcd123'),('gst110','Myroom','pan110'),('gst111','oracle','pan111'),('gstin0106','chaitu','pan0106'),('gstin031','Aj','pan031'),('gstin0726','chaitu','pan0726'),('gstin1811','Laxmi','pan1811'),('gstin1997','mindtree','pan1997'),('gstin2008','Ola','pan2008'),('gstin27051996','manohar','abcde123');
/*!40000 ALTER TABLE `gst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gst_company`
--

DROP TABLE IF EXISTS `gst_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gst_company` (
  `gst_id` varchar(15) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `flag` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`gst_id`),
  KEY `fk_gstc` (`company_id`),
  CONSTRAINT `fk_gstc` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gst_company`
--

LOCK TABLES `gst_company` WRITE;
/*!40000 ALTER TABLE `gst_company` DISABLE KEYS */;
INSERT INTO `gst_company` VALUES ('12345',9,'yes'),('abcd',2,'yes'),('gst111',10,'yes'),('gstin1997',8,'yes');
/*!40000 ALTER TABLE `gst_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gst_startup`
--

DROP TABLE IF EXISTS `gst_startup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gst_startup` (
  `gst_id` varchar(15) NOT NULL,
  `startup_id` int(11) DEFAULT NULL,
  `flag` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`gst_id`),
  KEY `fk_gsts` (`startup_id`),
  CONSTRAINT `fk_gsts` FOREIGN KEY (`startup_id`) REFERENCES `startup` (`startup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gst_startup`
--

LOCK TABLES `gst_startup` WRITE;
/*!40000 ALTER TABLE `gst_startup` DISABLE KEYS */;
INSERT INTO `gst_startup` VALUES ('abcd',18,'yes'),('gst110',25,'yes'),('gstin0106',24,'yes'),('gstin1811',23,'yes'),('gstin2008',22,'yes'),('gstin27051996',13,'yes');
/*!40000 ALTER TABLE `gst_startup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `flag` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES ('abc','manohar',1),('xyz','1234',2),('ffff','5555',1),('qwer','9999',1),('qwwwewe','8888',1),('qwwwewe','8888',1),('rtrww','88888',1),('Admin','Admin',0),('mindtree@gmail.com','mindtree',2),('ola@gmail.com','ola',1),('laxmi@gmail.com','LAXMI123',1),('mayur','12345',2),('chaitu','4545',1),('my@gmail.com','110',1),('oracle@gmail.com','111',2);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(50) DEFAULT NULL,
  `project_technology` varchar(50) DEFAULT NULL,
  `project_duration` varchar(50) DEFAULT NULL,
  `project_description` varchar(255) DEFAULT NULL,
  `project_bid_amount` double DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `flag` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`project_id`),
  KEY `fk_project` (`company_id`),
  CONSTRAINT `fk_project` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'Angular',NULL,NULL,NULL,NULL,1,'yes'),(2,'Online Game','Angular,Bootstarp,Java','4 Weeks','Create A platform For Online Games for Teenagers.',24000,2,'yes'),(3,'Online Compiler','Dot net,php,javascript','6 Weeks','Develop Online compiler to edit,compile and run the code.',30000,2,'yes'),(4,'Website For Barbours','Html,Bootstrap,javascript,NodeJs','8 Weeks','Must include good UI,Location Api,and payment gateway',56000,8,'yes'),(5,'Online chat bot','php, java,javascript','8 weeks','to create online chat bot for comapny',500000,8,'yes');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `startup`
--

DROP TABLE IF EXISTS `startup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `startup` (
  `description` varchar(100) DEFAULT NULL,
  `no_of_Employee` int(11) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `startup_id` int(11) NOT NULL AUTO_INCREMENT,
  `flag` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`startup_id`),
  KEY `fk_startup` (`email`),
  CONSTRAINT `fk_startup` FOREIGN KEY (`email`) REFERENCES `user` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `startup`
--

LOCK TABLES `startup` WRITE;
/*!40000 ALTER TABLE `startup` DISABLE KEYS */;
INSERT INTO `startup` VALUES ('scad',5,'abc',13,'yes'),('java',12,'atharva@gmail.com',14,'yes'),('java',18,'vishal@gmail.com',15,'yes'),('java',18,'nago@gmail.com',16,'yes'),('dotnet',58,'manohar@gmail.com',17,'yes'),('cnvjdn',5,'ffff',18,'yes'),('asakbdsab',5,'qwer',19,'yes'),('sndafnk',5,'qwwwewe',20,'yes'),('hvgcg',56,'rtrww',21,'yes'),('Service and Travels',1200,'ola@gmail.com',22,'yes'),('sdnjvnsjvn',10,'laxmi@gmail.com',23,'yes'),('dkbhdab',4,'chaitu',24,'yes'),('dncdn',10,'my@gmail.com',25,'yes');
/*!40000 ALTER TABLE `startup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_name` varchar(30) DEFAULT NULL,
  `gst_id` varchar(30) DEFAULT NULL,
  `contact_no` mediumtext,
  `email` varchar(30) NOT NULL,
  `password` varchar(30) DEFAULT NULL,
  `flag` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('manohar','gstin27051996','54544','abc','1234','yes'),('atharva','gstin190031','9546462321','atharva@gmail.com','abcd','yes'),('chaitu','gstin0106','154545484','chaitu','4545','yes'),('chaitanya','gstin190037','9423122367','chaitumhatre@gmail.com','chaitu','yes'),('honeywell','abcd','12145454','ffff','5555','yes'),('Laxmi','gstin1811','784454','laxmi@gmail.com','LAXMI123','yes'),('manohar','gstin190048','9423454367','manohar@gmail.com','mano','yes'),('Mayur','12345','8745454','mayur','12345','yes'),('Mindtree','gstin1997','7445854484','mindtree@gmail.com','mindtree','yes'),('MyRoom','gst110','4554','my@gmail.com','110','yes'),('nagratna','gstin190058','9425622378','nago@gmail.com','nago','yes'),('Ola','gstin2008','87458954','ola@gmail.com','ola','yes'),('Oracle','gst111','564654','oracle@gmail.com','111','yes'),('Demo','abcd','454545','qwer','9999','yes'),('demo project','abcd','656546','qwwwewe','8888','yes'),('Demo','abcd','54545','rtrww','88888','yes'),('vishal','gstin1900118','9892122367','vishal@gmail.com','vishu','yes'),('chaitu','abcd','2413','xyz','1234','yes');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-30  6:33:11
