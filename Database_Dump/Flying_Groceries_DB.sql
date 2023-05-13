CREATE DATABASE  IF NOT EXISTS `flying_groceries` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `flying_groceries`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: flying_groceries
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `appadmin`
--

DROP TABLE IF EXISTS `appadmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appadmin` (
  `AdminId` bigint NOT NULL AUTO_INCREMENT,
  `Username` varchar(50) NOT NULL,
  `UserPassword` varchar(100) NOT NULL,
  `User_FirstName` varchar(100) NOT NULL,
  `User_MiddleName` varchar(100) DEFAULT NULL,
  `User_LastName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`AdminId`),
  UNIQUE KEY `AdminId` (`AdminId`),
  UNIQUE KEY `Username` (`Username`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appadmin`
--

LOCK TABLES `appadmin` WRITE;
/*!40000 ALTER TABLE `appadmin` DISABLE KEYS */;
INSERT INTO `appadmin` VALUES (1,'Shivesh21286','Shivesh86','Shivesh',NULL,NULL),(2,'Shantanu21285','Shantanu85','Shantanu',NULL,NULL),(3,'Alien21287','Shfsfsdf','Alien',NULL,NULL),(4,'SuperAdmin21288','Shdjhsj','SuperAdmin',NULL,NULL),(5,'Admin21289','Shivfsdf','Admin',NULL,NULL),(6,'Hello','123','MYUser',NULL,NULL),(7,'TestUser','123456','MYUser',NULL,NULL),(12,'MainAdmin','Main@Admin','Hello','My','World');
/*!40000 ALTER TABLE `appadmin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appusers_useraccounts`
--

DROP TABLE IF EXISTS `appusers_useraccounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appusers_useraccounts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `role` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appusers_useraccounts`
--

LOCK TABLES `appusers_useraccounts` WRITE;
/*!40000 ALTER TABLE `appusers_useraccounts` DISABLE KEYS */;
INSERT INTO `appusers_useraccounts` VALUES (1,'pbkdf2_sha256$390000$OYDejQtfB0saOMYWqw2dDW$YioH15jC7gtMYqSEVSNaVfgKLQcS9xfnyO20Ladr3Z0=',NULL,1,'Shivesh','','','',1,1,'2023-04-05 14:23:02.130386','ADMIN'),(2,'pbkdf2_sha256$390000$X65mSAEmrZE1L1VgAUGJYk$NYBzGtdK0L+JkCE/1OlCLu2H0kqJCDD3kj505/zXE3E=',NULL,0,'Hello World','','','',0,1,'2023-04-05 14:27:55.598729','TRANSPORTER'),(3,'pbkdf2_sha256$390000$5hC5OH4RA2a7hOC0y7873r$J67wkU37snBq9ZvZ2BXhBeY+WWBQHBYc8YEwftCs+kE=',NULL,0,'Goku ','','','',0,1,'2023-04-05 16:01:28.955920','ADMIN'),(4,'pbkdf2_sha256$390000$jiPx9GpRYfD1JI0XwTLdC1$yQjSS9rUxcbI1Mw6ltLWCqXHQS9zpHJwr3vvn+sRWr4=',NULL,0,'Test_Customer','','','',0,1,'2023-04-07 19:34:41.616809','CUSTOMER'),(9,'pbkdf2_sha256$390000$j4MVLDCKbtidO0MntqzFb4$HsAbQOIqlQLhyW9a4q3p8agFIw5LtVpzAeuHBRGQkZ4=',NULL,0,'Hello213','','','',0,1,'2023-04-07 19:41:19.351643','CUSTOMER'),(11,'pbkdf2_sha256$390000$kaazah784fqean8eDlVrTn$IcSPsHZH257X2VhZN4h10qaTr/dAVu0rF6lta4V+3xQ=',NULL,0,'Hello222','','','',0,1,'2023-04-07 19:41:51.232496','CUSTOMER'),(12,'pbkdf2_sha256$390000$kugM9doG2PG43SEPUsOUal$uPSdPeJ1gYd5sFDttXQWa2Jp8dbYI8VpGlDY4KGaI0U=',NULL,0,'123','','','',0,1,'2023-04-07 19:43:55.246200','CUSTOMER'),(17,'pbkdf2_sha256$390000$Invs4yutQHnz7yAanL4zlu$Bj8utNnWkLQVi4M/+qTZOUC60G/0OjLUTdzk5415TvQ=',NULL,0,'Best','','','',0,1,'2023-04-07 19:46:28.087629','CUSTOMER'),(22,'pbkdf2_sha256$390000$SrzSwRFRYjOrp62Ao59NEP$/OlG7v/c9mhU560mcBsoyde+MbjwMKPA42kjqu434jg=',NULL,0,'Kakulukiya','','','',0,1,'2023-04-07 19:50:56.861297','CUSTOMER'),(24,'pbkdf2_sha256$390000$InIEm1y2wHfxrlKEjCV9Zw$tFpyFR5TjRyTOblbMQ6MQcCq3vjxcf2sCzva/5gW9s8=',NULL,0,'Kaku','','','',0,1,'2023-04-07 19:51:32.099500','CUSTOMER'),(26,'pbkdf2_sha256$390000$Thb9Mmtt71dMJ0SnBeXUll$FQmJEXsopwIY4Cm0k5CdXPUx5U2uWVSEyqrEiTyTKB4=',NULL,0,'bale','','','',0,1,'2023-04-07 19:55:40.493866','CUSTOMER'),(28,'pbkdf2_sha256$390000$1CFWhogfk1GgmNt6WWnZdr$q8d1IFNbxdG0apT5NnQbSGiXtz6E1mfeVlqvAuY5P7M=',NULL,0,'bale123','','','',0,1,'2023-04-07 20:02:49.251308','CUSTOMER'),(30,'pbkdf2_sha256$390000$z5Bryh4UVdbBT2GgRakdQq$+GKffWN3Ev5Z5NNPwzlnyYr2U/DIrT/PZlMSU2VhPDk=',NULL,0,'bale456','','','',0,1,'2023-04-07 20:05:11.675527','CUSTOMER'),(32,'pbkdf2_sha256$390000$s27GDQmsMaGGsSx2jwDJZM$ZY6uN51zGru7jGi+8D4tXwmWlZAl+mQY+xRox9UPCVg=',NULL,0,'bale789','','','',0,1,'2023-04-07 20:07:13.598333','CUSTOMER'),(33,'pbkdf2_sha256$390000$4aU10UU3FVB5wiaeK5SsaL$s4NTNeVS951A9ltD0MdfSKKEwZ6w1pMtidz9xd0Wk3I=',NULL,0,'metidoN1','','','',0,1,'2023-04-08 17:51:42.910096','CUSTOMER'),(34,'pbkdf2_sha256$390000$n9UsTgA1cvLv0gBRZVKMdN$xwTlCgO1uAY3oCjY0afN/kHKK+F7A4OA5C6k10qYSj8=',NULL,0,'MTC','','','',0,1,'2023-04-08 20:33:12.588145','CUSTOMER'),(35,'pbkdf2_sha256$390000$Rjy8BPfqdoSQQ9ZpPsgS4x$zF0hsYjobcScpEpCDByh+Ss8gclZUox62PwgxrA16kw=',NULL,0,'LH','','','',0,1,'2023-04-08 20:37:08.295601','CUSTOMER'),(40,'!zKE4Rkg4eIlCnjbKRrb0RcyNT65rifIOuf0bKPy6',NULL,0,'TestAdmin','','','TestAdmin',0,1,'2023-04-09 13:31:00.664237','ADMIN'),(41,'pbkdf2_sha256$390000$jpltFtTekVT4FTjoArrZrm$PwHD9aRg7O+KV7zFJePQql7aMGErvZkDEYM/lXhtwc8=',NULL,1,'TestHello','','','',1,1,'2023-04-09 13:38:06.768076','ADMIN'),(46,'pbkdf2_sha256$390000$o8oKFMfToKf4h4sgvL6879$Uipq2FBNCIH6LB4wvW/BdExfCDrlz7plZ5RAMrvUzGs=',NULL,0,'MainAdmin','','','',0,1,'2023-04-10 10:51:23.014929','ADMIN'),(47,'pbkdf2_sha256$390000$6tQydlHbfMDVgmd60wwz6w$ryszYG2ywqrzNRmpKReuWefmpvW3dg5Zv0jFNpypNz4=',NULL,0,'TestTransporter','','','',0,1,'2023-04-19 15:25:51.928544','TRANSPORTER'),(78,'pbkdf2_sha256$390000$d9JaY9P9qcH3oyGxxonvAW$/DBAzmPMn/Oa2Be1QLiQEzZ+Rx5k1dws8RKfnUSmRcc=',NULL,0,'Sahil124','','','',0,1,'2023-04-19 20:00:59.295975','TRANSPORTER'),(79,'pbkdf2_sha256$390000$R5WNuBfQCFOiwXywnpnGUU$bOutBp9m9VT8BbJQ/KaVXfxrjX/YdvlTBO59h90h8yM=',NULL,0,'urs5ta1ke1q','','','',0,1,'2023-04-19 23:31:30.787494','TRANSPORTER'),(83,'pbkdf2_sha256$390000$GvBfUEMgZtsprPxTlojE20$aMCaTL8mG/bNKTBfr6TKCRI+wRw6Osi6wrtYZ2SSVV8=',NULL,0,'DH','','','',0,1,'2023-04-20 13:18:04.165905','CUSTOMER'),(84,'pbkdf2_sha256$390000$dZqpGpcM3jKyzLUncmERdY$FBdSuwt1oJIRqdNK03FEWc2EmqZFoZXaviJ49VFe5C0=',NULL,0,'TestUser@123','','','',0,1,'2023-05-13 04:38:56.567075','CUSTOMER'),(85,'pbkdf2_sha256$390000$VIRqfnVREboDQSu79Saqv8$TICOL9mmOejO8DamtDavPZPfX2HtKJmCftcuZkae3cE=',NULL,0,'Test@User','','','',0,1,'2023-05-13 04:39:45.501488','CUSTOMER');
/*!40000 ALTER TABLE `appusers_useraccounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appusers_useraccounts_groups`
--

DROP TABLE IF EXISTS `appusers_useraccounts_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appusers_useraccounts_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `useraccounts_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `appusers_useraccounts_gr_useraccounts_id_group_id_2dbf2eb7_uniq` (`useraccounts_id`,`group_id`),
  KEY `appusers_useraccounts_groups_group_id_21cec066_fk_auth_group_id` (`group_id`),
  CONSTRAINT `appusers_useraccount_useraccounts_id_5a580f48_fk_appusers_` FOREIGN KEY (`useraccounts_id`) REFERENCES `appusers_useraccounts` (`id`),
  CONSTRAINT `appusers_useraccounts_groups_group_id_21cec066_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appusers_useraccounts_groups`
--

LOCK TABLES `appusers_useraccounts_groups` WRITE;
/*!40000 ALTER TABLE `appusers_useraccounts_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `appusers_useraccounts_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appusers_useraccounts_user_permissions`
--

DROP TABLE IF EXISTS `appusers_useraccounts_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appusers_useraccounts_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `useraccounts_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `appusers_useraccounts_us_useraccounts_id_permissi_5d452535_uniq` (`useraccounts_id`,`permission_id`),
  KEY `appusers_useraccount_permission_id_a2656e23_fk_auth_perm` (`permission_id`),
  CONSTRAINT `appusers_useraccount_permission_id_a2656e23_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `appusers_useraccount_useraccounts_id_2781a3e8_fk_appusers_` FOREIGN KEY (`useraccounts_id`) REFERENCES `appusers_useraccounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appusers_useraccounts_user_permissions`
--

LOCK TABLES `appusers_useraccounts_user_permissions` WRITE;
/*!40000 ALTER TABLE `appusers_useraccounts_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `appusers_useraccounts_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add user account',7,'add_useraccount'),(26,'Can change user account',7,'change_useraccount'),(27,'Can delete user account',7,'delete_useraccount'),(28,'Can view user account',7,'view_useraccount'),(29,'Can add user',8,'add_user'),(30,'Can change user',8,'change_user'),(31,'Can delete user',8,'delete_user'),(32,'Can view user',8,'view_user'),(33,'Can add user',9,'add_useraccounts'),(34,'Can change user',9,'change_useraccounts'),(35,'Can delete user',9,'delete_useraccounts'),(36,'Can view user',9,'view_useraccounts'),(37,'Can add transporter',10,'add_transporter'),(38,'Can change transporter',10,'change_transporter'),(39,'Can delete transporter',10,'delete_transporter'),(40,'Can view transporter',10,'view_transporter'),(41,'Can add customer',11,'add_customer'),(42,'Can change customer',11,'change_customer'),(43,'Can delete customer',11,'delete_customer'),(44,'Can view customer',11,'view_customer');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$390000$eXRwHgu7HBmpHTwFnpKXwx$i5maFSjFd54KOrMzTzXZA8DFt5jAnu70Cboz27+2fUw=','2023-03-22 21:21:42.365693',1,'admin','','','',1,1,'2023-03-22 21:21:14.200175'),(3,'pbkdf2_sha256$390000$1Mq7HeeoHt0QCx4a7bipG3$9pxjZfk9zt5BJqJzv8JYdI04efa3cSzIC8KwpkDrNXI=','2023-04-04 11:26:23.555084',1,'shivesh','','','',1,1,'2023-04-04 10:44:32.518565');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `CustomerId` bigint NOT NULL,
  `CategoryId` bigint NOT NULL,
  `SubCategoryId` bigint NOT NULL,
  `ProductId` bigint NOT NULL,
  `Quantity` int NOT NULL,
  `OrderPlaced` tinyint DEFAULT '0',
  PRIMARY KEY (`CustomerId`,`CategoryId`,`SubCategoryId`,`ProductId`),
  KEY `CategoryId` (`CategoryId`,`SubCategoryId`,`ProductId`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`CategoryId`, `SubCategoryId`, `ProductId`) REFERENCES `product` (`CategoryId`, `SubCategoryId`, `ProductId`) ON DELETE CASCADE,
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`CustomerId`) REFERENCES `customer` (`CustomerId`) ON DELETE CASCADE,
  CONSTRAINT `cart_chk_1` CHECK ((`OrderPlaced` between 0 and 1))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (22,4,2,38,5,0),(22,6,2,59,23,0),(23,5,2,46,3,0),(23,8,2,76,20,0),(24,1,2,6,1,0),(25,6,1,51,3,0),(26,4,2,39,3,0),(26,5,2,47,4,0),(26,6,2,57,10,0),(26,7,1,62,10,0),(28,7,2,70,38,0),(29,4,2,40,2,0),(32,10,2,100,2,0),(35,1,2,10,3,0),(36,6,1,52,28,0),(36,8,1,74,30,0),(38,1,1,4,2,0),(38,7,2,67,23,0),(39,1,1,4,5,0),(39,3,1,25,2,0),(39,5,2,50,10,0),(39,10,2,100,2,0),(40,4,1,32,16,0),(41,1,1,2,9,0),(41,2,1,12,5,0),(43,4,2,38,5,0),(43,7,1,64,6,0),(43,10,2,98,9,0),(44,3,2,27,6,0),(45,2,1,11,1,0),(45,6,2,59,9,0),(46,1,1,4,2,0),(46,5,1,45,9,0),(46,5,2,49,3,0),(47,3,1,22,3,0),(47,4,2,36,4,0),(47,4,2,40,2,0),(47,6,1,51,7,0),(47,6,2,56,10,0),(48,10,1,94,5,0),(48,10,2,96,60,0),(49,3,2,26,1,0),(49,7,1,64,2,0),(50,1,2,9,2,0),(50,7,1,64,11,0),(50,9,2,90,18,0),(51,7,1,61,21,0),(51,8,1,74,1,0),(51,9,2,90,2,0),(52,2,2,16,5,0),(52,8,2,78,1,0),(55,9,1,83,15,0),(57,6,1,52,26,0),(58,9,2,90,17,0),(59,8,1,73,33,0),(60,1,2,6,2,0),(60,4,1,31,19,0),(60,4,1,35,14,0),(60,9,2,90,11,0),(61,6,2,59,6,0),(62,4,2,39,11,0),(63,3,2,28,3,0),(64,3,2,28,16,0),(70,8,1,71,17,0);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `del_and_insert_cart` BEFORE DELETE ON `cart` FOR EACH ROW BEGIN
                SELECT TransporterId INTO @Transporter_Id FROM Transporter WHERE Transporter.ActiveStatus = 1 and Transporter.currentActiveOrders<=10 ORDER BY TransporterId LIMIT 1;
                SELECT CurrentActiveOrders INTO @Active_Orders FROM Transporter WHERE Transporter.TransporterId = @Transporter_Id;
                SELECT QUANTITY INTO @Prod_Quantity FROM PRODUCT WHERE Product.ProductId = OLD.ProductId and Product.CategoryId = OLD.CategoryID and Product.SubCategoryId = OLD.SubCategoryId;
                SELECT COUNT(ProductId) INTO @TOT_PROD FROM Cart WHERE CustomerId = OLD.CustomerId Group By CustomerId;
                if @Prod_Quantity>OLD.Quantity THEN
                    INSERT INTO Delivery (PaymentId,CustomerId,TransporterId,CategoryId,SubCategoryId,ProductId,Quantity,PaymentType,CheckOutDateAndTime,DeliveryStatus) VALUES (2000+Old.CustomerId,Old.CustomerId,@Transporter_Id,OLD.CategoryId,OLD.SubCategoryId,OLD.ProductId,OLD.Quantity,"PayTM",NOW(),1);
	                
                    UPDATE Transporter
	                SET CurrentActiveOrders = CurrentActiveOrders +1
    	            WHERE CurrentActiveOrders<=10 and Transporter.TransporterId = @Transporter_Id;
	
                    UPDATE Product
	                SET Quantity = Quantity - OLD.Quantity
	                WHERE Product.ProductId = OLD.ProductId and Product.CategoryId = OLD.CategoryId and Product.SubcategoryId = OLD.subCategoryId ;

	                if @Active_Orders >=9 THEN
                        UPDATE Transporter
		                SET ActiveStatus = 0
		                WHERE TransporterId  = @Transporter_Id;
	                end if;
                end if;
                end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `CategoryId` bigint NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(100) NOT NULL,
  PRIMARY KEY (`CategoryId`),
  UNIQUE KEY `CategoryId` (`CategoryId`),
  UNIQUE KEY `CategoryName` (`CategoryName`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (6,'AttaRice&Dal'),(8,'Bakery'),(3,'BreakfastCorner'),(5,'ColdDrinks'),(2,'Dairy'),(20,'Demo Category'),(9,'Instant Foods'),(4,'Munchies'),(10,'SweetTooth'),(7,'TeaCoffeeHealthDrinks'),(1,'Vegetables&Fruits');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CustomerId` bigint NOT NULL AUTO_INCREMENT,
  `Username` varchar(50) NOT NULL,
  `UserPassword` varchar(100) NOT NULL,
  `User_FirstName` varchar(100) NOT NULL,
  `User_MiddleName` varchar(100) DEFAULT NULL,
  `User_LastName` varchar(100) DEFAULT NULL,
  `PhoneNumber` bigint NOT NULL,
  `Customer_HouseNumber` varchar(100) NOT NULL,
  `Customer_Pincode` varchar(6) NOT NULL,
  `Customer_City` varchar(100) NOT NULL,
  `Customer_Locality` varchar(100) NOT NULL,
  PRIMARY KEY (`CustomerId`),
  UNIQUE KEY `CustomerId` (`CustomerId`),
  UNIQUE KEY `Username` (`Username`),
  UNIQUE KEY `PhoneNumber` (`PhoneNumber`),
  CONSTRAINT `customer_chk_1` CHECK ((`PhoneNumber` between 1000000000 and 9999999999))
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'nagligFF','zqfJ9wQJ','Kara','Jaquelin','Phelps',9229826414,'C-20/3','110009','Delhi','Dhakka, Kingsway Camp'),(2,'krijepihS7','Hp53rwhe','Fletcher','Reilly','Riley',9653274039,'1st Floor, Electron House','400025','Mumbai','Prabhadevi'),(3,'skyboisI','gU5mwKY4','Alexi','Jaime','Justice',9994822736,'3-6-419/c','500029','Hyderabad',' Street No 3, Opp Gangotri Apts, Himayat Nagar'),(4,'siakgn','9CPcZBmy','Kasey','Mariel','Ayala',9654017046,' Champa Nivas','400016','Mumbai','Opp City Light Cinema, Mahim'),(5,'KwamqC','Z4wZnVLB','Haylie','Brylee','Rose',9217403589,'113/a, Maskati Mahal,','400002','Mumbai','K.m.sharma Marg, Lohar Chawl'),(6,'esluatsJl','ef56YgvB','Celeste','Nichole','Lancaster',9249245188,'5, Anandi Niwas','400062',' Mumbai','Station Road, Goregaon (w)'),(7,'shvateMk','YHGqCY5v','Josef','Britton','Rollins',9834587216,'8810','110005','Delhi','Raja Lane, New Rohtak Road, Shidi Pura'),(8,'InventymnWextDi','9FQX7ndQ','Amirah','Dahlia','Blaylock',9081666972,' 13, B Block, Durlabh Bhavan','400004','Mumbai','Jaal Bhai Street, Rajaram Roy Rd, Grant Road(e)'),(9,'reepsillhibzX','rhPaYW8H','Alice','Siobhan','Easter',9619942699,'Shop No.98','390002',' Vadodara','Staion Road, Staion Road'),(10,'Tragweino7','Fb7Vr2PV','Mikel','Alec','Mann',9238117475,'72, Part 4','110024','Delhi','National Park'),(11,'SanillolA','CU5N7QMk','Deana','Ingrid','Craven',9575649743,'B/1003','500018','Hyderabad','Fathenagar'),(12,'Dirlbleprob1F','L7MhBwu7','Alexandria','Julianna','Burrell',9960608302,'Shop No 3 Sector 28','201301','Delhi','Alaknanda Shopp Complex'),(13,'ciprskegadB','N6fNefSW','Ezekiel','Randall','Regalado',9980577447,'58','400001','Mumbai','Mint Road, Fort'),(14,'colmenaropinaWz','MyC54w8n','Milo','Charlie','Stuart',9729739374,'28, H','560002','Bangalore','Siddaiah Road'),(15,'GiordazT','Sf3CKGfz','Keyanna','Kalli','Lomax',9693125800,'101, Shreeji Bhavan','400004','Mumbai','Tata Road No 2, Girgaon'),(16,'helloxdare7X','L2vZQ6JL','Lori','Hollie','Hirsch',9021636363,'24 Laram Shpng Centre','400058','Mumbai',' A / 30 S.v.road, Opp Platform No 6, Andheri (west))'),(17,'tirlintiVT','eeN6zS6K','Daveon','Kane','Souza',9775263603,'P68, D2-block','411019','Pune','Midc., Chinchwad'),(18,'blestelwC','sAm6qxgZ','Kylie','Karah','Witte',9929841268,'Newno 34','600002','Chennai','64 3rd Street, Pudupet'),(19,'ulkeartPS','Aa2PwUYc','Kaleigh','Kiarra','Dwyer',9157933907,'19, Hira Paana','401203','Mumbai','Station Rd, Nalasopara(w)'),(20,'r1sta4p','qhs7UMgE','Marlena','Isha','Henriquez',9997357374,'28, 6 5,','560027','Bangalore','Sampangirama Nagar'),(21,'proenzimasV','QnSfQ53A','Maya','Keara','Duffy',9012689526,'B-304 Sagar Samrat','380051','Ahmedabad','Times Of India Press Road,Satellite'),(22,'falenickimA','DwhbE3zS','Gerard','Camron','Singleton',9246280914,'404, 1/3, Sujata Chambers,','400009','Mumbai','A.b. Gandhi Marg, Nr Middle Bridge Of Station, Masjid Bunder (east)'),(23,'tungstatsy9','C978YzgA','Emelia','Denise','Hendrickson',9403565376,'155,jewellerstblr-1','560001','Bangalore','Jeweller Street'),(24,'fashionisticsQM','upNbN8jR','Justus','Houston','Hagan',9719117154,'206/b','500003','Hyderabad','S D Road'),(25,'telexeP0','h7xhQUpJ','Steve','Koby','Cornejo',9376424904,'201, Shrinath Krupa Ii,','400066','Mumbai','201 Karter Road 5, Borivali (east)'),(26,'Tamov0U','hD2TdRwL','Chandler','Vaughn','Burkholder',9199265303,'K-42, Sitaram Bldg','400001','Mumbai','Paltan Road'),(27,'metidoN1','Mgs3KY2T','Jania','Claudia','Zeigler',9212721477,'Plot No 70','400093',' Mumbai','C Cross Road, Midc, Marol, Andheri (west)'),(28,'CosselluGM','H8r3w6FY','Levi','Peter','Jackson',9871569135,'95, Gr Floor','400002','Mumbai','Dr A M Road, Opp Anantwadi, Bhuleshwar'),(29,'penheravicG','b9b9yHRX','Daylon','Paris','Clancy',9055776117,' 21, Sheetal Shopping Centre,','401105','Mumbai','B.p.road, Bhayander (e)'),(30,'benvengutS5','pVj8TZ3p','Keyonna','Renee','Downs',9184612575,'Shop No 3, Shree Shakti Coop Soc','401105',' Mumbai',' Bhd Shaktiganga C Bldg Oop Rly Stat, Bhayander (e)'),(31,'HampWeemeb6','zNY4aAJe','Triston','Bryant','Vega',9408841715,'1, Mahadev Tower','400602','Mumbai','Bombay Agra Rd, Naupada, Thane(w)'),(32,'SkalecG','B8Zhqfqc','Ernesto','Jeremiah','Burgos',9748504413,'10402/9, Multani Dhanda','110055','Delhi','Street No 13, Pahar Ganj'),(33,'krienauja93','sw7yXmJg','Galen','Todd','Tatum',9301484719,'78 M','600053','Chennai',' J R Hussian St, Krishna Puram'),(34,'mgomezI1','CA4mAf6u','Kinsey','Sarai','Ledesma',9254617083,'1/1, Shant Manor','400101','Mumbai','Atmaram Sawant Marg, Near Childrens Academy Sc, Kandivli(e)'),(35,'xnickweirxf1','TgEp4aXD','Jonathan','Luis','Carlton',9952256864,'B/411, Samruddhi','400092','Mumbai','Tps Road, Off Fatory Lane, Borivli(w)'),(36,'JustinovKg','UZ6zPLec','Jaclyn','Lyndsay','Roush',9603078458,'T No 4','110032','Delhi','Naveen Shahdara'),(37,'SagariaGF','ZRn97Jck','Lilian','Teagan','Musser',9833875399,'Shop No 42, Amrapali Shopping Arcade','400602','Mumbai','Vasant Vihar, Thane (west)'),(38,'ko2re2nyr','bwg9CVhA','Juwan','Cannon','Atwell',9599231025,'954, Gate No 5','400095','Mumbai','Bmc Colony, Malwani, Malad (west)'),(39,'criollos6y','wt4Ejg78','Tionna','Kirstyn','McCloud',9047452017,'Shop 1 2, Surang Shop Centershopping Centre','400054','Mumbai','Station Rd, Santacruz (w)'),(40,'Subbianid3','zeay9cdP','Tevin','Aiden','Burgos',9644968289,'6, Shanti Niketan','400017','Mumbai',' Dr Ambedkar Road, Matunga (east)'),(41,'Pellino1I','7EZKaxDZ','Andre','Dandre','McArthur',9884496106,'3, Bhandup Laghu Udyog Mandal','400078','Mumbai','Nr Bhandup Police Station, M D Shah, Bhandup - W'),(42,'trex31c5y','sj4aTmsP','Harley','Darwin','Acker',9189909266,'10/a  The Emperor,','390002','Vadodara','Fatehgunj Main Road, Fatehgunj Main Road'),(43,'waynwonderS4','6WTXX2ud','Amiya','Drew','Upton',9864305302,'35, Shop No-147','600014','Chennai','150, I O A Complex, R H Road, Royappe'),(44,'laiyinkwanS3','bCk9vvnL','Kameron','Deion','Pardo',9790297293,'58','400003','Mumbai','Off Nagdevi Street, Bhaji Pala Lane, Nagdevi'),(45,'CastruccirQ','2z85mfUm','Kaytlyn','Katelin','Herrick',9749816884,'13, 5 Th Flr, Palekar Chambers','400002','Mumbai','1 St Marine Street, Anantilal Podar Marg, Opp To Metro, Dhobi Talao'),(46,'ds3u4u4To','BkGyuSv9','Tayler','Fredy','Mohamed',9235378261,'376 A,','110065','Delhi','Sant Nagar'),(47,'itsaso834L','TRBKm2QJ','Nathanael','Tristin','Osborn',9496414648,'438, A1, Nahar & Seth Indl Estate,','400013','Mumbai','Ramkrishna Mandir Rd, Lower Parel (west)'),(48,'PerancinFX','x8CxF72S','Kristin','Maryjane','Solis',9210269848,'8, Koli Samji Bldg No 1','400015','Mumbai','Sewree Koliwada Rd, Sewree'),(49,'virile0U','vFD4wChN','Azaria','Breann','Ng',9616805959,'228','400027','Mumbai','Ambedkar Road, Opp Gloria Church, Byculla'),(50,'duarFI','fnRhWer8','Dianna','Malaysia','Rudd',9403574746,' Unit No 1, Post Office Bldg','401303','Mumbai','Satyabhama Ind Estate, Virar'),(51,'grupooctavoUQ','wMGvgPU7','Maritza','Anna','Giron',9435918380,'Room No 65 1st Flr, 34/a, K J Trust Bldg','400009','Mumbai','Kakad Street, Masjid Bunder(e)'),(52,'geoffreertO','m4T5xuW3','Daniel','Demarcus','Devore',9430390465,'Plot No 41 Adarsh','410221','Mumbai','Sector 15, Grant Road'),(53,'MMDXXVhJ','U3QY2FKy','Marvin','Clayton','Goldman',9881502437,'30, Central St, Bharath Villa','641046','Coimbatore','Annai Indira Nagar, Bharathiar University Po'),(54,'shortfreak116Vx','5dtBPh9B','Destinie','Heidy','Goldsmith',9637856657,'356','400057','Mumbai','Service Road, Near Highway, Vile Parle (east)'),(55,'mirrinoVc','nNRMB4fu','Jaquan','Irvin','Cormier',9249758060,'566/2, Vibhooti','382009','Ahmedabad','Sector 8, Gandhi Nagar'),(56,'tangoprimeTY','Gy8kuCTY','Halley','Erykah','Alley',9421124669,'2/3, Panduranag Niwas','400601','Mumbai','Dr Ambedkar Marg, Near S T Workshop. Khopat, Thane (west)'),(57,'sinistrasdg','N8e37tHD','Emelia','Gisselle','McCarthy',9357320753,'3523/49 A','110006','Delhi','Shri Balaji Market, Gali Haqim Baqa, Hauz Quazi'),(58,'coldplayfan13fZ','BG9bZW4X','Aidan','Willis','Harlan',9207291678,'4/32, 12-a, Deepak Building','400026','Mumbai','Opposit Jaslok, Peddar Road'),(59,'ingagiarAX','7cuwyH4g','Ramon','Shamar','Fink',9966550221,'Plot No 9 &10, Govt Hsg Soc, Shaflya','410206',' Mumbai',' Sector 2, Opp Bharat Gas, Panvel, Navi Mumbai'),(60,'Lucifero4R','Cw24rHnp','Kacie','Gracie','Chance',9307141956,'431, 1 St Flr, Sangrajka House','400004','Mumbai',' Lamington Road'),(61,'SuriaudidocalXA','eNQW9YmM','Jean','Rhea','Cowart',9157787229,'Plot 186','121001','Delhi','Faridabad'),(62,'formiraal','wb6f44Df','Lloyd','Rex','Menendez',9479408072,'35','560001','Bangalore','Quadrant Road, Shivaji Nagar'),(63,'filmcede0','6kqaDNaK','Randy','Mauro','Lira',9371222647,'293-raja Street','641001','Coimbatore','Townhall'),(64,'stumpfffff0I','xVHsxcS8','Jovani','Jadyn','Montanez',9404998065,'65, Dr Besant Road','600014','Chennai','Royapettah'),(65,'u2c1blJ','j9AXXAtj','Tristan','Ramiro','Ryan',9515085921,'5, C, Mahavir Enterprises','400086','Mumbai','J V Road, Khot Lane, Ghatkopar (west)'),(66,'OheimbO','spPgE2Hk','Clyde','Johnson','Mason',9549965745,'112, Sati Indl Estate','400063','Mumbai',' I B Patel Rd, Goregaon( East)'),(67,'srutynasrw','QM5pKZ2R','Christin','Anjali','Feldman',9020347489,'C 13','110015','Delhi','Ashiana Tower'),(68,'StarovaXI','ybewmM4J','Kasey','Trisha','Self',9315352643,'3rd Floor Hashim Bldg','400001','Mumbai','40 Vir Nariman Road'),(69,'seekx23','9kTZtP7x','Gary','Dimitri','Peck',9381450375,'8, Latif Building','400001','Mumbai','Pitha Cross Lane, Off Janmabhumi, Crawford Market'),(70,'meritist9','Ku8n2k5C','Armando','Zachary','Anglin',9599415395,' A-27 G','201301','Delhi','Noida'),(71,'TrumpenauBu','eM4Hj6tn','Darcy','Julianna','Seay',9775484587,'576/5','110006','Delhi','Ganda Nala Bazar, Hamilton Road, Kashmere Gate'),(72,'JudiegoF9','YxAJ9J7J','Uriah','Luke','Rock',9009719011,'6, Daruwala Compound','400064','Mumbai','S V Rd, Opp Vijay Apt, Malad (west)'),(73,'OlianasyD','7fbDyqVS','Cyrus','Karson','Torrez',9921673503,'44, Matru Samaj','400004','Mumbai','V P Road, Girgaon'),(74,'Deriobz','Bf4xJuGq','Walker','Deandre','Schuler',9862245867,'16, Taramati Bhavan','400078','Mumbai','Tembi Pada Rd, Sai Hill, Bhandup(w)'),(75,'Rohryx','77hdu5AB','Holden','Pedro','Cronin',9047518115,'474-475','122001','Delhi','3, Udyog Vihar, Udyog Vihar, Gurgaon'),(76,'alpinizmaWP','U9hgyXvP','Lia','Allyssa','Hughes',9937635452,'276/78','400003','Mumbai','Samuel Street, Mandvi'),(77,'frejoladaWL','xwX6Cjvr','Jarod','Willis','Purcell',9751205322,'84','421002','Mumbai','Japani Bazar, Ulhasnagar'),(78,'rapskootIC','6vhXAVUs','Lisbeth','Dawn','Linares',9931539145,'74 Maddox Street','600112','Chennai','Choolai'),(79,'mapetitefermeym','5hFf24ER','Charlie','Madalyn','Downs',9506590717,'17-a, New India Centre','400039','Mumbai','Cooperage Road, Opp Oval Maidan, Council Hall'),(80,'dreamecaEY','WA4GqnEP','Matteo','Lewis','Owens',9876264405,'Cornelian Property','400036','Mumbai','108 August Kranti Marg, Opp. Cumballa Hill Hospital., August Kranti Marg'),(81,'pistratW8','HpN3LQmn','Madalynn','Myranda','Delaney',9976454947,'Shop No 8','560009','Bangalore','1st Main Road, Gandhinagar'),(82,'Vacheciczexyk','JFL4qJKm','Caylee','Daijah','Brenner',9519986518,'905/906, 212, Tulsiani Chambers','400021','Mumbai','Free Press Journal Rd, Nariman Point'),(83,'rhagenwha','X6j5hkDb','Irvin','Miguelangel','Odom',9723986037,'Plot 46, Shop 26','400043','Mumbai','Main Rd, Shivaji Ngr, Govandi (west)'),(84,'yve1riYt','7wchrppW','Anna','Judith','Mcnutt',9318644588,'737, Stockexchange Rotunda','400001','Mumbai','Dalal Street, Gpo, Fort'),(85,'radtester8zo','FuG4MwVb','Malachi','Alfredo','Gross',9579082525,'2nd Floor,77, Sp-3, 102 Kailash Indl Complex','400079','Mumbai','E L B S Road, Gpo, Vikhro'),(86,'alfredaCG','vVpMWLP7','Carli','Kaili','Hutchings',9272911654,'12-7-125/1/a','500017','Hyderabad','Mettuguda'),(87,'DresoumemowD8','4PRtVnMc','Vincenzo','Danny','Ness',9158966082,'Room No.307, 3rd Flr Birya House','400001','Mumbai','265 Bazar Gate Street'),(88,'BEFRd','Qv3jMqT4','Giselle','Shania','Ashby',9067349582,'4, Rishikesh Bldg','400064','Mumbai','Evershine Nagar, Malad(w)'),(89,'mudezjr','dtGsSy7x','Hailey','Alyson','Waters',9510186544,'Todkar House','390001','Vadodara','nr Ramway Plaza, Dandia Bazar'),(90,'podlimIx','VdTAEbw7','Jodie','Yazmine','Herrmann',9874879287,'103, Pocket D &e','110044','Delhi',' Local Shopping Complex 1st Floor, Sarita Vihar'),(91,'telrunyaaaW3','xbn4nw5Z','Raelynn','Berenice','Sample',9520127563,'Plot No J 49','410208','Mumbai','208, Midc, Taloja, Navi Mumbai'),(92,'sebenarXc','rPVk7tjW','Ronan','Treyton','Groves',9275079859,'7, Bundimutt','560002','Bangalore','Avenue Road'),(93,'evetrenzas2J','6BhKsDaa','Cedrick','Trayvon','Bolin',9539345050,'Nr Zakaria Masjid','380001','Ahmedabad','Relief Road'),(94,'oxidgigTith2g','fkXVD2Tj','Jaylene','Eileen','Cosby',9187430508,'S. V. Road','400052','Mumbai','Khar'),(95,'linaye3a','4AxcjS3V','Claudio','Mathew','Murdock',9373924556,'4, Dm Shammanna Cplx','560036','Bangalore','Dvasandra Mn Rd Krishnarajapuram'),(96,'Mofedisi5l','VPJtr6KU','Juliette','Shirley','Edmonds',9575424561,'Shop No 6, ','401101','Mumbai','Ambika Park No 8, Janata Nagar Road, Bhayander (w)'),(97,'semuinduFG','22X3V2Nc','Daryl','Gavin','Roark',9651075795,'67/2,gundopanthstblr-2','560002','Bangalore','Behind Sri Krishna Rajendra Market, Gundopanth Street'),(98,'ticseniesWp','B8Y9cCca','Rodrigo','Arthur','Carl',9851075133,'B/24','380014','Ahmedabad','Income Tax'),(99,'povodnogQK','SNkTcs55','Chris','Amos','Farias',9412874213,'102, F-20, Green Crest','400053','Mumbai','Yamuna Nagar, Opp Parsurampuria Tower, Andheri (west)'),(100,'GabieEn','Cx4WwtZf','Tiana','Nelly','Barnard',9465604993,'Asm House','400055','Mumbai','7th Golibar Road, Santacruz (east)'),(102,'bale789','123','bale',NULL,'shaav',1234567890,'123','123','123','123'),(103,'PKZ73YGU1PP','Len','Garrison',NULL,NULL,4832818215,'F6F 1Q9','243943','Kech','Ap #882-9941 Odio Rd.'),(104,'GMZ75UMQ2QJ','Latifah','Blythe',NULL,NULL,6024886886,'R6L 9B9','446883','Việt Trì','189-3925 Natoque St.'),(105,'LGR61ZDN1FU','Melodie','Grant',NULL,NULL,2870815213,'C4Z 8E4','658529','Deventer','6196 Tincidunt Street'),(106,'KVE47INB4DT','Asher','Mollie',NULL,NULL,8442681134,'D4I 0S5','412819','Ełk','Ap #342-6283 Consequat St.'),(107,'LPX43AEH6ER','Wyoming','Garth',NULL,NULL,8103468729,'F9D 1Y9','123510','Cusco','196-6008 Mauris, Avenue'),(108,'DGE89TNU6QG','Scarlet','Hamilton',NULL,NULL,1036148567,'N1J 7M7','813694','Norwich','Ap #397-1882 Libero Road'),(109,'ODQ36GKU9WF','Ashely','Maia',NULL,NULL,5567854886,'H3J 1Q3','208152','Cao Bằng','284-6042 Ante. Avenue'),(110,'NXH79ITY0BB','Clayton','Venus',NULL,NULL,7662685363,'M8W 5L3','468205','Gyeongsan','388-7406 Nunc Av.'),(111,'DYJ76HKT5UN','Brock','Nathan',NULL,NULL,7427946552,'F7T 2K5','631411','Pacoa','909-2473 Arcu Rd.'),(112,'GYD12APD8ZN','Eve','Claudia',NULL,NULL,6022811142,'V5X 6V4','630521','Thabazimbi','570-4044 Quam, Street'),(113,'LH','123','Luigi',NULL,'Hello',1230981237,'wifoj','123','Delhi','Delhi'),(114,'DH','123','Luigi','None','Hello',1230918237,'wifoj','123','Delhi','Delhi'),(116,'Test@User','123','Test',NULL,'User',1010101010,'123','110003','Delhi','Delhi');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `OrderId` bigint NOT NULL AUTO_INCREMENT,
  `PaymentId` bigint NOT NULL,
  `CustomerId` bigint NOT NULL,
  `TransporterId` bigint NOT NULL,
  `CategoryId` bigint NOT NULL,
  `SubCategoryId` bigint NOT NULL,
  `ProductId` bigint NOT NULL,
  `Quantity` int NOT NULL,
  `CheckOutDateAndTime` datetime DEFAULT NULL,
  `ETA` time DEFAULT NULL,
  `DeliveryStatus` int NOT NULL DEFAULT '0',
  `PaymentType` varchar(100) NOT NULL,
  PRIMARY KEY (`OrderId`,`PaymentId`),
  UNIQUE KEY `OrderId` (`OrderId`),
  KEY `CustomerId` (`CustomerId`),
  KEY `TransporterId` (`TransporterId`),
  KEY `CategoryId` (`CategoryId`,`SubCategoryId`,`ProductId`),
  CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `customer` (`CustomerId`) ON DELETE CASCADE,
  CONSTRAINT `delivery_ibfk_2` FOREIGN KEY (`TransporterId`) REFERENCES `transporter` (`TransporterId`) ON DELETE CASCADE,
  CONSTRAINT `delivery_ibfk_3` FOREIGN KEY (`CategoryId`, `SubCategoryId`, `ProductId`) REFERENCES `product` (`CategoryId`, `SubCategoryId`, `ProductId`) ON DELETE CASCADE,
  CONSTRAINT `delivery_chk_1` CHECK ((`DeliveryStatus` between 0 and 2))
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (1,1,1,1,6,2,60,4,'2023-03-23 00:00:00',NULL,1,'paytm'),(2,2,1,1,4,2,38,9,'2023-02-25 00:00:00',NULL,2,'paytm'),(3,3,2,2,1,1,5,6,'2023-03-25 00:00:00',NULL,2,'paytm'),(4,4,1,1,10,1,93,13,'2023-04-07 00:00:00',NULL,1,'paytm'),(5,5,2,2,6,1,53,9,'2023-03-25 00:00:00',NULL,1,'paytm'),(6,6,2,2,1,2,8,2,'2023-03-20 00:00:00',NULL,1,'paytm'),(7,7,3,3,3,2,30,5,'2023-03-20 00:00:00',NULL,1,'paytm'),(8,8,3,3,5,1,45,9,'2023-03-27 00:00:00',NULL,1,'paytm'),(9,9,4,4,2,2,20,3,'2023-03-27 00:00:00',NULL,1,'paytm'),(10,10,3,3,1,2,7,1,'2023-03-28 00:00:00',NULL,1,'paytm'),(11,11,5,5,5,2,47,9,'2023-03-29 00:00:00',NULL,1,'paytm'),(12,12,5,5,4,2,37,3,'2023-03-29 00:00:00',NULL,1,'paytm'),(13,13,5,5,4,2,40,1,'2023-03-25 00:00:00',NULL,1,'paytm'),(14,14,6,6,3,2,28,19,'2023-03-25 00:00:00',NULL,1,'paytm'),(15,15,7,7,1,2,7,1,'2023-03-29 00:00:00',NULL,1,'paytm'),(16,16,6,6,9,1,81,19,'2023-03-29 00:00:00',NULL,2,'paytm'),(17,17,6,6,2,1,14,3,'2023-03-29 00:00:00',NULL,1,'paytm'),(18,18,8,8,10,1,91,33,'2023-03-29 00:00:00',NULL,2,'paytm'),(19,19,7,7,8,1,71,8,'2023-03-29 00:00:00',NULL,1,'paytm'),(20,20,8,8,6,2,56,26,'2023-03-29 00:00:00',NULL,1,'paytm'),(21,21,8,8,8,2,76,12,'2023-04-29 00:00:00',NULL,1,'paytm'),(22,22,9,9,8,1,72,26,'2023-04-29 00:00:00',NULL,2,'paytm'),(23,23,10,10,9,2,90,20,'2023-04-29 00:00:00',NULL,1,'paytm'),(24,24,11,11,9,1,84,32,'2023-04-29 00:00:00',NULL,1,'paytm'),(25,25,12,12,9,2,89,20,'2023-04-26 00:00:00',NULL,1,'paytm'),(26,26,12,12,8,2,77,1,'2023-04-29 00:00:00',NULL,2,'paytm'),(27,27,12,12,2,1,15,1,'2023-04-29 00:00:00',NULL,1,'paytm'),(28,28,12,12,9,2,86,9,'2023-04-26 00:00:00',NULL,1,'paytm'),(29,29,12,12,1,2,8,5,'2023-04-29 00:00:00',NULL,1,'paytm'),(30,30,13,13,6,1,55,6,'2023-04-29 00:00:00',NULL,2,'paytm'),(31,31,14,14,10,2,96,39,'2023-04-29 00:00:00',NULL,2,'paytm'),(32,32,13,13,4,2,37,4,'2023-04-26 00:00:00',NULL,1,'paytm'),(33,33,14,14,1,1,4,4,'2023-10-16 00:00:00',NULL,1,'paytm'),(34,34,15,15,5,1,45,3,'2023-10-16 00:00:00',NULL,1,'paytm'),(35,35,15,15,3,2,28,9,'2023-10-16 00:00:00',NULL,1,'paytm'),(36,36,16,16,7,2,68,11,'2023-10-16 00:00:00',NULL,1,'paytm'),(37,37,16,16,5,1,41,1,'2023-10-16 00:00:00',NULL,2,'paytm'),(38,38,17,17,10,2,96,10,'2023-10-16 00:00:00',NULL,2,'paytm'),(39,39,17,17,10,1,94,1,'2023-10-16 00:00:00',NULL,2,'paytm'),(40,40,18,18,9,1,83,17,'2023-10-16 00:00:00',NULL,1,'paytm'),(41,41,18,18,7,2,70,39,'2023-12-28 00:00:00',NULL,1,'paytm'),(42,42,18,18,2,1,15,4,'2023-12-28 00:00:00',NULL,1,'paytm'),(43,43,19,19,3,2,29,2,'2023-12-28 00:00:00',NULL,1,'paytm'),(44,44,19,19,4,1,31,13,'2023-12-28 00:00:00',NULL,2,'paytm'),(45,45,19,19,9,2,89,29,'2023-12-28 00:00:00',NULL,2,'paytm'),(46,46,20,20,4,1,32,27,'2023-12-28 00:00:00',NULL,1,'paytm'),(47,47,20,20,6,1,55,1,'2023-12-28 00:00:00',NULL,2,'paytm'),(48,48,20,20,7,1,64,4,'2023-12-28 00:00:00',NULL,1,'paytm'),(49,49,20,20,6,2,56,28,'2023-12-28 00:00:00',NULL,1,'paytm'),(50,50,20,20,8,1,73,53,'2023-12-28 00:00:00',NULL,2,'paytm'),(51,2000,69,1,4,2,37,1,'2023-12-28 00:00:00',NULL,1,'PayTM'),(52,2000,69,1,7,1,63,14,'2023-12-28 00:00:00',NULL,1,'PayTM'),(53,2000,69,1,7,2,66,29,'2023-12-28 00:00:00',NULL,1,'PayTM'),(54,2000,69,1,7,2,69,1,'2023-04-29 00:00:00',NULL,1,'PayTM'),(57,2000,68,1,9,2,86,12,'2023-04-29 00:00:00',NULL,1,'PayTM'),(58,2000,68,1,9,2,89,25,'2023-04-29 00:00:00',NULL,1,'PayTM'),(61,2067,67,5,3,2,27,6,'2023-10-16 00:00:00',NULL,1,'PayTM'),(62,2067,67,5,9,1,85,23,'2023-12-28 00:00:00',NULL,1,'PayTM'),(63,2021,21,2,6,1,52,14,'2023-12-28 00:00:00',NULL,1,'PayTM'),(64,2021,21,2,7,1,61,2,'2023-12-28 00:00:00',NULL,1,'PayTM'),(65,2021,21,2,8,2,76,19,'2023-12-28 00:00:00',NULL,1,'PayTM'),(66,2042,42,2,2,2,18,2,'2023-12-28 00:00:00',NULL,1,'PayTM'),(67,2042,42,2,4,2,37,2,'2023-12-28 00:00:00',NULL,1,'PayTM'),(68,2042,42,2,7,1,64,3,'2023-12-28 00:00:00',NULL,1,'PayTM'),(91,2027,27,10,1,2,6,1,'2023-04-20 19:48:28',NULL,1,'PayTM'),(92,2027,27,10,3,1,23,3,'2023-04-20 19:48:28',NULL,1,'PayTM'),(93,2027,27,10,7,2,68,2,'2023-04-20 19:48:28',NULL,1,'PayTM'),(94,2027,27,10,10,2,99,1,'2023-04-20 19:48:28',NULL,1,'PayTM'),(95,2033,33,10,5,2,47,2,'2023-04-20 19:54:38',NULL,1,'PayTM'),(96,2033,33,10,5,2,48,3,'2023-04-20 19:54:38',NULL,1,'PayTM'),(97,2033,33,10,8,2,79,43,'2023-04-20 19:54:38',NULL,1,'PayTM'),(98,2066,66,10,6,1,51,3,'2023-04-20 20:06:49',NULL,1,'PayTM'),(99,2066,66,10,6,2,60,2,'2023-04-20 20:06:49',NULL,1,'PayTM'),(100,2066,66,10,8,2,80,5,'2023-04-20 20:06:49',NULL,1,'PayTM'),(101,2030,30,10,9,1,81,11,'2023-04-20 20:11:14',NULL,1,'PayTM'),(102,2030,30,10,10,2,98,15,'2023-04-20 20:11:14',NULL,1,'PayTM'),(103,2056,56,11,1,2,6,2,'2023-04-20 20:17:10',NULL,1,'PayTM'),(104,2056,56,11,6,2,59,3,'2023-04-20 20:17:10',NULL,1,'PayTM'),(105,2056,56,12,10,2,98,13,'2023-04-20 20:17:10',NULL,1,'PayTM'),(106,2065,65,12,2,1,12,1,'2023-04-20 20:23:02',NULL,1,'PayTM'),(107,2065,65,12,3,1,21,15,'2023-04-20 20:23:02',NULL,1,'PayTM'),(108,2065,65,12,8,1,73,26,'2023-04-20 20:23:02',NULL,1,'PayTM'),(109,2065,65,14,9,1,83,12,'2023-04-20 20:23:02',NULL,1,'PayTM'),(122,2114,114,7,5,1,44,1,'2023-04-24 09:59:48',NULL,1,'PayTM'),(123,2114,114,17,5,1,45,1,'2023-04-24 09:59:48',NULL,1,'PayTM'),(124,2114,114,17,1,1,1,1,'2023-04-24 10:00:42',NULL,2,'PayTM'),(125,2114,114,17,1,1,2,1,'2023-04-24 10:00:42',NULL,2,'PayTM'),(128,2114,114,17,5,1,42,1,'2023-04-24 21:13:08',NULL,1,'PayTM'),(129,2114,114,17,5,1,45,1,'2023-04-24 21:13:08',NULL,1,'PayTM'),(130,2114,114,17,10,1,93,3,'2023-04-24 21:15:16',NULL,1,'PayTM'),(131,2114,114,17,10,1,95,1,'2023-04-24 21:15:16',NULL,1,'PayTM'),(133,2116,116,20,4,1,31,1,'2023-05-13 10:12:12',NULL,1,'PayTM'),(134,2116,116,20,4,1,32,1,'2023-05-13 10:12:12',NULL,1,'PayTM'),(135,2116,116,20,4,1,33,1,'2023-05-13 10:12:12',NULL,1,'PayTM'),(138,2116,116,17,4,1,31,2,'2023-05-13 10:55:02',NULL,1,'PayTM'),(139,2116,116,20,4,1,32,2,'2023-05-13 10:55:02',NULL,1,'PayTM');
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-04-04 11:11:12.701123','2','TestUser_1',3,'',4,3),(2,'2023-04-04 11:26:43.845806','4','Goku',3,'',4,3),(3,'2023-04-04 11:26:51.172373','5','Vegeta',3,'',4,3);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(11,'appusers','customer'),(10,'appusers','transporter'),(8,'appusers','user'),(7,'appusers','useraccount'),(9,'appusers','useraccounts'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-03-22 04:51:26.330698'),(2,'auth','0001_initial','2023-03-22 04:51:26.739790'),(3,'admin','0001_initial','2023-03-22 04:51:26.839813'),(4,'admin','0002_logentry_remove_auto_add','2023-03-22 04:51:26.846812'),(5,'admin','0003_logentry_add_action_flag_choices','2023-03-22 04:51:26.854816'),(6,'contenttypes','0002_remove_content_type_name','2023-03-22 04:51:26.915828'),(7,'auth','0002_alter_permission_name_max_length','2023-03-22 04:51:26.961838'),(8,'auth','0003_alter_user_email_max_length','2023-03-22 04:51:26.981843'),(9,'auth','0004_alter_user_username_opts','2023-03-22 04:51:26.989846'),(10,'auth','0005_alter_user_last_login_null','2023-03-22 04:51:27.034857'),(11,'auth','0006_require_contenttypes_0002','2023-03-22 04:51:27.037857'),(12,'auth','0007_alter_validators_add_error_messages','2023-03-22 04:51:27.045860'),(13,'auth','0008_alter_user_username_max_length','2023-03-22 04:51:27.102871'),(14,'auth','0009_alter_user_last_name_max_length','2023-03-22 04:51:27.151883'),(15,'auth','0010_alter_group_name_max_length','2023-03-22 04:51:27.170895'),(16,'auth','0011_update_proxy_permissions','2023-03-22 04:51:27.178888'),(17,'auth','0012_alter_user_first_name_max_length','2023-03-22 04:51:27.222897'),(18,'sessions','0001_initial','2023-03-22 04:51:27.244902'),(20,'appusers','0001_initial','2023-04-05 14:21:34.777991'),(21,'appusers','0002_transporter','2023-04-05 14:25:28.963018'),(22,'appusers','0003_customer','2023-04-05 14:34:24.152878');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('fjzg14y231aup71pgbehv3144tm8vb3v','.eJxVjMEOwiAQRP-FsyFZ6CJ49O43kN0uSNVAUtqT8d9tkx70Npn3Zt4q0rqUuPY0x0nURQ1OnX5LpvGZ6k7kQfXe9NjqMk-sd0UftOtbk_S6Hu7fQaFetjU7x8YGGGRL3jAEACA8GybvMwQMyVj2WcAKZbKSCRkQQZLBJEZ9vvnYOC4:1pqaM5:WUe76zGpf7Xhyz9AaMuS2m8MIyRyADDXu6pSM1ZStKQ','2023-05-07 14:06:17.005709'),('wor4rftrj0ero09rh7omcum68lwrf2l4','.eJxVjMEOwiAQRP-FsyFZ6CJ49O43kN0uSNVAUtqT8d9tkx70Npn3Zt4q0rqUuPY0x0nURQ1OnX5LpvGZ6k7kQfXe9NjqMk-sd0UftOtbk_S6Hu7fQaFetjU7x8YGGGRL3jAEACA8GybvMwQMyVj2WcAKZbKSCRkQQZLBJEZ9vvnYOC4:1pwn1w:nCYpPv0zxsNbcBc2Jli0LP-VIFOvACNPPQUlP4aYNKA','2023-05-24 16:51:08.069811');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `getsassigned`
--

DROP TABLE IF EXISTS `getsassigned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `getsassigned` (
  `TransporterId` bigint NOT NULL,
  `OrderId` bigint NOT NULL,
  PRIMARY KEY (`OrderId`,`TransporterId`),
  KEY `TransporterId` (`TransporterId`),
  CONSTRAINT `getsassigned_ibfk_1` FOREIGN KEY (`TransporterId`) REFERENCES `transporter` (`TransporterId`) ON DELETE CASCADE,
  CONSTRAINT `getsassigned_ibfk_2` FOREIGN KEY (`OrderId`) REFERENCES `delivery` (`OrderId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `getsassigned`
--

LOCK TABLES `getsassigned` WRITE;
/*!40000 ALTER TABLE `getsassigned` DISABLE KEYS */;
INSERT INTO `getsassigned` VALUES (1,1),(1,2),(1,4),(2,3),(2,5),(2,6),(3,7),(3,8),(3,10),(4,9),(5,11),(5,12),(5,13),(6,14),(6,16),(6,17),(7,15),(7,19),(8,18),(8,20),(8,21),(9,22),(10,23),(11,24),(12,25),(12,26),(12,27),(12,28),(12,29),(13,30),(13,32),(14,31),(14,33),(15,34),(15,35),(16,36),(16,37),(17,38),(17,39),(18,40),(18,41),(18,42),(19,43),(19,44),(19,45),(20,46),(20,47),(20,48),(20,49),(20,50);
/*!40000 ALTER TABLE `getsassigned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `CategoryId` bigint NOT NULL,
  `SubCategoryId` bigint NOT NULL,
  `ProductId` bigint NOT NULL,
  `ProductName` varchar(100) NOT NULL,
  `Specification` varchar(100) NOT NULL,
  `CompanyName` varchar(100) NOT NULL,
  `Discount` float NOT NULL DEFAULT '0',
  `MRP` float NOT NULL DEFAULT '0',
  `FinalPrice` float GENERATED ALWAYS AS ((`MRP` - ((`Discount` / 100) * `MRP`))) VIRTUAL,
  `ManufacturingDate` timestamp NULL DEFAULT NULL,
  `ExpiryDate` timestamp NULL DEFAULT NULL,
  `TimeForUse` bigint GENERATED ALWAYS AS (timestampdiff(DAY,`ManufacturingDate`,`ExpiryDate`)) VIRTUAL,
  `Quantity` int NOT NULL,
  PRIMARY KEY (`CategoryId`,`SubCategoryId`,`ProductId`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`CategoryId`) REFERENCES `category` (`CategoryId`) ON DELETE CASCADE,
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`CategoryId`, `SubCategoryId`) REFERENCES `subcategory` (`CategoryId`, `SubCategoryId`) ON DELETE CASCADE,
  CONSTRAINT `product_chk_1` CHECK ((`Discount` >= 0.0)),
  CONSTRAINT `product_chk_2` CHECK ((`MRP` >= 0.0)),
  CONSTRAINT `product_chk_3` CHECK ((`FinalPrice` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`CategoryId`, `SubCategoryId`, `ProductId`, `ProductName`, `Specification`, `CompanyName`, `Discount`, `MRP`, `ManufacturingDate`, `ExpiryDate`, `Quantity`) VALUES (1,1,1,'Apple ','3 pcs','Tree Top Inc.',5,100,'2023-03-22 18:30:00','2023-03-22 18:30:00',196),(1,1,2,'Banana ','3 pcs','Fowler Farms',0,15,'2023-02-24 18:30:00',NULL,34),(1,1,3,'Orange','3 pcs','Wonderful Citrus',0,30,'2023-03-24 18:30:00','2023-03-24 18:30:00',7),(1,1,4,'Strawberry','1 box','Driscoll\'s',0,400,'2023-04-06 18:30:00','2023-04-06 18:30:00',4),(1,1,5,'Pineapples','1 pc','Taylor Farms',10,50,'2023-03-24 18:30:00','2023-03-24 18:30:00',9),(1,2,6,'Carrots','10 pcs','Fresh Fields Farm',0,150,'2023-03-19 18:30:00','2023-03-19 18:30:00',7),(1,2,7,'Broccoli','1 pc','Green Sprout Produce',5,60,'2023-03-19 18:30:00','2023-03-19 18:30:00',1),(1,2,8,'Brinjal','1 pc','Harvest Time Vegetables',5,60,'2023-03-26 18:30:00','2023-03-26 18:30:00',5),(1,2,9,'Spinach','125g','Root & Branch Organic Vegetables',5,30,'2023-03-26 18:30:00','2023-03-26 18:30:00',10),(1,2,10,'Cucumber','3 pcs','Sunny Side Vegetables',5,50,'2023-03-27 18:30:00','2023-03-27 18:30:00',10),(1,2,230,'abc','def','ghi',12,10000,'2023-03-30 18:30:00','2023-04-11 18:30:00',12),(2,1,11,'A2 Fresh Milk','500ml','Humpy Farms',0,25,'2023-03-28 18:30:00','2023-03-28 18:30:00',10),(2,1,12,'Toned Milk','500ml','Amul ',5,20,'2023-03-28 18:30:00','2023-03-28 18:30:00',9),(2,1,13,'Full Cream Milk','500ml','Amul',20,30,'2023-03-24 18:30:00','2023-03-24 18:30:00',1),(2,1,14,'Toned Milk','1l','Mother Dairy',5,20,'2023-03-24 18:30:00','2023-03-24 18:30:00',5),(2,1,15,'Plant Milk','500ml','Pilk',5,60,'2023-03-28 18:30:00','2023-03-28 18:30:00',5),(2,2,16,'Malai Paneer','200g','Mother Dairy',0,50,'2023-03-28 18:30:00','2023-03-28 18:30:00',5),(2,2,17,'Tofu','200g','So-Lite',0,50,'2023-03-28 18:30:00','2023-03-28 18:30:00',10),(2,2,18,'Taaza Paneer','200g','Country Delight',5,60,'2023-03-28 18:30:00','2023-03-28 18:30:00',3),(2,2,19,'Block Paneer','200g','Gowardhan',5,80,'2023-03-28 18:30:00','2023-03-28 18:30:00',5),(2,2,20,'Fresh Malai Paneer','200g','Amul',0,100,'2023-03-28 18:30:00','2023-03-28 18:30:00',5),(3,1,21,'Poha Breakfast Mix','60g','MTR',0,100,'2023-04-28 18:30:00','2023-04-28 18:30:00',4),(3,1,22,'Upma Breakfast Mix','60g','MTR',0,150,'2023-04-28 18:30:00','2023-04-28 18:30:00',5),(3,1,23,'Rava Idli Breakfast Mix','1kg','MTR',10,100,'2023-04-28 18:30:00','2023-04-28 18:30:00',7),(3,1,24,'Rice Idli Breakfast Mix','500g','Gits',10,150,'2023-04-28 18:30:00','2023-04-28 18:30:00',10),(3,1,25,'Dahi vada Masala Mix','250g','Haldiram\'s',10,130,'2023-04-25 18:30:00','2023-04-25 18:30:00',10),(3,2,26,'Chicken Plain Salami','250g','Delichic',5,120,'2023-04-28 18:30:00','2023-04-28 18:30:00',10),(3,2,27,'Chicken Herbs Sausage','200g','Delichic',10,110,'2023-04-28 18:30:00','2023-04-28 18:30:00',4),(3,2,28,'Chicken Sausage','500g','Meatzza',5,180,'2023-04-25 18:30:00','2023-04-25 18:30:00',20),(3,2,29,'Naturally Smoked Chicken','500g','Sumeru',0,200,'2023-04-28 18:30:00','2023-04-28 18:30:00',20),(3,2,30,'Chicken Sliced Ham','200g','Carnivore',40,160,'2023-04-28 18:30:00','2023-04-28 18:30:00',20),(4,1,31,'Cheese Nachos','60g','Dorritos',10,110,'2023-04-28 18:30:00','2023-04-28 18:30:00',15),(4,1,32,'Masala Munch Crisps','82g','Kurkure',10,20,'2023-04-25 18:30:00','2023-04-25 18:30:00',26),(4,1,33,'Golden Sizzle Popcorn','30g','Act II',0,20,'2023-10-15 18:30:00','2023-10-15 18:30:00',1),(4,1,34,'Navratan Mixture','220g','Haldiram\'s',0,20,'2023-10-15 18:30:00','2023-10-15 18:30:00',1),(4,1,35,'Puffcorn','55g','Kurkure',10,20,'2023-10-15 18:30:00','2023-10-15 18:30:00',18),(4,2,36,'Boondi Namkeen','220g','Haldiram\'s',10,100,'2023-10-15 18:30:00','2023-10-15 18:30:00',20),(4,2,37,'Peanut Namkeen','200g','Bikano',10,100,'2023-10-15 18:30:00','2023-10-15 18:30:00',3),(4,2,38,'Mathri','200g','Haldiram\'s',0,60,'2023-10-15 18:30:00','2023-10-15 18:30:00',10),(4,2,39,'Roasted Chana','500g','GMC',0,75,'2023-10-15 18:30:00','2023-10-15 18:30:00',15),(4,2,40,'Kachori Namkeen','200g','Haldiram\'s',0,70,'2023-10-15 18:30:00','2023-10-15 18:30:00',2),(4,2,128,'hello','xyz','abc',20,100,'2023-02-09 18:30:00','2023-02-10 18:30:00',29),(5,1,41,'Coca-Cola','750ml','Coca-Cola',0,40,'2023-12-27 18:30:00','2023-12-27 18:30:00',1),(5,1,42,'Thums Up','750ml','Thums Up',50,40,'2023-12-27 18:30:00','2023-12-27 18:30:00',12),(5,1,43,'LimeNLemon','750ml','Limca',0,50,'2023-12-27 18:30:00','2023-12-27 18:30:00',8),(5,1,44,'Orange Flavored Soft Drink','750ml','Fanta',10,50,'2023-12-27 18:30:00','2023-12-27 18:30:00',8),(5,1,45,'Black Zero Sugar Soft Drink','250ml','Pepsi',10,50,'2023-12-27 18:30:00','2023-12-27 18:30:00',9),(5,2,46,'Orange Juice','200ml','Fresca',5,60,'2023-12-27 18:30:00','2023-12-27 18:30:00',10),(5,2,47,'Peach Flavored Fruit Drink','600ml','Paper Boat',10,50,'2023-12-27 18:30:00','2023-12-27 18:30:00',8),(5,2,48,'Orange Delight Juice','1l','Tropicana',10,70,'2023-12-27 18:30:00','2023-12-27 18:30:00',7),(5,2,49,'Mango Drink','1.8l','Frooti',10,80,'2023-12-27 18:30:00','2023-12-27 18:30:00',10),(5,2,50,'Guava Juice','250ml','Fresca',10,50,'2023-12-27 18:30:00','2023-12-27 18:30:00',10),(6,1,51,'Rozana Basmati Rice','1kg','Fortune',5,120,'2023-12-27 18:30:00','2023-12-27 18:30:00',17),(6,1,52,'Rozana Super basmati Rice','5kg','Dawat',10,400,'2023-12-27 18:30:00','2023-12-27 18:30:00',16),(6,1,53,'Dubar Basmati Rice','1kg','India Gate',10,80,'2023-12-27 18:30:00','2023-12-27 18:30:00',40),(6,1,54,'Puffed Rice','200g','GMC',10,320,'2023-04-28 18:30:00','2023-04-28 18:30:00',20),(6,1,55,'Feast Rozzana Basmati Rice','1kg','India Gate',0,190,'2023-04-28 18:30:00','2023-04-28 18:30:00',10),(6,2,56,'Chana Dal','1kg','Rajdhani',0,100,'2023-04-28 18:30:00','2023-04-28 18:30:00',30),(6,2,57,'Premium Unpolished Chana Dal','1kg ','GMC',0,50,'2023-04-28 18:30:00','2023-04-28 18:30:00',40),(6,2,58,'Whole Urad ','1kg','Rajdhani',5,450,'2023-04-28 18:30:00','2023-04-28 18:30:00',50),(6,2,59,'ArharDal/Toor Dal','1kg','GMC',5,200,'2023-10-15 18:30:00','2023-10-15 18:30:00',37),(6,2,60,'Organic Arhar Dal','500g','Aashirvaad',5,1000,'2023-10-15 18:30:00','2023-10-15 18:30:00',18),(7,1,61,'Premium Tea','1.5kg','Tata Tea',10,120,'2023-10-15 18:30:00','2023-10-15 18:30:00',28),(7,1,62,'Agni Special Blend Tea','1kg','Tata Tea',40,85,'2023-12-27 18:30:00','2023-12-27 18:30:00',10),(7,1,63,'Spiced Tea','250g','Wagh Bakri',5,820,'2023-12-27 18:30:00','2023-12-27 18:30:00',30),(7,1,64,'Gold Tea','1kg','Tata Tea',10,640,'2023-12-27 18:30:00','2023-12-27 18:30:00',17),(7,1,65,'Masala Tea','250g','Society Tea',0,400,'2023-12-27 18:30:00','2023-12-27 18:30:00',10),(7,2,66,'Classic Instant Cooffee','50g','Nescafe Classic',0,30,'2023-12-27 18:30:00','2023-12-27 18:30:00',40),(7,2,67,'Caramel Instant Coffee','100g','Country Bean',5,250,'2023-12-27 18:30:00','2023-12-27 18:30:00',30),(7,2,68,'Butterscotch Delight Coffee','100g','Rage Coffee',10,500,'2023-12-27 18:30:00','2023-12-27 18:30:00',18),(7,2,69,'Instan Coffee','100g','Rage Coffee',0,800,'2023-12-27 18:30:00','2023-12-27 18:30:00',10),(7,2,70,'French Vanilla Premium','100g','Sleepy Owl',0,1000,'2023-04-28 18:30:00','2023-04-28 18:30:00',40),(8,1,71,'Good Day Butter Biscuit','60g','Britania',10,700,'2023-04-28 18:30:00','2023-04-28 18:30:00',50),(8,1,72,'BisCafe Coffee Crackers','100g','Britannia',5,600,'2023-04-28 18:30:00','2023-04-28 18:30:00',30),(8,1,73,'RiteBite Choco Chip Cookies','55g','Max Protein',15,300,'2023-04-28 18:30:00','2023-04-28 18:30:00',34),(8,1,74,'Good Day Chocochip Cookies','400g','Britannia',10,400,'2023-04-28 18:30:00','2023-04-28 18:30:00',40),(8,1,75,'Coconut Cookies','200g','Batter Chatter',15,50,'2023-04-28 18:30:00','2023-04-28 18:30:00',20),(8,2,76,'Hearty Brown Bread','400g','Harvest Gold',10,75,'2023-04-28 18:30:00','2023-04-28 18:30:00',11),(8,2,77,'White Bread','700g','Harvest Gold',5,78,'2023-04-28 18:30:00','2023-04-28 18:30:00',10),(8,2,78,'Milk Bread','400g','English Oven',10,50,'2023-04-28 18:30:00','2023-04-28 18:30:00',40),(8,2,79,'Multigrain Bread','400g','English Oven',0,200,'2023-04-28 18:30:00','2023-04-28 18:30:00',7),(8,2,80,'Kulcha','250g','Harvest Gold',0,80,'2023-12-27 18:30:00','2023-12-27 18:30:00',25),(9,1,81,'Masla Noodels','70g','Maggi',0,100,'2023-12-27 18:30:00','2023-12-27 18:30:00',29),(9,1,82,'Masala 2 Minute Instant Noodles','560g','Maggi',0,90,'2023-12-27 18:30:00','2023-12-27 18:30:00',20),(9,1,83,'Ready to Eat Chicken Flavoured Instant Noodles','70g','Wai Wai',0,40,'2023-12-27 18:30:00','2023-12-27 18:30:00',28),(9,1,84,'Magic Masala Instant Noodles','60g','Sunfeast',0,70,'2023-12-27 18:30:00','2023-12-27 18:30:00',50),(9,1,85,'Ramen Masala Noodles','240g','Top',0,1000,'2023-04-28 18:30:00','2023-04-28 18:30:00',7),(9,2,86,'Hara Bhara Kabab','300g','Haldiram\'s',5,70,'2023-04-28 18:30:00','2023-04-28 18:30:00',8),(9,2,87,'Punjabi Samosa','650g','Haldiram\'s',5,300,'2023-04-28 18:30:00','2023-04-28 18:30:00',10),(9,2,88,'Veggie Burger Patty','360g','McCain',5,50,'2023-04-28 18:30:00','2023-04-28 18:30:00',40),(9,2,89,'Veggie Pizza Pocket','340g','ITC Master Chef',5,80,'2023-04-28 18:30:00','2023-04-28 18:30:00',5),(9,2,90,'Vegetable Spring Roll','420g','Goeld',5,60,'2023-04-28 18:30:00','2023-04-28 18:30:00',20),(10,1,91,'Cafe Mocha Ice Cream','125ml','Giani\'s',10,80,'2023-04-28 18:30:00','2023-04-28 18:30:00',40),(10,1,92,'Kesar Pista Ice Cream Stick','70 ml','Grameen',10,100,'2023-12-27 18:30:00','2023-12-27 18:30:00',30),(10,1,93,'Gorumet Silk Chocolate','140ml','Vadilal',10,90,'2023-12-27 18:30:00','2023-12-27 18:30:00',17),(10,1,94,'Chocolate Brown Ice Cream','1l','Amul',10,50,'2023-12-27 18:30:00','2023-12-27 18:30:00',10),(10,1,95,'Double Chocolate Ice Cream','125ml','London Dairy',5,60,'2023-04-28 18:30:00','2023-04-28 18:30:00',49),(10,2,96,'Gems Shaped Chocolates','17g','Cadbury',5,40,'2023-04-28 18:30:00','2023-04-28 18:30:00',60),(10,2,97,'Dairy Milk Chocolate','24g','Cadbury',5,50,'2023-04-28 18:30:00','2023-04-28 18:30:00',40),(10,2,98,'KitKat 4 Finger Wafer Chocolate Bar','38.5g','Nestle',0,30,'2023-04-28 18:30:00','2023-04-28 18:30:00',2),(10,2,99,'Smooth Milk Chocolate','56g','Galaxy',0,20,'2023-04-28 18:30:00','2023-04-28 18:30:00',19),(10,2,100,'Creamy Milk Chocolate Bar','100g','Hershey\'s',0,20,'2023-04-28 18:30:00','2023-04-28 18:30:00',10);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `RequestId` bigint NOT NULL,
  `AdminId` bigint NOT NULL,
  PRIMARY KEY (`AdminId`,`RequestId`),
  KEY `RequestId` (`RequestId`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`AdminId`) REFERENCES `appadmin` (`AdminId`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`RequestId`) REFERENCES `transporterrequests` (`RequestId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,4),(2,2),(3,5),(4,2),(5,1),(6,3),(7,5),(8,5),(9,3),(10,5),(11,5),(12,3),(13,5),(14,1),(15,4),(16,1),(17,5),(18,4),(19,3),(20,1),(21,3),(22,5),(23,1),(24,1),(25,2),(26,1),(27,5),(28,4),(29,1),(30,3),(31,4),(32,3),(34,4),(35,1),(36,2),(37,2),(38,4),(39,4),(40,2),(41,1),(42,4),(43,2),(44,5),(45,3),(46,5),(47,3),(48,4),(49,4),(50,4),(51,5),(52,2),(53,1),(54,3),(55,4),(56,5),(57,3),(58,4),(59,3),(60,1),(61,1),(62,2),(63,3),(64,3),(65,2),(66,2),(67,2),(68,3),(69,3),(70,1),(71,3),(72,5),(73,4),(74,3),(75,5),(76,5),(77,3),(78,3),(79,2),(80,1),(81,5),(82,3),(83,4),(84,3),(85,1),(86,3),(87,5),(88,5),(89,1),(90,1),(91,1),(92,2),(93,3),(94,3);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategory`
--

DROP TABLE IF EXISTS `subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcategory` (
  `CategoryId` bigint NOT NULL,
  `SubCategoryId` bigint NOT NULL,
  `SubCategoryName` varchar(100) NOT NULL,
  PRIMARY KEY (`CategoryId`,`SubCategoryId`),
  UNIQUE KEY `SubCategoryName` (`SubCategoryName`),
  CONSTRAINT `subcategory_ibfk_1` FOREIGN KEY (`CategoryId`) REFERENCES `category` (`CategoryId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategory`
--

LOCK TABLES `subcategory` WRITE;
/*!40000 ALTER TABLE `subcategory` DISABLE KEYS */;
INSERT INTO `subcategory` VALUES (8,2,'Bread'),(2,2,'Butter&More'),(4,1,'Chips'),(10,2,'Chocolate'),(7,2,'Coffee'),(8,1,'Cookies&Biscuit'),(6,2,'Dal'),(9,2,'Frozen Snacks'),(1,2,'Fruits'),(10,1,'IceCream'),(3,1,'InstantFood&Mixes'),(5,2,'Juices'),(2,1,'Milk'),(4,2,'NamkeenSnacks'),(9,1,'Noodles'),(6,1,'Rice'),(3,2,'Sausage&Hams'),(5,1,'SoftDrinks'),(7,1,'Tea'),(1,3,'test'),(1,1,'Vegetables');
/*!40000 ALTER TABLE `subcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transporter`
--

DROP TABLE IF EXISTS `transporter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transporter` (
  `TransporterId` bigint NOT NULL AUTO_INCREMENT,
  `Username` varchar(50) NOT NULL,
  `UserPassword` varchar(100) NOT NULL DEFAULT '1234',
  `User_FirstName` varchar(100) NOT NULL,
  `User_MiddleName` varchar(100) DEFAULT NULL,
  `User_LastName` varchar(100) DEFAULT NULL,
  `PhoneNumber` bigint NOT NULL,
  `ActiveStatus` tinyint NOT NULL DEFAULT '0',
  `AadharNumber` bigint DEFAULT NULL,
  `DrivingLicenseNumber` bigint NOT NULL,
  `CurrentActiveOrders` int NOT NULL DEFAULT '0',
  `PresentSalary` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`TransporterId`),
  UNIQUE KEY `TransporterId` (`TransporterId`),
  UNIQUE KEY `Username` (`Username`),
  UNIQUE KEY `PhoneNumber` (`PhoneNumber`),
  UNIQUE KEY `DrivingLicenseNumber` (`DrivingLicenseNumber`),
  UNIQUE KEY `AadharNumber` (`AadharNumber`),
  CONSTRAINT `chk_Password` CHECK ((not((`UserPassword` like _utf8mb4'%[^A-Z]%')))),
  CONSTRAINT `transporter_chk_1` CHECK ((`PhoneNumber` between 1000000000 and 9999999999)),
  CONSTRAINT `transporter_chk_2` CHECK (((`ActiveStatus` >= 0) and (`ActiveStatus` <= 1))),
  CONSTRAINT `transporter_chk_3` CHECK ((`AadharNumber` between 200000000000 and 999999999999))
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transporter`
--

LOCK TABLES `transporter` WRITE;
/*!40000 ALTER TABLE `transporter` DISABLE KEYS */;
INSERT INTO `transporter` VALUES (1,'UribegoJD','fVx4Rtvs','Rayven','Dobbins','Newby',9988776654,0,620344729904,7319482713948,1,34029),(2,'urs5ta1ke1q','2E4xLnyK','Landon','','Alfonso',9321023421,0,751002290886,8902574309621,10,58672),(3,'o2g1a2n2ySE','zHBmE6tS','Stewart','','Reno',9836542356,0,956711978104,6138200497543,0,95748),(4,'SvirgedaOq','bge36Jm5','Bonnie','Billingsley','Hanlon',9876543210,0,477738049130,2406843150892,2,42387),(5,'hcklcipFP','9x9m2cUR','Mitchell','','Toby',9178901234,0,785526909331,9482017430256,3,71896),(6,'sperrurgeGa','TACaUf2j','Felicity','','DeJesus',9658741258,0,247861601719,3627490128405,10,87402),(7,'trimablogJF','KARqqZ5U','Kyron','Conner','Pool',9765432190,0,748503021934,8291645302817,10,23957),(8,'propincXW','Yatr7z7t','Kavon','Kirby','Kenan',9955667788,0,873764501254,5728930164850,1,68723),(9,'FagliettiOy','s9NCxjRn','Baby','','Michael',9820037200,0,332299050374,4936728159301,0,53016),(10,'tan2t1elBc','7NJch7Dt','Guy','Stevens','Stubbs',9966778899,0,846604670004,1405682938749,10,96241),(11,'coinvoltoWt','3ZgP3UJn','Lane','','Karson',9898989897,0,463123261034,9813240657420,7,37486),(12,'ffs1963AB','ALjCTxH3','Davonte','Oates','Butler',9812345678,0,206645507574,2758430912650,10,80957),(13,'trillunumSc','fpXmfMM8','Kinsey','Poirier','Maria',9988776655,0,754665107343,6031957249382,0,27541),(14,'kazakhnQ','SSpbS5wh','Melina','Cagle','Stormy',9700012345,0,385417720381,4109853670194,6,49635),(15,'stampkarEM','GHbMu9D9','Harlie','Bertrand','Stormy',9820023456,0,441829390739,8096315273456,3,73690),(16,'MirijelloMt','T6pWV5ZK','Essence','McDowell','Amberly',9898989898,0,906682752355,9281673051940,3,88214),(17,'SesuluKT','sx2ZHP7j','Adan','','Bradford',9555555555,0,587376121263,4720369512843,10,65403),(18,'Aboudan5y','2QBd8x26','Carl','','Cyr',9833355555,0,834824254348,7631984250674,0,29358),(19,'venetiellaXs','5ZDmtbVb','Katharine','Connell','Sims',9167200022,0,936501615927,2917340568214,3,59107),(20,'demararemx','5nvY5ED5','Milo','Hatton','Jordi',9821161193,1,777027744167,6058349721301,4,17469),(21,'namerG7','A6VYx8YM','Kent','Handley','Dominique',9876543211,1,358601693021,8402951632570,1,42786),(22,'Bergedorfsw','tfjaF6xA','Kaylea','Farrow','Alanna',9876543212,0,987722535277,6132579402184,3,60315),(23,'atributIB','MXUgs2Qq','Brooklyn','','Kelsi',9845112345,1,711085933826,3059184762095,2,91983),(24,'dymarkabw','P9T8vTvx','Jazlynn','','Desai',9867543210,0,467596970660,1759064829340,1,38675),(25,'milkoat8z','8tHr3GEA','Jazmyn','Ashby','Reedy',9923658741,0,567143701232,4501832975681,0,75826),(26,'razsoljenTH','4b26gbG7','Sunny','Acuna','Brooke',9711212121,0,214834338764,2903158740658,2,52438),(27,'kutijamaLK','zYuBSvz5','Magali','Womack','Brooklynn',9922266666,1,809752263109,9624305813479,1,96184),(28,'blewynnwndw','e7NB7A4b','Bret','Dill','Trystan',9922543210,1,876398504861,5840197362051,0,34502),(29,'avtomobilum','V7a9hR3J','Aryana','Coburn','Gabriella',9811066666,0,662841994390,3182095740635,3,68716),(30,'hawdalaw3','UZx83JAH','Elana','','Mona',9717733333,0,318849622998,2391586073412,1,92841),(31,'RaguthrK','mUcv83vV','Jaleel','','French',9818022222,1,393675192540,6742185039815,0,27963),(32,'lealtyevoroWT','sb4TsmSZ','Collin','','VanHorn',9810888888,1,947178064172,1082593476152,2,53970),(33,'alain49XX','QKPfCc5R','Dominik','Barnes','Bacon',9716644444,1,360726545069,5374816290735,3,81072),(34,'nimlalelebq','wBsnhLP7','Clayton','Rodriguez','Tye',9811161116,0,236358508829,2801345968721,1,16928),(35,'usesTG','9bynZsen','Joanna','','Amy',9818141414,0,817192209946,8450261973450,2,72938),(36,'gegratetho','98muyRcQ','Kaitlyn','','Guy',9717474747,0,603663695964,1968420375892,0,27463),(37,'jtnauske4','A4eH78ht','Dallin','','Hodge',9818272727,1,632239965825,9814306572945,3,96470),(38,'utskjemdRn','Hf3gvJSZ','Javion','Gillette','Mortensen',9818404040,1,883889439707,7509843167290,2,42608),(39,'eichenUD','d7YSbuQq','Ruth','Ferrara','Sheyla',9818838383,1,528514956987,3206871594382,0,69482),(40,'RatCauraBafxN','j8u39TXm','Anya','','Tatyanna',9818181818,0,581584294072,5928173640518,1,51370),(41,'abuhatmY','CLBfA4re','Darrien','','Wayne',9821616161,0,236432022784,4087659321487,3,83912),(42,'Groorcetae6','fw2HWrmd','Siera','Somers','Lott',9821787878,1,903133703269,7328410597386,0,67094),(43,'einvaldurg4','a4Cb3WgZ','Ryan','Finch','Jalen',9821303031,0,840087797106,5062498730512,1,23476),(44,'HemnskjelOT','EK2R5Jmv','Oscar','','Cristian',9821212122,0,720599936427,8290763154921,2,46982),(45,'iessanjoseqG','B69bKYZn','Cory','Estep','Bateman',9821081081,0,280470397882,7139582401650,3,58712),(46,'Iral4v','c9Qm5yaS','Mitchell','','Jarvis',9821818181,1,828497088288,9214075630892,2,39851),(47,'xoxofresaxoxo7H','Bkrr3FA9','Jack','','Kuntz',9821606060,0,918697284386,4689230715682,1,71986),(48,'esgremivap3','Qv3RbRxS','Julianne','','Langley',9821383838,1,523942768035,8274056193871,0,85247),(49,'eviluncletonyjV','TAjdP6Sx','Stone','','Petersen',9821191915,1,983811666677,6948170352804,2,31295),(50,'meenuuhoT','u52R43J3','Ellen','Elizondo','Schumacher',9821313131,0,890307726302,5814206938740,1,68436),(51,'siedwyrqH','jFcRg34S','Xzavier','Hannah','Lester',9821333333,0,952130825252,2098574631528,0,17692),(52,'BendelinDH','b5Ck5bR8','Lucille','Coughlin','Elisabeth',9821575857,0,994167303237,9378410652930,3,54970),(53,'dilapidiKP','X9RYMEtt','Colton','','Titus',9821393939,1,236546141426,6718435920751,1,81427),(54,'alitokewafI','ZAGg9NTw','Makala','Shen','Murillo',9821050505,1,398048882567,3845296107543,0,49185),(55,'lametatwa','TL3eJ39s','Mikaela','','Jaidyn',9821979797,0,656354096127,9463012578340,3,93570),(56,'megan3nyifQ','ZtZ9bKVK','Aliya','','Epstein',9821040404,0,239613605296,3274159684021,2,28641),(57,'sembahanOx','McVkUdz4','Michele','Oldham','Madrid',9821535354,1,579794955101,4581309267410,1,64719),(58,'wonyErroroucttN','YSSWj7GR','Alison','','Layla',9821373738,0,574856358480,1039574821065,2,80275),(59,'handgripVn','MLFWmJ5f','Alysha','','Falk',9821020202,1,765690715904,7891462503182,0,38296),(60,'haitapata1V','UV6mQPrd','Ryland','Godwin','Holliday',9821444444,1,347405187293,5263198740598,3,91237),(61,'DurdisMc','zf8C3FCX','Zoie','Ricker','Candice',9821464646,1,684772056870,4709831265081,0,26743),(62,'ultimorayocl','ZTeEkJh2','Anne','French','Stephany',9821222222,0,434258844950,8926054173196,2,43581),(63,'opasnijomBa','r9uExFgH','Jacoby','Brandt','Matteo',9821545454,0,622556838721,1836497025480,1,57903),(64,'CinnaS','5cKd6EhD','Mikael','Hulsey','Coleman',9821363636,1,794616603930,5291046837152,3,75916),(65,'arteydeseoE1','4MdcpBB4','Karyme','','Ayesha',9821292929,1,269558657393,7301958462109,1,24378),(66,'ghettobeckyz1','emKQ3g5B','Hattie','','Page',9821515151,1,962038050220,8690421350793,0,69750),(67,'NebennamenL','LJKdVH3T','Kasey','','Dill',9821424242,0,225890798372,1048539620715,2,58632),(68,'hardshipxx','2nMJb3z6','Brent','Guerrero','Hacker',9821262628,0,779105691737,6412890375248,3,93506),(69,'capantaED','3cBXN28g','Wilson','Hanlon','Julien',9821282828,1,291634103223,3079468250198,1,43097),(70,'dilapidioO','6KmmRX4T','Aurora','McCallum','Mickayla',9821565656,1,307139711033,7254069315482,0,71863),(71,'bryteiq0','t2De5YGy','Bowen','Cisneros','George',9821202020,1,585547535626,9562138470520,2,15408),(72,'VecchiayT','N2CXUbGc','Gonzalo','','Latrell',9821232323,0,351432205014,2948503617059,0,36281),(73,'WoosmerSx','5tX9utAZ','Maximus','','Whitt',9821343434,0,726381755584,6781045293185,1,81946),(74,'funsoleilvj','JA7sjqpU','Carley','Berry','Lindberg',9821555555,0,425819122818,1409265837094,3,53609),(75,'Scelpepelrykm','9ra7tLbZ','Keshawn','','Brennan',9821595959,0,512937856655,3905278160345,7,94617),(76,'Jakasha1M','w49F57Js','Colt','Coble','Pino',9821242424,1,839015516408,8436501924758,0,18536),(77,'kinghakimHm','nZu89Mhp','Ashli','Paxton','Avery',9821272727,0,259285406417,5264190830715,1,73059),(78,'ngitholaD9','9H78Vpd4','Julius','','Edmund',9821414141,1,428257187253,2984750361294,2,34980),(79,'siberianorH','GE9vbwBJ','Braxton','Gilman','Lindley',9821494950,1,774435244370,6139705284135,3,91275),(80,'szintagmaHA','yvrKNeX8','Linnea','Browne','Tea',9821404040,0,695301530086,9708352618401,1,59824),(81,'geminimodel9r','2GGZtL8a','Karina','Ogle','Magaly',9821505050,0,672390975202,1802649357814,0,87610),(82,'OfsjenG8','sExFpPa7','Heaven','Downs','Billie',9821454545,0,461847404242,7623049185301,3,61357),(83,'kornelijuVd','x2q2ajhN','Lexie','Llamas','Jolene',9821525252,1,573136511216,4807153698240,2,41568),(84,'dvokla62','t7b5HLUJ','Alexandrea','','Laken',9821303030,1,385621263826,9230741568094,1,92085),(85,'Zehenringe6','DmaD4fHc','Fernando','Wolford','Faulkner',9821474747,1,671155981912,82746391528374,3,27691),(86,'matinu3L','MWZRn6Qx','Morgan','','Dante',9821585858,1,285465619346,61940573829740,0,50924),(87,'scuide5X','rDT4EKty','Greyson','','Roth',9821191919,0,654275601363,57382019563248,2,77108),(88,'carlaherebr','kbQHWUD2','Allie','Dietrich','Strain',9821212121,0,820686072574,84920631758492,1,35691),(89,'mjasusieK','rx7GX2Ck','Carrie','Finney','Kassie',9821373737,0,845384407707,39284051693750,3,94058),(90,'mandajayneXI','E3zML4Qg','Stuart','','Javonte',9821262626,1,712326883989,10624830571986,0,73829),(91,'loinid28','bGLs27MT','Abram','Howard','Bock',9821494949,1,423956947215,73495821630457,2,12378),(92,'elblogdeleoCC','es6vHyGZ','Raquel','Peoples','Krista',9821434343,1,315324571860,49102368752619,1,67249),(93,'KutasPs','yFUMNC3D','Niya','Rangel','Shayna',9821535353,0,888888888888,27580491362845,0,58107),(94,'te3t2tl','V5ppguxE','Hanna','','Shreya',9821575757,0,777777777777,84671509362851,3,89014),(95,'anbruddAS','EVf7qEWQ','Kennedy','','Diamond',8008008008,1,666666666666,90743125869042,1,30751),(96,'beautycorsets3H','a9KWAVC3','Tyra','','McIntire',7007007007,1,555555555555,50298617345068,2,94860),(97,'precyzjaBd','qne56Z8G','Skyler','','Hidalgo',6006006006,0,444444444444,31847592685019,0,48236),(98,'blolvemorTF','9PaPd6Sz','Rowan','','Jiang',5005005005,0,989898989898,68013957248109,3,71905),(99,'mayhemkidSF','zbyAQk6k','Presley','','Almeida',4004004004,0,787878787878,96581704325786,2,16572),(100,'marxel39IM','x6AB4QCz','Terrence','','Bernal',9009009009,1,656565656565,78430921650972,1,85390),(101,'Katerina93','1234','Katerina','','Rutledge',8392392153,0,450898214495,924771090487,0,0),(104,'Rohan114','1234','Rohan','Singh','Pathan',9570223862,0,NULL,7748,0,0),(105,'Elise95','1234','Elise','Kiser','Sage',9164354494,0,218292455547,309017807472,0,0),(106,'Sahil124','1234','Sahil','Carpenter','Jovany',8888109045,0,810441968207,746304964401,0,23400);
/*!40000 ALTER TABLE `transporter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transporter_companyname`
--

DROP TABLE IF EXISTS `transporter_companyname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transporter_companyname` (
  `TransporterId` bigint NOT NULL,
  `CompanyName` varchar(100) DEFAULT NULL,
  KEY `TransporterId` (`TransporterId`),
  CONSTRAINT `transporter_companyname_ibfk_1` FOREIGN KEY (`TransporterId`) REFERENCES `transporter` (`TransporterId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transporter_companyname`
--

LOCK TABLES `transporter_companyname` WRITE;
/*!40000 ALTER TABLE `transporter_companyname` DISABLE KEYS */;
INSERT INTO `transporter_companyname` VALUES (1,'Uber'),(1,'Ola'),(2,'Uber'),(3,'Zomato'),(4,'Zomato'),(4,'Ola'),(5,'Uber'),(6,'Uber'),(7,NULL),(8,NULL),(9,NULL),(10,NULL),(11,NULL);
/*!40000 ALTER TABLE `transporter_companyname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transporter_salary`
--

DROP TABLE IF EXISTS `transporter_salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transporter_salary` (
  `TransporterId` bigint NOT NULL,
  `Salary` float DEFAULT NULL,
  KEY `TransporterId` (`TransporterId`),
  CONSTRAINT `transporter_salary_ibfk_1` FOREIGN KEY (`TransporterId`) REFERENCES `transporter` (`TransporterId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transporter_salary`
--

LOCK TABLES `transporter_salary` WRITE;
/*!40000 ALTER TABLE `transporter_salary` DISABLE KEYS */;
INSERT INTO `transporter_salary` VALUES (1,10300),(1,10030),(2,1000),(3,1000),(4,10100),(4,10003),(5,10050),(7,NULL),(7,NULL),(8,NULL),(9,NULL),(11,NULL),(11,NULL);
/*!40000 ALTER TABLE `transporter_salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transporter_years`
--

DROP TABLE IF EXISTS `transporter_years`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transporter_years` (
  `TransporterId` bigint NOT NULL,
  `Years` int NOT NULL DEFAULT '0',
  KEY `TransporterId` (`TransporterId`),
  CONSTRAINT `transporter_years_ibfk_1` FOREIGN KEY (`TransporterId`) REFERENCES `transporter` (`TransporterId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transporter_years`
--

LOCK TABLES `transporter_years` WRITE;
/*!40000 ALTER TABLE `transporter_years` DISABLE KEYS */;
INSERT INTO `transporter_years` VALUES (1,2),(1,2),(2,2),(3,2),(4,2),(4,3),(5,2),(6,2),(7,0),(8,0),(9,0),(10,0),(11,0);
/*!40000 ALTER TABLE `transporter_years` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transporterrequests`
--

DROP TABLE IF EXISTS `transporterrequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transporterrequests` (
  `RequestId` bigint NOT NULL AUTO_INCREMENT,
  `User_FirstName` varchar(100) NOT NULL,
  `User_MiddleName` varchar(100) DEFAULT NULL,
  `User_LastName` varchar(100) DEFAULT NULL,
  `PhoneNumber` bigint NOT NULL,
  `AadharNumber` bigint DEFAULT NULL,
  `DrivingLicenseNumber` bigint NOT NULL,
  `RequestStatus` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`RequestId`),
  UNIQUE KEY `RequestId` (`RequestId`),
  UNIQUE KEY `PhoneNumber` (`PhoneNumber`),
  UNIQUE KEY `DrivingLicenseNumber` (`DrivingLicenseNumber`),
  UNIQUE KEY `AadharNumber` (`AadharNumber`),
  CONSTRAINT `transporterrequests_chk_1` CHECK ((`PhoneNumber` between 1000000000 and 9999999999)),
  CONSTRAINT `transporterrequests_chk_2` CHECK ((`AadharNumber` between 200000000000 and 999999999999)),
  CONSTRAINT `transporterrequests_chk_3` CHECK (((`RequestStatus` >= 0) and (`RequestStatus` <= 2)))
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transporterrequests`
--

LOCK TABLES `transporterrequests` WRITE;
/*!40000 ALTER TABLE `transporterrequests` DISABLE KEYS */;
INSERT INTO `transporterrequests` VALUES (1,'Savanah','Mcafee','Azaria',7152045150,979092681363,384723759131,0),(2,'Kurtis','','Petty',8806836258,511886419624,593855021632,0),(3,'Analisa','','Carbone',8830552738,367544511691,278766482001,0),(4,'Clarence','Golden','Rashad',8253588942,913292788373,656908816857,1),(5,'Hernan','','Armenta',9094249801,646153801083,900619513489,1),(6,'Ashton','Pence','Zachary',9010743220,613118109678,956885475189,0),(7,'Elisha','','Sommers',9931578201,927208345025,674691723941,1),(8,'Kirstin','','Cagle',9248228511,435953590229,207476026784,1),(9,'Mara','','Toney',7483956162,681485039403,565778128241,0),(10,'Luc','','Michel',9082842976,870336810250,132455570033,0),(11,'Aditya','','Alonzo',8740067251,910191104495,808513310452,1),(12,'Trevin','Atwell','Roland',8979497550,817779231174,132828215010,1),(13,'Ciera','','Desantis',7243122437,828315587771,796876921319,0),(14,'Dallin','Bittner','Deonte',8243732592,737565504932,150962436430,0),(15,'Kent','Feeney','Carlo',9038266324,237902497409,984407441528,1),(16,'Katia','','Vickers',9054159929,651395976602,739858432435,1),(17,'Cathy','Jolly','Brooke',8575422450,900610197974,466083306538,0),(18,'Devyn','','Chester',7522299829,801402800088,671162763631,0),(19,'Rolando','','Singer',8585175681,239324709470,602914229680,1),(20,'Misty','Graf','Maiya',9279104062,490183243106,498915595707,0),(21,'Imari','Mast','Karly',7267574132,736256811296,649738118037,1),(22,'Maranda','Gibson','Halle',8251325229,246568958437,721126233152,0),(23,'Melanie','','Ferris',7538037078,851433327431,928572556327,1),(24,'Cooper','Putnam','Ronnie',8168671008,500531635449,784194103834,1),(25,'Abigail','Willett','Kinsey',9646813106,222998651592,617770739385,0),(26,'Harvey','','Wheaton',9222667721,499036207957,245475563314,1),(27,'Layla','Chiu','Cathy',7250936807,487068006565,516129295910,1),(28,'Kristian','Malley','Ayesha',9256571504,566863584643,827661010119,0),(29,'Lazaro','','Hobson',7978084612,728664755158,374852789127,0),(30,'Tobias','Garay','Joe',8587282743,624480035991,171152134508,1),(31,'Giovanni','','Meyers',8892901253,210075129561,223150935787,0),(32,'Dominic','','Murphy',9523074407,661212762746,741370265686,0),(34,'Mikaela','Vo','Kallie',8090101534,490016040285,386957078383,1),(35,'Jala','Earley','Hailie',8771067148,304051225098,642022783224,1),(36,'Andrea','','Houck',7465512205,973137036592,414661588660,0),(37,'Warren','','Douglas',7121380136,362710026884,909723824724,1),(38,'Tobias','','Wingate',9396189172,262807866306,605158027600,0),(39,'Ethan','','Tyler',7958824776,849832696678,648273683839,0),(40,'Giovanna','','Vidal',8908389274,300841290620,965444639288,1),(41,'Yazmin','','Scherer',9982539393,244841102908,297213449808,1),(42,'Ayana','','Goodman',7058861004,319017418218,692262643684,0),(43,'Pamela','Hope','Annmarie',7796019262,867667503204,204856345397,1),(44,'David','','Andrade',8989074066,613706782531,332850045377,0),(45,'Deangelo','Younger','Paris',8086655705,273941115866,467418171443,1),(46,'Curtis','','Lance',8635807214,802634319328,887605407834,0),(47,'Mariel','','Scanlon',7649804851,224393587973,900918933954,1),(48,'Isabella','Wolford','Rosalie',8652022695,329498210888,774913630600,0),(49,'Dontae','','Andrade',8842779816,607631728439,764887836723,2),(50,'Spencer','Tamayo','Aubrey',7508573171,918918310729,277254590575,1),(51,'Heidy','','Hunt',7722134441,864374062537,926096280142,0),(52,'Lynette','','Cecil',9694284668,313078048751,791711574932,2),(53,'Shayna','Douglas','Bailee',8258816860,815216566836,992288358248,1),(54,'Saige','Harder','Domonique',8600127048,382201978360,709620206708,0),(55,'Betty','Van','Brigid',7422060054,762785813204,747661770672,0),(56,'Adrian','Arias','Jefferson',9775393870,826915041191,982499173453,2),(57,'Desmond','Johnston','Abner',7583352713,452807228829,221554299168,1),(58,'Semaj','Kitchens','Jasper',7547573393,340645966206,253176228511,2),(59,'Sahil','','Harms',9945389440,863438098180,918759172738,0),(60,'Cornelius','Riddle','Desean',8966859699,865369138852,361064938331,2),(61,'Treyton','Browne','Stefan',9728674371,203559127347,953277898959,0),(62,'Morgan','','Provost',8567139127,893831841820,700225118560,2),(63,'Brayan','','McDaniel',8689204589,415829158533,920171054927,1),(64,'Alena','','Orr',8723352839,885576506901,386320267161,2),(65,'Payne','','Reddy',9149049618,894325214611,649450973823,1),(66,'Dorian','','Salcido',7227639230,330959303769,258852965136,0),(67,'April','','Samuel',8456284826,653559664666,753517105816,2),(68,'Sahil','Landis','Brendon',8672324966,600158747317,655826780100,1),(69,'Noah','Keaton','Adan',8037494107,696466058182,395558929459,1),(70,'Erykah','','Shields',7036842127,676047362152,994000915035,0),(71,'Shannon','','Kennedy',7420672200,947126648098,254601625333,2),(72,'Khalil','','Roberts',8617446885,743733198559,814268873490,0),(73,'Rylee','','Berger',9131594840,873198541845,470988329055,1),(74,'Kian','Pulido','Jacob',9470487050,649884061287,494701106052,2),(75,'Gary','','Chaffin',9263959491,909016035229,739210414412,2),(76,'Brenda','Roth','Shaina',7795945122,591698434063,425024103706,0),(77,'Drew','','Putman',8923105102,998252965363,745839449277,1),(78,'Christin','','Hope',9675626130,541250543523,743207877987,2),(79,'Rene','','Parson',7368332603,833445850996,794523847161,2),(80,'Brayden','','Wayne',8114320048,819294032481,473324935539,1),(81,'Mckenzie','','Kilpatrick',9336296506,915880729082,546416619610,0),(82,'Adrian','','Goff',7026896569,416722246808,528724262575,2),(83,'Dexter','','Ricks',9324113381,661709421499,239425949108,2),(84,'Jaxson','Thacker','Jessie',7577274610,705353065687,149291335927,1),(85,'Nia','Burks','Tara',7881044519,276339456928,357179346754,2),(86,'Maira','','Stone',7114476750,559391034470,220645701764,0),(87,'Audra','Shepherd','Briana',8322752494,345866286737,378453696501,2),(88,'Braydon','Regalado','Elijah',8086820966,210886727022,906640097505,1),(89,'Leann','Yoo','Julianna',7059711690,499751248717,928093182535,2),(90,'Helen','','Centeno',8744839717,305053436796,655180043384,0),(91,'Jaleel','Pritchett','Deion',8301407325,239849193558,711829996423,2),(92,'Kenna','Delacruz','Cameryn',8971634664,433230403601,403787465280,1),(93,'Katerina','','Rutledge',8392392153,450898214495,924771090487,1),(94,'Kacie','','Ireland',8745029189,758918667158,925212831209,1);
/*!40000 ALTER TABLE `transporterrequests` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `del_and_insert_req` BEFORE DELETE ON `transporterrequests` FOR EACH ROW BEGIN
if old.RequestStatus =1 THEN
INSERT INTO Transporter(UserName,User_FirstName,User_MiddleName,User_LastName,PhoneNumber,AadharNumber,DrivingLicenseNumber)
SELECT CONCAT(User_FirstName,RequestId), User_FirstName, User_MiddleName,User_LastName,PhoneNumber,AadharNumber,DrivingLicenseNumber
FROM TransporterRequests
WHERE RequestId = OLD.RequestId;
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `transporterrequests_companyname`
--

DROP TABLE IF EXISTS `transporterrequests_companyname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transporterrequests_companyname` (
  `RequestId` bigint NOT NULL,
  `CompanyName` varchar(100) DEFAULT NULL,
  KEY `RequestId` (`RequestId`),
  CONSTRAINT `transporterrequests_companyname_ibfk_1` FOREIGN KEY (`RequestId`) REFERENCES `transporterrequests` (`RequestId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transporterrequests_companyname`
--

LOCK TABLES `transporterrequests_companyname` WRITE;
/*!40000 ALTER TABLE `transporterrequests_companyname` DISABLE KEYS */;
INSERT INTO `transporterrequests_companyname` VALUES (1,'Uber'),(1,'Ola'),(2,'Uber'),(3,'Zomato'),(4,'Zomato'),(4,'Ola'),(5,'Uber'),(6,'Uber'),(7,NULL),(8,NULL),(9,NULL),(10,NULL),(11,NULL),(11,NULL);
/*!40000 ALTER TABLE `transporterrequests_companyname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transporterrequests_salary`
--

DROP TABLE IF EXISTS `transporterrequests_salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transporterrequests_salary` (
  `RequestId` bigint NOT NULL,
  `Salary` float DEFAULT NULL,
  KEY `RequestId` (`RequestId`),
  CONSTRAINT `transporterrequests_salary_ibfk_1` FOREIGN KEY (`RequestId`) REFERENCES `transporterrequests` (`RequestId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transporterrequests_salary`
--

LOCK TABLES `transporterrequests_salary` WRITE;
/*!40000 ALTER TABLE `transporterrequests_salary` DISABLE KEYS */;
INSERT INTO `transporterrequests_salary` VALUES (1,10300),(2,1000),(2,1000),(4,10100),(4,10100),(4,10003),(5,10050),(7,NULL),(7,NULL),(9,NULL),(10,NULL),(10,NULL),(11,NULL),(11,NULL);
/*!40000 ALTER TABLE `transporterrequests_salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transporterrequests_years`
--

DROP TABLE IF EXISTS `transporterrequests_years`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transporterrequests_years` (
  `RequestId` bigint NOT NULL,
  `Years` int DEFAULT NULL,
  KEY `RequestId` (`RequestId`),
  CONSTRAINT `transporterrequests_years_ibfk_1` FOREIGN KEY (`RequestId`) REFERENCES `transporterrequests` (`RequestId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transporterrequests_years`
--

LOCK TABLES `transporterrequests_years` WRITE;
/*!40000 ALTER TABLE `transporterrequests_years` DISABLE KEYS */;
INSERT INTO `transporterrequests_years` VALUES (1,2),(1,2),(2,2),(3,2),(4,2),(4,3),(5,2),(6,2),(7,NULL),(8,NULL),(9,NULL),(10,NULL),(11,NULL);
/*!40000 ALTER TABLE `transporterrequests_years` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'flying_groceries'
--

--
-- Dumping routines for database 'flying_groceries'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-13 12:22:56
