-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: import_tech
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
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `Id_Categoria` char(10) NOT NULL,
  `Nom_Categoria` varchar(50) NOT NULL,
  `Des_Categoria` varchar(500) NOT NULL,
  PRIMARY KEY (`Id_Categoria`),
  UNIQUE KEY `Id_Categoria` (`Id_Categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES ('1','Limpieza','Productos de limpieza de hogar y de uso personal'),('2','Entretenimiento','Todo en entretenimiento'),('3','Hogar','Productos de hogar y estilo'),('4','Videojuegos','Toda la gama de videojuegos y tarjetas de ragalo'),('5','Tecnologia','Lo ultimo en tecnologia'),('6','Ropa','Expertos en moda');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `Nip_Clientes` char(10) NOT NULL,
  `Nom_Clientes` varchar(100) NOT NULL,
  `Dir_Clientes` varchar(50) NOT NULL,
  `Tel1_Clientes` char(10) NOT NULL,
  `Tel2_Clientes` char(10) DEFAULT NULL,
  PRIMARY KEY (`Nip_Clientes`),
  UNIQUE KEY `Nip_Clientes` (`Nip_Clientes`),
  UNIQUE KEY `Tel1_Clientes` (`Tel1_Clientes`),
  UNIQUE KEY `Tel2_Clientes` (`Tel2_Clientes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES ('1001','Andres Silva','Calle 10 No. 9 - 78  Centro - Samanes Garzon Huila','3215845312','3217845631'),('1002','Santiago Parra','Carrera 56A No. 51 - 81 - Barrio el Prado - Bogota','3543012715','3214841023'),('1003','Maria Del Mar','Carrera 22 No. 17-31 - El Clarín piso 3 - Medellin','3219024312','3476345631'),('1004','Stevan Gonzales','Carrera 54 No. 68-8 - La Estrella - Pasto','3215892012','3217956231'),('1005','Jesus Martinez','Calle 59 No. 27-35 - Galán - Pitalito','3210283412','3216351631'),('1006','Laura Camila','Calle 20 No. 22-27 - El Establo - Cali','3215812312','3219004631');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `Id_Producto` char(10) NOT NULL,
  `Nom_Producto` varchar(50) NOT NULL,
  `PrAc_Producto` int NOT NULL,
  `Stock_Producto` varchar(50) NOT NULL,
  `Id_Proveedor` char(10) NOT NULL,
  `Id_Categoria` char(10) NOT NULL,
  PRIMARY KEY (`Id_Producto`),
  UNIQUE KEY `Id_Producto` (`Id_Producto`),
  UNIQUE KEY `Id_Proveedor` (`Id_Proveedor`),
  UNIQUE KEY `Id_Categoria` (`Id_Categoria`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`Id_Categoria`) REFERENCES `categorias` (`Id_Categoria`),
  CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`Id_Proveedor`) REFERENCES `proveedores` (`Nip_Proveedores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES ('101','crema dental',7000,'120','1001','1'),('102','sofa',1000000,'3213','1002','2'),('103','Reloj Inteligente',50000,'100','1003','3'),('104','Balon de futbol',50000,'12','1004','4'),('105','Muñeca',40000,'100','1005','5');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `Nip_Proveedores` char(10) NOT NULL,
  `Nit_Proveedores` int NOT NULL,
  `Nom_Proveedores` varchar(50) NOT NULL,
  `Dir_Proveedores` varchar(50) NOT NULL,
  `Tel_Proveedores` char(10) NOT NULL,
  `Pagi_Proveedores` varchar(200) NOT NULL,
  PRIMARY KEY (`Nip_Proveedores`),
  UNIQUE KEY `Nip_Proveedores` (`Nip_Proveedores`),
  UNIQUE KEY `Nit_Proveedores` (`Nit_Proveedores`),
  UNIQUE KEY `Tel_Proveedores` (`Tel_Proveedores`),
  UNIQUE KEY `Pagi_Proveedores` (`Pagi_Proveedores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES ('1001',12192783,'Juan Alberto Pelaez','Carrera 7 No. 5 - 12 ','3219283115','http://compraalpormayor.com'),('1002',12191789,'Rayan Huertas','Calle 5 No. 1 - 9 ','321471823','http://sindireccion.com'),('1003',12191243,'Yanira Peralta','Carrera 2 No. 4 - 5 ','321478253','http://compraya.com'),('1004',12191892,'Cayetano Simon','Calle 3 No. 2 - 13 ','321479823','http://stellux.com'),('1005',12196984,'Mario Martinez','Calle 19 No. 1 - 12 ','321475241','http://elpalacio.com'),('1006',12191234,'Herminia Mejia','Calle 9 No. 8 - 7 ','321479023','http://creditech.com');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `IdFac_Venta` char(10) NOT NULL,
  `Fec_Venta` timestamp NOT NULL,
  `Nip_Clientes` char(10) NOT NULL,
  `Id_Producto` char(10) NOT NULL,
  `PrAc_Producto` varchar(200) NOT NULL,
  `Can_Producto` varchar(200) NOT NULL,
  `Des_Venta` varchar(200) NOT NULL,
  `MonFi_Venta` varchar(200) NOT NULL,
  PRIMARY KEY (`IdFac_Venta`),
  UNIQUE KEY `IdFac_Venta` (`IdFac_Venta`),
  UNIQUE KEY `Nip_Clientes` (`Nip_Clientes`),
  UNIQUE KEY `Id_Producto` (`Id_Producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES ('100100','2024-03-14 18:01:58','1002','103','50000','2','10','900000'),('100200','2024-03-14 18:01:58','1005','102','1000000','4','20','3200000'),('100500','2024-03-14 18:01:58','1004','104','50000','1','0','50000');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-14 13:52:47
