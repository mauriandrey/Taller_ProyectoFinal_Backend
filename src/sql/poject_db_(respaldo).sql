-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: poject_db
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article` (
  `publication_id` int(11) NOT NULL AUTO_INCREMENT,
  `doi` varchar(20) NOT NULL,
  `abstract` varchar(300) NOT NULL,
  `keywords` varchar(50) NOT NULL,
  `indexacion` varchar(20) NOT NULL,
  `magazine` varchar(50) NOT NULL,
  `area` varchar(50) NOT NULL,
  PRIMARY KEY (`publication_id`),
  UNIQUE KEY `doi` (`doi`),
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`publication_id`) REFERENCES `publication` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (2,'10.1234/abcd.2023.01','An introduction to MySQL database management.','MySQL, Database','Scopus','Database Journal','Database Management'),(4,'10.1234/abcd.2023.02','A beginner\'s guide to CSS styling.','CSS, Styling','Web of Science','CSS Journal','Web Development'),(6,'10.1234/abcd.2023.03','Exploring advanced features of PHP.','PHP, Advanced','Scopus','PHP Journal','Programming'),(8,'10.1234/abcd.2023.04','Creating responsive web designs.','Responsive Design, Web Development','Web of Science','Responsive Journal','Web Development'),(10,'10.1234/abcd.2023.05','Integrating PHP with MySQL databases.','PHP, MySQL Integration','Scopus','Integration Journal','Database Management'),(12,'10.1234/abcd.2023.06','Implementing data structures in PHP.','Data Structures, PHP','Web of Science','Data Structures Journal','Programming'),(14,'10.1234/abcd.2023.07','Using CSS Grid for layout design.','CSS Grid, Layout Design','Scopus','Grid Journal','Web Development'),(16,'10.1234/abcd.2023.08','Exploring new features in JavaScript ES6.','JavaScript ES6, Features','Web of Science','JavaScript Journal','Programming'),(18,'10.1234/abcd.2023.09','Understanding OOP concepts in PHP.','OOP, PHP','Scopus','OOP Journal','Programming'),(20,'10.1234/abcd.2023.10','Optimizing MySQL database performance.','MySQL, Performance Tuning','Web of Science','Performance Journal','Database Management'),(74,'10.1234/abcd.2024.02','Nuevo resumen del artículo','PHP, MySQL, Update','Scopus','Updated Magazine','Web Development'),(114,'10.1234/abcd.2024.01','This is an abstract of the new article.','keyword1, keyword2','indexacion_example','Magazine Name','Area of Study');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `orcid` varchar(20) NOT NULL,
  `affiliation` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'John','Doe','johndoe','johndoe@espe.edu.ec','password1','0000-0001-2345-6789','UFA-ESPE'),(2,'Jane','Smith','janesmith','janesmith@espe.edu.ec','password2','0000-0002-3456-7890','UFA-ESPE'),(3,'Alice','Johnson','alicejohnson','alicejohnson@espe.edu.ec','password3','0000-0003-4567-8901','UFA-ESPE'),(4,'Bob','Brown','bobbrown','bobbrown@espe.edu.ec','password4','0000-0004-5678-9012','UFA-ESPE'),(5,'Charlie','Davis','charliedavis','charliedavis@espe.edu.ec','password5','0000-0005-6789-0123','UFA-ESPE'),(6,'Betsy','Gomez','betsygomez2','ana.gomez@espe.edu.ec','$2y$10$OBCTLT2iK/TYt0Cy7ZtwfOXRoiJBt8qHJtzfe2ergPm24l1YAMN0i','0000-0006-7890-1234','UFA-ESPE'),(8,'Anabel','Perez','anabelperez','aperez.gomez@espe.edu.ec','$2y$10$k.8R8xa8./krCfSc48ee8./9ZmU22ZLDWKZO8ttUDGdhPpRpTqvW2','0000-0006-7890-1234','UFA-ESPE'),(9,'Ibeth','Arevalo','ibetharevalo','ibarevalo@espe.edu.ec','$2y$10$J52bKhPNAI6cMjCIrf37pe5Xnt9A5YOgpfZWno0EAple3U5AUSY6e','0000-0006-7890-1234','UFA-ESPE');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `publication_id` int(11) NOT NULL AUTO_INCREMENT,
  `isbn` varchar(20) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `edition` int(11) NOT NULL,
  PRIMARY KEY (`publication_id`),
  UNIQUE KEY `isbn` (`isbn`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`publication_id`) REFERENCES `publication` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'978-3-16-148410-0','Non-Fiction',2),(3,'978-1-23-456789-7','Education',2),(5,'978-0-12-345678-9','Science',1),(7,'978-9-87-654321-0','Fiction',3),(9,'978-8-76-543210-1','Non-Fiction',2),(11,'978-5-43-210987-6','Biography',1),(13,'978-4-32-109876-5','History',2),(15,'978-3-21-098765-4','Philosophy',1),(17,'978-2-10-987654-3','Psychology',2),(19,'978-1-09-876543-2','Sociology',1),(117,'978-3-16-148410-3','Drama',2),(118,'978-3-16-148001-0','Drama',2),(119,'978-3-16-148002-1','Drama',2);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;

--
-- Table structure for table `publication`
--

DROP TABLE IF EXISTS `publication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `publication_date` date NOT NULL,
  `author_id` int(11) NOT NULL,
  `type` enum('book','article') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `publication_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication`
