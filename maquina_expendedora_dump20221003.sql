-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: maquina_expendedora
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL,
  `nombre_categoria` varchar(32) NOT NULL,
  `descripcion_categoria` varchar(64) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (2010,'Bebida','Producto liquido consumible'),(2011,'Comida','Producto solido que se come y sirve de alimento'),(2012,'Electronico','Producto electrico para un particular uso'),(2013,'Higienico','Producto usado para mantenerse limpio o a sus alrededores'),(2014,'Vestimenta','Producto de vestimenta usado para estilo y comodidad'),(2015,'Dulces','Productos elaborado con azucar, y con sabores sutiles');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL,
  `nombre_cliente` varchar(64) NOT NULL,
  `apellido_paterno` varchar(64) NOT NULL,
  `apellido_materno` varchar(64) NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (20490687,'Random Names','Romero','Spears'),(20490688,'Ashlee Durham','Nash','Patton'),(20490689,'Hashim Finley','Mccarty','Figueroa'),(20490690,'Taya Farrington','Meyers','Schultz'),(20490691,'Celia Cottrell','Perkins','Zimmerman'),(20490692,'Habibah Guerra','Brooks','White'),(20490693,'Aston Bull','Alexander','Serrano'),(20490694,'Yannis Callahan','Combs','Vaughan'),(20490695,'Kasper Rawlings','Stein','Holmes'),(20490696,'Kaeden Whitworth','Ingram','Gallegos'),(20490697,'Jade Dejesus','Wilkerson','Klein'),(20490698,'Alejandro Walton','Daugherty','Banks'),(20490699,'Mitchel Amos','Casey','Mccann'),(20490700,'Tiernan Bishop','Day','Nichols'),(20490701,'Edan Whitaker','Rice','Glass'),(20490702,'Leon Becker','Gibbs','Guerra'),(20490703,'Homer Hawes','Heath','Kaufman'),(20490704,'Musa Bowler','Castaneda','Randolph'),(20490705,'Poppy Brewer','Howe','Phelps'),(20490706,'Charmaine Amin','Costa','Webb'),(20490707,'Madiha Lowry','Pollard','Arellano'),(20490708,'Ritik Lawrence','Dennis','Faulkner'),(20490709,'Abid Carroll','Allison','Sanford'),(20490710,'Abdurrahman Cousins','Crane','Guzman'),(20490711,'Piers Paterson','Hampton','Haynes'),(20490712,'Renesmee Sharp','Briggs','Rivas'),(20490713,'Efe Southern','Bright','Pierce'),(20490714,'Shelby Mccullough','Oneal','Huynh'),(20490715,'Cole Hicks','House','Ingram'),(20490716,'Jayde Matthews','Hansen','Hughes'),(20490717,'Maariya Franks','Larsen','Rasmussen'),(20490718,'Tymoteusz Lynn','Wu','Holden'),(20490719,'Kimora Kearney','Barnes','Hinton'),(20490720,'Marcelina Traynor','Reilly','Alvarado'),(20490721,'Kacy Donovan','Mccullough','Fowler'),(20490722,'Frazer Corrigan','Huerta','Davies'),(20490723,'Kia Davis','Barrera','Stafford'),(20490724,'Raees Ellwood','Cox','Sanchez'),(20490725,'Ursula Levine','Richardson','Lutz'),(20490726,'Sydney Rooney','Riggs','Mcdonald'),(20490727,'Kirstin Mccabe','Barron','Huff'),(20490728,'Wallace Hayward','Schroeder','Hendricks'),(20490729,'Dario Peralta','Stephens','Rogers'),(20490730,'Asiya Robbins','Mcgrath','David'),(20490731,'Indigo Simpson','Berg','Mooney'),(20490732,'Maximillian Sharpe','Barajas','Butler'),(20490733,'Macauly Rios','Shelton','Peterson'),(20490734,'Jordan Correa','Bauer','Taylor'),(20490735,'Carolina Cobb','Villegas','Clay'),(20490736,'Nel Miller','Carr','Berry');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle`
--

DROP TABLE IF EXISTS `detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle` (
  `id_factura` varchar(8) NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `posicion` varchar(3) NOT NULL,
  PRIMARY KEY (`id_factura`,`id_producto`),
  KEY `factura_idx` (`id_factura`),
  KEY `producto_idx` (`id_producto`),
  CONSTRAINT `factura_detalle` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`id_factura`),
  CONSTRAINT `producto_detalle` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle`
--

