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
-- Table structure for table `csbc_user`
--

DROP TABLE IF EXISTS `csbc_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csbc_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(150) NOT NULL,
  `user_code` varchar(30) NOT NULL,
  `user_psw` varchar(300) DEFAULT NULL,
  `user_group` int(11) NOT NULL DEFAULT '15',
  `e_mail` varchar(150) DEFAULT NULL,
  `rec_status` int(11) NOT NULL DEFAULT '3',
  `page_size` int(11) NOT NULL DEFAULT '10',
  `rec_user` int(11) DEFAULT NULL,
  `rec_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`user_code`),
  KEY `jbc_user_ibfk_2` (`rec_status`),
  KEY `jbc_user_ibfk_1` (`user_group`),
  CONSTRAINT `csbc_user_ibfk_1` FOREIGN KEY (`user_group`) REFERENCES `csbc_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `csbc_user_ibfk_2` FOREIGN KEY (`rec_status`) REFERENCES `csbc_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csbc_user`
--

LOCK TABLES `csbc_user` WRITE;
/*!40000 ALTER TABLE `csbc_user` DISABLE KEYS */;
INSERT INTO `csbc_user` VALUES (25,'Hayati KINAŞ','hayati','5b0Rdv/v8k5wFGoDZdCHEE73f7GKT1wjIXH8VY+vj2M=',14,'tst@test.com',3,100,26,'2020-09-24 16:27:00'),(26,'deneme01','dnm01','+KXDxt6hVCnXDzh/MW8KE60ZUSSdbvj5Ne5r2ds9SPo=',25,'tst@test.com',3,50,25,'2020-10-17 23:09:00'),(27,'deneme02','dnm02','5b0Rdv/v8k5wFGoDZdCHEE73f7GKT1wjIXH8VY+vj2M=',14,'tst@test.com',3,50,25,'2020-09-25 17:22:00'),(28,'deneme03','dnm03','/Wa1mnZY5uBgPnwZLz806vcsRBOxvMA4aQvOMcOZdAk=',26,'tst@test.com',3,10,25,'2020-10-21 15:17:00');
/*!40000 ALTER TABLE `csbc_user` ENABLE KEYS */;
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
