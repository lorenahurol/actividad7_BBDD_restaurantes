-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: actividad7_restaurantes
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Carlos Rodríguez','689242124','carlos.rodriguez@mail.com'),(2,'Elena Garcia','627243785','elena.garcia@mail.com'),(3,'Javier Lopez','655236985','javier.lopez@mail.com'),(4,'Laura Fernández','672589554','laura.fernandez@mail.com'),(5,'Miguel Ruíz','636665247','miguel.ruiz@mail.com'),(6,'Maria Sanchez','696558978','maria.sanchez@mail.com'),(7,'Clara Pascual','623559647','clara.pascual@mail.com'),(8,'David Garcia','675442589','david.garcia@mail.com'),(9,'Sergio Sales','654120036','sergio.sales@mail.com'),(10,'Andrea Puerto','652664785','andrea.puerto@mail.com');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favoritos`
--

DROP TABLE IF EXISTS `favoritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favoritos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `fk_cliente` int unsigned DEFAULT NULL,
  `fk_restaurante` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_favoritos` (`fk_cliente`,`fk_restaurante`),
  KEY `fk_favoritos_restaurantes_idx` (`fk_restaurante`),
  CONSTRAINT `fk_favoritos_clientes` FOREIGN KEY (`fk_cliente`) REFERENCES `clientes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_favoritos_restaurantes` FOREIGN KEY (`fk_restaurante`) REFERENCES `restaurantes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favoritos`
--

LOCK TABLES `favoritos` WRITE;
/*!40000 ALTER TABLE `favoritos` DISABLE KEYS */;
INSERT INTO `favoritos` VALUES (1,1,1),(2,1,3),(3,2,1),(4,2,2),(5,3,NULL),(6,4,4),(7,4,6),(8,5,2),(9,5,5),(10,6,NULL),(11,7,6),(12,7,7),(13,7,8),(14,8,2),(15,8,4),(16,8,5),(17,9,2),(19,9,3),(20,10,NULL);
/*!40000 ALTER TABLE `favoritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mesas`
--

DROP TABLE IF EXISTS `mesas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mesas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `num_mesa` int NOT NULL,
  `num_comensales` int NOT NULL,
  `fk_restaurante` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mesas_restaurantes_idx` (`fk_restaurante`),
  CONSTRAINT `fk_mesas_restaurantes` FOREIGN KEY (`fk_restaurante`) REFERENCES `restaurantes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesas`
--

LOCK TABLES `mesas` WRITE;
/*!40000 ALTER TABLE `mesas` DISABLE KEYS */;
INSERT INTO `mesas` VALUES (1,1,4,1),(2,2,8,1),(3,1,4,2),(4,2,6,2),(5,1,2,3),(6,2,4,3),(7,1,4,4),(8,2,6,4),(9,1,2,5),(10,2,4,5),(11,1,4,6),(12,2,8,6),(13,1,4,7),(14,2,6,7),(15,1,2,8),(16,2,4,8),(17,1,4,9),(18,2,8,9),(19,1,2,10),(20,2,6,10);
/*!40000 ALTER TABLE `mesas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservas`
--

DROP TABLE IF EXISTS `reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_reserva` date NOT NULL,
  `hora_reserva` time NOT NULL,
  `fk_cliente` int unsigned NOT NULL,
  `fk_mesa` int unsigned NOT NULL,
  `fk_restaurante` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_reserva` (`fecha_reserva`,`hora_reserva`,`fk_mesa`,`fk_restaurante`) /*!80000 INVISIBLE */,
  KEY `fk_reservas_clientes_idx` (`fk_cliente`),
  KEY `fk_reservas_mesas_idx` (`fk_mesa`),
  KEY `fk_reservas_restaurantes_idx` (`fk_restaurante`),
  CONSTRAINT `fk_reservas_clientes` FOREIGN KEY (`fk_cliente`) REFERENCES `clientes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_reservas_mesas` FOREIGN KEY (`fk_mesa`) REFERENCES `mesas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_reservas_restaurantes` FOREIGN KEY (`fk_restaurante`) REFERENCES `restaurantes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservas`
