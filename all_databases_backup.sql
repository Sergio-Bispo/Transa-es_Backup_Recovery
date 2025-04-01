-- MySQL dump 10.13  Distrib 9.2.0, for Win64 (x86_64)
--
-- Host: localhost    Database: company_constraints
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
-- Current Database: `company_constraints`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `company_constraints` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `company_constraints`;

--
-- Table structure for table `departament`
--

DROP TABLE IF EXISTS `departament`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departament` (
  `Dname` varchar(15) NOT NULL,
  `Dnumber` int NOT NULL,
  `Mgr_ssn` char(9) NOT NULL,
  `Mgr_start_date` date DEFAULT NULL,
  `Dept_create_date` date DEFAULT NULL,
  PRIMARY KEY (`Dnumber`),
  UNIQUE KEY `unique_name_dept` (`Dname`),
  KEY `fk_dept_1` (`Mgr_ssn`),
  CONSTRAINT `fk_dept` FOREIGN KEY (`Mgr_ssn`) REFERENCES `employee` (`Ssn`) ON UPDATE CASCADE,
  CONSTRAINT `fk_dept_1` FOREIGN KEY (`Mgr_ssn`) REFERENCES `employee` (`Ssn`) ON UPDATE CASCADE,
  CONSTRAINT `fk_dept_employee` FOREIGN KEY (`Mgr_ssn`) REFERENCES `employee` (`Ssn`) ON UPDATE CASCADE,
  CONSTRAINT `chk_date_dept` CHECK ((`Dept_create_date` < `Mgr_start_date`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departament`
--

