-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: localhost    Database: treenity
-- ------------------------------------------------------
-- Server version	8.0.40-0ubuntu0.24.04.1

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
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `number` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `date` datetime(6) NOT NULL,
  `love` int NOT NULL,
  `photo` varchar(255) NOT NULL,
  `price` int NOT NULL,
  `reply` varchar(255) DEFAULT NULL,
  `text` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `trash` datetime(6) NOT NULL,
  `why` varchar(255) NOT NULL,
  `member_id` varchar(255) NOT NULL,
  PRIMARY KEY (`number`),
  KEY `FKsds8ox89wwf6aihinar49rmfy` (`member_id`),
  CONSTRAINT `FKsds8ox89wwf6aihinar49rmfy` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bookmark`
--

DROP TABLE IF EXISTS `bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookmark` (
  `number` varchar(255) NOT NULL,
  `time` datetime(6) NOT NULL,
  `bk_number_id` varchar(255) NOT NULL,
  `member_id` varchar(255) NOT NULL,
  `tp_number_id` varchar(255) NOT NULL,
  PRIMARY KEY (`number`),
  KEY `FK5bm7rup91j277mc7gg63akie2` (`member_id`),
  KEY `FK5st4ivgwh56q7k9nkwit5cm9g` (`bk_number_id`),
  KEY `FK38hxvqipeom8bfsuaukwq0tqt` (`tp_number_id`),
  CONSTRAINT `FK38hxvqipeom8bfsuaukwq0tqt` FOREIGN KEY (`tp_number_id`) REFERENCES `plant` (`number`),
  CONSTRAINT `FK5bm7rup91j277mc7gg63akie2` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`),
  CONSTRAINT `FK5st4ivgwh56q7k9nkwit5cm9g` FOREIGN KEY (`bk_number_id`) REFERENCES `plant` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat` (
  `number` varchar(255) NOT NULL,
  `detail` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `time` datetime(6) NOT NULL,
  `bd_number_id` varchar(255) NOT NULL,
  `member_id` varchar(255) NOT NULL,
  `wr_number_id` varchar(255) NOT NULL,
  PRIMARY KEY (`number`),
  KEY `FKgvc5hrt0h18xk63qosss3ti30` (`member_id`),
  KEY `FKsou9xy5x5xdnm9mgdnk8t76ey` (`bd_number_id`),
  KEY `FKd66iu7ltctbwvesb60iir3182` (`wr_number_id`),
  CONSTRAINT `FKd66iu7ltctbwvesb60iir3182` FOREIGN KEY (`wr_number_id`) REFERENCES `board` (`number`),
  CONSTRAINT `FKgvc5hrt0h18xk63qosss3ti30` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`),
  CONSTRAINT `FKsou9xy5x5xdnm9mgdnk8t76ey` FOREIGN KEY (`bd_number_id`) REFERENCES `board` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grow`
--

DROP TABLE IF EXISTS `grow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grow` (
  `number` varchar(255) NOT NULL,
  `alam` int DEFAULT NULL,
  `category` varchar(255) NOT NULL,
  `date` datetime(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `water` int NOT NULL,
  `bk_number_id` varchar(255) NOT NULL,
  `number_id` varchar(255) NOT NULL,
  `tp_number_id` varchar(255) NOT NULL,
  PRIMARY KEY (`number`),
  KEY `FK3cywb0dro9enbwhti56o8bwqa` (`number_id`),
  KEY `FKj9j1qwr0q6e1hvpfgpbumtbjo` (`bk_number_id`),
  KEY `FKfiby6t1we8hxveodau6op9ofa` (`tp_number_id`),
  CONSTRAINT `FK3cywb0dro9enbwhti56o8bwqa` FOREIGN KEY (`number_id`) REFERENCES `member` (`member_id`),
  CONSTRAINT `FKfiby6t1we8hxveodau6op9ofa` FOREIGN KEY (`tp_number_id`) REFERENCES `plant` (`number`),
  CONSTRAINT `FKj9j1qwr0q6e1hvpfgpbumtbjo` FOREIGN KEY (`bk_number_id`) REFERENCES `plant` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `member_id` varchar(255) NOT NULL,
  `admin` int NOT NULL,
  `birthday` varchar(255) NOT NULL,
  `date` datetime(6) NOT NULL,
  `email` varchar(255) NOT NULL,
  `gps` int NOT NULL,
  `gps1` int NOT NULL,
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `person` int NOT NULL,
  `phone` varchar(255) NOT NULL,
  `pw` varchar(255) NOT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plant`
