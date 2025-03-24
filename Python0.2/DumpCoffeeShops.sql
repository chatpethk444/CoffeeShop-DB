-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: coffeeshops
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `coffeebeans`
--

DROP TABLE IF EXISTS `coffeebeans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coffeebeans` (
  `CoffeeBeansID` char(5) NOT NULL,
  `B_Name` varchar(30) NOT NULL,
  `B_Price` decimal(8,2) NOT NULL,
  `B_Stock` char(3) NOT NULL,
  `B_Cultivation` varchar(20) NOT NULL,
  `B_Type` varchar(20) NOT NULL,
  PRIMARY KEY (`CoffeeBeansID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coffeebeans`
--

LOCK TABLES `coffeebeans` WRITE;
/*!40000 ALTER TABLE `coffeebeans` DISABLE KEYS */;
/*!40000 ALTER TABLE `coffeebeans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CustomerID` char(5) NOT NULL,
  `C_Name` varchar(30) NOT NULL,
  `C_Address` varchar(30) NOT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customeremail`
--

DROP TABLE IF EXISTS `customeremail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customeremail` (
  `CustomerID` char(5) NOT NULL,
  `C_Email` varchar(35) NOT NULL,
  PRIMARY KEY (`CustomerID`,`C_Email`),
  CONSTRAINT `customeremail_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customeremail`
--

LOCK TABLES `customeremail` WRITE;
/*!40000 ALTER TABLE `customeremail` DISABLE KEYS */;
/*!40000 ALTER TABLE `customeremail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerphone`
--

DROP TABLE IF EXISTS `customerphone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customerphone` (
  `CustomerID` char(5) NOT NULL,
  `C_Phone` char(10) NOT NULL,
  PRIMARY KEY (`CustomerID`,`C_Phone`),
  CONSTRAINT `customerphone_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerphone`
--

LOCK TABLES `customerphone` WRITE;
/*!40000 ALTER TABLE `customerphone` DISABLE KEYS */;
/*!40000 ALTER TABLE `customerphone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `de_order`
--

DROP TABLE IF EXISTS `de_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `de_order` (
  `OrderID` char(10) NOT NULL,
  `CoffeeBeansID` char(5) NOT NULL,
  `O_Num` char(5) NOT NULL,
  PRIMARY KEY (`OrderID`,`CoffeeBeansID`),
  KEY `CoffeeBeansID` (`CoffeeBeansID`),
  CONSTRAINT `de_order_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  CONSTRAINT `de_order_ibfk_2` FOREIGN KEY (`CoffeeBeansID`) REFERENCES `coffeebeans` (`CoffeeBeansID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `de_order`
--

LOCK TABLES `de_order` WRITE;
/*!40000 ALTER TABLE `de_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `de_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `de_receip`
--

DROP TABLE IF EXISTS `de_receip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `de_receip` (
  `ReceiptID` char(10) NOT NULL,
  `CoffeeBeansID` char(5) NOT NULL,
  `R_Num` char(5) NOT NULL,
  PRIMARY KEY (`ReceiptID`,`CoffeeBeansID`),
  KEY `CoffeeBeansID` (`CoffeeBeansID`),
  CONSTRAINT `de_receip_ibfk_1` FOREIGN KEY (`ReceiptID`) REFERENCES `receipt` (`ReceiptID`),
  CONSTRAINT `de_receip_ibfk_2` FOREIGN KEY (`CoffeeBeansID`) REFERENCES `coffeebeans` (`CoffeeBeansID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `de_receip`
--

LOCK TABLES `de_receip` WRITE;
/*!40000 ALTER TABLE `de_receip` DISABLE KEYS */;
/*!40000 ALTER TABLE `de_receip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `DepartmentID` char(6) NOT NULL,
  `D_Name` varchar(10) NOT NULL,
  PRIMARY KEY (`DepartmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('D001','Dep 1');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `EmployeeID` char(5) NOT NULL,
  `E_Name` varchar(30) NOT NULL,
  `E_Brith` date NOT NULL,
  `E_Age` int DEFAULT NULL,
  `E_Salary` decimal(8,2) NOT NULL,
  `E_Position` varchar(20) NOT NULL,
  `E_ManagerID` char(5) DEFAULT NULL,
  `DepartmentID` char(5) NOT NULL,
  PRIMARY KEY (`EmployeeID`),
  KEY `E_ManagerID` (`E_ManagerID`),
  KEY `DepartmentID` (`DepartmentID`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`E_ManagerID`) REFERENCES `employee` (`EmployeeID`),
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`DepartmentID`) REFERENCES `department` (`DepartmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('E0001','Yoon','2004-01-01',NULL,100000.00,'Manager',NULL,'D001'),('E0002','Mos','2004-04-02',NULL,25000.00,'Henchman','E0001','D001');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeephone`
--

DROP TABLE IF EXISTS `employeephone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeephone` (
  `EmployeeID` char(5) NOT NULL,
  `E_Phone` char(10) NOT NULL,
  PRIMARY KEY (`EmployeeID`,`E_Phone`),
  CONSTRAINT `employeephone_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeephone`
--

LOCK TABLES `employeephone` WRITE;
/*!40000 ALTER TABLE `employeephone` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeephone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entityphone`
--

DROP TABLE IF EXISTS `entityphone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entityphone` (
  `DepartmentID` char(6) NOT NULL,
  `D_Phone` char(10) NOT NULL,
  PRIMARY KEY (`DepartmentID`,`D_Phone`),
  CONSTRAINT `entityphone_ibfk_1` FOREIGN KEY (`DepartmentID`) REFERENCES `department` (`DepartmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entityphone`
--

LOCK TABLES `entityphone` WRITE;
/*!40000 ALTER TABLE `entityphone` DISABLE KEYS */;
/*!40000 ALTER TABLE `entityphone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` char(10) NOT NULL,
  `O_Date` date NOT NULL,
  `SupplyerID` char(5) NOT NULL,
  `EmployeeID` char(5) NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `SupplyerID` (`SupplyerID`),
  KEY `EmployeeID` (`EmployeeID`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`SupplyerID`) REFERENCES `supplyer` (`SupplyerID`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receipt`
--

DROP TABLE IF EXISTS `receipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receipt` (
  `ReceiptID` char(10) NOT NULL,
  `R_Date` date NOT NULL,
  `CustomerID` char(5) NOT NULL,
  `EmployeeID` char(5) NOT NULL,
  PRIMARY KEY (`ReceiptID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `EmployeeID` (`EmployeeID`),
  CONSTRAINT `receipt_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  CONSTRAINT `receipt_ibfk_2` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipt`
--

LOCK TABLES `receipt` WRITE;
/*!40000 ALTER TABLE `receipt` DISABLE KEYS */;
/*!40000 ALTER TABLE `receipt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplyer`
--

DROP TABLE IF EXISTS `supplyer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplyer` (
  `SupplyerID` char(5) NOT NULL,
  `S_Name` varchar(20) NOT NULL,
  PRIMARY KEY (`SupplyerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplyer`
--

LOCK TABLES `supplyer` WRITE;
/*!40000 ALTER TABLE `supplyer` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplyer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplyerphone`
--

DROP TABLE IF EXISTS `supplyerphone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplyerphone` (
  `SupplyerID` char(5) NOT NULL,
  `S_Phone` char(10) NOT NULL,
  PRIMARY KEY (`SupplyerID`,`S_Phone`),
  CONSTRAINT `supplyerphone_ibfk_1` FOREIGN KEY (`SupplyerID`) REFERENCES `supplyer` (`SupplyerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplyerphone`
--

LOCK TABLES `supplyerphone` WRITE;
/*!40000 ALTER TABLE `supplyerphone` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplyerphone` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-24  1:57:16
