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
INSERT INTO `coffeebeans` VALUES ('CB001','Arabica',10.50,'100','Brazil','Light Roast'),('CB002','Robusta',8.75,'200','Vietnam','Dark Roast');
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
  `C_Phone` char(10) DEFAULT NULL,
  `C_Email` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('C0001','Anan Suphachai','12/34 Moo 5,Bangkok','080340124','AnanSuphachai42@gmail.com'),('C0002','Ploy Chutima','55/89 Moo 3, Nonthaburi ','094828412','PloyChutima1@gmail.com'),('C0003','Supaporn Jindarat','789/12 Moo 2, Bangkok','084545921','Supaporn24@gmail.com');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
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
INSERT INTO `de_order` VALUES ('ORD001','CB001','50'),('ORD002','CB002','100');
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
INSERT INTO `de_receip` VALUES ('RCP001','CB001','10'),('RCP002','CB002','20');
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
  `D_Phone` char(10) DEFAULT NULL,
  PRIMARY KEY (`DepartmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('D001','Dep 1','062031532');
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
  `E_Phone` char(10) DEFAULT NULL,
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
INSERT INTO `employee` VALUES ('E0001','Yoon','2004-01-01',NULL,100000.00,'083012405','Manager',NULL,'D001'),('E0002','Mos','2004-04-02',NULL,25000.00,'095305204','Henchman','E0001','D001'),('E0003','Bart','2003-07-12',NULL,45000.00,'094021414','AssistantManager','E0001','D001');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
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
  `O_Price` decimal(10,2) DEFAULT NULL,
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
INSERT INTO `orders` VALUES ('ORD001','2024-02-01',NULL,'S001','E0002'),('ORD002','2024-02-02',NULL,'S001','E0002');
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
  `R_Price` decimal(10,2) DEFAULT NULL,
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
INSERT INTO `receipt` VALUES ('RCP001','2024-02-05',NULL,'C0001','E0002'),('RCP002','2024-02-06',NULL,'C0002','E0003');
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
  `S_Phone` char(10) DEFAULT NULL,
  PRIMARY KEY (`SupplyerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplyer`
--

LOCK TABLES `supplyer` WRITE;
/*!40000 ALTER TABLE `supplyer` DISABLE KEYS */;
INSERT INTO `supplyer` VALUES ('S001','Supplier A','083043025'),('S002','Supplier B','069240146');
/*!40000 ALTER TABLE `supplyer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-25  1:03:36
