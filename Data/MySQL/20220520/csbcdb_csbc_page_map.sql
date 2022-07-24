-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: csbcdb
-- ------------------------------------------------------
-- Server version	5.7.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `csbc_page_map`
--

DROP TABLE IF EXISTS `csbc_page_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csbc_page_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mapped_page` int(11) NOT NULL,
  `theme` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `rec_user` int(11) NOT NULL,
  `rec_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `page_map_unique` (`mapped_page`,`theme`),
  KEY `jbc_page_map_ibfk_2` (`position`),
  KEY `jbc_page_map_ibfk_5` (`rec_user`),
  KEY `jbc_page_map_ibfk_1` (`theme`),
  CONSTRAINT `csbc_page_map_ibfk_1` FOREIGN KEY (`theme`) REFERENCES `csbc_theme` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `csbc_page_map_ibfk_2` FOREIGN KEY (`position`) REFERENCES `csbc_position` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `csbc_page_map_ibfk_3` FOREIGN KEY (`mapped_page`) REFERENCES `csbc_page` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `csbc_page_map_ibfk_5` FOREIGN KEY (`rec_user`) REFERENCES `csbc_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csbc_page_map`
--

LOCK TABLES `csbc_page_map` WRITE;
/*!40000 ALTER TABLE `csbc_page_map` DISABLE KEYS */;
INSERT INTO `csbc_page_map` VALUES (1,5,1,2,25,'2020-10-29 11:48:00'),(3,20,5,4,25,'2020-10-29 11:49:00'),(4,19,6,4,25,'2020-10-29 11:50:00'),(5,17,6,5,25,'2020-10-29 11:50:00'),(6,18,5,5,25,'2020-10-29 11:51:00'),(7,26,5,3,25,'2020-10-29 11:51:00'),(8,23,6,3,25,'2020-10-29 11:51:00');
/*!40000 ALTER TABLE `csbc_page_map` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-20 15:39:20
