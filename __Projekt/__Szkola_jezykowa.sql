CREATE DATABASE  IF NOT EXISTS `projekt_szkola_jezykowa` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `projekt_szkola_jezykowa`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: projekt_szkola_jezykowa
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.16-MariaDB

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
-- Table structure for table `archiwum_klas`
--

DROP TABLE IF EXISTS `archiwum_klas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `archiwum_klas` (
  `id` int(5) DEFAULT NULL,
  `nazwa` varchar(45) DEFAULT NULL,
  `data_rozpoczecia` date DEFAULT NULL,
  `data_zakonczenia` date DEFAULT NULL,
  `cena` int(10) DEFAULT NULL,
  `id_nauczyciela` int(5) DEFAULT NULL,
  `id_kursu` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archiwum_klas`
--

LOCK TABLES `archiwum_klas` WRITE;
/*!40000 ALTER TABLE `archiwum_klas` DISABLE KEYS */;
/*!40000 ALTER TABLE `archiwum_klas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `klasa`
--

DROP TABLE IF EXISTS `klasa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `klasa` (
  `id` int(5) NOT NULL,
  `nazwa` varchar(45) NOT NULL,
  `data_rozpoczecia` date NOT NULL,
  `data_zakonczenia` date NOT NULL,
  `cena` int(10) NOT NULL,
  `id_nauczyciela` int(5) NOT NULL,
  `id_kursu` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_kursu` (`id_kursu`),
  KEY `id_nauczyciela` (`id_nauczyciela`),
  CONSTRAINT `klasa_ibfk_1` FOREIGN KEY (`id_kursu`) REFERENCES `kurs` (`id`),
  CONSTRAINT `klasa_ibfk_2` FOREIGN KEY (`id_nauczyciela`) REFERENCES `nauczyciel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klasa`
--

LOCK TABLES `klasa` WRITE;
/*!40000 ALTER TABLE `klasa` DISABLE KEYS */;
INSERT INTO `klasa` VALUES (1,'Angielski (Podstawowy)','2019-09-02','2021-06-25',1899,2,1),(2,'Angielski (Zaawansowany)','2021-01-10','2021-06-25',949,2,6),(3,'Hiszpanski (Sredniozaawansowany)','2020-06-01','2020-08-28',899,1,15),(4,'Japonski (Sredniozaawansowany)','2020-06-26','2020-08-28',1599,4,28),(5,'Francuski (Podstawowy)','2020-01-12','2020-05-29',999,5,20),(6,'Niemiecki (Zaawansowany)','2020-09-07','2020-12-21',1399,3,11);
/*!40000 ALTER TABLE `klasa` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER archiwum_klasy
BEFORE DELETE ON klasa
FOR EACH ROW
BEGIN
INSERT INTO archiwum_klas
SELECT id,nazwa,data_rozpoczecia,data_zakonczenia,cena,id_nauczyciela,id_kursu
FROM klasa
WHERE id=old.id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `klasa_student`
--

DROP TABLE IF EXISTS `klasa_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `klasa_student` (
  `id` int(5) NOT NULL,
  `id_klasy` int(5) NOT NULL,
  `id_studenta` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_studenta` (`id_studenta`),
  KEY `id_klasy` (`id_klasy`),
  CONSTRAINT `klasa_student_ibfk_1` FOREIGN KEY (`id_studenta`) REFERENCES `student` (`id`),
  CONSTRAINT `klasa_student_ibfk_2` FOREIGN KEY (`id_studenta`) REFERENCES `klasa` (`id`),
  CONSTRAINT `klasa_student_ibfk_3` FOREIGN KEY (`id_klasy`) REFERENCES `klasa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klasa_student`
--

LOCK TABLES `klasa_student` WRITE;
/*!40000 ALTER TABLE `klasa_student` DISABLE KEYS */;
INSERT INTO `klasa_student` VALUES (1,2,1),(2,1,4),(3,4,5),(4,6,6),(5,3,3),(6,4,3),(7,5,2);
/*!40000 ALTER TABLE `klasa_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kurs`
--

DROP TABLE IF EXISTS `kurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kurs` (
  `id` int(5) NOT NULL,
  `nazwa_id` int(5) NOT NULL,
  `poziom_id` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nazwa_id` (`nazwa_id`),
  KEY `poziom_id` (`poziom_id`),
  CONSTRAINT `kurs_ibfk_1` FOREIGN KEY (`nazwa_id`) REFERENCES `nazwa_kurs` (`id`),
  CONSTRAINT `kurs_ibfk_2` FOREIGN KEY (`poziom_id`) REFERENCES `poziom_kurs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kurs`
--

LOCK TABLES `kurs` WRITE;
/*!40000 ALTER TABLE `kurs` DISABLE KEYS */;
INSERT INTO `kurs` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,2,1),(8,2,2),(9,2,3),(10,2,4),(11,2,5),(12,2,6),(13,3,1),(14,3,2),(15,3,3),(16,3,4),(17,3,5),(18,3,6),(19,4,1),(20,4,2),(21,4,3),(22,4,4),(23,4,5),(24,4,6),(25,5,1),(26,5,2),(27,5,3),(28,5,4),(29,5,5),(30,5,6);
/*!40000 ALTER TABLE `kurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nauczyciel`
--

DROP TABLE IF EXISTS `nauczyciel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nauczyciel` (
  `id` int(5) NOT NULL,
  `imie` varchar(45) NOT NULL,
  `nazwisko` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `numer_telefonu` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nauczyciel`
--

LOCK TABLES `nauczyciel` WRITE;
/*!40000 ALTER TABLE `nauczyciel` DISABLE KEYS */;
INSERT INTO `nauczyciel` VALUES (1,'David','Calle','d.calle@gmail.com','963852741'),(2,'Raymond','Chambers','chambersr@outlook.com','123654789'),(3,'Marie-Christine','Ghanbari Jahromi','mcghanbari@gmail.com','321456987'),(4,'Hisao','Kibune','his.kabune@gmail.com','357159862'),(5,'Bernadette','Rego','bernadette.rego@gmail.com','867384910');
/*!40000 ALTER TABLE `nauczyciel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nazwa_kurs`
--

DROP TABLE IF EXISTS `nazwa_kurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nazwa_kurs` (
  `id` int(5) NOT NULL,
  `nazwa` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nazwa_kurs`
--

LOCK TABLES `nazwa_kurs` WRITE;
/*!40000 ALTER TABLE `nazwa_kurs` DISABLE KEYS */;
INSERT INTO `nazwa_kurs` VALUES (1,'Angielski'),(2,'Niemiecki'),(3,'Hiszpanski'),(4,'Francuski'),(5,'Japonski');
/*!40000 ALTER TABLE `nazwa_kurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poziom_kurs`
--

DROP TABLE IF EXISTS `poziom_kurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poziom_kurs` (
  `id` int(5) NOT NULL,
  `poziom` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poziom_kurs`
--

LOCK TABLES `poziom_kurs` WRITE;
/*!40000 ALTER TABLE `poziom_kurs` DISABLE KEYS */;
INSERT INTO `poziom_kurs` VALUES (1,'A1'),(2,'A2'),(3,'B1'),(4,'B2'),(5,'C1'),(6,'C2');
/*!40000 ALTER TABLE `poziom_kurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id` int(5) NOT NULL,
  `imie` varchar(45) NOT NULL,
  `nazwisko` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `numer_telefonu` int(10) NOT NULL,
  `adres` varchar(45) NOT NULL,
  `miasto` varchar(45) NOT NULL,
  `kod_pocztowy` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Kacper','Mikolajewski','162662@student.uwm.edu.pl',502694580,'Murzynowskiego 17/19','Olsztyn','10-684'),(2,'Jan','Kowalski','j.kowal@gmail.com',123456789,'Okolna 7','Olsztyn','10-900'),(3,'Anna','Kowalczyk','akowalczyk@wp.pl',987654321,'Baltycka 37','Olsztyn','10-900'),(4,'Kamil','Tumulec','t.kamil@outlook.com',123456798,'al. Ksiecia Jozefa Poniatowskiego 1','Warszawa','03-901'),(5,'Theodore','Roosevelt','troosevelt@gmail.com',987654312,'28 E 20th St','Nowy Jork','NY 10003'),(6,'Mila','Kunis','mi.kunis@gmail.com',147258369,'Bukovynska St, 37','Czerniowce','58000');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `student_before_insert` BEFORE INSERT ON `student` FOR EACH ROW BEGIN
IF NEW.email = ' '
THEN
SET NEW.email = 'Brak';
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'projekt_szkola_jezykowa'
--

--
-- Dumping routines for database 'projekt_szkola_jezykowa'
--
/*!50003 DROP FUNCTION IF EXISTS `delta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `delta`(`a` INT(10), `b` INT(10), `c` INT(10)) RETURNS int(10)
    NO SQL
BEGIN
DECLARE wynik INT(10);
SELECT POW(b,2)-4*a*c INTO wynik;
RETURN wynik;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `najtanszykurs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `najtanszykurs`(OUT `min` FLOAT)
BEGIN
SELECT MIN(cena)
INTO min
FROM klasa;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-16 20:50:18
