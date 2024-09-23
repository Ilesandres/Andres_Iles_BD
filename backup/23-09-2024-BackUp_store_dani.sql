CREATE DATABASE  IF NOT EXISTS `store_dani` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `store_dani`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: store_dani
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.28-MariaDB

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `ID_CATEGORY` int(11) NOT NULL AUTO_INCREMENT,
  `CATEGORY_NAME` varchar(50) DEFAULT NULL,
  `DESCRIPTION` tinytext DEFAULT NULL,
  PRIMARY KEY (`ID_CATEGORY`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Carnes','carnes multiples'),(2,'productos de aseo','productos de aseo, jabones, desinfectantes e.t.c'),(3,'Purinas','alimentos para mascotas y animales ge granja o domesticos'),(4,'mecato xunidad','mecato dulces para niños'),(5,'Bedidas enbotelladas','bebidas generales'),(6,'granos','alimentos granos, arroz, arbeja, frijol...'),(7,'frutas y verduras','alimentos varios, naturales'),(8,'productos azucarados','dulces, panelas, azucar...\n'),(9,'abarrotes','utiles varios de usos varios');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `ID_CUSTOMER` int(11) NOT NULL AUTO_INCREMENT,
  `PERSON_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_CUSTOMER`),
  KEY `PERSON_ID` (`PERSON_ID`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`PERSON_ID`) REFERENCES `person` (`ID_PERSON`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,1);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_type`
--

DROP TABLE IF EXISTS `document_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_type` (
  `ID_DOCUMENT_TYPE` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_DOCUMENT_TYPE`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_type`
--

LOCK TABLES `document_type` WRITE;
/*!40000 ALTER TABLE `document_type` DISABLE KEYS */;
INSERT INTO `document_type` VALUES (1,'T.I'),(2,'C.C'),(3,'C.E');
/*!40000 ALTER TABLE `document_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `ID_INVOICE` int(11) NOT NULL AUTO_INCREMENT,
  `CUSTOMER_ID` int(11) DEFAULT NULL,
  `STATUS_ID` int(11) DEFAULT NULL,
  `CREATED_AT` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `UPDATED_AT` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_INVOICE`),
  KEY `CUSTOMER_ID` (`CUSTOMER_ID`),
  KEY `STATUS_ID` (`STATUS_ID`),
  CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`ID_CUSTOMER`),
  CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`STATUS_ID`) REFERENCES `invoice_status` (`ID_INVOICE_STATUS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_product`
--

DROP TABLE IF EXISTS `invoice_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_product` (
  `ID_INVOICE_PRODUCT` int(11) NOT NULL AUTO_INCREMENT,
  `PRODUCT_ID` int(11) DEFAULT NULL,
  `INVOICE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_INVOICE_PRODUCT`),
  KEY `PRODUCT_ID` (`PRODUCT_ID`),
  KEY `INVOICE_ID` (`INVOICE_ID`),
  CONSTRAINT `invoice_product_ibfk_1` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`ID_PRODUCT`),
  CONSTRAINT `invoice_product_ibfk_2` FOREIGN KEY (`INVOICE_ID`) REFERENCES `invoice` (`ID_INVOICE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_product`
--

LOCK TABLES `invoice_product` WRITE;
/*!40000 ALTER TABLE `invoice_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_status`
--

DROP TABLE IF EXISTS `invoice_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_status` (
  `ID_INVOICE_STATUS` int(11) NOT NULL AUTO_INCREMENT,
  `STATUS_NAME` varchar(50) DEFAULT NULL,
  `DESCRIPTION` tinytext DEFAULT NULL,
  PRIMARY KEY (`ID_INVOICE_STATUS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_status`
--

LOCK TABLES `invoice_status` WRITE;
/*!40000 ALTER TABLE `invoice_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `ID_ORDER` int(11) NOT NULL AUTO_INCREMENT,
  `INVOICE_ID` int(11) DEFAULT NULL,
  `STATUS_ID` int(11) DEFAULT NULL,
  `DETAILS` tinytext DEFAULT NULL,
  PRIMARY KEY (`ID_ORDER`),
  KEY `INVOICE_ID` (`INVOICE_ID`),
  KEY `STATUS_ID` (`STATUS_ID`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`INVOICE_ID`) REFERENCES `invoice` (`ID_INVOICE`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`STATUS_ID`) REFERENCES `order_status` (`ID_ORDER_STATUS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status`
--

DROP TABLE IF EXISTS `order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_status` (
  `ID_ORDER_STATUS` int(11) NOT NULL AUTO_INCREMENT,
  `STATUS_NAME` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_ORDER_STATUS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status`
--

LOCK TABLES `order_status` WRITE;
/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `ID_PERSON` int(11) NOT NULL AUTO_INCREMENT,
  `FIRST_NAME` varchar(30) DEFAULT NULL,
  `LAST_NAME` varchar(30) DEFAULT NULL,
  `ADDRESS` varchar(70) DEFAULT NULL,
  `DOCUMENT_TYPE_ID` int(11) DEFAULT NULL,
  `DOCUMENT_NUMBER` varchar(12) DEFAULT NULL,
  `PHONE` varchar(12) DEFAULT NULL,
  `CREATED_AT` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `UPDATED_AT` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_PERSON`),
  KEY `DOCUMENT_TYPE_ID` (`DOCUMENT_TYPE_ID`),
  CONSTRAINT `person_ibfk_1` FOREIGN KEY (`DOCUMENT_TYPE_ID`) REFERENCES `document_type` (`ID_DOCUMENT_TYPE`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'Camilo','Santacruz Gutierres','V/Palmenras',2,'1127071439','3227349085','2024-09-23 00:05:33',NULL);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `ID_PRODUCT` int(11) NOT NULL AUTO_INCREMENT,
  `PRODUCT_NAME` varchar(50) DEFAULT NULL,
  `STOCK` int(11) DEFAULT NULL,
  `PRICE` int(11) DEFAULT NULL,
  `CREATED_AT` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `UPDATED_AT` datetime DEFAULT NULL,
  `ISACTIVO` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`ID_PRODUCT`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (7,'Platano xkl',32,4500,'2024-09-23 18:48:41',NULL,1),(8,'Arroz Diana x1kl',35,4500,'2024-09-23 18:21:03',NULL,1),(11,'Agua x1lt',24,2000,'2024-09-23 20:01:03',NULL,1),(12,'Panela x1kl',12,4500,'2024-09-23 20:23:32',NULL,1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `ID_PRODUCT_CATEGORY` int(11) NOT NULL AUTO_INCREMENT,
  `CATEGORY_ID` int(11) DEFAULT NULL,
  `PRODUCT_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_PRODUCT_CATEGORY`),
  KEY `CATEGORY_ID` (`CATEGORY_ID`),
  KEY `PRODUCT_ID` (`PRODUCT_ID`),
  CONSTRAINT `product_category_ibfk_1` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `category` (`ID_CATEGORY`),
  CONSTRAINT `product_category_ibfk_2` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`ID_PRODUCT`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (1,7,7),(2,6,8),(5,5,11),(6,8,12);
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_supplier`
--

DROP TABLE IF EXISTS `product_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_supplier` (
  `ID_PRODUCT_SUPPLIER` int(11) NOT NULL AUTO_INCREMENT,
  `PRODUCT_ID` int(11) DEFAULT NULL,
  `SUPPLIER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_PRODUCT_SUPPLIER`),
  KEY `PRODUCT_ID` (`PRODUCT_ID`),
  KEY `SUPPLIER_ID` (`SUPPLIER_ID`),
  CONSTRAINT `product_supplier_ibfk_1` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`ID_PRODUCT`),
  CONSTRAINT `product_supplier_ibfk_2` FOREIGN KEY (`SUPPLIER_ID`) REFERENCES `supplier` (`ID_SUPPLIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_supplier`
--

LOCK TABLES `product_supplier` WRITE;
/*!40000 ALTER TABLE `product_supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `ID_ROLE` int(11) NOT NULL AUTO_INCREMENT,
  `ROLE_NAME` varchar(50) DEFAULT NULL,
  `DESCRIPTION` tinytext DEFAULT NULL,
  PRIMARY KEY (`ID_ROLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller` (
  `ID_SELLER` int(11) NOT NULL AUTO_INCREMENT,
  `FIRST_NAME` varchar(40) DEFAULT NULL,
  `LAST_NAME` varchar(35) DEFAULT NULL,
  `DOCUMENT_TYPE_ID` int(11) DEFAULT NULL,
  `DOCUMENT_NUMBER` varchar(12) DEFAULT NULL,
  `ROLE_ID` int(11) DEFAULT NULL,
  `CREATED_AT` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `UPDATED_AT` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_SELLER`),
  KEY `DOCUMENT_TYPE_ID` (`DOCUMENT_TYPE_ID`),
  KEY `ROLE_ID` (`ROLE_ID`),
  CONSTRAINT `seller_ibfk_1` FOREIGN KEY (`DOCUMENT_TYPE_ID`) REFERENCES `document_type` (`ID_DOCUMENT_TYPE`),
  CONSTRAINT `seller_ibfk_2` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`ID_ROLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `ID_SUPPLIER` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) DEFAULT NULL,
  `NIT` varchar(12) DEFAULT NULL,
  `PHONE` varchar(12) DEFAULT NULL,
  `CREATED_AT` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `UPDATED_AT` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_SUPPLIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-23 15:31:40
