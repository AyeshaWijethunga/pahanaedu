-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ayesha_pahanaedu
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `ayesha_items`
--

DROP TABLE IF EXISTS `ayesha_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ayesha_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ayesha_items`
--

LOCK TABLES `ayesha_items` WRITE;
/*!40000 ALTER TABLE `ayesha_items` DISABLE KEYS */;
INSERT INTO `ayesha_items` VALUES (1,'pen',25,4),(8,'books',200,10),(10,'pencil',30,40);
/*!40000 ALTER TABLE `ayesha_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ayesha_order_items`
--

DROP TABLE IF EXISTS `ayesha_order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ayesha_order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `ayesha_order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `ayesha_orders` (`id`),
  CONSTRAINT `ayesha_order_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `ayesha_items` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ayesha_order_items`
--

LOCK TABLES `ayesha_order_items` WRITE;
/*!40000 ALTER TABLE `ayesha_order_items` DISABLE KEYS */;
INSERT INTO `ayesha_order_items` VALUES (2,2,1,25,25);
/*!40000 ALTER TABLE `ayesha_order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ayesha_orders`
--

DROP TABLE IF EXISTS `ayesha_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ayesha_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `ayesha_orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `ayesha_pahanaedu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ayesha_orders`
--

LOCK TABLES `ayesha_orders` WRITE;
/*!40000 ALTER TABLE `ayesha_orders` DISABLE KEYS */;
INSERT INTO `ayesha_orders` VALUES (2,9,'2025-08-18 15:29:59');
/*!40000 ALTER TABLE `ayesha_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ayesha_pahanaedu`
--

DROP TABLE IF EXISTS `ayesha_pahanaedu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ayesha_pahanaedu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `contact` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ayesha_pahanaedu`
--

LOCK TABLES `ayesha_pahanaedu` WRITE;
/*!40000 ALTER TABLE `ayesha_pahanaedu` DISABLE KEYS */;
INSERT INTO `ayesha_pahanaedu` VALUES (1,'ayeshaa','0714651405'),(9,'dulee','0713195745');
/*!40000 ALTER TABLE `ayesha_pahanaedu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-18 20:44:21