--

/*!40000 ALTER TABLE `publication` DISABLE KEYS */;
INSERT INTO `publication` VALUES (1,'Updated Book Title','This is an updated book description.','2024-10-02',1,'book'),(2,'Understanding MySQL','An introduction to MySQL database management.','2023-02-20',2,'article'),(3,'Web Development with HTML','Basics of web development using HTML.','2023-03-10',3,'book'),(4,'CSS for Beginners','A beginner\'s guide to CSS styling.','2023-04-05',4,'article'),(5,'JavaScript Essentials','Essential concepts of JavaScript programming.','2023-05-25',5,'book'),(6,'Advanced PHP Techniques','Exploring advanced features of PHP.','2023-06-15',1,'article'),(7,'Database Design Principles','Fundamentals of database design.','2023-07-10',2,'book'),(8,'Responsive Web Design','Creating responsive web designs.','2023-08-20',3,'article'),(9,'JavaScript Frameworks','Overview of popular JavaScript frameworks.','2023-09-05',4,'book'),(10,'PHP and MySQL Integration','Integrating PHP with MySQL databases.','2023-10-15',5,'article'),(11,'Web Security Best Practices','Best practices for web security.','2023-11-01',1,'book'),(12,'Data Structures in PHP','Implementing data structures in PHP.','2023-12-10',2,'article'),(13,'HTML5 Features','New features introduced in HTML5.','2024-01-05',3,'book'),(14,'CSS Grid Layout','Using CSS Grid for layout design.','2024-02-15',4,'article'),(15,'JavaScript ES6 Features','Exploring new features in JavaScript ES6.','2024-03-20',5,'book'),(16,'PHP Object-Oriented Programming','Understanding OOP concepts in PHP.','2024-04-10',1,'article'),(17,'MySQL Performance Tuning','Optimizing MySQL database performance.','2024-05-05',2,'book'),(18,'Web Accessibility Guidelines','Guidelines for making web content accessible.','2024-06-15',3,'article'),(19,'JavaScript Asynchronous Programming','Handling asynchronous operations in JavaScript.','2024-07-20',4,'book'),(20,'PHP Frameworks Overview','Overview of popular PHP frameworks.','2024-08-25',5,'article'),(74,'Updated Article Title 2','Updated article description 2.','2024-11-02',1,'article'),(114,'New Article Title','This is a new article description.','2024-10-01',1,'article'),(117,'Updated Book Title 2','Updated book description 2.','2024-11-01',1,'book'),(118,'Updated Book Title 2','Updated book description 2.','2024-11-02',1,'book'),(119,'New Book Title 3','Updated book description 2.','2024-11-02',1,'book');
/*!40000 ALTER TABLE `publication` ENABLE KEYS */;

--
-- Dumping routines for database 'poject_db'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_article_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_article_list`()
BEGIN
    SELECT 
        ar.doi,
        ar.abstract,
        ar.keywords,
        ar.indexacion,
        ar.magazine,
        ar.area,
        p.id AS publication_id,
        p.title, 
        p.description, 
        p.publication_date, 
        p.type,
        p.author_id AS author_id,
        a.id,
        a.first_name, 
        a.last_name
        FROM article ar
        JOIN publication p ON ar.publication_id = p.id
        JOIN author a ON p.author_id = a.id
        ORDER BY p.publication_date DESC;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_book_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_book_list`()
