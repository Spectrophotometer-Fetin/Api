-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: especto
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.22-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `url` text NOT NULL,
  `image` text NOT NULL,
  `createdAt` date DEFAULT NULL,
  `updatedAt` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,'Cortisol: o que é e como atua o hormônio do estresse?','https://www.cnnbrasil.com.br/saude/cortisol/','news1.jpg',NULL,NULL),(2,'O que é cortisol, hormônio do estresse que viralizou nas redes sociais','https://www1.folha.uol.com.br/equilibrio/2023/03/o-que-e-cortisol-hormonio-do-estresse-que-viralizou-nas-redes-sociais.shtml','news2.jpg',NULL,NULL);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `createdAt` date NOT NULL,
  `updatedAt` date NOT NULL,
  `name` text NOT NULL,
  `height` text DEFAULT NULL,
  `weight` text DEFAULT NULL,
  `age` text NOT NULL,
  `gender` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'joaozinho123@gmail.com','$2b$12$qdTmw838ZitD/AABSAVwq.RyEN.kc2ZsXieLI1M3kj5SjQ.Pg9jCW','2023-06-15','2023-06-15','Joãozinho',NULL,NULL,'',''),(9,'teste@teste.com','$2b$12$9WwZoRdPUZgFtjVHlroGWOZkfAQcxn1xO0Orcc8UBleXboz0vu4uK','2023-06-21','2023-09-24','Fetin','1,50','80','',''),(10,'jose@teste.com','$2b$12$kIkmdmANwBEbbnP9P.HwBO71cpdm1B0rMIMonmlXMoSs0UR7haIsK','2023-06-22','2023-06-22','José',NULL,NULL,'',''),(11,'paulinho@paulinho.com','$2b$12$kL93hey0PrT8rvRYawsoQOqUyqpX9omYXP/cxq1dYnMsjbfAfGouu','2023-06-22','2023-06-22','Paulinho',NULL,NULL,'',''),(12,'paulinho@paulinho2.com','$2b$12$4Ph0G286vk11AmuPycGbluMaUsJJR723CCMXM8LiQkSXwCKdqf7ku','2023-06-22','2023-06-22','joao',NULL,NULL,'',''),(13,'paulao@paulao.com','$2b$12$8Q2ZhIB.ygT.KTQx9B.wCeBoRJEiijbgdsxxGdY89oNyZdyMRIrNS','2023-06-22','2023-06-22','Paulao',NULL,NULL,'',''),(14,'mizal@mizal.com','$2b$12$RgcNQFrCqBfTL7qPVOut2uYB50fLM8Gm0s9mS6lT4VoXmcu28uQ.u','2023-06-22','2023-06-22','Mizal',NULL,NULL,'',''),(15,'roberto@bonaldo.com','$2b$12$agA28AR.Ejrxleanpq3EOOTI7QjkagxUMrvdCCqi/t.29q2Xd240C','2023-06-22','2023-06-22','roberto',NULL,NULL,'',''),(16,'teste@teste2.com','$2b$12$bwJKEHIpvaakjV95ogjwlubDTHQlppWgglcrKgoIf4.1eju24Bie2','2023-06-22','2023-06-22','teste2',NULL,NULL,'',''),(17,'teste12@teste.com','$2b$12$wDNptW7ZTLMht5hPQULAMe6xjd.phfGKePaXXWuTwOWwtoY38AYua','2023-08-19','2023-08-19','teste',NULL,NULL,'15','Masculino');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_historics`
--

DROP TABLE IF EXISTS `users_historics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_historics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `value` float NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=452 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_historics`
--

LOCK TABLES `users_historics` WRITE;
/*!40000 ALTER TABLE `users_historics` DISABLE KEYS */;
INSERT INTO `users_historics` VALUES (1,1,485,'2023-06-18 21:56:13','2023-06-18 21:56:13'),(2,1,261,'2023-06-18 21:56:27','2023-06-18 21:56:27'),(3,9,14,'2023-09-01 20:30:12','2023-06-21 20:30:12'),(4,9,18,'2023-09-02 20:31:45','2023-06-21 20:31:45'),(5,9,12,'2023-09-03 20:33:00','2023-09-21 20:33:00'),(6,9,8,'2023-09-04 20:33:07','2023-06-21 20:33:07'),(7,9,22.3,'2023-09-05 21:04:33','2023-06-21 21:04:33'),(8,9,23.7,'2023-09-13 21:05:10','2023-06-21 21:05:10'),(9,9,16.9,'2023-09-17 21:05:38','2023-06-21 21:05:38'),(10,9,6.4,'2023-09-20 04:37:51','2023-06-22 04:37:51'),(11,9,259,'2023-06-22 05:01:26','2023-06-22 05:01:26'),(12,9,400,'2023-06-23 13:46:02','2023-06-22 13:46:02'),(13,9,466,'2023-06-24 17:01:34','2023-06-22 17:01:34'),(14,9,100,'2023-06-25 17:01:35','2023-06-22 17:01:35'),(15,9,172,'2023-06-26 17:01:36','2023-06-22 17:01:36'),(16,10,551,'2023-06-22 17:14:42','2023-06-22 17:14:42'),(17,10,108,'2023-06-22 17:14:55','2023-06-22 17:14:55'),(18,11,58,'2023-06-22 17:19:15','2023-06-22 17:19:15'),(19,11,361,'2023-06-22 17:19:54','2023-06-22 17:19:54'),(20,11,135,'2023-06-22 17:20:44','2023-06-22 17:20:44'),(21,11,220,'2023-06-22 18:19:09','2023-06-22 18:19:09'),(22,9,386,'2023-06-22 18:42:26','2023-06-22 18:42:26'),(23,13,421,'2023-06-22 18:49:16','2023-06-22 18:49:16'),(24,13,318,'2023-06-22 18:49:45','2023-06-22 18:49:45'),(25,9,366,'2023-06-22 18:51:24','2023-06-22 18:51:24'),(26,9,19.4,'2023-09-21 18:51:31','2023-06-22 18:51:31'),(27,9,10.2,'2023-09-22 18:53:27','2023-06-22 18:53:27'),(28,9,17.5,'2023-09-25 18:54:16','2023-06-22 18:54:16'),(29,9,23.1,'2023-09-26 22:39:19','2023-06-22 22:39:19'),(30,14,274,'2023-06-22 22:46:50','2023-06-22 22:46:50'),(31,14,503,'2023-06-22 22:47:20','2023-06-22 22:47:20'),(32,14,597,'2023-06-22 22:48:02','2023-06-22 22:48:02'),(33,15,534,'2023-06-22 23:05:58','2023-06-22 23:05:58'),(34,15,423,'2023-06-22 23:06:16','2023-06-22 23:06:16'),(35,16,466,'2023-06-22 23:25:07','2023-06-22 23:25:07'),(36,16,445,'2023-06-22 23:25:41','2023-06-22 23:25:41'),(46,0,17,'2023-08-10 20:16:25','2023-08-10 20:16:25'),(47,0,28,'2023-08-10 20:19:42','2023-08-10 20:19:42'),(48,0,23,'2023-08-10 20:20:04','2023-08-10 20:20:04'),(49,0,25,'2023-08-10 20:20:22','2023-08-10 20:20:22'),(50,0,28,'2023-08-10 20:21:00','2023-08-10 20:21:00'),(315,9,19.5,'2023-09-28 21:56:01','2023-09-28 21:56:01'),(316,9,22.6,'2023-09-28 21:58:28','2023-09-28 21:58:28'),(317,9,14.3,'2023-09-28 22:05:47','2023-09-28 22:05:47'),(318,9,14.3,'2023-09-28 22:06:09','2023-09-28 22:06:09'),(319,9,16.5,'2023-09-28 22:07:06','2023-09-28 22:07:06'),(320,9,9.8,'2023-09-28 22:07:30','2023-09-28 22:07:30'),(321,9,9.8,'2023-09-28 22:07:35','2023-09-28 22:07:35'),(322,9,9.8,'2023-09-28 22:07:38','2023-09-28 22:07:38'),(323,9,10.8,'2023-09-28 22:07:47','2023-09-28 22:07:47'),(324,9,14.3,'2023-09-28 22:12:27','2023-09-28 22:12:27'),(325,9,16.5,'2023-09-28 22:14:08','2023-09-28 22:14:08'),(326,9,15.6,'2023-09-28 22:15:29','2023-09-28 22:15:29'),(327,9,15.6,'2023-09-28 22:16:01','2023-09-28 22:16:01'),(328,9,14.7,'2023-09-28 22:17:14','2023-09-28 22:17:14'),(329,9,15.6,'2023-09-28 22:18:07','2023-09-28 22:18:07'),(330,9,16.9,'2023-09-28 22:19:10','2023-09-28 22:19:10'),(331,9,17.4,'2023-09-28 22:20:02','2023-09-28 22:20:02'),(332,9,14.5,'2023-09-28 22:20:20','2023-09-28 22:20:20'),(333,9,20.6,'2023-09-28 22:25:13','2023-09-28 22:25:13'),(334,9,20.2,'2023-09-28 22:27:26','2023-09-28 22:27:26'),(335,9,20.2,'2023-09-28 22:28:33','2023-09-28 22:28:33'),(336,9,17.6,'2023-09-28 22:38:13','2023-09-28 22:38:13'),(337,9,50,'2023-09-28 22:42:43','2023-09-28 22:42:43'),(338,9,42,'2023-09-28 22:44:50','2023-09-28 22:44:50'),(339,9,-79.2,'2023-09-28 22:47:46','2023-09-28 22:47:46'),(340,9,3.4,'2023-09-28 22:48:08','2023-09-28 22:48:08'),(341,9,2.5,'2023-09-28 22:48:11','2023-09-28 22:48:11'),(342,9,14.3,'2023-09-28 22:48:21','2023-09-28 22:48:21'),(343,9,74,'2023-09-28 22:48:56','2023-09-28 22:48:56'),(344,9,2.1,'2023-09-28 22:49:08','2023-09-28 22:49:08'),(345,9,16.1,'2023-09-28 22:49:18','2023-09-28 22:49:18'),(346,9,0,'2023-09-28 23:14:40','2023-09-28 23:14:40'),(347,9,41.1,'2023-09-28 23:15:48','2023-09-28 23:15:48'),(348,9,-55.9,'2023-09-28 23:16:29','2023-09-28 23:16:29'),(349,9,-76.1,'2023-09-28 23:16:38','2023-09-28 23:16:38'),(350,9,23.9,'2023-09-28 23:16:49','2023-09-28 23:16:49'),(351,9,13.9,'2023-09-28 23:17:00','2023-09-28 23:17:00'),(352,9,14.3,'2023-09-28 23:17:16','2023-09-28 23:17:16'),(353,9,38.4,'2023-09-28 23:22:57','2023-09-28 23:22:57'),(354,9,16.9,'2023-09-28 23:33:03','2023-09-28 23:33:03'),(355,9,42.4,'2023-09-28 23:33:42','2023-09-28 23:33:42'),(356,9,22.2,'2023-09-28 23:33:52','2023-09-28 23:33:52'),(357,9,45,'2023-09-28 23:33:58','2023-09-28 23:33:58'),(358,9,45.5,'2023-09-28 23:34:02','2023-09-28 23:34:02'),(359,9,16.8,'2023-09-28 23:34:16','2023-09-28 23:34:16'),(360,9,17.7,'2023-09-28 23:34:25','2023-09-28 23:34:25'),(361,9,18.1,'2023-09-28 23:34:38','2023-09-28 23:34:38'),(362,9,20.3,'2023-09-28 23:34:49','2023-09-28 23:34:49'),(363,9,19,'2023-09-28 23:35:02','2023-09-28 23:35:02'),(364,9,19.9,'2023-09-28 23:35:29','2023-09-28 23:35:29'),(365,9,21.6,'2023-09-28 23:35:51','2023-09-28 23:35:51'),(366,9,18.5,'2023-09-28 23:42:00','2023-09-28 23:42:00'),(367,9,22.9,'2023-09-28 23:44:32','2023-09-28 23:44:32'),(368,9,22.9,'2023-09-28 23:44:36','2023-09-28 23:44:36'),(369,9,22.9,'2023-09-28 23:44:44','2023-09-28 23:44:44'),(370,9,22.9,'2023-09-28 23:48:26','2023-09-28 23:48:26'),(371,9,24.2,'2023-09-28 23:50:00','2023-09-28 23:50:00'),(372,9,9.7,'2023-09-28 23:50:16','2023-09-28 23:50:16'),(373,9,10.7,'2023-09-28 23:50:26','2023-09-28 23:50:26'),(374,9,14.2,'2023-09-28 23:57:52','2023-09-28 23:57:52'),(375,9,16.8,'2023-09-29 00:03:19','2023-09-29 00:03:19'),(376,9,12.4,'2023-09-29 00:10:24','2023-09-29 00:10:24'),(377,9,26.9,'2023-09-29 00:13:04','2023-09-29 00:13:04'),(378,9,28.7,'2023-09-29 00:26:44','2023-09-29 00:26:44'),(379,9,19.9,'2023-09-29 00:26:53','2023-09-29 00:26:53'),(380,9,10.7,'2023-09-29 00:27:07','2023-09-29 00:27:07'),(381,9,10.7,'2023-09-29 00:28:12','2023-09-29 00:28:12'),(382,9,12.9,'2023-09-29 00:29:35','2023-09-29 00:29:35'),(383,9,11.1,'2023-09-29 00:33:46','2023-09-29 00:33:46'),(384,9,10.7,'2023-09-29 00:36:50','2023-09-29 00:36:50'),(385,9,10.7,'2023-09-29 00:37:52','2023-09-29 00:37:52'),(386,9,10.7,'2023-09-29 00:38:36','2023-09-29 00:38:36'),(387,9,10.2,'2023-09-29 00:40:35','2023-09-29 00:40:35'),(388,9,10.2,'2023-09-29 00:41:32','2023-09-29 00:41:32'),(389,9,10.2,'2023-09-29 00:45:55','2023-09-29 00:45:55'),(390,9,22.2,'2023-09-29 00:46:06','2023-09-29 00:46:06'),(391,9,29.8,'2023-09-29 00:46:16','2023-09-29 00:46:16'),(392,9,33.3,'2023-09-29 00:48:17','2023-09-29 00:48:17'),(393,9,31.6,'2023-09-29 00:48:58','2023-09-29 00:48:58'),(394,9,0,'2023-09-29 20:38:08','2023-09-29 20:38:08'),(395,9,17.1,'2023-09-29 21:09:45','2023-09-29 21:09:45'),(396,9,24.1,'2023-09-29 21:09:52','2023-09-29 21:09:52'),(397,9,-6.2,'2023-09-29 21:10:35','2023-09-29 21:10:35'),(398,9,-5.3,'2023-09-29 21:10:42','2023-09-29 21:10:42'),(399,9,-5.6,'2023-09-29 21:11:06','2023-09-29 21:11:06'),(400,9,15.7,'2023-09-29 21:11:22','2023-09-29 21:11:22'),(401,9,15.7,'2023-09-29 21:11:29','2023-09-29 21:11:29'),(402,9,17.5,'2023-09-29 21:12:02','2023-09-29 21:12:02'),(403,9,19.2,'2023-09-29 21:12:57','2023-09-29 21:12:57'),(404,9,27.1,'2023-09-29 21:14:26','2023-09-29 21:14:26'),(405,9,38.1,'2023-09-29 21:17:25','2023-09-29 21:17:25'),(406,9,28.2,'2023-09-29 21:23:28','2023-09-29 21:23:28'),(407,9,28.2,'2023-09-29 21:23:36','2023-09-29 21:23:36'),(408,9,29.1,'2023-09-29 21:24:16','2023-09-29 21:24:16'),(409,9,30,'2023-09-29 21:27:04','2023-09-29 21:27:04'),(410,9,18.5,'2023-09-29 21:31:14','2023-09-29 21:31:14'),(411,9,21.6,'2023-09-29 21:32:47','2023-09-29 21:32:47'),(412,9,21.2,'2023-09-29 21:33:09','2023-09-29 21:33:09'),(413,9,22.1,'2023-09-29 21:33:19','2023-09-29 21:33:19'),(414,9,22.5,'2023-09-29 21:33:22','2023-09-29 21:33:22'),(415,9,11.6,'2023-09-29 21:34:13','2023-09-29 21:34:13'),(416,9,11.6,'2023-09-29 21:34:18','2023-09-29 21:34:18'),(417,9,11.6,'2023-09-29 21:34:38','2023-09-29 21:34:38'),(418,9,12.1,'2023-09-29 21:34:49','2023-09-29 21:34:49'),(419,9,11.1,'2023-09-29 21:35:02','2023-09-29 21:35:02'),(420,9,12.4,'2023-09-29 21:37:22','2023-09-29 21:37:22'),(421,9,10.1,'2023-09-29 21:38:35','2023-09-29 21:38:35'),(422,9,19.7,'2023-09-29 21:42:51','2023-09-29 21:42:51'),(423,9,15.3,'2023-09-29 21:43:36','2023-09-29 21:43:36'),(424,9,16.6,'2023-09-29 21:44:24','2023-09-29 21:44:24'),(425,9,16.6,'2023-09-29 21:44:37','2023-09-29 21:44:37'),(426,9,16.6,'2023-09-29 21:44:42','2023-09-29 21:44:42'),(427,9,17.5,'2023-09-29 21:44:45','2023-09-29 21:44:45'),(428,9,13.8,'2023-09-29 21:45:25','2023-09-29 21:45:25'),(429,9,12.1,'2023-09-29 21:45:59','2023-09-29 21:45:59'),(430,9,12.1,'2023-09-29 21:46:42','2023-09-29 21:46:42'),(431,9,12.9,'2023-09-29 21:47:11','2023-09-29 21:47:11'),(432,9,12.9,'2023-09-29 21:52:22','2023-09-29 21:52:22'),(433,9,11.6,'2023-09-29 21:57:07','2023-09-29 21:57:07'),(434,9,13.4,'2023-09-29 21:58:30','2023-09-29 21:58:30'),(435,9,12.4,'2023-09-29 21:58:44','2023-09-29 21:58:44'),(436,9,0,'2023-09-29 22:08:38','2023-09-29 22:08:38'),(437,9,0,'2023-09-29 22:09:00','2023-09-29 22:09:00'),(438,9,17.2,'2023-09-29 22:09:43','2023-09-29 22:09:43'),(439,9,29.5,'2023-09-29 22:10:21','2023-09-29 22:10:21'),(440,9,15.1,'2023-09-29 22:14:03','2023-09-29 22:14:03'),(441,9,26.5,'2023-09-29 22:19:47','2023-09-29 22:19:47'),(442,9,26.5,'2023-09-29 22:21:18','2023-09-29 22:21:18'),(443,9,13,'2023-09-29 22:26:57','2023-09-29 22:26:57'),(444,9,23.5,'2023-09-29 22:31:35','2023-09-29 22:31:35'),(445,9,24.4,'2023-09-29 22:33:07','2023-09-29 22:33:07'),(446,9,9.4,'2023-09-29 22:37:43','2023-09-29 22:37:43'),(447,9,9,'2023-09-29 22:39:54','2023-09-29 22:39:54'),(448,9,24.1,'2023-09-29 22:41:41','2023-09-29 22:41:41'),(449,9,10.4,'2023-09-29 22:48:05','2023-09-29 22:48:05'),(450,9,10.4,'2023-09-29 22:50:06','2023-09-29 22:50:06'),(451,9,24.5,'2023-09-29 22:51:14','2023-09-29 22:51:14');
/*!40000 ALTER TABLE `users_historics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'especto'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-23 17:03:04
