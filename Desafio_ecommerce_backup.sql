-- MySQL dump 10.13  Distrib 9.2.0, for Win64 (x86_64)
--
-- Host: localhost    Database: Desafio_ecommerce
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
-- Current Database: `Desafio_ecommerce`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `Desafio_ecommerce` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `Desafio_ecommerce`;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `idClient` int NOT NULL AUTO_INCREMENT,
  `Fname` varchar(10) DEFAULT NULL,
  `Minit` varchar(3) DEFAULT NULL,
  `Lname` varchar(20) DEFAULT NULL,
  `CPF` char(11) NOT NULL,
  `Data_Nascimento` date NOT NULL,
  `Address` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idClient`),
  UNIQUE KEY `unique_cpf_client` (`CPF`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Maria','M','Silva','12345678900','1990-08-27','rua Bonfim 01'),(2,'Marli','M','Silva','12923456789','1990-08-27','rua Bonfim 01'),(3,'Mateus','O','Pimentel','987654321','1992-07-10','rua Alameida'),(4,'Ricardo','F','Silva','456789132','1989-05-15','rua Vinhaes'),(5,'Julia','S','França','789123456','1960-01-18','Avenida Sete'),(6,'Roberta','G','Assis','987456731','1965-09-20','rua Bahia'),(7,'Isabela','M','Cruz','654345889','1988-09-27','rua das Flores');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `idOrder` int NOT NULL AUTO_INCREMENT,
  `idOrderClient` int DEFAULT NULL,
  `orderStatus` enum('Cancelado','Confirmado','Em processamento','Entregue') DEFAULT 'Em processamento',
  `orderDescription` varchar(255) DEFAULT NULL,
  `sendValue` float DEFAULT '10',
  `paymentCash` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idOrder`),
  KEY `fk_ordes_client` (`idOrderClient`),
  CONSTRAINT `fk_ordes_client` FOREIGN KEY (`idOrderClient`) REFERENCES `clients` (`idClient`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'Em processamento','compra via aplicativo',NULL,1),(2,2,'Em processamento','compra via aplicativo',50,0),(3,3,'Confirmado',NULL,NULL,1),(4,4,'Em processamento','compra via web site',150,0);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentproduct`
--

DROP TABLE IF EXISTS `paymentproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paymentproduct` (
  `idPsPayment` int NOT NULL,
  `idPsProduct` int NOT NULL,
  `price` float NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`idPsPayment`,`idPsProduct`),
  KEY `fk_product_paynent` (`idPsProduct`),
  CONSTRAINT `fk_payment_product_payment` FOREIGN KEY (`idPsPayment`) REFERENCES `clients` (`idClient`),
  CONSTRAINT `fk_product_paynent` FOREIGN KEY (`idPsProduct`) REFERENCES `product` (`idProduct`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentproduct`
--