LOCK TABLES `departament` WRITE;
/*!40000 ALTER TABLE `departament` DISABLE KEYS */;
INSERT INTO `departament` VALUES ('Headquarters',1,'888665555','1981-06-19','1980-06-19'),('Administration',4,'987987987','1995-01-01','1994-01-01'),('Research',5,'333445555','1988-05-22','1986-05-22'),('Dname',123456789,'333445555',NULL,'1990-09-15'),('Reseaech',178456789,'333445555',NULL,'1995-09-10'),('Alicia-Admin',567456789,'987654321',NULL,'1997-07-10');
/*!40000 ALTER TABLE `departament` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `Dname` varchar(15) NOT NULL,
  `Dnumber` int NOT NULL,
  `Mgr_ssn` char(9) DEFAULT NULL,
  `Mgr_start_date` date DEFAULT NULL,
  `Dept_create_date` date DEFAULT NULL,
  PRIMARY KEY (`Dnumber`),
  UNIQUE KEY `unique_name_dept` (`Dname`),
  KEY `Mgr_ssn` (`Mgr_ssn`),
  CONSTRAINT `department_ibfk_1` FOREIGN KEY (`Mgr_ssn`) REFERENCES `employee` (`Ssn`),
  CONSTRAINT `chk_date_dpt` CHECK ((`Dept_create_date` < `Mgr_start_date`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependent`
--

DROP TABLE IF EXISTS `dependent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dependent` (
  `Essn` char(9) NOT NULL,
  `Dependent_name` varchar(15) NOT NULL,
  `sex` char(1) DEFAULT NULL,
  `Bdate` date DEFAULT NULL,
  `Relationship` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`Essn`,`Dependent_name`),
  CONSTRAINT `fk_dependent` FOREIGN KEY (`Essn`) REFERENCES `employee` (`Ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependent`
--

LOCK TABLES `dependent` WRITE;
/*!40000 ALTER TABLE `dependent` DISABLE KEYS */;
INSERT INTO `dependent` VALUES ('123456789','Alice','F','1988-12-30','Daughter'),('123456789','Elizabeth','F','1967-05-05','Spouse'),('123456789','Michael','M','1988-01-04','Son'),('333445555','Alice','F','1986-04-05','Daughter'),('333445555','Joy','F','1958-05-03','Spouse'),('333445555','Theodore','M','1983-10-25','Son'),('987987987','Abner','M','1942-02-28','Spouse');
/*!40000 ALTER TABLE `dependent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dept_locations`
--

DROP TABLE IF EXISTS `dept_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dept_locations` (
  `Dnumber` int NOT NULL,
  `Dlocation` varchar(15) NOT NULL,
  PRIMARY KEY (`Dnumber`,`Dlocation`),
  CONSTRAINT `dept_locations` FOREIGN KEY (`Dnumber`) REFERENCES `departament` (`Dnumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_dept_locations` FOREIGN KEY (`Dnumber`) REFERENCES `departament` (`Dnumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_dept_locations_departament` FOREIGN KEY (`Dnumber`) REFERENCES `departament` (`Dnumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept_locations`
--

LOCK TABLES `dept_locations` WRITE;
/*!40000 ALTER TABLE `dept_locations` DISABLE KEYS */;
INSERT INTO `dept_locations` VALUES (1,'Houston'),(1,'Houstons'),(1,'Houstonts'),(4,'Stafford'),(4,'Staffordr'),(4,'Staffordtr'),(5,'Bellaire'),(5,'Bellairet'),(5,'Bellairets'),(5,'Houston'),(5,'Houstonv'),(5,'Houstonvs'),(5,'Sugarland'),(5,'Sugarlandu'),(5,'Sugarlandus');
/*!40000 ALTER TABLE `dept_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `depto`
--

DROP TABLE IF EXISTS `depto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `depto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Dname` varchar(20) NOT NULL,
  `Dnumber` varchar(2) NOT NULL,
  `Mgr_ssn` varchar(9) NOT NULL,
  `Dept_create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Dname` (`Dname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `depto`
--

LOCK TABLES `depto` WRITE;
/*!40000 ALTER TABLE `depto` DISABLE KEYS */;
/*!40000 ALTER TABLE `depto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dpto`
--

DROP TABLE IF EXISTS `dpto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dpto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Dname` varchar(20) NOT NULL,
  `Dnumber` varchar(2) NOT NULL,
  `Mgr_ssn` varchar(9) NOT NULL,
  `Dept_create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Dname` (`Dname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dpto`
--

LOCK TABLES `dpto` WRITE;
/*!40000 ALTER TABLE `dpto` DISABLE KEYS */;
/*!40000 ALTER TABLE `dpto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `Fname` varchar(15) NOT NULL,
  `Minit` char(9) DEFAULT NULL,
  `Lname` varchar(15) NOT NULL,
  `Ssn` char(9) NOT NULL,
  `Bdate` date DEFAULT NULL,
  `Address` varchar(30) NOT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `Super_ssn` char(9) DEFAULT NULL,
  `Dno` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`Ssn`),
  KEY `fk_employee_company` (`Super_ssn`),
  CONSTRAINT `fk_employee` FOREIGN KEY (`Super_ssn`) REFERENCES `employee` (`Ssn`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_employee_company` FOREIGN KEY (`Super_ssn`) REFERENCES `employee` (`Ssn`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `chk_salary_employee` CHECK ((`Salary` > 2000.0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('Maria','B','Smith','123456249','1965-08-01','731-Fondren-Houston-Tx','F',35000.00,'123456789',5),('João','B','Smith','123456759','1965-01-09','731-Fondren-Houston-Tx','M',30000.00,'987654321',5),('John','B','Smith','123456789','1965-01-09','731-Fondren-Houston-Tx','M',32000.00,NULL,5),('Fulano','B','Smith','123489859','1965-08-10','ausente','M',35000.00,'987654321',5),('Felipe','B','Teixeira','123808249','1991-08-20','731-Fondren-Houston-Tx','M',40000.00,'123456789',4),('Claudio','B','Teixeira','123859249','1990-08-01','731-Fondren-Houston-Tx','M',40000.00,'123456789',4),('Fulano','B','Smith','223489859','1965-08-10','ausente','M',35000.00,'987654321',5),('Fulano','B','Smith','323489859','1965-08-10','ausente','M',35000.00,'987654321',5),('Franklin','T','Wong','333445555','1955-12-08','638-Voss-Houston-Tx','M',42000.00,'123456789',5),('John','B','Smith','423456789','1965-01-09','731-Fondren-Houston-Tx','M',30000.00,'987654321',5),('Fulano','B','Smith','423489859','1965-08-10','ausente','M',35000.00,'987654321',5),('Joyce','A','English','453453453','1972-07-31','5631-Rice-Houston-Tx','F',27000.00,'987654321',5),('John','B','Smith','523456789','1965-01-09','731-Fondren-Houston-Tx','M',30000.00,'987654321',5),('Fulano','B','Smith','623489859','1965-08-10','ausente','M',35000.00,'987654321',5),('Ramesh','K','Narayan','666884444','1962-09-15','975-Fire-Oak-Humble-Tx','M',40000.00,'987654321',5),('Fulano','B','Smith','723489859','1965-08-10','ausente','M',35000.00,'987654321',5),('Fulano','B','Smith','823489859','1965-08-10','ausente','M',35000.00,'987654321',5),('James','E','Borg','888665555','1937-11-10','450-Stone-Houston-Tx','M',56500.00,'333445555',1),('Jennifer','L','Wallace','987654321','1941-06-20','291-Berry-Bellaire-Tx','F',46000.00,NULL,4),('Ahmad','V','Jabbar','987987987','1969-03-29','980-Dallas-Houston-Tx','M',28000.00,'123456789',4),('Alicia','J','Zelaya','999887777','1968-01-19','3321-Castle-Spring-Tx','F',28000.00,'333445555',4);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `superssn_check` BEFORE INSERT ON `employee` FOR EACH ROW begin
        case new.Dno
        when 1 then set new.Super_ssn = '333445555';
        when 2 then set new.Super_ssn = null;
        when 3 then set new.Super_ssn = null;
        when 4 then set new.Super_ssn = '123456789';
        when 5 then set new.Super_ssn = '987654321';
        end case;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `null_value_check` AFTER INSERT ON `employee` FOR EACH ROW if (new.Address is null) then
        insert into user_messages (message, ssn) values (concat('Update your address, please ', new.Fname), new.Ssn);
        else
        insert into user_messages (message, ssn) values (concat('error ', new.Fname), new.Ssn);
     end if */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `employees_dependent_view`
