-- MySQL dump 10.13  Distrib 9.2.0, for Win64 (x86_64)
--
-- Host: localhost    Database: transaction_ecommerce
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Current Database: `transaction_ecommerce`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `transaction_ecommerce` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `transaction_ecommerce`;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id_customer` int DEFAULT NULL,
  `customer_name` varchar(15) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `cpf` char(11) NOT NULL,
  `credit_card` int DEFAULT NULL,
  `contato` int DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `extra` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Pedro','pedro@email.com','88898765497',100,987654532,'Rua da Cruz',10000.00,1000.00),(1,'Pedro','João@email.com','88898765497',100,987654532,'Rua da Cruz',10000.00,1000.00),(1,'Pedro','João@email.com','88898765497',150,987654532,'Rua da Cruz',10000.00,1000.00);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `orderNumbers` int NOT NULL,
  `orderDate` date DEFAULT NULL,
  `requiredDate` date DEFAULT NULL,
  `shippedDate` date DEFAULT NULL,
  `orderStatus` enum('DESPACHADO','EM PROGRESSO','ENTREGUE','CONFIRMADO') DEFAULT NULL,
  `custumerNumber` int DEFAULT NULL,
  PRIMARY KEY (`orderNumbers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (14,'2005-05-31','2005-06-10','2005-06-11','CONFIRMADO',1),(15,'2005-05-31','2005-06-10','2005-06-11','CONFIRMADO',1),(16,'2005-05-31','2005-06-10','2005-06-11','CONFIRMADO',1),(17,'2005-05-31','2005-06-10','2005-06-11','CONFIRMADO',1),(18,'2005-05-31','2005-06-10','2005-06-11','DESPACHADO',2);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordersdetails`
--

DROP TABLE IF EXISTS `ordersdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordersdetails` (
  `orderNumbers` int NOT NULL,
  `productCode` varchar(255) NOT NULL,
  `quantityOrder` int DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`orderNumbers`,`productCode`),
  CONSTRAINT `fk_orderdetails` FOREIGN KEY (`orderNumbers`) REFERENCES `orders` (`orderNumbers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordersdetails`
--

LOCK TABLES `ordersdetails` WRITE;
/*!40000 ALTER TABLE `ordersdetails` DISABLE KEYS */;
INSERT INTO `ordersdetails` VALUES (16,'18_1849',35,'186.00'),(16,'18_2548',58,'58.09');
/*!40000 ALTER TABLE `ordersdetails` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-31 21:07:00