--

LOCK TABLES `reservas` WRITE;
/*!40000 ALTER TABLE `reservas` DISABLE KEYS */;
INSERT INTO `reservas` VALUES (1,'2024-04-14','17:00:00',1,1,1),(2,'2024-04-15','19:00:00',2,2,1),(3,'2024-04-15','21:00:00',3,2,1),(4,'2024-04-14','17:00:00',4,1,2),(5,'2024-04-14','17:00:00',5,2,2),(6,'2024-04-14','14:00:00',6,1,3),(7,'2024-04-14','15:00:00',7,2,3),(8,'2024-04-15','18:00:00',4,2,3),(9,'2024-04-15','20:00:00',8,1,3),(10,'2024-04-17','11:00:00',1,1,4),(11,'2024-04-19','22:00:00',7,1,5),(12,'2024-04-17','14:00:00',1,2,5),(13,'2024-04-16','11:00:00',1,1,5),(14,'2024-04-18','20:00:00',1,2,5),(15,'2024-04-18','21:00:00',5,1,5),(16,'2024-04-20','14:00:00',1,2,5),(17,'2024-04-20','20:00:00',7,2,5),(18,'2024-04-21','11:00:00',5,1,5),(19,'2024-04-21','18:00:00',1,2,5),(20,'2024-04-21','19:00:00',2,2,5),(21,'2024-04-22','21:00:00',2,1,5),(22,'2024-04-23','17:00:00',1,2,5),(23,'2024-04-14','14:00:00',8,1,6),(24,'2024-04-15','15:00:00',9,2,6),(25,'2024-04-15','19:00:00',6,1,6),(26,'2024-04-15','19:00:00',3,2,6),(27,'2024-04-15','21:00:00',1,1,6),(28,'2024-04-16','21:00:00',1,1,7),(29,'2024-04-17','14:00:00',10,1,7),(30,'2024-04-14','19:00:00',7,1,8),(31,'2024-04-14','19:00:00',1,2,8),(32,'2024-04-15','13:00:00',8,1,9),(33,'2024-04-15','13:00:00',6,2,9),(34,'2024-04-15','15:00:00',5,1,9),(35,'2024-04-15','20:00:00',2,2,9),(36,'2024-04-15','21:00:00',7,1,9),(37,'2024-04-18','21:00:00',5,1,10),(38,'2024-04-21','14:00:00',1,2,10);
/*!40000 ALTER TABLE `reservas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurantes`
--

DROP TABLE IF EXISTS `restaurantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurantes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_responsable` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_abierto` tinyint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurantes`
--

LOCK TABLES `restaurantes` WRITE;
/*!40000 ALTER TABLE `restaurantes` DISABLE KEYS */;
INSERT INTO `restaurantes` VALUES (1,'Burgerqueen_Valencia','C/ Xativa, 103','961425668','Antonio Morales',1),(2,'Burgerqueen_Madrid','C/ Sol, 88','911253223','Pepe Sanchez',1),(3,'Burgerqueen_Barcelona','Av. Diagonal, 123','932112233','Maria Gonzalez',1),(4,'Burgerqueen_Sevilla','C/ Sierpes, 45','955667788','Juan Martinez',0),(5,'Burgerqueen_Bilbao','Plaza Moyua, 10','944554433','Elena Fernandez',1),(6,'Burgerqueen_Malaga','C/ Larios, 15','952112233','Manuel Lopez',1),(7,'Burgerqueen_Alicante','C/ Rambla, 5','965667788','Laura Ramirez',1),(8,'Burgerqueen_Zaragoza','Plaza del Pilar, 20','976554433','Pablo Diaz',0),(9,'Burgerqueen_Granada','Av. de la Constitución, 30','958112233','Carmen Ruiz',1),(10,'Burgerqueen_Cadiz','Av. Andalucia, 12','956667788','Pedro Fernandez',1);
/*!40000 ALTER TABLE `restaurantes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-14 21:45:30
