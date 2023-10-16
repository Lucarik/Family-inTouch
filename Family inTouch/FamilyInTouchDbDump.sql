-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: webdb
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `friends`
--

DROP TABLE IF EXISTS `friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friends` (
  `User_id` int NOT NULL,
  `Friend_id` int NOT NULL,
  PRIMARY KEY (`User_id`,`Friend_id`),
  KEY `Friend_id` (`Friend_id`),
  CONSTRAINT `friends_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `person` (`Id`),
  CONSTRAINT `friends_ibfk_2` FOREIGN KEY (`Friend_id`) REFERENCES `person` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friends`
--

LOCK TABLES `friends` WRITE;
/*!40000 ALTER TABLE `friends` DISABLE KEYS */;
INSERT INTO `friends` VALUES (5,4),(7,4),(4,5),(11,5),(4,7),(5,11);
/*!40000 ALTER TABLE `friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_chat`
--

DROP TABLE IF EXISTS `group_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_chat` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `User_id` int NOT NULL,
  `Group_id` int NOT NULL,
  `message` varchar(150) NOT NULL,
  `date_made` timestamp NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `User_id` (`User_id`),
  KEY `Group_id` (`Group_id`),
  CONSTRAINT `group_chat_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `person` (`Id`),
  CONSTRAINT `group_chat_ibfk_2` FOREIGN KEY (`Group_id`) REFERENCES `guild` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_chat`
--

LOCK TABLES `group_chat` WRITE;
/*!40000 ALTER TABLE `group_chat` DISABLE KEYS */;
INSERT INTO `group_chat` VALUES (1,4,2,'Hi guys, this is Qwerty. Nice meeting you all.','2021-04-22 06:37:18'),(2,4,2,'So how is everyone today?','2021-04-23 21:28:51'),(3,5,3,'Hi everyone','2021-05-10 16:30:06'),(4,11,4,'Hi I\'m Sam','2021-05-10 19:11:20'),(5,5,4,'Hi Sam','2021-05-10 19:14:10');
/*!40000 ALTER TABLE `group_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_users`
--

DROP TABLE IF EXISTS `group_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_users` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Group_id` int DEFAULT NULL,
  `Person_id` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Group_id` (`Group_id`,`Person_id`),
  KEY `Person_id` (`Person_id`),
  CONSTRAINT `group_users_ibfk_1` FOREIGN KEY (`Group_id`) REFERENCES `guild` (`Id`),
  CONSTRAINT `group_users_ibfk_2` FOREIGN KEY (`Person_id`) REFERENCES `person` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=286 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_users`
--

LOCK TABLES `group_users` WRITE;
/*!40000 ALTER TABLE `group_users` DISABLE KEYS */;
INSERT INTO `group_users` VALUES (1,1,6),(3,2,4),(284,4,11);
/*!40000 ALTER TABLE `group_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guild`
--

DROP TABLE IF EXISTS `guild`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guild` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Group_name` varchar(20) NOT NULL,
  `image_link` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guild`
--

LOCK TABLES `guild` WRITE;
/*!40000 ALTER TABLE `guild` DISABLE KEYS */;
INSERT INTO `guild` VALUES (1,'Bob Fam','group.png'),(2,'Qwerty Family','group.png'),(3,'Ch Family','group.png'),(4,'Sam Family','group.png');
/*!40000 ALTER TABLE `guild` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `Message_id` int NOT NULL AUTO_INCREMENT,
  `Sent_from` int NOT NULL,
  `Sent_to` int NOT NULL,
  `MessageContent` text,
  `Subject` varchar(30) DEFAULT NULL,
  `Date_made` timestamp NULL DEFAULT NULL,
  `Sent_from_username` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,4,5,'Hi Char, just saying hi this time. This is the first message of Family inTouch.','First Message','2021-04-27 07:00:59','qwerty'),(2,4,5,'Hi again. Just wanted to say hello for the second time.','Saying hello','2021-04-27 15:06:11','qwerty'),(3,5,6,'Hi, Bob.','Saying hello','2021-05-10 17:27:55','Charte'),(4,11,5,'Hi, I\'m new to the site.','Hi Char','2021-05-10 19:12:18','Sam');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pending_friends`
--

DROP TABLE IF EXISTS `pending_friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pending_friends` (
  `Requester_id` int NOT NULL,
  `Requestee_id` int NOT NULL,
  PRIMARY KEY (`Requester_id`,`Requestee_id`),
  KEY `Requestee_id` (`Requestee_id`),
  CONSTRAINT `pending_friends_ibfk_1` FOREIGN KEY (`Requester_id`) REFERENCES `person` (`Id`),
  CONSTRAINT `pending_friends_ibfk_2` FOREIGN KEY (`Requestee_id`) REFERENCES `person` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pending_friends`
--

LOCK TABLES `pending_friends` WRITE;
/*!40000 ALTER TABLE `pending_friends` DISABLE KEYS */;
INSERT INTO `pending_friends` VALUES (4,6);
/*!40000 ALTER TABLE `pending_friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pending_groups`
--

DROP TABLE IF EXISTS `pending_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pending_groups` (
  `Group_id` int NOT NULL,
  `User_id` int DEFAULT NULL,
  PRIMARY KEY (`Group_id`),
  KEY `User_id` (`User_id`),
  CONSTRAINT `pending_groups_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `person` (`Id`),
  CONSTRAINT `pending_groups_ibfk_2` FOREIGN KEY (`Group_id`) REFERENCES `guild` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pending_groups`
--

LOCK TABLES `pending_groups` WRITE;
/*!40000 ALTER TABLE `pending_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `pending_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Fname` varchar(15) NOT NULL,
  `Lname` varchar(15) NOT NULL,
  `Username` varchar(10) NOT NULL,
  `Password` varchar(128) DEFAULT NULL,
  `Email` varchar(20) NOT NULL,
  `Birthday` date NOT NULL,
  `image_link` varchar(30) DEFAULT NULL,
  `Pmessage` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'Justin','Sterling','Lucarik','justin117','test@gmail.com','1998-03-01',NULL,'Personal message not set by user'),(4,'Qwerty','Nosn','qwerty','$argon2id$v=19$m=65536,t=4,p=1$SHMxdjFQaGI2bmhFa3dvSg$j1F7878up14eX0BPO1scvqJxRuLKgKxSgzQf8HzVn3k','qwerty@gmail.com','2000-01-01','user.png','Personal message not set by user'),(5,'Charlotte','Sandra','Charte','$argon2id$v=19$m=65536,t=4,p=1$a1BEajBYeHFFQzhtM0VnVQ$Qq6eu1BYcgkd9GXYwa+EyZdUBNIZCbLEflD1DYzUV3E','char456@gmail.com','2002-03-24','default-user-icon.jpg','Hi I\'m Sandra. Nice to meet everyone visiting my profile'),(6,'Bob','Robinson','Bobson','$argon2id$v=19$m=65536,t=4,p=1$RnpucFMzR0ZzSElBTWVqUw$cqtausgVh/tz93CY71GwNbYJJASNyETp/TBjpi2LnlY','bob789@gmail.com','1991-10-30','default-user-icon.jpg','Personal message not set by user'),(7,'Parry','Mellow','Parmello','$argon2id$v=19$m=65536,t=4,p=1$dDFiQkJ3VDcxTW8wSms4aQ$/ipS9ad4qOHVbNyFzDTXfadius47/xkLbIWzuPeF8dA','parry789@gmail.com','2001-02-21','default-user-icon.jpg','Personal message not set by user'),(11,'Samual','Robb','Sam','$argon2id$v=19$m=65536,t=4,p=1$LkRYektGUlo5MlZVcTMzLw$lRWaobQWbYswRAjNVgbQectYOBWkokR3h6p0qo1Dakc','sam@gmail.com','2000-01-18','default-user-icon.jpg','Hi everyone I\'m Sam');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-11  0:41:49
