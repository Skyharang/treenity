-- MySQL dump 10.13  Distrib 8.0.41, for Linux (x86_64)
--
-- Host: localhost    Database: treenity
-- ------------------------------------------------------
-- Server version	8.0.41-0ubuntu0.24.04.1

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
-- Table structure for table `Q&A`
--

DROP TABLE IF EXISTS `Q&A`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Q&A` (
  `qna_num` varchar(255) NOT NULL,
  `qna_title` varchar(255) NOT NULL,
  `qna_category` int NOT NULL DEFAULT (0),
  `qna_text` int NOT NULL DEFAULT (0),
  `complete_yn` tinyint NOT NULL DEFAULT '0',
  `member_num` varchar(255) NOT NULL,
  PRIMARY KEY (`qna_num`),
  KEY `member_num` (`member_num`),
  CONSTRAINT `member_num` FOREIGN KEY (`member_num`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `board_num` varchar(255) NOT NULL,
  `member_num` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `category` int NOT NULL DEFAULT (0),
  `deleted_at` datetime NOT NULL DEFAULT (0),
  `price` int DEFAULT (0),
  `likes` int DEFAULT (0),
  PRIMARY KEY (`board_num`),
  KEY `board_member_num` (`member_num`),
  CONSTRAINT `board_member_num` FOREIGN KEY (`member_num`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bookmark`
--

DROP TABLE IF EXISTS `bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookmark` (
  `bookmark_num` varchar(255) NOT NULL,
  `member_num` varchar(255) NOT NULL,
  `plant_num` varchar(255) NOT NULL,
  PRIMARY KEY (`bookmark_num`),
  KEY `bookmark_member_num` (`member_num`),
  KEY `bookmark_plant_num` (`plant_num`),
  CONSTRAINT `bookmark_member_num` FOREIGN KEY (`member_num`) REFERENCES `member` (`member_id`),
  CONSTRAINT `bookmark_plant_num` FOREIGN KEY (`plant_num`) REFERENCES `plant` (`plant_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat` (
  `room_num` varchar(255) NOT NULL,
  `board_num` varchar(255) NOT NULL,
  `member1` varchar(255) NOT NULL,
  `member2` varchar(255) NOT NULL,
  PRIMARY KEY (`room_num`),
  KEY `chat_board_num` (`board_num`),
  KEY `chat_member1` (`member1`),
  KEY `chat_member2` (`member2`),
  CONSTRAINT `chat_board_num` FOREIGN KEY (`board_num`) REFERENCES `board` (`board_num`),
  CONSTRAINT `chat_member1` FOREIGN KEY (`member1`) REFERENCES `member` (`member_id`),
  CONSTRAINT `chat_member2` FOREIGN KEY (`member2`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `comment_num` varchar(255) NOT NULL,
  `board_num` varchar(255) NOT NULL,
  `member_num` varchar(255) NOT NULL,
  `comment_text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`comment_num`),
  KEY `comment_board_num` (`board_num`),
  KEY `comment_member_num` (`member_num`),
  CONSTRAINT `comment_board_num` FOREIGN KEY (`board_num`) REFERENCES `board` (`board_num`),
  CONSTRAINT `comment_member_num` FOREIGN KEY (`member_num`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grow`
--

DROP TABLE IF EXISTS `grow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grow` (
  `grow_num` varchar(255) NOT NULL,
  `member_num` varchar(255) NOT NULL,
  `plant_num` varchar(255) NOT NULL,
  `nickname` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `started_at` date NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `water` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `alam` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`grow_num`),
  KEY `grow_member_num` (`member_num`),
  KEY `grow_plant_num` (`plant_num`),
  CONSTRAINT `grow_member_num` FOREIGN KEY (`member_num`) REFERENCES `member` (`member_id`),
  CONSTRAINT `grow_plant_num` FOREIGN KEY (`plant_num`) REFERENCES `plant` (`plant_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `member_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `birthday` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `user_type` tinyint NOT NULL DEFAULT '1',
  `signdate` date NOT NULL,
  `terms` tinyint NOT NULL DEFAULT '0',
  `latitude` int DEFAULT NULL,
  `longlatitude` int DEFAULT NULL,
  PRIMARY KEY (`member_id`) USING BTREE,
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pick`
--

DROP TABLE IF EXISTS `pick`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pick` (
  `pick_num` varchar(255) NOT NULL,
  `member_num` varchar(255) NOT NULL,
  `board_num` varchar(255) NOT NULL,
  PRIMARY KEY (`pick_num`),
  KEY `pick_member_num` (`member_num`),
  KEY `pick_board_num` (`board_num`),
  CONSTRAINT `pick_board_num` FOREIGN KEY (`board_num`) REFERENCES `board` (`board_num`),
  CONSTRAINT `pick_member_num` FOREIGN KEY (`member_num`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plant`
--

DROP TABLE IF EXISTS `plant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plant` (
  `plant_num` varchar(255) NOT NULL,
  `species_num` varchar(255) NOT NULL,
  `plant_name` varchar(255) NOT NULL,
  `explain` varchar(255) NOT NULL,
  `habitat` varchar(255) NOT NULL,
  `enviroment` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `cycle` varchar(255) NOT NULL,
  PRIMARY KEY (`plant_num`),
  KEY `plant_species_num` (`species_num`),
  CONSTRAINT `plant_species_num` FOREIGN KEY (`species_num`) REFERENCES `species` (`species_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report` (
  `report_num` varchar(255) NOT NULL,
  `board_num` varchar(255) NOT NULL,
  `member_num` varchar(255) NOT NULL,
  `report_text` varchar(255) NOT NULL,
  `reported_at` datetime NOT NULL,
  PRIMARY KEY (`report_num`),
  KEY `report_board_num` (`board_num`),
  KEY `report_member_num` (`member_num`),
  CONSTRAINT `report_board_num` FOREIGN KEY (`board_num`) REFERENCES `board` (`board_num`),
  CONSTRAINT `report_member_num` FOREIGN KEY (`member_num`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `species`
--

DROP TABLE IF EXISTS `species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `species` (
  `species_num` varchar(255) NOT NULL,
  `species_name` varchar(255) NOT NULL,
  PRIMARY KEY (`species_num`)
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

-- Dump completed on 2025-04-13 11:21:31
