
-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: Company
-- ------------------------------------------------------
-- Server version       5.7.23-0ubuntu0.18.04.1

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

DROP DATABASE IF EXISTS `SUPERMARKET`;
CREATE SCHEMA `SUPERMARKET`;
USE `SUPERMARKET`;


--
-- Table structure for table `GOODS`
--

DROP TABLE IF EXISTS `GOODS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GOODS` (
  `GOOD_ID` int(100) NOT NULL,
  `GOOD_TYPE` varchar(150) NOT NULL,
  `BRAND` char(90) NOT NULL,
  `MRP` int(110) NOT NULL,
  `MANUFACTURE_DATE` date DEFAULT NULL,
  `EXPIRY_DATE` date DEFAULT NULL,
  `NET_WEIGHT` int(255) DEFAULT NULL,
  `TRADE_MARK` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`GOOD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GOODS`
--

LOCK TABLES `GOODS` WRITE;
/*!40000 ALTER TABLE `GOODS` DISABLE KEYS */;
INSERT INTO `GOODS` VALUES (110001,'Cosmetics','Himalaya',120,'2019-10-22','2021-10-22',100,'Himalaya Global Holdings Ltd'),(110002,'Cosmetics','Himalaya',150,'2019-10-22','2021-10-22',150,'Himalaya Global Holdings Ltd'),(110003,'Cosmetics','Himalaya',250,'2019-10-22','2021-10-22',250,'Himalaya Global Holdings Ltd'),(110004,'Cosmetics','Himalaya',50,'2019-10-17','2021-10-17',80,'Hindustan Unilever Ltd'),(110005,'Cosmetics','Himalaya',100,'2019-10-17','2021-10-17',100,'Hindustan Unilever Ltd');
/*!40000 ALTER TABLE `GOODS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GOODS.BRANCHES`
--

DROP TABLE IF EXISTS `GOODS.BRANCHES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GOODS.BRANCHES` (
  `GOOD_ID` int(100) NOT NULL,
  `BRANCH_ID` int(100) NOT NULL,
  PRIMARY KEY (`GOOD_ID`,`BRANCH_ID`),
  CONSTRAINT `GOODS.BRANCHES_ibfk_1` FOREIGN KEY (`GOOD_ID`) REFERENCES `GOODS` (`GOOD_ID`),
  CONSTRAINT `GOODS.BRANCHES_ibfk_2` FOREIGN KEY (`BRANCH_ID`) REFERENCES `BRANCH` (`BRANCH_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GOODS.BRANCHES`
--

LOCK TABLES `GOODS.BRANCHES` WRITE;
/*!40000 ALTER TABLE `GOODS.BRANCHES` DISABLE KEYS */;
INSERT INTO `GOODS.BRANCHES` VALUES (110001,10001),(110001,10002),(110002,10002),(110003,10003),(110004,10002),(110005,10002);
/*!40000 ALTER TABLE `GOODS.BRANCHES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GOODS.SUPPLIERS`
--

DROP TABLE IF EXISTS `GOODS.SUPPLIERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GOODS.SUPPLIERS` (
  `SUPPLIER_ID` int(100) NOT NULL,
  `GOOD_ID` int(100) NOT NULL,
  PRIMARY KEY (`SUPPLIER_ID`,`GOOD_ID`),
  CONSTRAINT `GOODS.SUPPLIERS_ibfk_1` FOREIGN KEY (`SUPPLIER_ID`) REFERENCES `SUPPLIER` (`SUPPLIER_ID`),
  CONSTRAINT `GOODS.SUPPLIERS_ibfk_2` FOREIGN KEY (`GOOD_ID`) REFERENCES `GOODS` (`GOOD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GOODS.SUPPLIERS`
--

LOCK TABLES `GOODS.SUPPLIERS` WRITE;
/*!40000 ALTER TABLE `GOODS.SUPPLIERS` DISABLE KEYS */;
INSERT INTO `GOODS.SUPPLIERS` VALUES (50001,110001),(50001,110002),(50001,110003),(50002,110001),(50002,110002),(50002,110003),(50003,110004),(50003,110005);
/*!40000 ALTER TABLE `GOODS.SUPPLIERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BRANCH`
--

DROP TABLE IF EXISTS `BRANCH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BRANCH` (
  `BRANCH_ID` int(100) NOT NULL,
  `LOCATION.STREETNAME` varchar(90) DEFAULT NULL,
  `LOCATION.CITY` varchar(90) NOT NULL,
  `LOCATION.DISTRICT` varchar(90) DEFAULT NULL,
  `LOCATION.STATE` varchar(90) DEFAULT NULL,
  `PARTNER_ID` int(100) NOT NULL,
  PRIMARY KEY (`BRANCH_ID`),
  CONSTRAINT `BRANCH_ibfk_1` FOREIGN KEY (`PARTNER_ID`) REFERENCES `PARTNER` (`PARTNER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BRANCH`
--

LOCK TABLES `BRANCH` WRITE;
/*!40000 ALTER TABLE `BRANCH` DISABLE KEYS */;
INSERT INTO `BRANCH` VALUES (10001,'Gachibowli circle','Hyderabad','Hyderabad','Telangana',20001),(10002,'Dr.Radhakrishnan Nagar (South)','Chennai','Chennai','Tamil Nadu',20002),(10003,'Padma Nagar','Karimnagar','Karimnagar','Telangana',20002);
/*!40000 ALTER TABLE `BRANCH` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `BRANCH.PINCODE`
--

DROP TABLE IF EXISTS `BRANCH.PINCODE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BRANCH.PINCODE` (
  `LOCATION.CITY` varchar(100) NOT NULL,
  `LOCATION.PINCODE` char(7) NOT NULL,
  PRIMARY KEY (`LOCATION.CITY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BRANCH.PINCODE`
--

LOCK TABLES `BRANCH.PINCODE` WRITE;
/*!40000 ALTER TABLE `BRANCH.PINCODE` DISABLE KEYS */;
INSERT INTO `BRANCH.PINCODE` VALUES ('Hyderabad','500032'),('Chennai','600036'),('Karimnagar','505001');
/*!40000 ALTER TABLE `BRANCH.PINCODE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BRANCHES.SUPPLIERS`
--

DROP TABLE IF EXISTS `BRANCHES.SUPPLIERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BRANCHES.SUPPLIERS` (
  `BRANCH_ID` int(100) NOT NULL,
  `SUPPLIER_ID` int(100) NOT NULL,
  PRIMARY KEY (`BRANCH_ID`,`SUPPLIER_ID`),
  CONSTRAINT `BRANCHES.SUPPLIERS_ibfk_1` FOREIGN KEY (`BRANCH_ID`) REFERENCES `BRANCH` (`BRANCH_ID`),
  CONSTRAINT `BRANCHES.SUPPLIERS_ibfk_2` FOREIGN KEY (`SUPPLIER_ID`) REFERENCES `SUPPLIER` (`SUPPLIER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BRANCHES.SUPPLIERS`
--

LOCK TABLES `BRANCHES.SUPPLIERS` WRITE;
/*!40000 ALTER TABLE `BRANCHES.SUPPLIERS` DISABLE KEYS */;
INSERT INTO `BRANCHES.SUPPLIERS` VALUES (50001,110001),(50001,110002),(50001,110003),(50002,110001),(50002,110002),(50002,110003),(50003,110004),(50003,110005);
/*!40000 ALTER TABLE `BRANCHES.SUPPLIERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMPLOYEE`
--

DROP TABLE IF EXISTS `EMPLOYEE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EMPLOYEE` (
  `EMPLOYEE_ID` int(100) NOT NULL,
  `FIRST_NAME` varchar(150) NOT NULL,
  `LAST_NAME` varchar(150) NOT NULL,
  `MOTHER'S_NAME` varchar(150) DEFAULT NULL,
  `FATHER'S_NAME` varchar(150) DEFAULT NULL,
  `QUALIFICATION` varchar(150) DEFAULT NULL, 
  `DOB` date DEFAULT NULL,
  `DATE_OF_RECRUITMENT` date NOT NULL,
  `MOBILE_NUMBER` char(10) DEFAULT NULL,
  `EMPLOYEE_TYPE` varchar(15) DEFAULT NULL,
  `SALARY` int(100) NOT NULL,
  `BRANCH_ID` int(100) NOT NULL,
  PRIMARY KEY (`EMPLOYEE_ID`),
  CONSTRAINT `EMPLOYEE_ibfk_1` FOREIGN KEY (`BRANCH_ID`) REFERENCES `BRANCH` (`BRANCH_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLOYEE`
--

LOCK TABLES `EMPLOYEE` WRITE;
/*!40000 ALTER TABLE `EMPLOYEE` DISABLE KEYS */;
INSERT INTO `EMPLOYEE` VALUES (70001,'Sai','AA','Sruthi','Kiran','10th','1989-06-10','2012-11-19','9246985555','Manager',25000,10001),(70002,'Ravi','BB','Harika','Sudhir','Btech','1992-07-09','2015-08-07','9444554478','Worker',10000,10001),(70003,'Sree','CC','Priya','Teja','BA','1995-12-19','2014-07-08','9454154526','Worker',9000,10002);
/*!40000 ALTER TABLE `EMPLOYEE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MANAGER`
--

DROP TABLE IF EXISTS `MANAGER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MANAGER` (
  `EMPLOYEE_ID` int(100) NOT NULL,
  `WORKER_ID` int(100) NOT NULL,
  PRIMARY KEY (`EMPLOYEE_ID`,`WORKER_ID`),
  CONSTRAINT `MANAGER_ibfk_1` FOREIGN KEY (`EMPLOYEE_ID`) REFERENCES `EMPLOYEE` (`EMPLOYEE_ID`),
  CONSTRAINT `MANAGER_ibfk_2` FOREIGN KEY (`WORKER_ID`) REFERENCES `WORKER` (`WORKER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MANAGER`
--

LOCK TABLES `MANAGER` WRITE;
/*!40000 ALTER TABLE `MANAGER` DISABLE KEYS */;
INSERT INTO `MANAGER` VALUES (70001,70002),(70001,70003);
/*!40000 ALTER TABLE `MANAGER` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `INCREMENT`
--

DROP TABLE IF EXISTS `INCREMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INCREMENT` (
  `EMPLOYEE_ID` int(100) NOT NULL,
  `INCREMENT_LAST_YEAR` int(255) NOT NULL,
  PRIMARY KEY (`EMPLOYEE_ID`,`INCREMENT_LAST_YEAR`),
  CONSTRAINT `INCREMENT_ibfk_1` FOREIGN KEY (`EMPLOYEE_ID`) REFERENCES `EMPLOYEE` (`EMPLOYEE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INCREMENT`
--

LOCK TABLES `INCREMENT` WRITE;
/*!40000 ALTER TABLE `INCREMENT` DISABLE KEYS */;
INSERT INTO `INCREMENT` VALUES (70001,1500),(70002,800),(70003,600);
/*!40000 ALTER TABLE `INCREMENT` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `SUPPLIER`
--

DROP TABLE IF EXISTS `SUPPLIER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SUPPLIER` (
  `SUPPLIER_ID` int(100) NOT NULL,
  `NAME` varchar(150) NOT NULL,
  PRIMARY KEY (`SUPPLIER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SUPPLIER`
--

LOCK TABLES `SUPPLIER` WRITE;
/*!40000 ALTER TABLE `SUPPLIER` DISABLE KEYS */;
INSERT INTO `SUPPLIER` VALUES (50001,'Raju'),(50002,'Somesh'),(50003,'Venkat');
/*!40000 ALTER TABLE `SUPPLIER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PARTNER`
--

DROP TABLE IF EXISTS `PARTNER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PARTNER` (
  `PARTNER_ID` int(100) NOT NULL,
  `NAME` varchar(150) NOT NULL,
  `MOBILE_NUMBER` char(10) DEFAULT NULL,
  PRIMARY KEY (`PARTNER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PARTNER`
--

LOCK TABLES `PARTNER` WRITE;
/*!40000 ALTER TABLE `PARTNER` DISABLE KEYS */;
INSERT INTO `PARTNER` VALUES (20001,'Pratap','9100546551'),(20002,'Sumanth','9553560050');
/*!40000 ALTER TABLE `PARTNER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PARTNER.BRANCH`
--

DROP TABLE IF EXISTS `PARTNER.BRANCH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PARTNER.BRANCH` (
  `BRANCH_ID` int(100) NOT NULL,
  `PARTNER_ID` int(100) NOT NULL,
  PRIMARY KEY (`PARTNER_ID`,`BRANCH_ID`),
  CONSTRAINT `PARTNER.BRANCH_ibfk_1` FOREIGN KEY (`PARTNER_ID`) REFERENCES `PARTNER` (`PARTNER_ID`),
  CONSTRAINT `PARTNER.BRANCH_ibfk_2` FOREIGN KEY (`BRANCH_ID`) REFERENCES `BRANCH` (`BRANCH_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PARTNER.BRANCH`
--

LOCK TABLES `PARTNER.BRANCH` WRITE;
/*!40000 ALTER TABLE `PARTNER.BRANCH` DISABLE KEYS */;
INSERT INTO `PARTNER.BRANCH` VALUES (20001,10001),(20002,10002),(20002,110003);
/*!40000 ALTER TABLE `PARTNER.BRANCH` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MANUFACTURER`
--

DROP TABLE IF EXISTS `MANUFACTURER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MANUFACTURER` (
  `MANUFACTURER_ID` int(100) NOT NULL,
  `FACTORY_NAME` varchar(100) DEFAULT NULL,
  `MADDRESS.BUILDINGNUMBER` varchar(90) DEFAULT NULL,
  `MADDRESS.CITY` varchar(90) NOT NULL,
  `MADDRESS.DISTRICT` varchar(90) DEFAULT NULL,
  `MADDRESS.STATE` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`MANUFACTURER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MANUFACTURER`
--

LOCK TABLES `MANUFACTURER` WRITE;
/*!40000 ALTER TABLE `MANUFACTURER` DISABLE KEYS */;
INSERT INTO `MANUFACTURER` VALUES (60001,'Himalaya Drug company','Plot no. 16/A','Jeedimetla','Hyderabad','Telangana'),(60002,'Herbal concepts health care PVT.LTD','Plot no. 2','Ranipur','Haridwar','Uttarakhand');
/*!40000 ALTER TABLE `MANUFACTURER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MANUFACTURER.PINCODE`
--

DROP TABLE IF EXISTS `MANUFACTURER.PINCODE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MANUFACTURER.PINCODE` (
  `MADDRESS.CITY` varchar(100) NOT NULL,
  `MADDRESS.PINCODE` char(7) NOT NULL,
  PRIMARY KEY (`MADDRESS.CITY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MANUFACTURER.PINCODE`
--

LOCK TABLES `MANUFACTURER.PINCODE` WRITE;
/*!40000 ALTER TABLE `MANUFACTURER.PINCODE` DISABLE KEYS */;
INSERT INTO `MANUFACTURER.PINCODE` VALUES ('Jeedimetla','500055'),('Ranipur','249403');
/*!40000 ALTER TABLE `MANUFACTURER.PINCODE` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `MANUFACTURER.SUPPLIERS`
--

DROP TABLE IF EXISTS `MANUFACTURER.SUPPLIERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MANUFACTURER.SUPPLIERS` (
  `MANUFACTURER_ID` int(100) NOT NULL,
  `SUPPLIER_ID` int(100) NOT NULL,
  PRIMARY KEY (`MANUFACTURER_ID`,`SUPPLIER_ID`),
  CONSTRAINT `MANUFACTURER.SUPPLIERS_ibfk_1` FOREIGN KEY (`MANUFACTURER_ID`) REFERENCES `MANUFACTURER` (`MANUFACTURER_ID`),
  CONSTRAINT `MANUFACTURER.SUPPLIERS_ibfk_2` FOREIGN KEY (`SUPPLIER_ID`) REFERENCES `SUPPLIER` (`SUPPLIER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MANUFACTURER.SUPPLIERS`
--

LOCK TABLES `MANUFACTURER.SUPPLIERS` WRITE;
/*!40000 ALTER TABLE `MANUFACTURER.SUPPLIERS` DISABLE KEYS */;
INSERT INTO `MANUFACTURER.SUPPLIERS` VALUES (60001,50001),(60001,50002),(60002,50003);
/*!40000 ALTER TABLE `MANUFACTURER.SUPPLIERS` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `MANUFACTURER.GOODS`
--

DROP TABLE IF EXISTS `MANUFACTURER.GOODS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MANUFACTURER.GOODS` (
  `MANUFACTURER_ID` int(100) NOT NULL,
  `GOOD_ID` int(100) NOT NULL,
  PRIMARY KEY (`MANUFACTURER_ID`,`GOOD_ID`),
  CONSTRAINT `MANUFACTURER.GOODS_ibfk_1` FOREIGN KEY (`MANUFACTURER_ID`) REFERENCES `MANUFACTURER` (`MANUFACTURER_ID`),
  CONSTRAINT `MANUFACTURER.GOODS_ibfk_2` FOREIGN KEY (`GOOD_ID`) REFERENCES `GOOD` (`GOOD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MANUFACTURER.GOODS`
--

LOCK TABLES `MANUFACTURER.GOODS` WRITE;
/*!40000 ALTER TABLE `MANUFACTURER.GOODS` DISABLE KEYS */;
INSERT INTO `MANUFACTURER.GOODS` VALUES (60001,110001),(60001,110002),(60001,110003),(60002,110004),(60002,110005);
/*!40000 ALTER TABLE `MANUFACTURER.GOODS` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `CUSTOMERR`
--

DROP TABLE IF EXISTS `CUSTOMER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CUSTOMER` (
  `CUSTOMER_ID` int(100) NOT NULL,
  `NAME` varchar(150) NOT NULL,
  `MOBILE_NUMBER` char(10) DEFAULT NULL,
  `MEMBERSHIP_FLAG` int(10) NOT NULL,
  PRIMARY KEY (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMER`
--

LOCK TABLES `CUSTOMER` WRITE;
/*!40000 ALTER TABLE `CUSTOMER` DISABLE KEYS */;
INSERT INTO `CUSTOMER` VALUES (80052,'Anushree','9445415425',1),(80002,'Rahul','9425426221',1),(80004,'Kowshik','9742252221',1),(80005,'Kushal','9841222221',0);
/*!40000 ALTER TABLE `CUSTOMER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MEMBERSHIP`
--

DROP TABLE IF EXISTS `MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MEMBERSHIP` (
  `MEMBERSHIP_ID` int(100) NOT NULL,
  `MEMBERSHIP_TYPE` char(10) NOT NULL,
  `CUSTOMER_ID` int(100) NOT NULL,
  PRIMARY KEY (`CUSTOMER_ID`),
  CONSTRAINT `MEMBERSHIP_ibfk_1` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `CUSTOMER` (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MEMBERSHIP`
--

LOCK TABLES `MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `MEMBERSHIP` DISABLE KEYS */;
INSERT INTO `MEMBERSHIP` VALUES (90001,'A',80052),(90002,'B',80002),(90003,'C',80004);
/*!40000 ALTER TABLE `MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `DISCOUNT`
--

DROP TABLE IF EXISTS `DISCOUNT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DISCOUNT` (
  `CUSTOMER_ID` int(100) NOT NULL,
  `DISCOUNT` int(100) NOT NULL,
  PRIMARY KEY (`CUSTOMER_ID`,`DISCOUNT`),
  CONSTRAINT `DISCOUNT_ibfk_1` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `CUSTOMER` (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DISCOUNT`
--

LOCK TABLES `DISCOUNT` WRITE;
/*!40000 ALTER TABLE `DISCOUNT` DISABLE KEYS */;
INSERT INTO `DISCOUNT` VALUES (80052,2000),(80002,1000),(80004,500);
/*!40000 ALTER TABLE `DISCOUNT` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `SUPPLY`
--

DROP TABLE IF EXISTS `SUPPLY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SUPPLY` (
  `BRANCH_ID` int(100) NOT NULL,
  `CUSTOMER_ID` int(100) NOT NULL,
  `MANUFACTURER_ID` int(100) NOT NULL,
  `SUPPLIER_ID` int(100) NOT NULL,
  `GOOD_ID` int(100) NOT NULL,
  PRIMARY KEY (`BRANCH_ID`,`CUSTOMER_ID`,`MANUFACTURER_ID`,`SUPPLIER_ID`,`GOOD_ID`),
  CONSTRAINT `SUPPLY_ibfk_1` FOREIGN KEY (`BRANCH_ID`) REFERENCES `BRANCH` (`BRANCH_ID`),
  CONSTRAINT `SUPPLY_ibfk_2` FOREIGN KEY (`SUPPLIER_ID`) REFERENCES `SUPPLIER` (`SUPPLIER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BRANCHES.SUPPLIERS`
--

LOCK TABLES `SUPPLY` WRITE;
/*!40000 ALTER TABLE `SUPPLY` DISABLE KEYS */;
INSERT INTO `SUPPLY` VALUES (10001,80002,60001,50001,110001),(10001,80004,60001,50002,110001),(10002,80005,60001,50002,110001),(10002,80005,60001,50002,110004),(10002,80005,60002,50003,110004),(10002,80005,60002,50003,110005),(10003,80052,60001,50001,110003);
/*!40000 ALTER TABLE `SUPPLY` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;



