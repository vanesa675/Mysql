-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: cursos_complementarios
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `aprendiz`
--

DROP TABLE IF EXISTS `aprendiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aprendiz` (
  `AprIdentificacion` char(10) NOT NULL,
  `AprNombres` varchar(50) NOT NULL,
  `AprApellidos` varchar(50) NOT NULL,
  `AprCorreo` varchar(100) NOT NULL,
  `AprTelefono` int NOT NULL,
  `AprDireccion` varchar(100) NOT NULL,
  `CurIdentificacion` char(10) NOT NULL,
  PRIMARY KEY (`AprIdentificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aprendiz`
--

LOCK TABLES `aprendiz` WRITE;
/*!40000 ALTER TABLE `aprendiz` DISABLE KEYS */;
INSERT INTO `aprendiz` VALUES ('10763688','David','Cortez','kdssbhsjb@gmail.com',32876289,'barrio los canelos','1001'),('1077847126','Laura Vanesa','Gutierrez Lozano','laura.gutierrez11@soy.sena.edu.co',322710,'Calle 3 Barrio los canelos','1001'),('1976728','Jorge Enrique','Gonzales rojas','kudhfsiuhfiushfshi@gmail.com',98473432,'barrio juan pablo','1002'),('2987817','sara','ramirez','khkjhskjkjsd@gmail.com',2364872,'barrios las mercedes','1003'),('338763','daniel','lopez','kjshjcsbhcbjh@gmail.com',3433443,'barrios calima','1004');
/*!40000 ALTER TABLE `aprendiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursos` (
  `CurIdentificacion` char(10) NOT NULL,
  `CurNombre` varchar(100) NOT NULL,
  `CurFechaInicio` date NOT NULL,
  `CurFechaFin` date NOT NULL,
  `CurDuracion` varchar(50) NOT NULL,
  `InsIdentificacion` char(10) NOT NULL,
  PRIMARY KEY (`CurIdentificacion`),
  KEY `InsIdentificacion` (`InsIdentificacion`),
  CONSTRAINT `cursos_ibfk_1` FOREIGN KEY (`InsIdentificacion`) REFERENCES `instructor` (`InsIdentificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES ('1001','Analisis y desarrollo de software','2022-01-28','2025-03-15','3680','10511384'),('1002','Administracion de empresas','2023-03-15','2024-04-25','1500','10518291'),('1003','contabilidad','2022-02-27','2024-04-12','3680','1056784'),('1004','Analisis y desarrollo de software','2022-01-28','2025-03-15','3680','10511384');
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos_aprendiz`
--

DROP TABLE IF EXISTS `cursos_aprendiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursos_aprendiz` (
  `CurIdentificacion` char(10) NOT NULL,
  `AprIdentificacion` char(10) NOT NULL,
  KEY `CurIdentificacion` (`CurIdentificacion`),
  KEY `AprIdentificacion` (`AprIdentificacion`),
  CONSTRAINT `cursos_aprendiz_ibfk_1` FOREIGN KEY (`CurIdentificacion`) REFERENCES `cursos` (`CurIdentificacion`),
  CONSTRAINT `cursos_aprendiz_ibfk_2` FOREIGN KEY (`AprIdentificacion`) REFERENCES `aprendiz` (`AprIdentificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos_aprendiz`
--

LOCK TABLES `cursos_aprendiz` WRITE;
/*!40000 ALTER TABLE `cursos_aprendiz` DISABLE KEYS */;
INSERT INTO `cursos_aprendiz` VALUES ('1001','1077847126'),('1001','10763688'),('1003','1976728'),('1003','2987817'),('1004','1077847126'),('1004','338763');
/*!40000 ALTER TABLE `cursos_aprendiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructor` (
  `InsIdentificacion` char(10) NOT NULL,
  `InsNombres` varchar(50) NOT NULL,
  `InsApellidos` varchar(50) NOT NULL,
  `InsCorreo` varchar(100) NOT NULL,
  `InsTelefono` int NOT NULL,
  `InsDireccion` varchar(100) NOT NULL,
  PRIMARY KEY (`InsIdentificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES ('10511384','andres','rojas','akjksjcsskj@gmail.com',28789761,'barrio las mercedes'),('10518291','daniela','hernandez','a2881jcsskj@gmail.com',33216836,'barrio calima'),('1056784','Jesus','Silva','akjsdhajdkj@gmail.com',23627836,'barrio calima'),('1057829','carmen','duarte','akjk98kj@gmail.com',28816236,'barrio juan pablo');
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-13 16:40:51
