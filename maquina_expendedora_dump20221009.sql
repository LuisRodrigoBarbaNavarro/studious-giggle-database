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
INSERT INTO `categoria` VALUES (2010,'Botellas de agua','Agua potable envasada en botellas individuales'),(2011,'Bebidas energeticas','Bebida envasada estimulante en botellas individuales'),(2012,'Bebidas vitaminadas','Bebidas envasada vitaminada en botellas individuales'),(2013,'Refrescos dieteticos','Refresco envasado con poco contenido de azucares'),(2014,'Refrescos mineral','Refresco envasado con caracteristicas minerales'),(2015,'Refrescos normal','Refresco envasado de consumo popular'),(2016,'Cafe caliente','Bebida envasada de variantes de cafe caliente'),(2017,'Cafe frio','Bebida envasada de variantes de cafe frio'),(2018,'Meriendas','Alimento generalmente ligero que se toma a media tarde'),(2019,'Pastelillos','Pastelillo de diversos sabores dulces o salados'),(2020,'Galletas','Producto alimenticio horneado y moldeado a base de harina'),(2021,'Gelatinas','Mezcla coloide gel de diferentes sabores'),(2022,'Chocolates','Alimento que se elabora con una pasta de cacao y azucar'),(2023,'Gominolas','Alimento coloide gel que poseen diferentes sabores'),(2024,'Papas fritas','Alimento procesado a base de papa con diversos sabores'),(2025,'Nueces','Semilla comestible con diferentes formas y sabores'),(2026,'Ropa','Vestimenta adecuada para la institucion'),(2027,'Electronicos','Tecnologia para satisfacer necesidades de la cotidianidad'),(2028,'Suministros','Suministro escolar adecuado'),(2029,'Libretas','Conjunto de hojas de papel');
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
INSERT INTO `detalle` VALUES ('AX001010',159001,4,'A01'),('AX001011',159002,2,'A02'),('AX001012',159003,1,'A03'),('AX001013',159004,2,'A04'),('AX001014',159005,4,'A05'),('AX001015',159006,4,'A06'),('AX001016',159007,1,'A07'),('AX001017',159008,2,'A08'),('AX001018',159009,4,'B01'),('AX001019',159010,1,'B02'),('AX001020',159011,4,'B03'),('AX001021',159012,4,'B04'),('AX001022',159013,2,'B05'),('AX001023',159014,4,'B06'),('AX001024',159015,1,'B07'),('AX001025',159016,3,'B08'),('AX001026',159017,4,'C01'),('AX001027',159018,2,'C02'),('AX001028',159019,3,'C03'),('AX001029',159020,4,'C04'),('AX001030',159021,3,'C05'),('AX001031',159022,3,'C06'),('AX001032',159023,2,'C07'),('AX001033',159024,4,'C08'),('AX001034',159025,2,'D01'),('AX001035',159026,3,'D02'),('AX001036',159027,4,'D03'),('AX001037',159028,3,'D04'),('AX001038',159029,1,'D05'),('AX001039',159030,3,'D06'),('AX001040',159031,3,'D07'),('AX001041',159032,2,'D08'),('AX001042',159033,4,'E01'),('AX001043',159034,2,'E02'),('AX001044',159035,1,'E03'),('AX001045',159036,2,'E04'),('AX001046',159037,4,'E05'),('AX001047',159038,4,'E06'),('AX001048',159039,3,'E07'),('AX001049',159040,4,'E08'),('AX001050',159041,3,'F01'),('AX001051',159042,2,'F02'),('AX001052',159043,1,'F03'),('AX001053',159044,4,'F04'),('AX001054',159045,3,'F05'),('AX001055',159046,2,'F06'),('AX001056',159047,4,'F07'),('AX001057',159048,2,'F08'),('AX001058',159049,4,'G01'),('AX001059',159050,2,'G02');
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
INSERT INTO `factura` VALUES ('AX001010',20490687,'4010','2022-09-18','08:12:00'),('AX001011',20490688,'4011','2022-09-20','08:22:00'),('AX001012',20490689,'4012','2022-09-22','08:32:00'),('AX001013',20490690,'4020','2022-09-24','08:42:00'),('AX001014',20490691,'4021','2022-09-26','08:52:00'),('AX001015',20490692,'4022','2022-09-28','09:02:00'),('AX001016',20490693,'4030','2022-09-30','09:12:00'),('AX001017',20490694,'4031','2022-10-02','09:22:00'),('AX001018',20490695,'4032','2022-10-04','09:32:00'),('AX001019',20490696,'4040','2022-10-06','09:42:00'),('AX001020',20490697,'4041','2022-10-08','09:52:00'),('AX001021',20490698,'4042','2022-10-10','10:02:00'),('AX001022',20490699,'4010','2022-10-12','10:12:00'),('AX001023',20490700,'4011','2022-10-14','10:22:00'),('AX001024',20490701,'4012','2022-10-16','10:32:00'),('AX001025',20490702,'4020','2022-10-18','10:42:00'),('AX001026',20490703,'4021','2022-10-20','10:52:00'),('AX001027',20490704,'4022','2022-10-22','11:02:00'),('AX001028',20490705,'4030','2022-10-24','11:12:00'),('AX001029',20490706,'4031','2022-10-26','11:22:00'),('AX001030',20490707,'4032','2022-10-28','11:32:00'),('AX001031',20490708,'4040','2022-10-30','11:42:00'),('AX001032',20490709,'4041','2022-11-01','11:52:00'),('AX001033',20490710,'4042','2022-11-03','12:02:00'),('AX001034',20490711,'4010','2022-11-05','12:12:00'),('AX001035',20490712,'4011','2022-11-07','12:22:00'),('AX001036',20490713,'4012','2022-11-09','12:32:00'),('AX001037',20490714,'4020','2022-11-11','12:42:00'),('AX001038',20490715,'4021','2022-11-13','12:52:00'),('AX001039',20490716,'4022','2022-11-15','13:02:00'),('AX001040',20490717,'4030','2022-11-17','13:12:00'),('AX001041',20490718,'4031','2022-11-19','13:22:00'),('AX001042',20490719,'4032','2022-11-21','13:32:00'),('AX001043',20490720,'4040','2022-11-23','13:42:00'),('AX001044',20490721,'4041','2022-11-25','13:52:00'),('AX001045',20490722,'4042','2022-11-27','14:02:00'),('AX001046',20490723,'4010','2022-11-29','14:12:00'),('AX001047',20490724,'4011','2022-12-01','14:22:00'),('AX001048',20490725,'4012','2022-12-03','14:32:00'),('AX001049',20490726,'4020','2022-12-05','14:42:00'),('AX001050',20490727,'4021','2022-12-07','14:52:00'),('AX001051',20490728,'4022','2022-12-09','15:02:00'),('AX001052',20490729,'4030','2022-12-11','15:12:00'),('AX001053',20490730,'4031','2022-12-13','15:22:00'),('AX001054',20490731,'4032','2022-12-15','15:32:00'),('AX001055',20490732,'4040','2022-12-17','15:42:00'),('AX001056',20490733,'4041','2022-12-19','15:52:00'),('AX001057',20490734,'4042','2022-12-21','16:02:00'),('AX001058',20490735,'4010','2022-12-23','16:12:00'),('AX001059',20490736,'4011','2022-12-25','16:22:00');
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
INSERT INTO `inventario_maquina` VALUES ('4010',159001,'A01',6,36),('4010',159002,'A02',6,40),('4010',159003,'A03',4,36),('4010',159004,'A04',9,29),('4010',159005,'A05',9,21),('4010',159006,'A06',8,28),('4010',159007,'A07',5,53),('4010',159008,'A08',0,31),('4010',159009,'B01',3,55),('4010',159010,'B02',3,50),('4010',159011,'B03',9,25),('4010',159012,'B04',9,38),('4010',159013,'B05',5,41),('4010',159014,'B06',8,38),('4010',159015,'B07',2,20),('4010',159016,'B08',3,20),('4010',159017,'C01',10,39),('4010',159018,'C02',9,20),('4010',159019,'C03',10,50),('4010',159020,'C04',2,40),('4010',159021,'C05',9,32),('4010',159022,'C06',3,27),('4010',159023,'C07',7,26),('4010',159024,'C08',6,38),('4010',159025,'D01',1,49),('4010',159026,'D02',8,52),('4010',159027,'D03',0,31),('4010',159028,'D04',9,18),('4010',159029,'D05',6,25),('4010',159030,'D06',3,20),('4010',159031,'D07',8,28),('4010',159032,'D08',10,43),('4010',159033,'E01',10,29),('4010',159034,'E02',6,43),('4010',159035,'E03',4,20),('4010',159036,'E04',1,49),('4010',159037,'E05',4,32),('4010',159038,'E06',1,45),('4010',159039,'E07',5,55),('4010',159040,'E08',4,40),('4010',159041,'F01',2,45),('4010',159042,'F02',8,37),('4010',159043,'F03',6,44),('4010',159044,'F04',2,40),('4010',159045,'F05',9,43),('4010',159046,'F06',7,43),('4010',159047,'F07',4,29),('4010',159048,'F08',7,31),('4010',159049,'G01',5,51),('4010',159050,'G02',10,51),('4011',159001,'A01',7,36),('4011',159002,'A02',1,40),('4011',159003,'A03',2,36),('4011',159004,'A04',5,29),('4011',159005,'A05',0,21),('4011',159006,'A06',2,28),('4011',159007,'A07',3,53),('4011',159008,'A08',1,31),('4011',159009,'B01',10,55),('4011',159010,'B02',1,50),('4011',159011,'B03',0,25),('4011',159012,'B04',4,38),('4011',159013,'B05',3,41),('4011',159014,'B06',8,38),('4011',159015,'B07',10,20),('4011',159016,'B08',2,20),('4011',159017,'C01',1,39),('4011',159018,'C02',2,20),('4011',159019,'C03',4,50),('4011',159020,'C04',6,40),('4011',159021,'C05',7,32),('4011',159022,'C06',1,27),('4011',159023,'C07',2,26),('4011',159024,'C08',3,38),('4011',159025,'D01',10,49),('4011',159026,'D02',3,52),('4011',159027,'D03',2,31),('4011',159028,'D04',5,18),('4011',159029,'D05',4,25),('4011',159030,'D06',1,20),('4011',159031,'D07',1,28),('4011',159032,'D08',8,43),('4011',159033,'E01',2,29),('4011',159034,'E02',10,43),('4011',159035,'E03',10,20),('4011',159036,'E04',4,49),('4011',159037,'E05',1,32),('4011',159038,'E06',9,45),('4011',159039,'E07',6,55),('4011',159040,'E08',3,40),('4011',159041,'F01',9,45),('4011',159042,'F02',2,37),('4011',159043,'F03',7,44),('4011',159044,'F04',5,40),('4011',159045,'F05',2,43),('4011',159046,'F06',7,43),('4011',159047,'F07',4,29),('4011',159048,'F08',4,31),('4011',159049,'G01',8,51),('4011',159050,'G02',8,51),('4012',159001,'A01',8,36),('4012',159002,'A02',6,40),('4012',159003,'A03',0,36),('4012',159004,'A04',9,29),('4012',159005,'A05',5,21),('4012',159006,'A06',8,28),('4012',159007,'A07',9,53),('4012',159008,'A08',9,31),('4012',159009,'B01',8,55),('4012',159010,'B02',2,50),('4012',159011,'B03',2,25),('4012',159012,'B04',6,38),('4012',159013,'B05',3,41),('4012',159014,'B06',2,38),('4012',159015,'B07',6,20),('4012',159016,'B08',10,20),('4012',159017,'C01',2,39),('4012',159018,'C02',1,20),('4012',159019,'C03',7,50),('4012',159020,'C04',5,40),('4012',159021,'C05',6,32),('4012',159022,'C06',0,27),('4012',159023,'C07',9,26),('4012',159024,'C08',0,38),('4012',159025,'D01',9,49),('4020',159001,'A01',1,53),('4020',159002,'A02',10,46),('4020',159003,'A03',3,55),('4020',159004,'A04',8,27),('4020',159005,'A05',3,38),('4020',159006,'A06',8,53),('4020',159007,'A07',9,18),('4020',159008,'A08',10,28),('4020',159009,'B01',0,18),('4020',159010,'B02',2,37),('4020',159011,'B03',0,34),('4020',159012,'B04',8,35),('4020',159013,'B05',2,17),('4020',159014,'B06',0,40),('4020',159015,'B07',5,20),('4020',159016,'B08',7,45),('4020',159017,'C01',0,33),('4020',159018,'C02',6,38),('4020',159019,'C03',0,23),('4020',159020,'C04',6,51),('4020',159021,'C05',10,50),('4020',159022,'C06',6,45),('4020',159023,'C07',3,49),('4020',159024,'C08',8,35),('4020',159025,'D01',6,17),('4020',159026,'D02',7,26),('4020',159027,'D03',5,55),('4020',159028,'D04',6,55),('4020',159029,'D05',2,20),('4020',159030,'D06',2,34),('4020',159031,'D07',4,23),('4020',159032,'D08',1,21),('4020',159033,'E01',3,52),('4020',159034,'E02',7,45),('4020',159035,'E03',6,50),('4020',159036,'E04',3,52),('4020',159037,'E05',1,48),('4020',159038,'E06',5,51),('4020',159039,'E07',10,41),('4020',159040,'E08',5,27),('4020',159041,'F01',9,52),('4020',159042,'F02',0,25),('4020',159043,'F03',4,52),('4020',159044,'F04',0,53),('4020',159045,'F05',7,23),('4020',159046,'F06',1,51),('4020',159047,'F07',7,35),('4020',159048,'F08',5,40),('4020',159049,'G01',10,55),('4020',159050,'G02',0,41),('4021',159001,'A01',7,53),('4021',159002,'A02',5,46),('4021',159003,'A03',3,55),('4021',159004,'A04',5,27),('4021',159005,'A05',7,38),('4021',159006,'A06',8,53),('4021',159007,'A07',9,18),('4021',159008,'A08',5,28),('4021',159009,'B01',8,18),('4021',159010,'B02',7,37),('4021',159011,'B03',4,34),('4021',159012,'B04',7,35),('4021',159013,'B05',2,17),('4021',159014,'B06',7,40),('4021',159015,'B07',9,20),('4021',159016,'B08',2,45),('4021',159017,'C01',8,33),('4021',159018,'C02',3,38),('4021',159019,'C03',2,23),('4021',159020,'C04',2,51),('4021',159021,'C05',0,50),('4021',159022,'C06',2,45),('4021',159023,'C07',3,49),('4021',159024,'C08',5,35),('4021',159025,'D01',7,17),('4021',159026,'D02',3,26),('4021',159027,'D03',10,55),('4021',159028,'D04',2,55),('4021',159029,'D05',3,20),('4021',159030,'D06',6,34),('4021',159031,'D07',7,23),('4021',159032,'D08',2,21),('4021',159033,'E01',6,52),('4021',159034,'E02',10,45),('4021',159035,'E03',10,50),('4021',159036,'E04',6,52),('4021',159037,'E05',2,48),('4021',159038,'E06',1,51),('4021',159039,'E07',3,41),('4021',159040,'E08',10,27),('4021',159041,'F01',2,52),('4021',159042,'F02',1,25),('4021',159043,'F03',5,52),('4021',159044,'F04',8,53),('4021',159045,'F05',6,23),('4021',159046,'F06',7,51),('4021',159047,'F07',8,35),('4021',159048,'F08',9,40),('4021',159049,'G01',8,55),('4021',159050,'G02',7,41),('4022',159001,'A01',5,53),('4022',159002,'A02',6,46),('4022',159003,'A03',1,55),('4022',159004,'A04',6,27),('4022',159005,'A05',3,38),('4022',159006,'A06',9,53),('4022',159007,'A07',7,18),('4022',159008,'A08',3,28),('4022',159009,'B01',1,18),('4022',159010,'B02',6,37),('4022',159011,'B03',8,34),('4022',159012,'B04',1,35),('4022',159013,'B05',6,17),('4022',159014,'B06',4,40),('4022',159015,'B07',8,20),('4022',159016,'B08',10,45),('4022',159017,'C01',3,33),('4022',159018,'C02',3,38),('4022',159019,'C03',9,23),('4022',159020,'C04',1,51),('4022',159021,'C05',3,50),('4022',159022,'C06',8,45),('4022',159023,'C07',1,49),('4022',159024,'C08',9,35),('4022',159025,'D01',6,17),('4030',159001,'A01',8,19),('4030',159002,'A02',10,34),('4030',159003,'A03',4,51),('4030',159004,'A04',1,38),('4030',159005,'A05',10,22),('4030',159006,'A06',3,43),('4030',159007,'A07',5,41),('4030',159008,'A08',6,37),('4030',159009,'B01',9,18),('4030',159010,'B02',0,17),('4030',159011,'B03',1,36),('4030',159012,'B04',8,16),('4030',159013,'B05',7,21),('4030',159014,'B06',0,47),('4030',159015,'B07',4,43),('4030',159016,'B08',4,50),('4030',159017,'C01',8,55),('4030',159018,'C02',1,29),('4030',159019,'C03',0,53),('4030',159020,'C04',7,22),('4030',159021,'C05',10,44),('4030',159022,'C06',4,19),('4030',159023,'C07',7,49),('4030',159024,'C08',6,44),('4030',159025,'D01',7,16),('4030',159026,'D02',9,41),('4030',159027,'D03',5,35),('4030',159028,'D04',7,30),('4030',159029,'D05',0,34),('4030',159030,'D06',9,46),('4030',159031,'D07',4,32),('4030',159032,'D08',5,32),('4030',159033,'E01',7,28),('4030',159034,'E02',10,29),('4030',159035,'E03',8,30),('4030',159036,'E04',5,34),('4030',159037,'E05',3,18),('4030',159038,'E06',0,17),('4030',159039,'E07',1,52),('4030',159040,'E08',3,30),('4030',159041,'F01',10,28),('4030',159042,'F02',7,32),('4030',159043,'F03',10,28),('4030',159044,'F04',6,28),('4030',159045,'F05',8,29),('4030',159046,'F06',7,53),('4030',159047,'F07',4,18),('4030',159048,'F08',0,31),('4030',159049,'G01',9,25),('4030',159050,'G02',5,49),('4031',159001,'A01',2,19),('4031',159002,'A02',4,34),('4031',159003,'A03',6,51),('4031',159004,'A04',9,38),('4031',159005,'A05',2,22),('4031',159006,'A06',2,43),('4031',159007,'A07',1,41),('4031',159008,'A08',8,37),('4031',159009,'B01',6,18),('4031',159010,'B02',6,17),('4031',159011,'B03',7,36),('4031',159012,'B04',7,16),('4031',159013,'B05',0,21),('4031',159014,'B06',9,47),('4031',159015,'B07',7,43),('4031',159016,'B08',3,50),('4031',159017,'C01',6,55),('4031',159018,'C02',9,29),('4031',159019,'C03',1,53),('4031',159020,'C04',5,22),('4031',159021,'C05',7,44),('4031',159022,'C06',9,19),('4031',159023,'C07',9,49),('4031',159024,'C08',8,44),('4031',159025,'D01',10,16),('4031',159026,'D02',4,41),('4031',159027,'D03',9,35),('4031',159028,'D04',10,30),('4031',159029,'D05',4,34),('4031',159030,'D06',5,46),('4031',159031,'D07',6,32),('4031',159032,'D08',10,32),('4031',159033,'E01',7,28),('4031',159034,'E02',1,29),('4031',159035,'E03',9,30),('4031',159036,'E04',4,34),('4031',159037,'E05',0,18),('4031',159038,'E06',6,17),('4031',159039,'E07',10,52),('4031',159040,'E08',0,30),('4031',159041,'F01',1,28),('4031',159042,'F02',7,32),('4031',159043,'F03',0,28),('4031',159044,'F04',2,28),('4031',159045,'F05',4,29),('4031',159046,'F06',4,53),('4031',159047,'F07',0,18),('4031',159048,'F08',7,31),('4031',159049,'G01',7,25),('4031',159050,'G02',8,49),('4032',159001,'A01',1,19),('4032',159002,'A02',7,34),('4032',159003,'A03',6,51),('4032',159004,'A04',3,38),('4032',159005,'A05',0,22),('4032',159006,'A06',2,43),('4032',159007,'A07',0,41),('4032',159008,'A08',8,37),('4032',159009,'B01',1,18),('4032',159010,'B02',4,17),('4032',159011,'B03',0,36),('4032',159012,'B04',9,16),('4032',159013,'B05',7,21),('4032',159014,'B06',0,47),('4032',159015,'B07',10,43),('4032',159016,'B08',1,50),('4032',159017,'C01',3,55),('4032',159018,'C02',8,29),('4032',159019,'C03',0,53),('4032',159020,'C04',7,22),('4032',159021,'C05',4,44),('4032',159022,'C06',3,19),('4032',159023,'C07',2,49),('4032',159024,'C08',4,44),('4032',159025,'D01',2,16),('4040',159001,'A01',0,25),('4040',159002,'A02',6,16),('4040',159003,'A03',3,43),('4040',159004,'A04',7,21),('4040',159005,'A05',4,50),('4040',159006,'A06',1,43),('4040',159007,'A07',7,39),('4040',159008,'A08',6,44),('4040',159009,'B01',9,48),('4040',159010,'B02',7,27),('4040',159011,'B03',9,28),('4040',159012,'B04',0,45),('4040',159013,'B05',5,30),('4040',159014,'B06',0,37),('4040',159015,'B07',4,31),('4040',159016,'B08',0,26),('4040',159017,'C01',3,34),('4040',159018,'C02',5,34),('4040',159019,'C03',5,36),('4040',159020,'C04',6,38),('4040',159021,'C05',1,29),('4040',159022,'C06',0,34),('4040',159023,'C07',10,32),('4040',159024,'C08',10,36),('4040',159025,'D01',6,16),('4040',159026,'D02',5,30),('4040',159027,'D03',6,38),('4040',159028,'D04',8,42),('4040',159029,'D05',7,51),('4040',159030,'D06',1,39),('4040',159031,'D07',9,31),('4040',159032,'D08',8,37),('4040',159033,'E01',6,28),('4040',159034,'E02',4,42),('4040',159035,'E03',6,24),('4040',159036,'E04',2,19),('4040',159037,'E05',9,54),('4040',159038,'E06',0,45),('4040',159039,'E07',8,24),('4040',159040,'E08',6,50),('4040',159041,'F01',7,46),('4040',159042,'F02',1,27),('4040',159043,'F03',9,24),('4040',159044,'F04',5,18),('4040',159045,'F05',5,52),('4040',159046,'F06',1,21),('4040',159047,'F07',6,19),('4040',159048,'F08',6,17),('4040',159049,'G01',4,52),('4040',159050,'G02',0,50),('4041',159001,'A01',0,25),('4041',159002,'A02',2,16),('4041',159003,'A03',6,43),('4041',159004,'A04',2,21),('4041',159005,'A05',1,50),('4041',159006,'A06',3,43),('4041',159007,'A07',5,39),('4041',159008,'A08',10,44),('4041',159009,'B01',1,48),('4041',159010,'B02',10,27),('4041',159011,'B03',3,28),('4041',159012,'B04',7,45),('4041',159013,'B05',8,30),('4041',159014,'B06',1,37),('4041',159015,'B07',7,31),('4041',159016,'B08',5,26),('4041',159017,'C01',4,34),('4041',159018,'C02',2,34),('4041',159019,'C03',6,36),('4041',159020,'C04',6,38),('4041',159021,'C05',9,29),('4041',159022,'C06',6,34),('4041',159023,'C07',10,32),('4041',159024,'C08',5,36),('4041',159025,'D01',6,16),('4041',159026,'D02',2,30),('4041',159027,'D03',1,38),('4041',159028,'D04',6,42),('4041',159029,'D05',4,51),('4041',159030,'D06',4,39),('4041',159031,'D07',10,31),('4041',159032,'D08',6,37),('4041',159033,'E01',9,28),('4041',159034,'E02',1,42),('4041',159035,'E03',10,24),('4041',159036,'E04',5,19),('4041',159037,'E05',9,54),('4041',159038,'E06',7,45),('4041',159039,'E07',3,24),('4041',159040,'E08',8,50),('4041',159041,'F01',7,46),('4041',159042,'F02',4,27),('4041',159043,'F03',4,24),('4041',159044,'F04',1,18),('4041',159045,'F05',2,52),('4041',159046,'F06',3,21),('4041',159047,'F07',3,19),('4041',159048,'F08',7,17),('4041',159049,'G01',7,52),('4041',159050,'G02',8,50),('4042',159001,'A01',9,25),('4042',159002,'A02',3,16),('4042',159003,'A03',0,43),('4042',159004,'A04',10,21),('4042',159005,'A05',0,50),('4042',159006,'A06',9,43),('4042',159007,'A07',7,39),('4042',159008,'A08',2,44),('4042',159009,'B01',1,48),('4042',159010,'B02',10,27),('4042',159011,'B03',2,28),('4042',159012,'B04',7,45),('4042',159013,'B05',4,30),('4042',159014,'B06',1,37),('4042',159015,'B07',6,31),('4042',159016,'B08',3,26),('4042',159017,'C01',3,34),('4042',159018,'C02',5,34),('4042',159019,'C03',7,36),('4042',159020,'C04',5,38),('4042',159021,'C05',3,29),('4042',159022,'C06',7,34),('4042',159023,'C07',10,32),('4042',159024,'C08',9,36),('4042',159025,'D01',7,16);
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
INSERT INTO `producto` VALUES (159001,2010,'Agua Bonafont','por 100ml - Calorias: 0kcal | Grasa: 0,00g'),(159002,2010,'Agua Ciel','por 100ml - Calorias: 0kcal | Grasa: 0,00g'),(159003,2010,'Agua Epura','por 100ml - Calorias: 0kcal | Grasa: 0,00g'),(159004,2011,'Bebida Monster','por 100ml - Calorias: 49kcal | Grasa: 0,00g'),(159005,2011,'Bebida Boost','por 1 porción (200ml) - Calorias: 102kcal | Grasa: 2,00g'),(159006,2011,'Bebida Red Bull','por 100ml - Calorias: 45kcal | Grasa: 0,00g'),(159007,2014,'Minerale Epura','por 1 botella (600ml) - Calorias: 24kcal | Grasa: 0,00g'),(159008,2014,'Peñafiel','por 100ml - Calorías: 0kcal | Grasa: 0,00g'),(159009,2014,'Perrier','por 100ml - Calorías: 0kcal | Grasa: 0,00g'),(159010,2015,'Coca-Cola','por 1 porción (200ml) - Calorias: 200kcal | Grasa: 2,00g'),(159011,2015,'Delaware Punch','por 1 porción (200ml) - Calorias: 92kcal | Grasa: 1,00g'),(159012,2015,'Sprite','por 1 porción (200ml) - Calorias: 122kcal | Grasa: 1,00g'),(159013,2015,'Manzana Lift','por 1 porción (200ml) - Calorias: 176kcal | Grasa: 1,00g'),(159014,2015,'Fanta Sabor Fresa','por 1 porción (200ml) - Calorias: 112kcal | Grasa: 1,00g'),(159015,2015,'Fanta Sabor Uva','por 1 porción (200ml) - Calorias: 112kcal | Grasa: 1,00g'),(159016,2016,'Clasico Nescafe','por 1 porción (2g) - Calorias: 3kcal | Grasa: 0,01g'),(159017,2016,'Coffe-Mate','por 1 taza - Calorias: 44kcal | Grasa: 0,10g '),(159018,2016,'Cafe Lala','por 1 taza (250ml) - Calorías: 164kcal | Grasa: 4,00g'),(159019,2017,'Clasico Nescafe','por 1 porción (2g) - Calorias: 3kcal | Grasa: 0,01g'),(159020,2017,'Coffe-Mate','por 1 taza - Calorias: 44kcal | Grasa: 0,10g '),(159021,2017,'Cafe Lala','por 1 taza (250ml) - Calorías: 164kcal | Grasa: 4,00g'),(159022,2018,'Sandwich','por 100g - Calorias: 440kcal | Grasa: 15,00g'),(159023,2018,'Croissant','por 1 mediana - Calorias: 231kcal | Grasa: 11,97g'),(159024,2018,'Panini Clasico','por 100g - Calorias: 230kcal | Grasa: 10,00g'),(159025,2019,'Gansito','por 1 pieza (50g) - Calorias: 196kcal | Grasa: 8,00g'),(159026,2019,'Chocorroles','por 1 pieza (40g) - Calorias: 154kcal | Grasa: 6,00g'),(159027,2019,'Pinguinos','por 1 chocorrol (40g) - Calorias: 143kcal | Grasa: 5,00g'),(159028,2020,'Principe','por 1 galleta (11g) - Calorias: 50kcal | Grasa: 1,90g'),(159029,2020,'Triki Trakes','por 1 galleta (9g) - Calorias: 42kcal | Grasa: 2,00g'),(159030,2020,'Polvorones','por 1 galleta (14g) - Calorias: 67kcal | Grasa: 3,00g '),(159031,2020,'Barritas Fresa','por 1 pieza (34g) - Calorias: 151kcal | Grasa: 6,40g'),(159032,2020,'Barritas Piña','por 1 pieza (34g) - Calorias: 151kcal | Grasa: 6,40g'),(159033,2020,'Canelitas','por 1 pieza (6g) - Calorias: 25kcal | Grasa: 1,00g'),(159034,2022,'Carlos V','por 1 barra (19g) - Calorias: 56kcal | Grasa: 5,70g'),(159035,2022,'Milkyway','por 1 barra (19g) - Calorias: 88kcal | Grasa: 5,70g'),(159036,2022,'Lunetas','por 1 barra (19g) - Calorias: 76kcal | Grasa: 5,70g'),(159037,2022,'M&Ms','por 1 barra (19g) - Calorias: 126kcal | Grasa: 5,70g'),(159038,2022,'Snickers','por 1 barra (19g) - Calorias: 96kcal | Grasa: 5,70g'),(159039,2022,'Larin','por 1 barra (19g) - Calorias: 86kcal | Grasa: 5,70g'),(159040,2024,'Sabritas Adobadas','por 1 porción (30g) - Calorias: 144kcal | Grasa: 7,20g '),(159041,2024,'Paketaxo Azul','por 1 porción (55g) - Calorias: 270kcal | Grasa: 14,00g'),(159042,2024,'Paketaxo Verde','por 1 porción (30g) - Calorias: 150kcal | Grasa: 9,50g'),(159043,2024,'Doritos','por 1 porción (30g) - Calorias: 158kcal | Grasa: 10,00g'),(159044,2024,'Ruffles','por 100g - Calorias: 532kcal | Grasa: 33,60g'),(159045,2024,'Takis Fuego','por 1 porción (55g) - Calorias: 270kcal | Grasa: 14,00g'),(159046,2025,'Snurkels','por 1 pieza (40g) - Calorias: 154kcal | Grasa: 6,00g'),(159047,2026,'Camiseta Blanca','Sin informacion nutrimental'),(159048,2027,'Cable Tipo C','Sin informacion nutrimental'),(159049,2028,'Pluma Bicolor','Sin informacion nutrimental'),(159050,2029,'Libreta Norma','Sin informacion nutrimental');
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
INSERT INTO `promocion` VALUES (5010,'2022-10-23 12:00:00',25),(5011,'2022-10-24 13:00:00',28),(5012,'2022-10-25 14:00:00',31),(5013,'2022-10-26 15:00:00',34),(5014,'2022-10-27 16:00:00',37),(5015,'2022-10-28 17:00:00',40),(5016,'2022-10-29 18:00:00',43),(5017,'2022-10-30 19:00:00',46),(5018,'2022-10-31 20:00:00',34),(5019,'2022-11-01 21:00:00',36),(5020,'2022-11-02 22:00:00',38),(5021,'2022-11-03 23:00:00',40),(5022,'2022-11-05 00:00:00',42),(5023,'2022-11-06 01:00:00',44),(5024,'2022-11-07 02:00:00',46),(5025,'2022-11-08 03:00:00',48),(5026,'2022-11-09 04:00:00',60),(5027,'2022-11-10 05:00:00',62),(5028,'2022-11-11 06:00:00',64),(5029,'2022-11-12 07:00:00',66);
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
INSERT INTO `promocion_categoria` VALUES (5010,2010),(5010,2018),(5010,2019),(5011,2011),(5011,2018),(5011,2019),(5012,2012),(5012,2018),(5012,2019),(5013,2014),(5013,2018),(5013,2019),(5014,2015),(5014,2018),(5014,2019),(5015,2016),(5015,2018),(5015,2021),(5016,2018),(5016,2023),(5016,2025),(5017,2015),(5017,2024),(5018,2011),(5019,2016),(5019,2024),(5020,2019),(5020,2020),(5020,2025),(5021,2025),(5022,2017),(5023,2028),(5023,2029),(5024,2027),(5024,2028),(5025,2017),(5025,2023),(5025,2024),(5026,2019),(5026,2023),(5026,2024),(5027,2016),(5027,2029),(5028,2010),(5029,2011);
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
INSERT INTO `promocion_maquina` VALUES (5010,'4010'),(5010,'4011'),(5010,'4012'),(5011,'4020'),(5011,'4021'),(5011,'4022'),(5012,'4030'),(5012,'4031'),(5012,'4032'),(5013,'4010'),(5013,'4020'),(5013,'4030'),(5014,'4011'),(5014,'4021'),(5014,'4031'),(5015,'4040'),(5015,'4041'),(5015,'4042'),(5016,'4030'),(5016,'4040'),(5016,'4041'),(5017,'4010'),(5017,'4021'),(5018,'4031'),(5019,'4021'),(5019,'4031'),(5020,'4012'),(5020,'4022'),(5020,'4030'),(5021,'4010'),(5022,'4011'),(5023,'4012'),(5023,'4040'),(5024,'4041'),(5024,'4042'),(5025,'4010'),(5025,'4020'),(5025,'4040'),(5026,'4020'),(5026,'4041'),(5026,'4042'),(5027,'4021'),(5027,'4022'),(5028,'4040'),(5029,'4042');
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
INSERT INTO `tarjeta` VALUES (10020512,20490687,'2022-08-10',2000,'Habilitada'),(10020513,20490688,'2022-08-11',2050,'Habilitada'),(10020514,20490689,'2022-08-12',2100,'Habilitada'),(10020515,20490690,'2022-08-13',2150,'Habilitada'),(10020516,20490691,'2022-08-14',2200,'Habilitada'),(10020517,20490692,'2022-08-15',2250,'Habilitada'),(10020518,20490693,'2022-08-16',2300,'Habilitada'),(10020519,20490694,'2022-08-17',2350,'Habilitada'),(10020520,20490695,'2022-08-18',2400,'Habilitada'),(10020521,20490696,'2022-08-19',2450,'Habilitada'),(10020522,20490697,'2022-08-20',2500,'Habilitada'),(10020523,20490698,'2022-08-21',2550,'Habilitada'),(10020524,20490699,'2022-08-22',2600,'Habilitada'),(10020525,20490700,'2022-08-23',2650,'Habilitada'),(10020526,20490701,'2022-08-24',2700,'Habilitada'),(10020527,20490702,'2022-08-25',2750,'Habilitada'),(10020528,20490703,'2022-08-26',2800,'Habilitada'),(10020529,20490704,'2022-08-27',2850,'Habilitada'),(10020530,20490705,'2022-08-28',2900,'Habilitada'),(10020531,20490706,'2022-08-29',2950,'Habilitada'),(10020532,20490707,'2022-08-30',3000,'Habilitada'),(10020533,20490708,'2022-08-31',3050,'Habilitada'),(10020534,20490709,'2022-09-01',3100,'Habilitada'),(10020535,20490710,'2022-09-02',3150,'Habilitada'),(10020536,20490711,'2022-09-03',5150,'Habilitada'),(10020537,20490712,'2022-09-04',5300,'Habilitada'),(10020538,20490713,'2022-09-05',5450,'Habilitada'),(10020539,20490714,'2022-09-06',5600,'Habilitada'),(10020540,20490715,'2022-09-07',5750,'Habilitada'),(10020541,20490716,'2022-09-08',5900,'Habilitada'),(10020542,20490717,'2022-09-09',6050,'Habilitada'),(10020543,20490718,'2022-09-10',6200,'Habilitada'),(10020544,20490719,'2022-09-11',6350,'Habilitada'),(10020545,20490720,'2022-09-12',6500,'Habilitada'),(10020546,20490721,'2022-09-13',6650,'Habilitada'),(10020547,20490722,'2022-09-14',6800,'Habilitada'),(10020548,20490723,'2022-09-15',6950,'Habilitada'),(10020549,20490724,'2022-09-16',7100,'Habilitada'),(10020550,20490725,'2022-09-17',7250,'Habilitada'),(10020551,20490726,'2022-09-18',7400,'Habilitada'),(10020552,20490727,'2022-09-19',7550,'Habilitada'),(10020553,20490728,'2022-09-20',7700,'Habilitada'),(10020554,20490729,'2022-09-21',7850,'Habilitada'),(10020555,20490730,'2022-09-22',8000,'Habilitada'),(10020556,20490731,'2022-09-23',8150,'Habilitada'),(10020557,20490732,'2022-09-24',8300,'Habilitada'),(10020558,20490733,'2022-09-25',8450,'Habilitada'),(10020559,20490734,'2022-09-26',8600,'Deshabilitada'),(10020560,20490735,'2022-09-27',8750,'Deshabilitada'),(10020561,20490736,'2022-09-28',8900,'Deshabilitada');
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

-- Dump completed on 2022-10-09 23:17:04