BEGIN
    SELECT 
        b.isbn, 
        b.edition,
        b.gender, 
        p.id AS publication_id,
        p.title, 
        p.description, 
        p.publication_date, 
        p.type,
        p.author_id AS author_id,
        a.id,
        a.first_name, 
        a.last_name
        FROM book b
        JOIN publication p ON b.publication_id = p.id
        JOIN author a ON p.author_id = a.id
        ORDER BY p.publication_date DESC;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_create_article` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_create_article`(
  
   IN  p_title                  VARCHAR(100),
   IN  p_description            VARCHAR(100) ,
   IN  p_publication_date       DATE,
   IN  p_author_id              int,
   IN  p_doi                    VARCHAR(20),
   IN  p_abstract               VARCHAR(300),
   IN  p_keywords               VARCHAR(50),
   IN  p_indexacion             VARCHAR(20),
   IN  p_magazine               VARCHAR(50),
   IN  p_area                   VARCHAR(50)

)
BEGIN
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
            ROLLBACK;
        END ;

        START TRANSACTION;
        INSERT INTO publication (title, description, publication_date, type, author_id)
        VALUES (p_title, p_description, p_publication_date, 'article', p_author_id);
        SET @new_pub_id := LAST_INSERT_ID();

        INSERT INTO article (publication_id, doi, abstract, keywords, indexacion, magazine, area)
        VALUES (@new_pub_id, p_doi, p_abstract, p_keywords, p_indexacion, p_magazine, p_area);

        COMMIT; 
        SELECT @new_pub_id AS pub_id;
        SELECT 'ARTICULO INGRESADO CORRECTAMENTE' AS message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_create_book` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_create_book`(
  
   IN  p_title                  VARCHAR(100),
   IN  p_description            VARCHAR(100) ,
   IN  p_publication_date       DATE,
   IN  p_author_id              int,
   IN  p_isbn                   VARCHAR(20),
   IN  p_gender                 VARCHAR(20),
   IN  p_edition                INT
)
BEGIN
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
            ROLLBACK;
        END ;

        START TRANSACTION;
        INSERT INTO publication (title, description, publication_date, type, author_id)
        VALUES (p_title, p_description, p_publication_date, 'book', p_author_id);
        SET @new_pub_id := LAST_INSERT_ID();

        INSERT INTO book (publication_id, isbn, gender,edition) 
        VALUES (@new_pub_id, p_isbn,p_gender, p_edition);

        COMMIT; 
        SELECT @new_pub_id AS pub_id;
        SELECT 'LIBRO INGRESADO CORRECTAMENTE' AS message;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_article` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_article`(IN p_id INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END ;

    START TRANSACTION;

    DELETE FROM article WHERE publication_id = p_id;
    DELETE FROM publication WHERE id = p_id;

    COMMIT;
    SELECT 1 AS OK;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_book` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_book`(IN p_id INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;

    DELETE FROM book WHERE publication_id = p_id;
    DELETE FROM publication WHERE id = p_id;

    COMMIT;
    SELECT 1 AS OK;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_find_article` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_find_article`(IN p_id INT)
BEGIN
    SELECT 
        ar.doi,
        ar.abstract,
        ar.keywords,
        ar.indexacion,
        ar.magazine,
        ar.area,
        p.id AS publication_id,
        p.title, 
        p.description, 
        p.publication_date, 
        p.type,
        p.author_id AS author_id,
        a.id,
        a.first_name, 
        a.last_name
        FROM article ar
        JOIN publication p ON ar.publication_id = p.id
        JOIN author a ON p.author_id = a.id
        WHERE ar.publication_id = p_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_find_book` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_find_book`(IN p_id INT)
BEGIN
    SELECT 
        b.isbn, 
        b.edition,
        b.gender, 
        p.id AS publication_id,
        p.title, 
        p.description, 
        p.publication_date, 
        p.type,
        p.author_id AS author_id,
        a.id,
        a.first_name, 
        a.last_name
        FROM book b
        JOIN publication p ON b.publication_id = p.id
        JOIN author a ON p.author_id = a.id
        WHERE b.publication_id = p_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_article` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_article`(
    IN  p_id                     INT,
    IN  p_title                  VARCHAR(100),
    IN  p_description            VARCHAR(100),
    IN  p_publication_date       DATE,
    IN  p_author_id              INT,
    IN  p_doi                    VARCHAR(20),
    IN  p_abstract               VARCHAR(300),
    IN  p_keywords               VARCHAR(50),
    IN  p_indexacion             VARCHAR(20),
    IN  p_magazine               VARCHAR(50),
    IN  p_area                   VARCHAR(50)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END ;

    START TRANSACTION;

    -- Actualizar la tabla publication
    UPDATE publication
    SET title = p_title,
        description = p_description,
        publication_date = p_publication_date,
        author_id = p_author_id
    WHERE id = p_id;

    -- Actualizar la tabla book
    UPDATE article
    SET doi = p_doi,
        abstract = p_abstract,
        keywords = p_keywords,
        indexacion = p_indexacion,
        magazine = p_magazine,
        area = p_area
    WHERE publication_id = p_id;
    COMMIT;
    SELECT 'ARTICULO ACTUALIZADO CORRECTAMENTE' AS message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_book` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_book`(
    IN  p_id                     INT,
    IN  p_title                  VARCHAR(100),
    IN  p_description            VARCHAR(100),
    IN  p_publication_date       DATE,
    IN  p_author_id              INT,
    IN  p_isbn                   VARCHAR(20),
    IN  p_gender                 VARCHAR(20),
    IN  p_edition                INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END ;

    START TRANSACTION;

    -- Actualizar la tabla publication
    UPDATE publication
    SET title = p_title,
        description = p_description,
        publication_date = p_publication_date,
        author_id = p_author_id
    WHERE id = p_id;

    -- Actualizar la tabla book
    UPDATE book
    SET isbn = p_isbn,
        gender = p_gender,
        edition = p_edition
    WHERE publication_id = p_id;

    COMMIT;
    SELECT 'LIBRO ACTUALIZADO CORRECTAMENTE' AS message;
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

-- Dump completed on 2025-08-05 18:36:09