--

DROP TABLE IF EXISTS `employees_dependent_view`;
/*!50001 DROP VIEW IF EXISTS `employees_dependent_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employees_dependent_view` AS SELECT 
 1 AS `Name`,
 1 AS `Departament`,
 1 AS `Dependent`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `employees_salary_27000_view`
--

DROP TABLE IF EXISTS `employees_salary_27000_view`;
/*!50001 DROP VIEW IF EXISTS `employees_salary_27000_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employees_salary_27000_view` AS SELECT 
 1 AS `Name`,
 1 AS `Salary`,
 1 AS `Dept_Number`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `employees_salary_view`
--

DROP TABLE IF EXISTS `employees_salary_view`;
/*!50001 DROP VIEW IF EXISTS `employees_salary_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employees_salary_view` AS SELECT 
 1 AS `Name`,
 1 AS `Dependent`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `employeespordepatamentedept_locations`
--

DROP TABLE IF EXISTS `employeespordepatamentedept_locations`;
/*!50001 DROP VIEW IF EXISTS `employeespordepatamentedept_locations`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employeespordepatamentedept_locations` AS SELECT 
 1 AS `Departamento`,
 1 AS `Localidade`,
 1 AS `NumeroEmpregados`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `employeesspordepartamentelocation`
--

DROP TABLE IF EXISTS `employeesspordepartamentelocation`;
/*!50001 DROP VIEW IF EXISTS `employeesspordepartamentelocation`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employeesspordepartamentelocation` AS SELECT 
 1 AS `Employee`,
 1 AS `Location`,
 1 AS `Numeroemployees`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `empregadopordepartamentoelocalizacao`
--

DROP TABLE IF EXISTS `empregadopordepartamentoelocalizacao`;
/*!50001 DROP VIEW IF EXISTS `empregadopordepartamentoelocalizacao`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `empregadopordepartamentoelocalizacao` AS SELECT 
 1 AS `Departamento`,
 1 AS `Localizacao`,
 1 AS `NumeroDeEmpregados`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `empregadoscomdependentesgerencia`
--

DROP TABLE IF EXISTS `empregadoscomdependentesgerencia`;
/*!50001 DROP VIEW IF EXISTS `empregadoscomdependentesgerencia`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `empregadoscomdependentesgerencia` AS SELECT 
 1 AS `NomeEmpregado`,
 1 AS `SobrenomeEmpregado`,
 1 AS `EhGerente`,
 1 AS `NumeroDeDependentes`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `empregadospordepartamentoelocalidade`
--

DROP TABLE IF EXISTS `empregadospordepartamentoelocalidade`;
/*!50001 DROP VIEW IF EXISTS `empregadospordepartamentoelocalidade`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `empregadospordepartamentoelocalidade` AS SELECT 
 1 AS `Departamento`,
 1 AS `Localidade`,
 1 AS `NumeroEmpregados`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `engine_ex`
--

DROP TABLE IF EXISTS `engine_ex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `engine_ex` (
  `iod` int NOT NULL,
  PRIMARY KEY (`iod`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine_ex`
--

LOCK TABLES `engine_ex` WRITE;
/*!40000 ALTER TABLE `engine_ex` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine_ex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `listadepartamentosgerentes`
--

DROP TABLE IF EXISTS `listadepartamentosgerentes`;
/*!50001 DROP VIEW IF EXISTS `listadepartamentosgerentes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `listadepartamentosgerentes` AS SELECT 
 1 AS `NomeDepartamento`,
 1 AS `NomeGerente`,
 1 AS `SobrenomeGerente`,
 1 AS `DataInicioGerencia`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `Pname` varchar(15) NOT NULL,
  `Pnumber` int NOT NULL,
  `Plocation` varchar(15) NOT NULL,
  `Dnum` int NOT NULL,
  PRIMARY KEY (`Pnumber`),
  UNIQUE KEY `unique_project` (`Pname`),
  KEY `fk_project` (`Dnum`),
  CONSTRAINT `fk_project` FOREIGN KEY (`Dnum`) REFERENCES `departament` (`Dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES ('ProductX',1,'Bellaire',5),('ProductY',2,'Sugarland',5),('ProductZ',3,'Houston',5),('Computerization',10,'Stafford',4),('Reorganization',20,'Houston',1),('Newbenefits',30,'Stafford',4);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `projetoscommaisempregados`
--

DROP TABLE IF EXISTS `projetoscommaisempregados`;
/*!50001 DROP VIEW IF EXISTS `projetoscommaisempregados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `projetoscommaisempregados` AS SELECT 
 1 AS `NomeProjeto`,
 1 AS `NumeroDeEmpregados`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `projetosdepartamentosgerentes`
--

DROP TABLE IF EXISTS `projetosdepartamentosgerentes`;
/*!50001 DROP VIEW IF EXISTS `projetosdepartamentosgerentes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `projetosdepartamentosgerentes` AS SELECT 
 1 AS `NomeProjeto`,
 1 AS `NomeDepartamento`,
 1 AS `NomeGerente`,
 1 AS `SobrenomeGerente`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Dname` varchar(20) NOT NULL,
  `Dnumber` varchar(2) NOT NULL,
  `Mgr_ssn` varchar(9) NOT NULL,
  `Dept_create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Dname` (`Dname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_messages`
--

DROP TABLE IF EXISTS `user_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message` varchar(100) DEFAULT NULL,
  `ssn` char(9) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ssn_messages` (`ssn`),
  CONSTRAINT `fk_ssn_messages` FOREIGN KEY (`ssn`) REFERENCES `employee` (`Ssn`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_messages`
--

LOCK TABLES `user_messages` WRITE;
/*!40000 ALTER TABLE `user_messages` DISABLE KEYS */;
INSERT INTO `user_messages` VALUES (1,'errorFulano','223489859'),(2,'errorFulano','323489859'),(3,'errorFulano','423489859'),(4,'error Fulano','623489859'),(5,'error Fulano','723489859'),(6,'error Fulano','823489859'),(7,'error Felipe','123808249'),(8,'error John','423456789'),(9,'error John','523456789');
/*!40000 ALTER TABLE `user_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_today`
--

DROP TABLE IF EXISTS `v_today`;
/*!50001 DROP VIEW IF EXISTS `v_today`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_today` AS SELECT 
 1 AS `current_date()`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `works_on`
--

DROP TABLE IF EXISTS `works_on`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `works_on` (
  `Essn` char(9) NOT NULL,
  `Pno` int NOT NULL,
  `Hours` decimal(3,1) NOT NULL,
  PRIMARY KEY (`Essn`,`Pno`),
  KEY `fk_project_works_on` (`Pno`),
  CONSTRAINT `fk_employee_works_on` FOREIGN KEY (`Essn`) REFERENCES `employee` (`Ssn`),
  CONSTRAINT `fk_project_works_on` FOREIGN KEY (`Pno`) REFERENCES `project` (`Pnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works_on`
--

LOCK TABLES `works_on` WRITE;
/*!40000 ALTER TABLE `works_on` DISABLE KEYS */;
INSERT INTO `works_on` VALUES ('123456789',1,32.5),('123456789',2,20.0),('123456789',3,40.0),('123456789',10,10.0),('123456789',30,5.0),('333445555',1,20.0),('333445555',10,10.0),('333445555',20,10.0),('333445555',30,30.0),('888665555',20,0.0),('987654321',1,10.0),('987654321',2,7.5),('987654321',3,10.0),('987654321',30,20.0);
/*!40000 ALTER TABLE `works_on` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `customer_managment`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `customer_managment` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `customer_managment`;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id_customer` int NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(25) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `cpf` char(11) DEFAULT NULL,
  `credit_card` char(13) DEFAULT NULL,
  `contact` char(9) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_customer`),
  KEY `index_email` (`email`)
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
-- Table structure for table `customer_v2`
--

DROP TABLE IF EXISTS `customer_v2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_v2` (
  `customer_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `store_id` tinyint unsigned NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address_id` smallint unsigned NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `create_date` datetime NOT NULL,
  `last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`),
  KEY `idx_fk_store_id` (`store_id`),
  KEY `idx_fk_address_id` (`address_id`),
  KEY `idx_fk_last_name` (`last_name`),
  KEY `active_customers_index` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_v2`
--

LOCK TABLES `customer_v2` WRITE;
/*!40000 ALTER TABLE `customer_v2` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_v2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departament_v3`
--

DROP TABLE IF EXISTS `departament_v3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departament_v3` (
  `departament_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `store_id` tinyint unsigned NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `Dname` varchar(50) DEFAULT NULL,
  `Dlocation_id` smallint unsigned NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `create_date` datetime NOT NULL,
  `last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`departament_id`),
  KEY `idx_fk_store_id` (`store_id`),
  KEY `idx_fk_dlacation_id` (`Dlocation_id`),
  KEY `idx_fk_last_name` (`last_name`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departament_v3`
--

LOCK TABLES `departament_v3` WRITE;
/*!40000 ALTER TABLE `departament_v3` DISABLE KEYS */;
/*!40000 ALTER TABLE `departament_v3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exemplo`
--

DROP TABLE IF EXISTS `exemplo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exemplo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_hash_ativo` (`ativo`) USING HASH,
  KEY `idx_btree_id` (`id`) USING BTREE
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exemplo`
--

LOCK TABLES `exemplo` WRITE;
/*!40000 ALTER TABLE `exemplo` DISABLE KEYS */;
/*!40000 ALTER TABLE `exemplo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `company_constraints`
--

USE `company_constraints`;

--
-- Final view structure for view `employees_dependent_view`
--

/*!50001 DROP VIEW IF EXISTS `employees_dependent_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employees_dependent_view` AS select concat(`e`.`Fname`,`e`.`Minit`,`e`.`Lname`) AS `Name`,`e`.`Dno` AS `Departament`,`d`.`Dependent_name` AS `Dependent` from (`employee` `e` join `dependent` `d` on((`e`.`Ssn` = `d`.`Essn`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employees_salary_27000_view`
--

/*!50001 DROP VIEW IF EXISTS `employees_salary_27000_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employees_salary_27000_view` AS select concat(`employee`.`Fname`,`employee`.`Minit`,`employee`.`Lname`) AS `Name`,`employee`.`Salary` AS `Salary`,`employee`.`Dno` AS `Dept_Number` from `employee` where (`employee`.`Salary` > 26999) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employees_salary_view`
--

/*!50001 DROP VIEW IF EXISTS `employees_salary_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employees_salary_view` AS select concat(`e`.`Fname`,`e`.`Minit`,`e`.`Lname`) AS `Name`,`d`.`Dependent_name` AS `Dependent` from (`employee` `e` join `dependent` `d` on((`e`.`Ssn` = `d`.`Essn`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employeespordepatamentedept_locations`
--

/*!50001 DROP VIEW IF EXISTS `employeespordepatamentedept_locations`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employeespordepatamentedept_locations` AS select `d`.`Dname` AS `Departamento`,`l`.`Dlocation` AS `Localidade`,count(`e`.`Ssn`) AS `NumeroEmpregados` from ((`department` `d` join `dept_locations` `l` on((`d`.`Dnumber` = `l`.`Dnumber`))) left join `employee` `e` on((`d`.`Dnumber` = `e`.`Dno`))) group by `d`.`Dname`,`l`.`Dlocation` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employeesspordepartamentelocation`
--

/*!50001 DROP VIEW IF EXISTS `employeesspordepartamentelocation`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employeesspordepartamentelocation` AS select `d`.`Dname` AS `Employee`,`l`.`Dlocation` AS `Location`,count(`e`.`Ssn`) AS `Numeroemployees` from ((`department` `d` join `dept_locations` `l` on((`d`.`Dnumber` = `l`.`Dnumber`))) left join `employee` `e` on((`d`.`Dnumber` = `e`.`Dno`))) group by `d`.`Dname`,`l`.`Dlocation` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `empregadopordepartamentoelocalizacao`
--

/*!50001 DROP VIEW IF EXISTS `empregadopordepartamentoelocalizacao`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `empregadopordepartamentoelocalizacao` AS select `d`.`Dname` AS `Departamento`,`dl`.`Dlocation` AS `Localizacao`,count(`e`.`Ssn`) AS `NumeroDeEmpregados` from ((`departament` `d` join `dept_locations` `dl` on((`d`.`Dnumber` = `dl`.`Dnumber`))) left join `employee` `e` on((`e`.`Dno` = `d`.`Dnumber`))) group by `d`.`Dname`,`dl`.`Dlocation` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `empregadoscomdependentesgerencia`
--

/*!50001 DROP VIEW IF EXISTS `empregadoscomdependentesgerencia`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `empregadoscomdependentesgerencia` AS select `e`.`Fname` AS `NomeEmpregado`,`e`.`Lname` AS `SobrenomeEmpregado`,(case when `e`.`Ssn` in (select `d`.`Mgr_ssn` from `departament` `d`) then 'Sim' else 'Não' end) AS `EhGerente`,count(`d`.`Dependent_name`) AS `NumeroDeDependentes` from (`employee` `e` left join `dependent` `d` on((`e`.`Ssn` = `d`.`Essn`))) group by `e`.`Ssn`,`e`.`Fname`,`e`.`Lname` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `empregadospordepartamentoelocalidade`
--

/*!50001 DROP VIEW IF EXISTS `empregadospordepartamentoelocalidade`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `empregadospordepartamentoelocalidade` AS select `d`.`Dname` AS `Departamento`,`l`.`Dlocation` AS `Localidade`,count(`e`.`Ssn`) AS `NumeroEmpregados` from ((`department` `d` join `dept_locations` `l` on((`d`.`Dnumber` = `l`.`Dnumber`))) left join `employee` `e` on((`d`.`Dnumber` = `e`.`Dno`))) group by `d`.`Dname`,`l`.`Dlocation` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `listadepartamentosgerentes`
--

/*!50001 DROP VIEW IF EXISTS `listadepartamentosgerentes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `listadepartamentosgerentes` AS select `d`.`Dname` AS `NomeDepartamento`,`e`.`Fname` AS `NomeGerente`,`e`.`Lname` AS `SobrenomeGerente`,`d`.`Mgr_start_date` AS `DataInicioGerencia` from (`departament` `d` join `employee` `e` on((`d`.`Mgr_ssn` = `e`.`Ssn`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `projetoscommaisempregados`
--

/*!50001 DROP VIEW IF EXISTS `projetoscommaisempregados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `projetoscommaisempregados` AS select `p`.`Pname` AS `NomeProjeto`,count(`w`.`Essn`) AS `NumeroDeEmpregados` from (`project` `p` join `works_on` `w` on((`p`.`Pnumber` = `w`.`Pno`))) group by `p`.`Pname` order by `NumeroDeEmpregados` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `projetosdepartamentosgerentes`
--

/*!50001 DROP VIEW IF EXISTS `projetosdepartamentosgerentes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `projetosdepartamentosgerentes` AS select `p`.`Pname` AS `NomeProjeto`,`d`.`Dname` AS `NomeDepartamento`,`e`.`Fname` AS `NomeGerente`,`e`.`Lname` AS `SobrenomeGerente` from ((`project` `p` join `departament` `d` on((`p`.`Dnum` = `d`.`Dnumber`))) join `employee` `e` on((`d`.`Mgr_ssn` = `e`.`Ssn`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_today`
--

/*!50001 DROP VIEW IF EXISTS `v_today`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_today` AS select curdate() AS `current_date()` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Current Database: `customer_managment`
--

USE `customer_managment`;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-31 23:57:39