LOCK TABLES `paymentproduct` WRITE;
/*!40000 ALTER TABLE `paymentproduct` DISABLE KEYS */;
INSERT INTO `paymentproduct` VALUES (1,2,2000,2);
/*!40000 ALTER TABLE `paymentproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `idclient` int DEFAULT NULL,
  `idPayment` int DEFAULT NULL,
  `typePayment` enum('Cartão de crédito','Pix','Boleto','Dois Cartões de créditos','Cartão de débito') DEFAULT NULL,
  `Data_Pagamento` date NOT NULL,
  `CPF` char(11) NOT NULL,
  `CNPJ` char(15) NOT NULL,
  `contact` char(11) NOT NULL,
  `limitAvailable` float DEFAULT NULL,
  UNIQUE KEY `unique_cnpj_payments` (`CNPJ`),
  UNIQUE KEY `unique_cpf_payments` (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `idProduct` int NOT NULL AUTO_INCREMENT,
  `Pname` varchar(10) NOT NULL,
  `classification_kids` tinyint(1) DEFAULT '0',
  `category` enum('Eletrônico','Confecção','Brinquedo','Alimentos','Móveis') NOT NULL,
  `Avaliação` float DEFAULT '0',
  `size` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idProduct`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Fone',0,'Eletrônico',4,NULL),(2,'Barbie',1,'Brinquedo',3,NULL),(3,'Body',1,'Confecção',2,NULL),(4,'Microfone',0,'Eletrônico',4,NULL),(5,'Sofá',0,'Móveis',3,'3x57x80');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productorder`
--

DROP TABLE IF EXISTS `productorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productorder` (
  `idPOproduct` int NOT NULL,
  `idPOorder` int NOT NULL,
  `poQuantity` int DEFAULT '1',
  `poStatus` enum('Disponível','Sem estoque') DEFAULT 'Disponível',
  PRIMARY KEY (`idPOproduct`,`idPOorder`),
  KEY `fk_productorder_product` (`idPOorder`),
  CONSTRAINT `fk_productorder_product` FOREIGN KEY (`idPOorder`) REFERENCES `orders` (`idOrder`),
  CONSTRAINT `fk_productorder_seller` FOREIGN KEY (`idPOproduct`) REFERENCES `product` (`idProduct`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productorder`
--

LOCK TABLES `productorder` WRITE;
/*!40000 ALTER TABLE `productorder` DISABLE KEYS */;
INSERT INTO `productorder` VALUES (1,1,2,NULL),(2,1,1,NULL),(3,2,1,NULL);
/*!40000 ALTER TABLE `productorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productseller`
--

DROP TABLE IF EXISTS `productseller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productseller` (
  `idPseller` int NOT NULL,
  `idPproduct` int NOT NULL,
  `prodQuantity` int DEFAULT '1',
  PRIMARY KEY (`idPseller`,`idPproduct`),
  KEY `fk_product_product` (`idPproduct`),
  CONSTRAINT `fk_product_product` FOREIGN KEY (`idPproduct`) REFERENCES `product` (`idProduct`),
  CONSTRAINT `fk_product_seller` FOREIGN KEY (`idPseller`) REFERENCES `seller` (`idSeller`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productseller`
--

LOCK TABLES `productseller` WRITE;
/*!40000 ALTER TABLE `productseller` DISABLE KEYS */;
/*!40000 ALTER TABLE `productseller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productstorage`
--

DROP TABLE IF EXISTS `productstorage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productstorage` (
  `idProdStorage` int NOT NULL AUTO_INCREMENT,
  `storageLacation` varchar(255) DEFAULT NULL,
  `Quantity` int DEFAULT '0',
  PRIMARY KEY (`idProdStorage`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productstorage`
--

LOCK TABLES `productstorage` WRITE;
/*!40000 ALTER TABLE `productstorage` DISABLE KEYS */;
INSERT INTO `productstorage` VALUES (1,'Rio de Janeiro',1000),(2,'Rio de Janeiro',500),(3,'São Paulo',10),(4,'São Paulo',20),(5,'Brasília',50),(6,'São Paulo',100);
/*!40000 ALTER TABLE `productstorage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productsupplier`
--

DROP TABLE IF EXISTS `productsupplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productsupplier` (
  `idPsSupplier` int NOT NULL,
  `idPsProduct` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`idPsSupplier`,`idPsProduct`),
  KEY `fk_product_supplier_product` (`idPsProduct`),
  CONSTRAINT `fk_product_supplier_product` FOREIGN KEY (`idPsProduct`) REFERENCES `product` (`idProduct`),
  CONSTRAINT `fk_product_supplier_supplier` FOREIGN KEY (`idPsSupplier`) REFERENCES `supplier` (`idSupplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productsupplier`
--

LOCK TABLES `productsupplier` WRITE;
/*!40000 ALTER TABLE `productsupplier` DISABLE KEYS */;
INSERT INTO `productsupplier` VALUES (1,1,500),(1,2,400),(2,4,633),(2,5,10),(3,3,5);
/*!40000 ALTER TABLE `productsupplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller` (
  `idSeller` int NOT NULL AUTO_INCREMENT,
  `SocialName` varchar(255) DEFAULT NULL,
  `AbstName` varchar(255) DEFAULT NULL,
  `CNPJ` char(15) DEFAULT NULL,
  `CPF` char(11) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `contact` char(11) NOT NULL,
  PRIMARY KEY (`idSeller`),
  UNIQUE KEY `unique_cnpj_seller` (`CNPJ`),
  UNIQUE KEY `unique_cpf_seller` (`CPF`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` VALUES (1,'Tech Eletronics',NULL,'123654789107689',NULL,'Bahia','123456789'),(2,'Boutique Durgas',NULL,NULL,'98765432123','Rio de Janeiro','135790827'),(3,'Kids World',NULL,'456987123246973',NULL,'São Paulo','11987563423');
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storagelocation`
--

DROP TABLE IF EXISTS `storagelocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storagelocation` (
  `idLproduct` int NOT NULL,
  `idLstorage` int NOT NULL,
  `location` varchar(255) NOT NULL,
  PRIMARY KEY (`idLproduct`,`idLstorage`),
  KEY `fk_storage_location_storage` (`idLstorage`),
  CONSTRAINT `fk_storage_location_product` FOREIGN KEY (`idLproduct`) REFERENCES `product` (`idProduct`),
  CONSTRAINT `fk_storage_location_storage` FOREIGN KEY (`idLstorage`) REFERENCES `productstorage` (`idProdStorage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storagelocation`
--

LOCK TABLES `storagelocation` WRITE;
/*!40000 ALTER TABLE `storagelocation` DISABLE KEYS */;
INSERT INTO `storagelocation` VALUES (1,2,'RJ'),(3,4,'SP');
/*!40000 ALTER TABLE `storagelocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `idSupplier` int NOT NULL AUTO_INCREMENT,
  `SocialName` varchar(255) DEFAULT NULL,
  `CNPJ` char(15) NOT NULL,
  `contact` char(11) NOT NULL,
  PRIMARY KEY (`idSupplier`),
  UNIQUE KEY `unique_supplier` (`CNPJ`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Almeida Filho','123456789123456','987653219'),(2,'Eletrônicos Silva','246801357987654','912347895'),(3,'Eletrônicos Valmar','867956432319856','959073425');
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

-- Dump completed on 2025-04-01  0:32:19
