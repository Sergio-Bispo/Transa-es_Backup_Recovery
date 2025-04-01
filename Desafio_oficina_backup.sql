-- MySQL dump 10.13  Distrib 9.2.0, for Win64 (x86_64)
--
-- Host: localhost    Database: Desafio_oficina
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
-- Current Database: `Desafio_oficina`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `Desafio_oficina` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `Desafio_oficina`;

--
-- Table structure for table `cliente_solicitação`
--

DROP TABLE IF EXISTS `cliente_solicitação`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_solicitação` (
  `idCliente` int NOT NULL,
  `idServiço_Mecânico` int NOT NULL,
  `Cliente_Serviço` int DEFAULT NULL,
  PRIMARY KEY (`idCliente`,`idServiço_Mecânico`),
  CONSTRAINT `fk_Cliente_serviço_mecânico` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idClientes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_solicitação`
--

LOCK TABLES `cliente_solicitação` WRITE;
/*!40000 ALTER TABLE `cliente_solicitação` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_solicitação` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `idClientes` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) DEFAULT NULL,
  `CPF` char(11) NOT NULL,
  `Numero_Os` int NOT NULL,
  `Data_Os` date NOT NULL,
  `Veiculo` varchar(15) NOT NULL,
  `Ano` float NOT NULL,
  PRIMARY KEY (`idClientes`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Manoel de Souza','12345678911',1,'1990-11-01','Corsa',2015),(2,'Joana Figueira','98765432178',5,'2000-08-15','Fusca',2018),(3,'Ricardo Pereira','23456789012',20,'2018-07-10','Honda',2017),(4,'Florentino Palesma','34512567891',17,'2020-01-05','Picape',2019),(5,'João Pedro Almeida','65784592167',10,'2021-12-15','Sedan',2016),(6,'Samuel Azevedo','97531257837',15,'2022-09-08','Jipe',2020),(7,'Manoel de Souza','12345678911',1,'1990-11-01','Corsa',2015),(8,'Joana Figueira','98765432178',5,'2000-08-15','Fusca',2018),(9,'Ricardo Pereira','23456789012',20,'2018-07-10','Honda',2017),(10,'Florentino Palesma','34512567891',17,'2020-01-05','Picape',2019),(11,'João Pedro Almeida','65784592167',10,'2021-12-15','Sedan',2016),(12,'Samuel Azevedo','97531257837',15,'2022-09-08','Jipe',2020);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distribuição_os`
--

DROP TABLE IF EXISTS `distribuição_os`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `distribuição_os` (
  `idOrdem_Serviços` int NOT NULL,
  `idEspecialidade` int NOT NULL,
  PRIMARY KEY (`idOrdem_Serviços`,`idEspecialidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distribuição_os`
--

LOCK TABLES `distribuição_os` WRITE;
/*!40000 ALTER TABLE `distribuição_os` DISABLE KEYS */;
/*!40000 ALTER TABLE `distribuição_os` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipe_mecânicos`
--

DROP TABLE IF EXISTS `equipe_mecânicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipe_mecânicos` (
  `idEquipe_Mecanico` int NOT NULL AUTO_INCREMENT,
  `Código` varchar(20) NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Endereço` varchar(255) NOT NULL,
  PRIMARY KEY (`idEquipe_Mecanico`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipe_mecânicos`
--

LOCK TABLES `equipe_mecânicos` WRITE;
/*!40000 ALTER TABLE `equipe_mecânicos` DISABLE KEYS */;
INSERT INTO `equipe_mecânicos` VALUES (1,'12345678901234567890','Severino dos Santos','Rua das Palmeiras, 10'),(2,'00000986765341244456','Paulo Sérgio da Silva','Rua das Flores, 120'),(3,'55566688811132457658','Luciene Melo','Avenida Tiradentes, 98-Mares'),(4,'98124356861350259763','Juraci de Almeida','Condomínio das Águas,1007'),(5,'44454667889054231895','Luís Amorim dos Anjos','Estrada das Barreiras,700'),(6,'12345678901234567890','Severino dos Santos','Rua das Palmeiras, 10'),(7,'00000986765341244456','Paulo Sérgio da Silva','Rua das Flores, 120'),(8,'55566688811132457658','Luciene Melo','Avenida Tiradentes, 98-Mares'),(9,'98124356861350259763','Juraci de Almeida','Condomínio das Águas,1007'),(10,'44454667889054231895','Luís Amorim dos Anjos','Estrada das Barreiras,700'),(11,'12345678901234567890','Severino dos Santos','Rua das Palmeiras, 10'),(12,'00000986765341244456','Paulo Sérgio da Silva','Rua das Flores, 120'),(13,'55566688811132457658','Luciene Melo','Avenida Tiradentes, 98-Mares'),(14,'98124356861350259763','Juraci de Almeida','Condomínio das Águas,1007'),(15,'44454667889054231895','Luís Amorim dos Anjos','Estrada das Barreiras,700');
/*!40000 ALTER TABLE `equipe_mecânicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `execução_serviço`
--

DROP TABLE IF EXISTS `execução_serviço`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `execução_serviço` (
  `idExecução_Serviço` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `Código` int NOT NULL,
  `Inicio` date NOT NULL,
  `Conclusão` date NOT NULL,
  PRIMARY KEY (`idExecução_Serviço`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `execução_serviço`
--

LOCK TABLES `execução_serviço` WRITE;
/*!40000 ALTER TABLE `execução_serviço` DISABLE KEYS */;
INSERT INTO `execução_serviço` VALUES (1,'Manoel dos Anjos',23,'2022-12-01','2023-01-30'),(2,'Elisio Sacramento',70,'2023-11-09','2023-12-01'),(3,'Carlos Santana',75,'2024-01-15','2024-01-28');
/*!40000 ALTER TABLE `execução_serviço` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mecânico_especializado`
--

DROP TABLE IF EXISTS `mecânico_especializado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mecânico_especializado` (
  `idMecanico_Especializado` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `Especialidade` varchar(45) NOT NULL,
  `Código` int NOT NULL,
  PRIMARY KEY (`idMecanico_Especializado`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mecânico_especializado`
--

LOCK TABLES `mecânico_especializado` WRITE;
/*!40000 ALTER TABLE `mecânico_especializado` DISABLE KEYS */;
INSERT INTO `mecânico_especializado` VALUES (1,'João Pereira','Manutenção de Motor',10),(2,'João Pereira','Manutenção de Motor',10),(3,'Mário Jorge Silva','Eletricista de Auto',25),(4,'Salatiel de Jesus','Retifica de Motor',39),(5,'João Pereira','Manutenção de Motor',10),(6,'Mário Jorge Silva','Eletricista de Auto',25),(7,'Salatiel de Jesus','Retifica de Motor',39);
/*!40000 ALTER TABLE `mecânico_especializado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordem_serviço`
--

DROP TABLE IF EXISTS `ordem_serviço`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordem_serviço` (
  `idOrdem_Serviço` int NOT NULL AUTO_INCREMENT,
  `Numero_OS` int NOT NULL,
  `Data_Emissão` date NOT NULL,
  `Valor_Orçamento` float NOT NULL,
  `Serviço_Status` enum('Cancelado','Confirmado','Em processamento','Concluido') DEFAULT 'Em processamento',
  `Data_Conclusão` date NOT NULL,
  `Autorização_Cliente` varchar(45) NOT NULL,
  PRIMARY KEY (`idOrdem_Serviço`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordem_serviço`
--

LOCK TABLES `ordem_serviço` WRITE;
/*!40000 ALTER TABLE `ordem_serviço` DISABLE KEYS */;
INSERT INTO `ordem_serviço` VALUES (10,2525,'1990-01-24',180000,'Confirmado','1990-02-18','Autorizada');
/*!40000 ALTER TABLE `ordem_serviço` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serviços_mecânicos`
--

DROP TABLE IF EXISTS `serviços_mecânicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serviços_mecânicos` (
  `idserviço_mecânico` int NOT NULL AUTO_INCREMENT,
  `Razão_Social` varchar(255) NOT NULL,
  `CNPJ` char(15) NOT NULL,
  `Localização` varchar(255) NOT NULL,
  `Contato` char(9) DEFAULT NULL,
  PRIMARY KEY (`idserviço_mecânico`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serviços_mecânicos`
--

LOCK TABLES `serviços_mecânicos` WRITE;
/*!40000 ALTER TABLE `serviços_mecânicos` DISABLE KEYS */;
INSERT INTO `serviços_mecânicos` VALUES (4,'SB Informática','987895643214567','Rio de Janeiro','987634524'),(5,'DEB Informações','189125346978634','Bahia','988662428'),(6,'Pavilhão das Louças','658970004532786','Belo Horizonte','986664533'),(12,'SB Informática','987895643214567','Rio de Janeiro','987634524'),(13,'DEB Informações','189125346978634','Bahia','988662428'),(14,'Pavilhão das Louças','658970004532786','Belo Horizonte','986664533'),(15,'Atacadão das Confecções','781927837456719','São Paulo','889012346'),(16,'Feira da Moda','348900888654234','Novalandia','970078766'),(17,'SB Informática','987895643214567','Rio de Janeiro','987634524'),(18,'DEB Informações','189125346978634','Bahia','988662428'),(19,'Pavilhão das Louças','658970004532786','Belo Horizonte','986664533'),(20,'Atacadão das Confecções','781927837456719','São Paulo','889012346'),(21,'Feira da Moda','348900888654234','Novalandia','970078766');
/*!40000 ALTER TABLE `serviços_mecânicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabela_serviço`
--

DROP TABLE IF EXISTS `tabela_serviço`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabela_serviço` (
  `idTabela_Serviço` int NOT NULL AUTO_INCREMENT,
  `Valor_Serviço` float NOT NULL,
  `Valor_Peça` float NOT NULL,
  `Valor_revisão` int DEFAULT NULL,
  PRIMARY KEY (`idTabela_Serviço`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabela_serviço`
--

LOCK TABLES `tabela_serviço` WRITE;
/*!40000 ALTER TABLE `tabela_serviço` DISABLE KEYS */;
INSERT INTO `tabela_serviço` VALUES (1,150000,30000,NULL),(2,32000,180000,NULL),(3,15000,10000,NULL),(4,100000,150000,NULL),(5,8000,10000,NULL),(6,150000,30000,NULL),(7,32000,180000,NULL),(8,15000,10000,NULL),(9,100000,150000,NULL),(10,8000,10000,NULL),(11,150000,30000,NULL),(12,32000,180000,NULL),(13,15000,10000,NULL),(14,100000,150000,NULL),(15,8000,10000,NULL);
/*!40000 ALTER TABLE `tabela_serviço` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veiculos`
--

DROP TABLE IF EXISTS `veiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veiculos` (
  `idVeiculo` int NOT NULL AUTO_INCREMENT,
  `Modelo` char(10) NOT NULL,
  `Ano` int NOT NULL,
  PRIMARY KEY (`idVeiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculos`
--

LOCK TABLES `veiculos` WRITE;
/*!40000 ALTER TABLE `veiculos` DISABLE KEYS */;
INSERT INTO `veiculos` VALUES (1,'Corsa',2010),(2,'Sedan',2014),(3,'Honda',2020),(4,'Celta',2012),(5,'Jipe',2022),(6,'Corsa',2010),(7,'Sedan',2014),(8,'Honda',2020),(9,'Celta',2012),(10,'Jipe',2022);
/*!40000 ALTER TABLE `veiculos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-31 21:40:24