LOCK TABLES `detalle` WRITE;
/*!40000 ALTER TABLE `detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `id_factura` varchar(8) NOT NULL,
  `id_cliente` int NOT NULL,
  `id_maquina` varchar(8) NOT NULL,
  `fecha_expedicion` date NOT NULL,
  `hora_expedicion` time NOT NULL,
  PRIMARY KEY (`id_factura`),
  KEY `cliente_idx` (`id_cliente`),
  KEY `maquina_idx` (`id_maquina`),
  CONSTRAINT `cliente_factura` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `maquina_factura` FOREIGN KEY (`id_maquina`) REFERENCES `maquina` (`id_maquina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institucion`
--

DROP TABLE IF EXISTS `institucion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institucion` (
  `id_institucion` int NOT NULL,
  `nombre_inst` varchar(64) NOT NULL,
  `calle_inst` varchar(64) NOT NULL,
  `colonia_inst` varchar(64) NOT NULL,
  `numero_inst` int NOT NULL,
  PRIMARY KEY (`id_institucion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institucion`
--

LOCK TABLES `institucion` WRITE;
/*!40000 ALTER TABLE `institucion` DISABLE KEYS */;
INSERT INTO `institucion` VALUES (1010,'CETYS Universidad','Calzada Cetys ','Rivera',21259),(1020,'Universidad Autonoma de Baja California','Avenida Alvaro Obregon ','Nueva',21100),(1030,'Tecnologico Nacional de Mexico Campus Mexicali','Av. Instituto Tecnologico','Plutarco Elias Calles',21376),(1040,'Universidad Xochicalco Mexicali','C. Novena 1199','Plutarco Elias Calles',21376);
/*!40000 ALTER TABLE `institucion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario_maquina`
--

DROP TABLE IF EXISTS `inventario_maquina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario_maquina` (
  `id_maquina` varchar(8) NOT NULL,
  `id_producto` int NOT NULL,
  `numero_slot` varchar(3) NOT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` int NOT NULL,
  PRIMARY KEY (`id_maquina`,`id_producto`,`numero_slot`),
  KEY `maquina_idx` (`id_maquina`),
  KEY `producto_idx` (`id_producto`),
  CONSTRAINT `maquina_inventario` FOREIGN KEY (`id_maquina`) REFERENCES `maquina` (`id_maquina`),
  CONSTRAINT `producto_inventario` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario_maquina`
--

LOCK TABLES `inventario_maquina` WRITE;
/*!40000 ALTER TABLE `inventario_maquina` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventario_maquina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maquina`
--

DROP TABLE IF EXISTS `maquina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maquina` (
  `id_maquina` varchar(8) NOT NULL,
  `id_institucion` int NOT NULL,
  `ubicacion` varchar(64) NOT NULL,
  `estatus` varchar(32) NOT NULL,
  `capacidad` int NOT NULL,
  PRIMARY KEY (`id_maquina`),
  KEY `institucion_idx` (`id_institucion`),
  CONSTRAINT `institucion_maquina` FOREIGN KEY (`id_institucion`) REFERENCES `institucion` (`id_institucion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maquina`
--

LOCK TABLES `maquina` WRITE;
/*!40000 ALTER TABLE `maquina` DISABLE KEYS */;
INSERT INTO `maquina` VALUES ('4010',1010,'Edificio 10','Activa',64),('4011',1010,'Area Verde 13','Activa',64),('4012',1010,'Edificio 14','Activa',64),('4020',1020,'Facultad de Derecho','Desactivada',48),('4021',1020,'Facultad de Ciencias ','Activa',48),('4022',1020,'Facultad de Contabilidad','Activa',64),('4030',1030,'Edificio G','Desactivada',48),('4031',1030,'Edificio U','Desactivada',64),('4032',1030,'Nodo ','Desactivada',64),('4040',1040,'Edificio Administrativo','Activa',64),('4041',1040,'Servicios Escolares','Desactivada',48),('4042',1040,'Posgrado','Activa',48);
/*!40000 ALTER TABLE `maquina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int NOT NULL,
  `id_categoria` int NOT NULL,
  `nombre_producto` varchar(32) NOT NULL,
  `descripcion_producto` varchar(64) NOT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `categoria_idx` (`id_categoria`),
  CONSTRAINT `categoria_producto` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promocion`
--

DROP TABLE IF EXISTS `promocion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promocion` (
  `id_promocion` int NOT NULL,
  `vigencia_promocion` datetime NOT NULL,
  `precio_promocion` int NOT NULL,
  PRIMARY KEY (`id_promocion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promocion`
--

LOCK TABLES `promocion` WRITE;
/*!40000 ALTER TABLE `promocion` DISABLE KEYS */;
/*!40000 ALTER TABLE `promocion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promocion_categoria`
--

DROP TABLE IF EXISTS `promocion_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promocion_categoria` (
  `id_promocion` int NOT NULL,
  `id_categoria` int NOT NULL,
  PRIMARY KEY (`id_promocion`,`id_categoria`),
  KEY `promocion_idx` (`id_promocion`),
  KEY `categoria_idx` (`id_categoria`),
  CONSTRAINT `categoria_pc` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`),
  CONSTRAINT `promocion_pc` FOREIGN KEY (`id_promocion`) REFERENCES `promocion` (`id_promocion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promocion_categoria`
--

LOCK TABLES `promocion_categoria` WRITE;
/*!40000 ALTER TABLE `promocion_categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `promocion_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promocion_maquina`
--

DROP TABLE IF EXISTS `promocion_maquina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promocion_maquina` (
  `id_promocion` int NOT NULL,
  `id_maquina` varchar(8) NOT NULL,
  PRIMARY KEY (`id_promocion`,`id_maquina`),
  KEY `promocion_idx` (`id_promocion`),
  KEY `maquina_idx` (`id_maquina`),
  CONSTRAINT `maquina_pm` FOREIGN KEY (`id_maquina`) REFERENCES `maquina` (`id_maquina`),
  CONSTRAINT `promocion_pm` FOREIGN KEY (`id_promocion`) REFERENCES `promocion` (`id_promocion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promocion_maquina`
--

LOCK TABLES `promocion_maquina` WRITE;
/*!40000 ALTER TABLE `promocion_maquina` DISABLE KEYS */;
/*!40000 ALTER TABLE `promocion_maquina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarjeta`
--

DROP TABLE IF EXISTS `tarjeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarjeta` (
  `id_tarjeta` int NOT NULL,
  `id_cliente` int NOT NULL,
  `fecha_expedicion` date NOT NULL,
  `puntos` int NOT NULL,
  `estatus` varchar(32) NOT NULL,
  PRIMARY KEY (`id_tarjeta`),
  KEY `cliente_idx` (`id_cliente`),
  CONSTRAINT `cliente_tarjeta` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarjeta`
--

LOCK TABLES `tarjeta` WRITE;
/*!40000 ALTER TABLE `tarjeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarjeta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-03 23:08:44