--

DROP TABLE IF EXISTS `plant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plant` (
  `number` varchar(255) NOT NULL,
  `environment` varchar(255) NOT NULL,
  `home` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `water` datetime(6) NOT NULL,
  `tp_number_id` varchar(255) NOT NULL,
  PRIMARY KEY (`number`),
  KEY `FK5ba2gjxfvl3sjht4vw52w6ou4` (`tp_number_id`),
  CONSTRAINT `FK5ba2gjxfvl3sjht4vw52w6ou4` FOREIGN KEY (`tp_number_id`) REFERENCES `plant_type` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plant_type`
--

DROP TABLE IF EXISTS `plant_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plant_type` (
  `number` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qa`
--

DROP TABLE IF EXISTS `qa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qa` (
  `number` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `complete_yn` int NOT NULL,
  `text` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `member_id` varchar(255) NOT NULL,
  PRIMARY KEY (`number`),
  KEY `FK3yfsns1k704srpq07qrylbrcn` (`member_id`),
  CONSTRAINT `FK3yfsns1k704srpq07qrylbrcn` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sos`
--

DROP TABLE IF EXISTS `sos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sos` (
  `number` varchar(255) NOT NULL,
  `date` datetime(6) NOT NULL,
  `text` varchar(255) NOT NULL,
  `bd_number_id` varchar(255) NOT NULL,
  `member_id` varchar(255) NOT NULL,
  `wr_number_id` varchar(255) NOT NULL,
  PRIMARY KEY (`number`),
  KEY `FK78fkgypwngqcm9wtmv8v5fet2` (`member_id`),
  KEY `FKmmy10srm26351fe7d9fb5gina` (`bd_number_id`),
  KEY `FK39t8gbuoj5a3m7fmbbfxckpbq` (`wr_number_id`),
  CONSTRAINT `FK39t8gbuoj5a3m7fmbbfxckpbq` FOREIGN KEY (`wr_number_id`) REFERENCES `board` (`number`),
  CONSTRAINT `FK78fkgypwngqcm9wtmv8v5fet2` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`),
  CONSTRAINT `FKmmy10srm26351fe7d9fb5gina` FOREIGN KEY (`bd_number_id`) REFERENCES `board` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `star`
--

DROP TABLE IF EXISTS `star`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `star` (
  `number` varchar(255) NOT NULL,
  `bd_number_id` varchar(255) NOT NULL,
  `member_id` varchar(255) NOT NULL,
  `wr_number_id` varchar(255) NOT NULL,
  PRIMARY KEY (`number`),
  KEY `FKppukvq3nd68siyltdnbj7l7fr` (`member_id`),
  KEY `FK22e2anehljwdjwuj5wiixs2mo` (`bd_number_id`),
  KEY `FK8yk5wklxm4cify9ms4hirc2jm` (`wr_number_id`),
  CONSTRAINT `FK22e2anehljwdjwuj5wiixs2mo` FOREIGN KEY (`bd_number_id`) REFERENCES `board` (`number`),
  CONSTRAINT `FK8yk5wklxm4cify9ms4hirc2jm` FOREIGN KEY (`wr_number_id`) REFERENCES `board` (`number`),
  CONSTRAINT `FKppukvq3nd68siyltdnbj7l7fr` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uuid`
--

DROP TABLE IF EXISTS `uuid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uuid` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-23 15:14:03
