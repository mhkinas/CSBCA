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
-- Table structure for table `csbc_code`
--

DROP TABLE IF EXISTS `csbc_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csbc_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_name` varchar(150) NOT NULL,
  `adr_path` int(11) NOT NULL,
  `code_data` mediumtext,
  `code_type` int(11) NOT NULL,
  `rec_user` int(11) NOT NULL,
  `rec_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_unique` (`code_name`),
  KEY `jbc_code_ibfk_1` (`adr_path`),
  KEY `jbc_code_ibfk_2` (`rec_user`),
  KEY `jbc_code_ibfk_3` (`code_type`),
  CONSTRAINT `csbc_code_ibfk_1` FOREIGN KEY (`adr_path`) REFERENCES `csbc_path` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `csbc_code_ibfk_2` FOREIGN KEY (`rec_user`) REFERENCES `csbc_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `csbc_code_ibfk_3` FOREIGN KEY (`code_type`) REFERENCES `csbc_code_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csbc_code`
--

LOCK TABLES `csbc_code` WRITE;
/*!40000 ALTER TABLE `csbc_code` DISABLE KEYS */;
INSERT INTO `csbc_code` VALUES (6,'back-warn',2,'history.pushState(null, null, location.href);\r\n    window.onpopstate = function () {\r\n        history.go(1);\r\n    };',1,25,'2020-10-28 17:02:00'),(7,'modal-width-90',2,'\r\n	.modal-dialog.modal-custom \r\n	{\r\n		max-width: 90%;\r\n	}\r\n	\r\n	\r\n\r\n',2,25,'2020-10-28 17:03:00');
/*!40000 ALTER TABLE `csbc_code` ENABLE KEYS */;
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
