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
-- Table structure for table `csbc_page_link`
--

DROP TABLE IF EXISTS `csbc_page_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csbc_page_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link_name` varchar(150) NOT NULL,
  `adr_path` int(11) NOT NULL,
  `linked_page` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `theme` int(11) NOT NULL,
  `rec_user` int(11) NOT NULL,
  `rec_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `page_link_unique` (`link_name`),
  KEY `fk_page_link_user` (`rec_user`),
  KEY `fk_page_link_page` (`linked_page`),
  KEY `jbc_page_link_ibfk_4` (`position`),
  KEY `adr_path_index` (`adr_path`),
  KEY `fk_page_link_theme` (`theme`),
  CONSTRAINT `csbc_page_link_ibfk_2` FOREIGN KEY (`adr_path`) REFERENCES `csbc_path` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csbc_page_link`
--

LOCK TABLES `csbc_page_link` WRITE;
/*!40000 ALTER TABLE `csbc_page_link` DISABLE KEYS */;
INSERT INTO `csbc_page_link` VALUES (1,'deneme01',5,10,1,1,25,'2020-10-29 10:31:00'),(2,'deneme03',5,9,1,2,25,'2020-10-29 10:32:00'),(3,'about',8,24,1,6,25,'2020-10-29 10:43:00'),(4,'experience',8,25,1,6,25,'2020-10-29 10:45:00'),(5,'expertise',8,27,1,6,25,'2020-10-29 10:46:00'),(6,'hakkinda',8,28,1,5,25,'2020-10-29 10:46:00'),(7,'kimdir',8,29,1,5,25,'2020-10-29 11:12:00'),(8,'tecrubeler',8,30,1,5,25,'2020-10-29 11:15:00'),(9,'uzmanlik',8,31,1,5,25,'2020-10-29 11:16:00'),(10,'whois',8,32,1,6,25,'2020-10-29 11:17:00'),(11,'blog-tr',9,34,1,5,25,'2020-10-29 11:19:00'),(12,'blog',9,33,1,6,25,'2020-10-29 11:19:00'),(13,'frontside',9,35,1,6,25,'2020-10-29 11:26:00'),(14,'onyuz',9,40,1,5,25,'2020-10-29 11:27:00'),(15,'jbca-sablon',9,36,1,5,25,'2020-10-29 11:29:00'),(16,'jbca-template',9,37,1,6,25,'2020-10-29 11:31:00'),(17,'jbca-website-tr',9,39,1,5,25,'2020-10-29 11:32:00'),(18,'jbca-website-en',9,38,1,6,25,'2020-10-29 11:32:00'),(19,'contact',10,41,1,6,25,'2020-10-29 11:34:00'),(20,'iletisim',10,42,1,5,25,'2020-10-29 11:39:00'),(21,'consultancy',12,43,1,6,25,'2020-10-29 11:40:00'),(22,'danismanlik',12,44,1,5,25,'2020-10-29 11:41:00'),(23,'database',12,45,1,6,25,'2020-10-29 11:41:00'),(24,'entegrasyon',12,46,1,5,25,'2020-10-29 11:42:00'),(25,'hizmetler',12,47,1,5,25,'2020-10-29 11:42:00'),(26,'integration',12,48,1,6,25,'2020-10-29 11:44:00'),(27,'services',12,49,1,6,25,'2020-10-29 11:45:00'),(28,'sistem',12,50,1,5,25,'2020-10-29 11:46:00'),(29,'software',12,51,1,6,25,'2020-10-29 11:46:00'),(30,'system',12,52,1,6,25,'2020-10-29 11:47:00'),(31,'yazilim',12,54,1,5,25,'2020-10-29 11:47:00'),(32,'veritabani',12,53,1,5,25,'2020-10-29 11:47:00');
/*!40000 ALTER TABLE `csbc_page_link` ENABLE KEYS */;
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
