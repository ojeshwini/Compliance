CREATE DATABASE  IF NOT EXISTS `compliancedb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `compliancedb`;
-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: compliancedb
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auditcalender`
--

DROP TABLE IF EXISTS `auditcalender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auditcalender` (
  `Audit_Calender_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Org_Hier_ID` int(11) DEFAULT NULL,
  `Compliance_Type_ID` int(11) DEFAULT NULL,
  `Start_Date` datetime DEFAULT NULL,
  `End_Date` datetime DEFAULT NULL,
  `Audit_Year` year(4) DEFAULT NULL,
  PRIMARY KEY (`Audit_Calender_ID`),
  KEY `Org_Hier_ID` (`Org_Hier_ID`),
  KEY `Compliance_Type_ID` (`Compliance_Type_ID`),
  CONSTRAINT `auditcalender_ibfk_1` FOREIGN KEY (`Org_Hier_ID`) REFERENCES `org_hier` (`org_hier_id`),
  CONSTRAINT `auditcalender_ibfk_2` FOREIGN KEY (`Compliance_Type_ID`) REFERENCES `compliance_type` (`compliance_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditcalender`
--

LOCK TABLES `auditcalender` WRITE;
/*!40000 ALTER TABLE `auditcalender` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditcalender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch_auditor_mapping`
--

DROP TABLE IF EXISTS `branch_auditor_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `branch_auditor_mapping` (
  `Branch_Allocation_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Org_Hier_ID` int(11) NOT NULL,
  `Auditor_ID` int(11) NOT NULL,
  `Financial_Year` datetime DEFAULT NULL,
  `Is_Active` bit(1) DEFAULT NULL,
  `UpdatedByLogin_ID` int(11) DEFAULT NULL,
  `Allocation_Date` datetime DEFAULT NULL,
  PRIMARY KEY (`Branch_Allocation_ID`),
  KEY `Org_Hier_ID` (`Org_Hier_ID`),
  KEY `Auditor_ID` (`Auditor_ID`),
  KEY `UpdatedByLogin_ID` (`UpdatedByLogin_ID`),
  CONSTRAINT `branch_auditor_mapping_ibfk_1` FOREIGN KEY (`Org_Hier_ID`) REFERENCES `org_hier` (`org_hier_id`),
  CONSTRAINT `branch_auditor_mapping_ibfk_2` FOREIGN KEY (`Auditor_ID`) REFERENCES `user` (`user_id`),
  CONSTRAINT `branch_auditor_mapping_ibfk_3` FOREIGN KEY (`UpdatedByLogin_ID`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch_auditor_mapping`
--

LOCK TABLES `branch_auditor_mapping` WRITE;
/*!40000 ALTER TABLE `branch_auditor_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `branch_auditor_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch_location`
--

DROP TABLE IF EXISTS `branch_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `branch_location` (
  `Location_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Location_Name` varchar(75) DEFAULT NULL,
  `Address` varchar(450) DEFAULT NULL,
  `Country_ID` int(11) NOT NULL,
  `State_ID` int(11) NOT NULL,
  `City_ID` int(11) NOT NULL,
  `Postal_Code` varchar(10) DEFAULT NULL,
  `Branch_Coordinates1` varchar(100) DEFAULT NULL,
  `Branch_Coordinates2` varchar(100) DEFAULT NULL,
  `Branch_CoordinateURL` varchar(100) DEFAULT NULL,
  `Org_Hier_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Location_ID`),
  KEY `Country_ID` (`Country_ID`),
  KEY `State_ID` (`State_ID`),
  KEY `City_ID` (`City_ID`),
  KEY `fk_OrgID` (`Org_Hier_ID`),
  CONSTRAINT `branch_location_ibfk_1` FOREIGN KEY (`Country_ID`) REFERENCES `country` (`country_id`),
  CONSTRAINT `branch_location_ibfk_2` FOREIGN KEY (`State_ID`) REFERENCES `state` (`state_id`),
  CONSTRAINT `branch_location_ibfk_3` FOREIGN KEY (`City_ID`) REFERENCES `city` (`city_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_OrgID` FOREIGN KEY (`Org_Hier_ID`) REFERENCES `org_hier` (`org_hier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch_location`
--

LOCK TABLES `branch_location` WRITE;
/*!40000 ALTER TABLE `branch_location` DISABLE KEYS */;
INSERT INTO `branch_location` VALUES (1,NULL,NULL,1,12,3,'589043',NULL,NULL,NULL,2),(2,NULL,NULL,1,12,3,'589043',NULL,NULL,NULL,3),(3,NULL,NULL,1,12,104,'678905',NULL,NULL,NULL,4),(4,NULL,NULL,1,15,1,'567890',NULL,NULL,NULL,6),(5,NULL,NULL,1,15,1,'567890',NULL,NULL,NULL,7),(6,NULL,NULL,1,12,3,'678905',NULL,NULL,NULL,8),(7,NULL,NULL,1,12,3,'560987',NULL,NULL,NULL,10),(8,NULL,NULL,1,12,3,'560987',NULL,NULL,NULL,11),(9,NULL,NULL,1,12,104,'560987',NULL,NULL,NULL,12),(10,NULL,NULL,1,7,4,'789012',NULL,NULL,NULL,14),(11,NULL,NULL,1,7,4,'789012',NULL,NULL,NULL,15),(12,NULL,NULL,1,7,4,'678012',NULL,NULL,NULL,16),(13,NULL,NULL,1,7,4,'789065',NULL,NULL,NULL,17),(14,NULL,NULL,1,5,101,'670891',NULL,NULL,NULL,18),(15,NULL,NULL,1,5,2,'670123',NULL,NULL,NULL,19),(16,NULL,NULL,1,12,3,'741085',NULL,NULL,NULL,20),(17,NULL,NULL,1,12,3,'741085',NULL,NULL,NULL,21),(18,NULL,NULL,1,12,3,'741025',NULL,NULL,NULL,22),(19,NULL,NULL,1,12,3,'741085',NULL,NULL,NULL,23),(20,NULL,NULL,1,12,3,'741085',NULL,NULL,NULL,24);
/*!40000 ALTER TABLE `branch_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `city` (
  `City_ID` int(11) NOT NULL AUTO_INCREMENT,
  `City_Name` varchar(70) DEFAULT NULL,
  `State_ID` int(11) NOT NULL,
  PRIMARY KEY (`City_ID`),
  KEY `FK_State` (`State_ID`),
  CONSTRAINT `FK_State` FOREIGN KEY (`State_ID`) REFERENCES `state` (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1216 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'	Mumbai	',15),(2,'	Delhi	',5),(3,'	Bengaluru	',12),(4,'	Ahmedabad	',7),(5,'	Hyderabad	',24),(6,'	Chennai	',24),(7,'	Kolkata	',36),(8,'	Pune	',15),(9,'	Jaipur	',22),(10,'	Surat	',7),(11,'	Lucknow	',27),(12,'	Kanpur	',27),(13,'	Nagpur	',15),(14,'	Patna	',4),(15,'	Indore	',14),(16,'	Thane	',15),(17,'	Bhopal	',14),(18,'	Visakhapatnam	',1),(19,'	Vadodara	',7),(20,'	Firozabad	',27),(21,'	Ludhiana	',21),(22,'	Rajkot	',7),(23,'	Agra	',27),(24,'	Siliguri	',36),(25,'	Nashik	',15),(26,'	Faridabad	',8),(27,'	Patiala	',21),(28,'	Meerut	',27),(29,'	Kalyan-Dombivali	',15),(30,'	Vasai-Virar	',15),(31,'	Varanasi	',27),(32,'	Srinagar	',10),(33,'	Dhanbad	',11),(34,'	Jodhpur	',22),(35,'	Amritsar	',21),(36,'	Raipur	',5),(37,'	Allahabad	',27),(38,'	Coimbatore	',24),(39,'	Jabalpur	',14),(40,'	Gwalior	',14),(41,'	Vijayawada	',1),(42,'	Madurai	',24),(43,'	Guwahati	',3),(44,'	Chandigarh	',4),(45,'	Hubli-Dharwad	',12),(46,'	Amroha	',27),(47,'	Moradabad	',27),(48,'	Gurgaon	',8),(49,'	Aligarh	',27),(50,'	Solapur	',15),(51,'	Ranchi	',11),(52,'	Jalandhar	',21),(53,'	Tiruchirappalli	',24),(54,'	Bhubaneswar	',19),(55,'	Salem	',24),(56,'	Warangal	',24),(57,'	Mira-Bhayandar	',15),(58,'	Thiruvananthapuram	',13),(59,'	Bhiwandi	',15),(60,'	Saharanpur	',27),(61,'	Guntur	',1),(62,'	Amravati	',15),(63,'	Bikaner	',22),(64,'	Noida	',27),(65,'	Jamshedpur	',11),(66,'	Bhilai Nagar	',5),(67,'	Cuttack	',19),(68,'	Kochi	',13),(69,'	Udaipur	',22),(70,'	Bhavnagar	',7),(71,'	Dehradun	',36),(72,'	Asansol	',36),(73,'	Nanded-Waghala	',15),(74,'	Ajmer	',22),(75,'	Jamnagar	',7),(76,'	Ujjain	',14),(77,'	Sangli	',15),(78,'	Loni	',27),(79,'	Jhansi	',27),(80,'	Pondicherry	',20),(81,'	Nellore	',1),(82,'	Jammu	',10),(83,'	Belagavi	',12),(84,'	Raurkela	',19),(85,'	Mangaluru	',12),(86,'	Tirunelveli	',24),(87,'	Malegaon	',15),(88,'	Gaya	',4),(89,'	Tiruppur	',24),(90,'	Davanagere	',12),(91,'	Kozhikode	',13),(92,'	Akola	',15),(93,'	Kurnool	',1),(94,'	Bokaro Steel City	',11),(95,'	Rajahmundry	',1),(96,'	Ballari	',12),(97,'	Agartala	',25),(98,'	Bhagalpur	',4),(99,'	Latur	',15),(100,'	Dhule	',15),(101,'	Korba	',5),(102,'	Bhilwara	',22),(103,'	Brahmapur	',19),(104,'	Mysore	',12),(105,'	Muzaffarpur	',4),(106,'	Ahmednagar	',15),(107,'	Kollam	',13),(108,'	Raghunathganj	',36),(109,'	Bilaspur	',5),(110,'	Shahjahanpur	',27),(111,'	Thrissur	',13),(112,'	Alwar	',22),(113,'	Kakinada	',1),(114,'	Nizamabad	',24),(115,'	Sagar	',14),(116,'	Tumkur	',12),(117,'	Hisar	',8),(118,'	Rohtak	',8),(119,'	Panipat	',8),(120,'	Darbhanga	',4),(121,'	Kharagpur	',36),(122,'	Aizawl	',18),(123,'	Ichalkaranji	',15),(124,'	Tirupati	',1),(125,'	Karnal	',8),(126,'	Bathinda	',21),(127,'	Rampur	',27),(128,'	Shivamogga	',12),(129,'	Ratlam	',14),(130,'	Modinagar	',27),(131,'	Durg	',5),(132,'	Shillong	',17),(133,'	Imphal	',16),(134,'	Hapur	',27),(135,'	Ranipet	',24),(136,'	Anantapur	',1),(137,'	Arrah	',4),(138,'	Karimnagar	',24),(139,'	Parbhani	',15),(140,'	Etawah	',27),(141,'	Bharatpur	',22),(142,'	Begusarai	',4),(143,'	New Delhi	',5),(144,'	Chhapra	',4),(145,'	Kadapa	',1),(146,'	Ramagundam	',24),(147,'	Pali	',22),(148,'	Satna	',14),(149,'	Vizianagaram	',1),(150,'	Katihar	',4),(151,'	Hardwar	',36),(152,'	Sonipat	',8),(153,'	Nagercoil	',24),(154,'	Thanjavur	',24),(155,'	Murwara (Katni)	',14),(156,'	Naihati	',36),(157,'	Sambhal	',27),(158,'	Nadiad	',7),(159,'	Yamunanagar	',8),(160,'	English Bazar	',36),(161,'	Eluru	',1),(162,'	Munger	',4),(163,'	Panchkula	',8),(164,'	Raayachuru	',12),(165,'	Panvel	',15),(166,'	Deoghar	',11),(167,'	Ongole	',1),(168,'	Nandyal	',1),(169,'	Morena	',14),(170,'	Bhiwani	',8),(171,'	Porbandar	',7),(172,'	Palakkad	',13),(173,'	Anand	',7),(174,'	Purnia	',4),(175,'	Baharampur	',36),(176,'	Barmer	',22),(177,'	Morvi	',7),(178,'	Orai	',27),(179,'	Bahraich	',27),(180,'	Sikar	',22),(181,'	Vellore	',24),(182,'	Singrauli	',14),(183,'	Khammam	',24),(184,'	Mahesana	',7),(185,'	Silchar	',3),(186,'	Sambalpur	',19),(187,'	Rewa	',14),(188,'	Unnao	',27),(189,'	Hugli-Chinsurah	',36),(190,'	Raiganj	',36),(191,'	Phusro	',11),(192,'	Adityapur	',11),(193,'	Alappuzha	',13),(194,'	Bahadurgarh	',8),(195,'	Machilipatnam	',1),(196,'	Rae Bareli	',27),(197,'	Jalpaiguri	',36),(198,'	Bharuch	',7),(199,'	Pathankot	',21),(200,'	Hoshiarpur	',21),(201,'	Baramula	',10),(202,'	Adoni	',1),(203,'	Jind	',8),(204,'	Tonk	',22),(205,'	Tenali	',1),(206,'	Kancheepuram	',24),(207,'	Vapi	',7),(208,'	Sirsa	',8),(209,'	Navsari	',7),(210,'	Mahbubnagar	',24),(211,'	Puri	',19),(212,'	Robertson Pet	',12),(213,'	Erode	',24),(214,'	Batala	',21),(215,'	Haldwani-cum-Kathgodam	',36),(216,'	Vidisha	',14),(217,'	Saharsa	',4),(218,'	Thanesar	',8),(219,'	Chittoor	',1),(220,'	Veraval	',7),(221,'	Lakhimpur	',27),(222,'	Sitapur	',27),(223,'	Hindupur	',1),(224,'	Santipur	',36),(225,'	Balurghat	',36),(226,'	Ganjbasoda	',14),(227,'	Moga	',21),(228,'	Proddatur	',1),(229,'	Srinagar	',36),(230,'	Medinipur	',36),(231,'	Habra	',36),(232,'	Sasaram	',4),(233,'	Hajipur	',4),(234,'	Bhuj	',7),(235,'	Shivpuri	',14),(236,'	Ranaghat	',36),(237,'	Shimla	',9),(238,'	Tiruvannamalai	',24),(239,'	Kaithal	',8),(240,'	Rajnandgaon	',5),(241,'	Godhra	',7),(242,'	Hazaribag	',11),(243,'	Bhimavaram	',1),(244,'	Mandsaur	',14),(245,'	Dibrugarh	',3),(246,'	Kolar	',12),(247,'	Bankura	',36),(248,'	Mandya	',12),(249,'	Dehri-on-Sone	',4),(250,'	Madanapalle	',1),(251,'	Malerkotla	',21),(252,'	Lalitpur	',27),(253,'	Bettiah	',4),(254,'	Pollachi	',24),(255,'	Khanna	',21),(256,'	Neemuch	',14),(257,'	Palwal	',8),(258,'	Palanpur	',7),(259,'	Guntakal	',1),(260,'	Nabadwip	',36),(261,'	Udupi	',12),(262,'	Jagdalpur	',5),(263,'	Motihari	',4),(264,'	Pilibhit	',27),(265,'	Dimapur	',19),(266,'	Mohali	',21),(267,'	Sadulpur	',22),(268,'	Rajapalayam	',24),(269,'	Dharmavaram	',1),(270,'	Kashipur	',36),(271,'	Sivakasi	',24),(272,'	Darjiling	',36),(273,'	Chikkamagaluru	',12),(274,'	Gudivada	',1),(275,'	Baleshwar Town	',19),(276,'	Mancherial	',24),(277,'	Srikakulam	',1),(278,'	Adilabad	',24),(279,'	Yavatmal	',15),(280,'	Barnala	',21),(281,'	Nagaon	',3),(282,'	Narasaraopet	',1),(283,'	Raigarh	',5),(284,'	Roorkee	',36),(285,'	Valsad	',7),(286,'	Ambikapur	',5),(287,'	Giridih	',11),(288,'	Chandausi	',27),(289,'	Purulia	',36),(290,'	Patan	',7),(291,'	Bagaha	',4),(292,'	Hardoi 	',27),(293,'	Achalpur	',15),(294,'	Osmanabad	',15),(295,'	Deesa	',7),(296,'	Nandurbar	',15),(297,'	Azamgarh	',27),(298,'	Ramgarh	',11),(299,'	Firozpur	',21),(300,'	Baripada Town	',19),(301,'	Karwar	',12),(302,'	Siwan	',4),(303,'	Rajampet	',1),(304,'	Pudukkottai	',24),(305,'	Anantnag	',10),(306,'	Tadpatri	',1),(307,'	Satara	',15),(308,'	Bhadrak	',19),(309,'	Kishanganj	',4),(310,'	Suryapet	',24),(311,'	Wardha	',15),(312,'	Ranebennuru	',12),(313,'	Amreli	',7),(314,'	Neyveli (TS)	',24),(315,'	Jamalpur	',4),(316,'	Marmagao	',6),(317,'	Udgir	',15),(318,'	Tadepalligudem	',1),(319,'	Nagapattinam	',24),(320,'	Buxar	',4),(321,'	Aurangabad	',15),(322,'	Jehanabad	',4),(323,'	Phagwara	',21),(324,'	Khair	',27),(325,'	Sawai Madhopur	',22),(326,'	Kapurthala	',21),(327,'	Chilakaluripet	',1),(328,'	Aurangabad	',4),(329,'	Malappuram	',13),(330,'	Rewari	',8),(331,'	Nagaur	',22),(332,'	Sultanpur	',27),(333,'	Nagda	',14),(335,'	Lakhisarai	',4),(336,'	Panaji	',6),(337,'	Tinsukia	',3),(338,'	Itarsi	',14),(339,'	Kohima	',19),(340,'	Balangir	',19),(341,'	Nawada	',4),(342,'	Jharsuguda	',19),(343,'	Jagtial	',24),(344,'	Viluppuram	',24),(345,'	Amalner	',15),(346,'	Zirakpur	',21),(347,'	Tanda	',27),(348,'	Tiruchengode	',24),(349,'	Nagina	',27),(350,'	Yemmiganur	',1),(351,'	Vaniyambadi	',24),(352,'	Sarni	',14),(353,'	Theni Allinagaram	',24),(354,'	Margao	',6),(355,'	Akot	',15),(356,'	Sehore	',14),(357,'	Mhow Cantonment	',14),(358,'	Kot Kapura	',21),(359,'	Makrana	',22),(360,'	Pandharpur	',15),(361,'	Miryalaguda	',24),(362,'	Shamli	',27),(363,'	Seoni	',14),(364,'	Ranibennur	',12),(365,'	Kadiri	',1),(366,'	Shrirampur	',15),(367,'	Rudrapur	',36),(368,'	Parli	',15),(369,'	Najibabad	',27),(370,'	Nirmal	',24),(371,'	Udhagamandalam	',24),(372,'	Shikohabad	',27),(373,'	Jhumri Tilaiya	',11),(374,'	Aruppukkottai	',24),(375,'	Ponnani	',13),(376,'	Jamui	',4),(377,'	Sitamarhi	',4),(378,'	Chirala	',1),(379,'	Anjar	',7),(380,'	Karaikal	',20),(381,'	Hansi	',8),(382,'	Anakapalle	',1),(383,'	Mahasamund	',5),(384,'	Faridkot	',21),(385,'	Saunda	',11),(386,'	Dhoraji	',7),(387,'	Paramakudi	',24),(388,'	Balaghat	',14),(389,'	Sujangarh	',22),(390,'	Khambhat	',7),(391,'	Muktsar	',21),(392,'	Rajpura	',21),(393,'	Kavali	',1),(394,'	Dhamtari	',5),(395,'	Ashok Nagar	',14),(396,'	Sardarshahar	',22),(397,'	Mahuva	',7),(398,'	Bargarh	',19),(399,'	Kamareddy	',24),(400,'	Sahibganj	',11),(401,'	Kothagudem	',24),(402,'	Ramanagaram	',12),(403,'	Gokak	',12),(404,'	Tikamgarh	',14),(405,'	Araria	',4),(406,'	Rishikesh	',36),(407,'	Shahdol	',14),(408,'	Medininagar (Daltonganj)	',11),(409,'	Arakkonam	',24),(410,'	Washim	',15),(411,'	Sangrur	',21),(412,'	Bodhan	',24),(413,'	Fazilka	',21),(414,'	Palacole	',1),(415,'	Keshod	',7),(416,'	Sullurpeta	',1),(417,'	Wadhwan	',7),(418,'	Gurdaspur	',21),(419,'	Vatakara	',13),(420,'	Tura	',17),(421,'	Narnaul	',8),(422,'	Kharar	',21),(423,'	Yadgir	',12),(424,'	Ambejogai	',15),(425,'	Ankleshwar	',7),(426,'	Savarkundla	',7),(427,'	Paradip	',19),(428,'	Virudhachalam	',24),(429,'	Kanhangad	',13),(430,'	Kadi	',7),(431,'	Srivilliputhur	',24),(432,'	Gobindgarh	',21),(433,'	Tindivanam	',24),(434,'	Mansa	',21),(435,'	Taliparamba	',13),(436,'	Manmad	',15),(437,'	Tanuku	',1),(438,'	Rayachoti	',1),(439,'	Virudhunagar	',24),(440,'	Koyilandy	',13),(441,'	Jorhat	',3),(442,'	Karur	',24),(443,'	Valparai	',24),(444,'	Srikalahasti	',1),(445,'	Neyyattinkara	',13),(446,'	Bapatla	',1),(447,'	Fatehabad	',8),(448,'	Malout	',21),(449,'	Sankarankovil	',24),(450,'	Tenkasi	',24),(451,'	Ratnagiri	',15),(452,'	Rabkavi Banhatti	',12),(453,'	Sikandrabad	',27),(454,'	Chaibasa	',11),(455,'	Chirmiri	',5),(456,'	Palwancha	',24),(457,'	Bhawanipatna	',19),(458,'	Kayamkulam	',13),(459,'	Pithampur	',14),(460,'	Nabha	',21),(461,'	Shahabad, Hardoi	',27),(462,'	Dhenkanal	',19),(463,'	Uran Islampur	',15),(464,'	Gopalganj	',4),(465,'	Bongaigaon City	',3),(466,'	Palani	',24),(467,'	Pusad	',15),(468,'	Sopore	',10),(469,'	Pilkhuwa	',27),(470,'	Tarn Taran	',21),(471,'	Renukoot	',27),(472,'	Mandamarri	',24),(473,'	Shahabad	',12),(474,'	Barbil	',19),(475,'	Koratla	',24),(476,'	Madhubani	',4),(477,'	Arambagh	',36),(478,'	Gohana	',8),(479,'	Ladnu	',22),(480,'	Pattukkottai	',24),(481,'	Sirsi	',12),(482,'	Sircilla	',24),(483,'	Tamluk	',36),(484,'	Jagraon	',21),(485,'	AlipurdUrban Agglomerationr	',36),(486,'	Alirajpur	',14),(487,'	Tandur	',24),(488,'	Naidupet	',1),(489,'	Tirupathur	',24),(490,'	Tohana	',8),(491,'	Ratangarh	',22),(492,'	Dhubri	',3),(493,'	Masaurhi	',4),(494,'	Visnagar	',7),(495,'	Vrindavan	',27),(496,'	Nokha	',22),(497,'	Nagari	',1),(498,'	Narwana	',8),(499,'	Ramanathapuram	',24),(500,'	Ujhani	',27),(501,'	Samastipur	',4),(502,'	Laharpur	',27),(503,'	Sangamner	',15),(504,'	Nimbahera	',22),(505,'	Siddipet	',24),(506,'	Suri	',36),(507,'	Diphu	',3),(508,'	Jhargram	',36),(509,'	Shirpur-Warwade	',15),(510,'	Tilhar	',27),(511,'	Sindhnur	',12),(512,'	Udumalaipettai	',24),(513,'	Malkapur	',15),(514,'	Wanaparthy	',24),(515,'	Gudur	',1),(516,'	Kendujhar	',19),(517,'	Mandla	',14),(518,'	Mandi	',9),(519,'	Nedumangad	',13),(520,'	North Lakhimpur	',3),(521,'	Vinukonda	',1),(522,'	Tiptur	',12),(523,'	Gobichettipalayam	',24),(524,'	Sunabeda	',19),(525,'	Wani	',15),(526,'	Upleta	',7),(527,'	Narasapuram	',1),(528,'	Nuzvid	',1),(529,'	Tezpur	',3),(530,'	Una	',7),(531,'	Markapur	',1),(532,'	Sheopur	',14),(533,'	Thiruvarur	',24),(534,'	Sidhpur	',7),(535,'	Sahaswan	',27),(536,'	Suratgarh	',22),(537,'	Shajapur	',14),(538,'	Rayagada	',19),(539,'	Lonavla	',15),(540,'	Ponnur	',1),(541,'	Kagaznagar	',24),(542,'	Gadwal	',24),(543,'	Bhatapara	',5),(544,'	Kandukur	',1),(545,'	Sangareddy	',24),(546,'	Unjha	',7),(547,'	Lunglei	',18),(548,'	Karimganj	',3),(549,'	Kannur	',13),(550,'	Bobbili	',1),(551,'	Mokameh	',4),(552,'	Talegaon Dabhade	',15),(553,'	Anjangaon	',15),(554,'	Mangrol	',7),(555,'	Sunam	',21),(556,'	Gangarampur	',36),(557,'	Thiruvallur	',24),(558,'	Tirur	',13),(559,'	Rath	',27),(560,'	Jatani	',19),(561,'	Viramgam	',7),(562,'	Rajsamand	',22),(563,'	Yanam	',20),(564,'	Kottayam	',13),(565,'	Panruti	',24),(566,'	Dhuri	',21),(567,'	Namakkal	',24),(568,'	Kasaragod	',13),(569,'	Modasa	',7),(570,'	Rayadurg	',1),(571,'	Supaul	',4),(572,'	Kunnamkulam	',13),(573,'	Umred	',15),(574,'	Bellampalle	',24),(575,'	Sibsagar	',3),(576,'	Mandi Dabwali	',8),(577,'	Ottappalam	',13),(578,'	Dumraon	',4),(579,'	Samalkot	',1),(580,'	Jaggaiahpet	',1),(581,'	Goalpara	',3),(582,'	Tuni	',1),(583,'	Lachhmangarh	',22),(584,'	Bhongir	',24),(585,'	Amalapuram	',1),(586,'	Firozpur Cantt.	',21),(587,'	Vikarabad	',24),(588,'	Thiruvalla	',13),(589,'	Sherkot	',27),(590,'	Palghar	',15),(591,'	Shegaon	',15),(592,'	Jangaon	',24),(593,'	Bheemunipatnam	',1),(594,'	Panna	',14),(595,'	Thodupuzha	',13),(596,'	KathUrban Agglomeration	',10),(597,'	Palitana	',7),(598,'	Arwal	',4),(599,'	Venkatagiri	',1),(600,'	Kalpi	',27),(601,'	Rajgarh (Churu)	',22),(602,'	Sattenapalle	',1),(603,'	Arsikere	',12),(604,'	Ozar	',15),(605,'	Thirumangalam	',24),(606,'	Petlad	',7),(607,'	Nasirabad	',22),(608,'	Phaltan	',15),(609,'	Rampurhat	',36),(610,'	Nanjangud	',12),(611,'	Forbesganj	',4),(612,'	Tundla	',27),(613,'	BhabUrban Agglomeration	',4),(614,'	Sagara	',12),(615,'	Pithapuram	',1),(616,'	Sira	',12),(617,'	Bhadrachalam	',24),(618,'	Charkhi Dadri	',8),(619,'	Chatra	',11),(620,'	Palasa Kasibugga	',1),(621,'	Nohar	',22),(622,'	Yevla	',15),(623,'	Sirhind Fatehgarh Sahib	',21),(624,'	Bhainsa	',24),(625,'	Parvathipuram	',1),(626,'	Shahade	',15),(627,'	Chalakudy	',13),(628,'	Narkatiaganj	',4),(629,'	Kapadvanj	',7),(630,'	Macherla	',1),(631,'	Raghogarh-Vijaypur	',14),(632,'	Rupnagar	',21),(633,'	Naugachhia	',4),(634,'	Sendhwa	',14),(635,'	Byasanagar	',19),(636,'	Sandila	',27),(637,'	Gooty	',1),(638,'	Salur	',1),(639,'	Nanpara	',27),(640,'	Sardhana	',27),(641,'	Vita	',15),(642,'	Gumia	',11),(643,'	Puttur	',12),(644,'	Jalandhar Cantt.	',21),(645,'	Nehtaur	',27),(646,'	Changanassery	',13),(647,'	Mandapeta	',1),(648,'	Dumka	',11),(649,'	Seohara	',27),(650,'	Umarkhed	',15),(651,'	Madhupur	',11),(652,'	Vikramasingapuram	',24),(653,'	Punalur	',13),(654,'	Kendrapara	',19),(655,'	Sihor	',7),(656,'	Nellikuppam	',24),(657,'	Samana	',21),(658,'	Warora	',15),(659,'	Nilambur	',13),(660,'	Rasipuram	',24),(661,'	Ramnagar	',36),(662,'	Jammalamadugu	',1),(663,'	Nawanshahr	',21),(664,'	Thoubal	',16),(665,'	Athni	',12),(666,'	Cherthala	',13),(667,'	Sidhi	',14),(668,'	Farooqnagar	',24),(669,'	Peddapuram	',1),(670,'	Chirkunda	',11),(671,'	Pachora	',15),(672,'	Madhepura	',4),(673,'	Pithoragarh	',36),(674,'	Tumsar	',15),(675,'	Phalodi	',22),(676,'	Tiruttani	',24),(677,'	Rampura Phul	',21),(678,'	Perinthalmanna	',13),(679,'	Padrauna	',27),(680,'	Pipariya	',14),(681,'	Dalli-Rajhara	',5),(682,'	Punganur	',1),(683,'	Mattannur	',13),(684,'	Mathura	',27),(685,'	Thakurdwara	',27),(686,'	Nandivaram-Guduvancheri	',24),(687,'	Mulbagal	',12),(688,'	Manjlegaon	',15),(689,'	Wankaner	',7),(690,'	Sillod	',15),(691,'	Nidadavole	',1),(692,'	Surapura	',12),(693,'	Rajagangapur	',19),(694,'	Sheikhpura	',4),(695,'	Parlakhemundi	',19),(696,'	Kalimpong	',36),(697,'	Siruguppa	',12),(698,'	Arvi	',15),(699,'	Limbdi	',7),(700,'	Barpeta	',3),(701,'	Manglaur	',36),(702,'	Repalle	',1),(703,'	Mudhol	',12),(704,'	Shujalpur	',14),(705,'	Mandvi	',7),(706,'	Thangadh	',7),(707,'	Sironj	',14),(708,'	Nandura	',15),(709,'	Shoranur	',13),(710,'	Nathdwara	',22),(711,'	Periyakulam	',24),(712,'	Sultanganj	',4),(713,'	Medak	',24),(714,'	Narayanpet	',24),(715,'	Raxaul Bazar	',4),(716,'	Rajauri	',10),(717,'	Pernampattu	',24),(718,'	Nainital	',36),(719,'	Ramachandrapuram	',1),(720,'	Vaijapur	',15),(721,'	Nangal	',21),(722,'	Sidlaghatta	',12),(723,'	Punch	',10),(724,'	Pandhurna	',14),(725,'	Wadgaon Road	',15),(726,'	Talcher	',19),(727,'	Varkala	',13),(728,'	Pilani	',22),(729,'	Nowgong	',14),(730,'	Naila Janjgir	',5),(731,'	Mapusa	',6),(732,'	Vellakoil	',24),(733,'	Merta City	',22),(734,'	Sivaganga	',24),(735,'	Mandideep	',14),(736,'	Sailu	',15),(737,'	Vyara	',7),(738,'	Kovvur	',1),(739,'	Vadalur	',24),(740,'	Nawabganj	',27),(741,'	Padra	',7),(742,'	Sainthia	',36),(743,'	Siana	',27),(744,'	Shahpur	',12),(745,'	Sojat	',22),(746,'	Noorpur	',27),(747,'	Paravoor	',13),(748,'	Murtijapur	',15),(749,'	Ramnagar	',4),(750,'	Sundargarh	',19),(751,'	Taki	',36),(752,'	Saundatti-Yellamma	',12),(753,'	Pathanamthitta	',13),(754,'	Wadi	',12),(755,'	Rameshwaram	',24),(756,'	Tasgaon	',15),(757,'	Sikandra Rao	',27),(758,'	Sihora	',14),(759,'	Tiruvethipuram	',24),(760,'	Tiruvuru	',1),(761,'	Mehkar	',15),(762,'	Peringathur	',13),(763,'	Perambalur	',24),(764,'	Manvi	',12),(765,'	Zunheboto	',19),(766,'	Mahnar Bazar	',4),(767,'	Attingal	',13),(768,'	Shahbad	',8),(769,'	Puranpur	',27),(770,'	Nelamangala	',12),(771,'	Nakodar	',21),(772,'	Lunawada	',7),(773,'	Murshidabad	',36),(774,'	Mahe	',20),(775,'	Lanka	',3),(776,'	Rudauli	',27),(777,'	Tuensang	',19),(778,'	Lakshmeshwar	',12),(779,'	Zira	',21),(780,'	Yawal	',15),(781,'	Thana Bhawan	',27),(782,'	Ramdurg	',12),(783,'	Pulgaon	',15),(784,'	Sadasivpet	',24),(785,'	Nargund	',12),(786,'	Neem-Ka-Thana	',22),(787,'	Memari	',36),(788,'	Nilanga	',15),(789,'	Naharlagun	',2),(790,'	Pakaur	',11),(791,'	Wai	',15),(792,'	Tarikere	',12),(793,'	Malavalli	',12),(794,'	Raisen	',14),(795,'	Lahar	',14),(796,'	Uravakonda	',1),(797,'	Savanur	',12),(798,'	Sirohi	',22),(799,'	Udhampur	',10),(800,'	Umarga	',15),(801,'	Pratapgarh	',22),(802,'	Lingsugur	',12),(803,'	Usilampatti	',24),(804,'	Palia Kalan	',27),(805,'	Wokha	',19),(806,'	Rajpipla	',7),(807,'	Vijayapura	',12),(808,'	Rawatbhata	',22),(809,'	Sangaria	',22),(810,'	Paithan	',15),(811,'	Rahuri	',15),(812,'	Patti	',21),(813,'	Zaidpur	',27),(814,'	Lalsot	',22),(815,'	Maihar	',14),(816,'	Vedaranyam	',24),(817,'	Nawapur	',15),(818,'	Solan	',9),(819,'	Vapi	',7),(820,'	Sanawad	',14),(821,'	Warisaliganj	',4),(822,'	Revelganj	',4),(823,'	Sabalgarh	',14),(824,'	Tuljapur	',15),(825,'	Simdega	',11),(826,'	Musabani	',11),(827,'	Kodungallur	',13),(828,'	Phulabani	',19),(829,'	Umreth	',7),(830,'	Narsipatnam	',1),(831,'	Nautanwa	',27),(832,'	Rajgir	',4),(833,'	Yellandu	',24),(834,'	Sathyamangalam	',24),(835,'	Pilibanga	',22),(836,'	Morshi	',15),(837,'	Pehowa	',8),(838,'	Sonepur	',4),(839,'	Pappinisseri	',13),(840,'	Zamania	',27),(841,'	Mihijam	',11),(842,'	Purna	',15),(843,'	Puliyankudi	',24),(844,'	Shikarpur, Bulandshahr	',27),(845,'	Umaria	',14),(846,'	Porsa	',14),(847,'	Naugawan Sadat	',27),(848,'	Fatehpur Sikri	',27),(849,'	Manuguru	',24),(850,'	Udaipur	',25),(851,'	Pipar City	',22),(852,'	Pattamundai	',19),(853,'	Nanjikottai	',24),(854,'	Taranagar	',22),(855,'	Yerraguntla	',1),(856,'	Satana	',15),(857,'	Sherghati	',4),(858,'	Sankeshwara	',12),(859,'	Madikeri	',12),(860,'	Thuraiyur	',24),(861,'	Sanand	',7),(862,'	Rajula	',7),(863,'	Kyathampalle	',24),(864,'	Shahabad, Rampur	',27),(865,'	Tilda Newra	',5),(866,'	Narsinghgarh	',14),(867,'	Chittur-Thathamangalam	',13),(868,'	Malaj Khand	',14),(869,'	Sarangpur	',14),(870,'	Robertsganj	',27),(871,'	Sirkali	',24),(872,'	Radhanpur	',7),(873,'	Tiruchendur	',24),(874,'	Utraula	',27),(875,'	Patratu	',11),(876,'	Vijainagar, Ajmer	',22),(877,'	Periyasemur	',24),(878,'	Pathri	',15),(879,'	Sadabad	',27),(880,'	Talikota	',12),(881,'	Sinnar	',15),(882,'	Mungeli	',5),(883,'	Sedam	',12),(884,'	Shikaripur	',12),(885,'	Sumerpur	',22),(886,'	Sattur	',24),(887,'	Sugauli	',4),(888,'	Lumding	',3),(889,'	Vandavasi	',24),(890,'	Titlagarh	',19),(891,'	Uchgaon	',15),(892,'	Mokokchung	',19),(893,'	Paschim Punropara	',36),(894,'	Sagwara	',22),(895,'	Ramganj Mandi	',22),(896,'	Tarakeswar	',36),(897,'	Mahalingapura	',12),(898,'	Dharmanagar	',25),(899,'	Mahemdabad	',7),(900,'	Manendragarh	',5),(901,'	Uran	',15),(902,'	Tharamangalam	',24),(903,'	Tirukkoyilur	',24),(904,'	Pen	',15),(905,'	Makhdumpur	',4),(906,'	Maner	',4),(907,'	Oddanchatram	',24),(908,'	Palladam	',24),(909,'	Mundi	',14),(910,'	Nabarangapur	',19),(911,'	Mudalagi	',12),(912,'	Samalkha	',8),(913,'	Nepanagar	',14),(914,'	Karjat	',15),(915,'	Ranavav	',7),(916,'	Pedana	',1),(917,'	Pinjore	',8),(918,'	Lakheri	',22),(919,'	Pasan	',14),(920,'	Puttur	',1),(921,'	Vadakkuvalliyur	',24),(922,'	Tirukalukundram	',24),(923,'	Mahidpur	',14),(924,'	Mussoorie	',36),(925,'	Muvattupuzha	',13),(926,'	Rasra	',27),(927,'	Udaipurwati	',22),(928,'	Manwath	',15),(929,'	Adoor	',13),(930,'	Uthamapalayam	',24),(931,'	Partur	',15),(932,'	Nahan	',9),(933,'	Ladwa	',8),(934,'	Mankachar	',3),(935,'	Nongstoin	',17),(936,'	Losal	',22),(937,'	Sri Madhopur	',22),(938,'	Ramngarh	',22),(939,'	Mavelikkara	',13),(940,'	Rawatsar	',22),(941,'	Rajakhera	',22),(942,'	Lar	',27),(943,'	Lal Gopalganj Nindaura	',27),(944,'	Muddebihal	',12),(945,'	Sirsaganj	',27),(946,'	Shahpura	',22),(947,'	Surandai	',24),(948,'	Sangole	',15),(949,'	Pavagada	',12),(950,'	Tharad	',7),(951,'	Mansa	',7),(952,'	Umbergaon	',7),(953,'	Mavoor	',13),(954,'	Nalbari	',3),(955,'	Talaja	',7),(956,'	Malur	',12),(957,'	Mangrulpir	',15),(958,'	Soro	',19),(959,'	Shahpura	',22),(960,'	Vadnagar	',7),(961,'	Raisinghnagar	',22),(962,'	Sindhagi	',12),(963,'	Sanduru	',12),(964,'	Sohna	',8),(965,'	Manavadar	',7),(966,'	Pihani	',27),(967,'	Safidon	',8),(968,'	Risod	',15),(969,'	Rosera	',4),(970,'	Sankari	',24),(971,'	Malpura	',22),(972,'	Sonamukhi	',36),(973,'	Shamsabad, Agra	',27),(974,'	Nokha	',4),(975,'	PandUrban Agglomeration	',36),(976,'	Mainaguri	',36),(977,'	Afzalpur	',12),(978,'	Shirur	',15),(979,'	Salaya	',7),(980,'	Shenkottai	',24),(981,'	Pratapgarh	',25),(982,'	Vadipatti	',24),(983,'	Nagarkurnool	',24),(984,'	Savner	',15),(985,'	Sasvad	',15),(986,'	Rudrapur	',27),(987,'	Soron	',27),(988,'	Sholingur	',24),(989,'	Pandharkaoda	',15),(990,'	Perumbavoor	',13),(991,'	Maddur	',12),(992,'	Nadbai	',22),(993,'	Talode	',15),(994,'	Shrigonda	',15),(995,'	Madhugiri	',12),(996,'	Tekkalakote	',12),(997,'	Seoni-Malwa	',14),(998,'	Shirdi	',15),(999,'	SUrban Agglomerationr	',27),(1000,'	Terdal	',12),(1001,'	Raver	',15),(1002,'	Tirupathur	',24),(1003,'	Taraori	',8),(1004,'	Mukhed	',15),(1005,'	Manachanallur	',24),(1006,'	Rehli	',14),(1007,'	Sanchore	',22),(1008,'	Rajura	',15),(1009,'	Piro	',4),(1010,'	Mudabidri	',12),(1011,'	Vadgaon Kasba	',15),(1012,'	Nagar	',22),(1013,'	Vijapur	',7),(1014,'	Viswanatham	',24),(1015,'	Polur	',24),(1016,'	Panagudi	',24),(1017,'	Manawar	',14),(1018,'	Tehri	',36),(1019,'	Samdhan	',27),(1020,'	Pardi	',7),(1021,'	Rahatgarh	',14),(1022,'	Panagar	',14),(1023,'	Uthiramerur	',24),(1024,'	Tirora	',15),(1025,'	Rangia	',3),(1026,'	Sahjanwa	',27),(1027,'	Wara Seoni	',14),(1028,'	Magadi	',12),(1029,'	Rajgarh (Alwar)	',22),(1030,'	Rafiganj	',4),(1031,'	Tarana	',14),(1032,'	Rampur Maniharan	',27),(1033,'	Sheoganj	',22),(1034,'	Raikot	',21),(1035,'	Pauri	',36),(1036,'	Sumerpur	',27),(1037,'	Navalgund	',12),(1038,'	Shahganj	',27),(1039,'	Marhaura	',4),(1040,'	Tulsipur	',27),(1041,'	Sadri	',22),(1042,'	Thiruthuraipoondi	',24),(1043,'	Shiggaon	',12),(1044,'	Pallapatti	',24),(1045,'	Mahendragarh	',8),(1046,'	Sausar	',14),(1047,'	Ponneri	',24),(1048,'	Mahad	',15),(1049,'	Lohardaga	',11),(1050,'	Tirwaganj	',27),(1051,'	Margherita	',3),(1052,'	Sundarnagar	',9),(1053,'	Rajgarh	',14),(1054,'	Mangaldoi	',3),(1055,'	Renigunta	',1),(1056,'	Longowal	',21),(1057,'	Ratia	',8),(1058,'	Lalgudi	',24),(1059,'	Shrirangapattana	',12),(1060,'	Niwari	',14),(1061,'	Natham	',24),(1062,'	Unnamalaikadai	',24),(1063,'	PurqUrban Agglomerationzi	',27),(1064,'	Shamsabad, Farrukhabad	',27),(1065,'	Mirganj	',4),(1066,'	Todaraisingh	',22),(1067,'	Warhapur	',27),(1068,'	Rajam	',1),(1069,'	Urmar Tanda	',21),(1070,'	Lonar	',15),(1071,'	Powayan	',27),(1072,'	P.N.Patti	',24),(1073,'	Palampur	',9),(1074,'	Srisailam Project (Right Flank Colony) Township	',1),(1075,'	Sindagi	',12),(1076,'	Sandi	',27),(1077,'	Vaikom	',13),(1078,'	Malda	',36),(1079,'	Tharangambadi	',24),(1080,'	Sakaleshapura	',12),(1081,'	Lalganj	',4),(1082,'	Malkangiri	',19),(1083,'	Rapar	',7),(1084,'	Mauganj	',14),(1085,'	Todabhim	',22),(1086,'	Srinivaspur	',12),(1087,'	Murliganj	',4),(1088,'	Reengus	',22),(1089,'	Sawantwadi	',15),(1090,'	Tittakudi	',24),(1091,'	Lilong	',16),(1092,'	Rajaldesar	',22),(1093,'	Pathardi	',15),(1094,'	Achhnera	',27),(1095,'	Pacode	',24),(1096,'	Naraura	',27),(1097,'	Nakur	',27),(1098,'	Palai	',13),(1099,'	Morinda, India	',21),(1100,'	Manasa	',14),(1101,'	Nainpur	',14),(1102,'	Sahaspur	',27),(1103,'	Pauni	',15),(1104,'	Prithvipur	',14),(1105,'	Ramtek	',15),(1106,'	Silapathar	',3),(1107,'	Songadh	',7),(1108,'	Safipur	',27),(1109,'	Sohagpur	',14),(1110,'	Mul	',15),(1111,'	Sadulshahar	',22),(1112,'	Phillaur	',21),(1113,'	Sambhar	',22),(1114,'	Prantij	',22),(1115,'	Nagla	',36),(1116,'	Pattran	',21),(1117,'	Mount Abu	',22),(1118,'	Reoti	',27),(1119,'	Tenu dam-cum-Kathhara	',11),(1120,'	Panchla	',36),(1121,'	Sitarganj	',36),(1122,'	Pasighat	',2),(1123,'	Motipur	',4),(1124,'	O\' Valley	',24),(1125,'	Raghunathpur	',36),(1126,'	Suriyampalayam	',24),(1127,'	Qadian	',21),(1128,'	Rairangpur	',19),(1129,'	Silvassa	',5),(1130,'	Nowrozabad (Khodargama)	',14),(1131,'	Mangrol	',22),(1132,'	Soyagaon	',15),(1133,'	Sujanpur	',21),(1134,'	Manihari	',4),(1135,'	Sikanderpur	',27),(1136,'	Mangalvedhe	',15),(1137,'	Phulera	',22),(1138,'	Ron	',12),(1139,'	Sholavandan	',24),(1140,'	Saidpur	',27),(1141,'	Shamgarh	',14),(1142,'	Thammampatti	',24),(1143,'	Maharajpur	',14),(1144,'	Multai	',14),(1145,'	Mukerian	',21),(1146,'	Sirsi	',27),(1147,'	Purwa	',27),(1148,'	Sheohar	',4),(1149,'	Namagiripettai	',24),(1150,'	Parasi	',27),(1151,'	Lathi	',7),(1152,'	Lalganj	',27),(1153,'	Narkhed	',15),(1154,'	Mathabhanga	',36),(1155,'	Shendurjana	',15),(1156,'	Peravurani	',24),(1157,'	Mariani	',3),(1158,'	Phulpur	',27),(1159,'	Rania	',8),(1160,'	Pali	',14),(1161,'	Pachore	',14),(1162,'	Parangipettai	',24),(1163,'	Pudupattinam	',24),(1164,'	Panniyannur	',13),(1165,'	Maharajganj	',4),(1166,'	Rau	',14),(1167,'	Monoharpur	',36),(1168,'	Mandawa	',22),(1169,'	Marigaon	',3),(1170,'	Pallikonda	',24),(1171,'	Pindwara	',22),(1172,'	Shishgarh	',27),(1173,'	Patur	',15),(1174,'	Mayang Imphal	',16),(1175,'	Mhowgaon	',14),(1176,'	Guruvayoor	',13),(1177,'	Mhaswad	',15),(1178,'	Sahawar	',27),(1179,'	Sivagiri	',24),(1180,'	Mundargi	',12),(1181,'	Punjaipugalur	',24),(1182,'	Kailasahar	',25),(1183,'	Samthar	',27),(1184,'	Sakti	',5),(1185,'	Sadalagi	',12),(1186,'	Silao	',4),(1187,'	Mandalgarh	',22),(1188,'	Loha	',15),(1189,'	Pukhrayan	',27),(1190,'	Padmanabhapuram	',24),(1191,'	Belonia	',25),(1192,'	Saiha	',18),(1193,'	Srirampore	',36),(1194,'	Talwara	',21),(1195,'	Puthuppally	',13),(1196,'	Khowai	',25),(1197,'	Vijaypur	',14),(1198,'	Takhatgarh	',22),(1199,'	Thirupuvanam	',24),(1200,'	Adra	',36),(1201,'	Piriyapatna	',12),(1202,'	Obra	',27),(1203,'	Adalaj	',7),(1204,'	Nandgaon	',15),(1205,'	Barh	',4),(1206,'	Chhapra	',7),(1207,'	Panamattom	',13),(1208,'	Niwai	',27),(1209,'	Bageshwar	',36),(1210,'	Tarbha	',19),(1211,'	Adyar	',12),(1212,'	Narsinghgarh	',14),(1213,'	Warud	',15),(1214,'	Asarganj	',4),(1215,'	Sarsod	',8);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_details`
--

DROP TABLE IF EXISTS `company_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `company_details` (
  `Company_Details_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Org_Hier_ID` int(11) NOT NULL,
  `Formal_Name` varchar(45) DEFAULT NULL,
  `Calender_StartDate` datetime DEFAULT NULL,
  `Calender_EndDate` datetime DEFAULT NULL,
  `Auditing_Frequency` varchar(45) DEFAULT NULL,
  `Website` varchar(45) DEFAULT NULL,
  `Company_Email_ID` varchar(45) DEFAULT NULL,
  `Company_ContactNumber1` varchar(45) DEFAULT NULL,
  `Company_ContactNumber2` varchar(45) DEFAULT NULL,
  `Industry_Type_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Company_Details_ID`),
  KEY `Org_Hier_ID` (`Org_Hier_ID`),
  KEY `Industry_Type_ID` (`Industry_Type_ID`),
  CONSTRAINT `company_details_ibfk_1` FOREIGN KEY (`Org_Hier_ID`) REFERENCES `org_hier` (`org_hier_id`),
  CONSTRAINT `company_details_ibfk_2` FOREIGN KEY (`Industry_Type_ID`) REFERENCES `industry_type_master` (`industry_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_details`
--

LOCK TABLES `company_details` WRITE;
/*!40000 ALTER TABLE `company_details` DISABLE KEYS */;
INSERT INTO `company_details` VALUES (1,2,NULL,'0001-01-01 00:00:00','0001-01-01 00:00:00',NULL,'www.microsoftcompany1.com','info@microsoftcompany.com','8907543210',NULL,1),(2,6,NULL,'0001-01-01 00:00:00','0001-01-01 00:00:00',NULL,'www.reliancecomm.com','info@reliance.com','7890654321',NULL,1),(3,9,NULL,'2018-08-01 00:00:00','2019-08-31 00:00:00',NULL,'www.vendor1.com','info@vendor1.com','8907432121',NULL,1),(4,10,NULL,'0001-01-01 00:00:00','0001-01-01 00:00:00',NULL,'www.microcomp.com','info@gmail.com','6789043124',NULL,1),(5,14,NULL,'0001-01-01 00:00:00','0001-01-01 00:00:00',NULL,'www.adanipower.com','info@adanipower.com','8907654321',NULL,2),(6,16,NULL,'0001-01-01 00:00:00','0001-01-01 00:00:00',NULL,'www.adanimining.com','info@adanimining.com','8907654321',NULL,4),(7,17,NULL,'0001-01-01 00:00:00','0001-01-01 00:00:00',NULL,'www.adaniming.com','info@adanimining.com','8901233451',NULL,4),(8,20,NULL,'0001-01-01 00:00:00','0001-01-01 00:00:00',NULL,'adani.in','adani@adani.com','7896541230',NULL,2),(9,23,NULL,'0001-01-01 00:00:00','0001-01-01 00:00:00',NULL,'adani.in','adani@a.com','7410852963',NULL,2);
/*!40000 ALTER TABLE `company_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compliance_audit`
--

DROP TABLE IF EXISTS `compliance_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `compliance_audit` (
  `Compliance_Audit_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Xref_Comp_Type_Map_ID` int(11) DEFAULT NULL,
  `Org_Hier_ID` int(11) NOT NULL,
  `Auditor_ID` int(11) NOT NULL,
  `Audit_Date` datetime DEFAULT NULL,
  `Audit_Followup_Date` datetime DEFAULT NULL,
  `Audit_Remarks` varchar(1000) DEFAULT NULL,
  `Is_Active` bit(1) DEFAULT NULL,
  `Version` int(11) DEFAULT NULL,
  `Compliance_Status` varchar(100) DEFAULT NULL,
  `Applicability` varchar(10) DEFAULT NULL,
  `Start_Date` datetime DEFAULT NULL,
  `End_Date` datetime DEFAULT NULL,
  `Vendor_ID` int(11) NOT NULL,
  `Risk_Category` varchar(10) DEFAULT NULL,
  `Evidences` varchar(1000) DEFAULT NULL,
  `Periodicity` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Compliance_Audit_ID`),
  KEY `Xref_Comp_Type_Map_ID` (`Xref_Comp_Type_Map_ID`),
  KEY `Org_Hier_ID` (`Org_Hier_ID`),
  KEY `Auditor_ID` (`Auditor_ID`),
  KEY `Vendor_ID` (`Vendor_ID`),
  CONSTRAINT `compliance_audit_ibfk_1` FOREIGN KEY (`Xref_Comp_Type_Map_ID`) REFERENCES `xref_comp_type_mapping` (`xref_comp_type_map_id`),
  CONSTRAINT `compliance_audit_ibfk_2` FOREIGN KEY (`Org_Hier_ID`) REFERENCES `org_hier` (`org_hier_id`),
  CONSTRAINT `compliance_audit_ibfk_3` FOREIGN KEY (`Auditor_ID`) REFERENCES `user` (`user_id`),
  CONSTRAINT `compliance_audit_ibfk_4` FOREIGN KEY (`Vendor_ID`) REFERENCES `org_hier` (`org_hier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compliance_audit`
--

LOCK TABLES `compliance_audit` WRITE;
/*!40000 ALTER TABLE `compliance_audit` DISABLE KEYS */;
INSERT INTO `compliance_audit` VALUES (3,20,8,1,'2018-01-01 00:00:00','2018-07-10 00:00:00','Punishable',_binary '',1,'Compliant','Yes','2018-01-01 00:00:00','2018-01-31 00:00:00',8,'High',NULL,'One Time'),(5,21,8,1,'2018-09-20 21:52:11','2018-01-01 00:00:00','Non Punishable',_binary '',1,'Compliant','Yes','2018-01-01 00:00:00','2018-01-31 00:00:00',8,'Low',NULL,'Monthly'),(6,21,8,1,'2018-09-20 22:45:39','2018-01-31 00:00:00','Punishable',_binary '',1,'Compliant','Yes','2018-02-01 00:00:00','2018-02-28 00:00:00',8,'Low',NULL,'Monthly'),(7,21,8,1,'2018-09-20 22:46:45','2018-01-31 00:00:00','Punishable',_binary '',1,'Non-Compliant','Yes','2018-03-01 00:00:00','2018-03-30 00:00:00',8,'Low',NULL,'Monthly'),(8,21,8,1,'2018-09-25 22:46:45','2018-01-31 00:00:00','Punishable',_binary '',1,'Compliant','Yes','2018-02-01 00:00:00','2018-02-28 00:00:00',8,'High',NULL,'One Time'),(9,21,8,1,'2018-09-25 22:46:45',NULL,'Overallgood',_binary '',1,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL),(10,20,8,1,'2018-10-01 20:21:50','2018-01-01 00:00:00','Compliant',_binary '\0',0,'Compliant','No','2018-01-01 00:00:00','2018-01-31 00:00:00',8,'Low',NULL,'One Time'),(11,20,8,1,'2018-10-01 20:36:18','2018-01-01 00:00:00','Compliant',_binary '\0',0,'Compliant','No','2018-02-01 00:00:00','2018-02-28 00:00:00',8,NULL,NULL,NULL),(12,20,8,1,'2018-10-01 20:43:16','2018-01-01 00:00:00','Compliant',_binary '\0',0,'Compliant','No','2018-03-01 00:00:00','2018-03-31 00:00:00',8,NULL,NULL,NULL);
/*!40000 ALTER TABLE `compliance_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compliance_audit_audittrail`
--

DROP TABLE IF EXISTS `compliance_audit_audittrail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `compliance_audit_audittrail` (
  `Compliance_Audit_Trail_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Xref_Comp_Type_Map_ID` int(11) NOT NULL,
  `Org_Hier_ID` int(11) NOT NULL,
  `Auditor_ID` int(11) NOT NULL,
  `Audit_Date` datetime DEFAULT NULL,
  `Audit_Followup_Date` datetime DEFAULT NULL,
  `Audit_Remarks` varchar(1000) DEFAULT NULL,
  `Is_Active` bit(1) DEFAULT NULL,
  `Version` int(11) DEFAULT NULL,
  `Compliance_Status` varchar(100) DEFAULT NULL,
  `Applicability` varchar(10) DEFAULT NULL,
  `Start_Date` datetime DEFAULT NULL,
  `End_Date` datetime DEFAULT NULL,
  `Vendor_ID` int(11) NOT NULL,
  `Risk_Category` varchar(10) DEFAULT NULL,
  `Evidences` varchar(1000) DEFAULT NULL,
  `Action_Type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Compliance_Audit_Trail_ID`),
  KEY `Xref_Comp_Type_Map_ID` (`Xref_Comp_Type_Map_ID`),
  KEY `Org_Hier_ID` (`Org_Hier_ID`),
  KEY `Auditor_ID` (`Auditor_ID`),
  KEY `Vendor_ID` (`Vendor_ID`),
  CONSTRAINT `compliance_audit_audittrail_ibfk_1` FOREIGN KEY (`Xref_Comp_Type_Map_ID`) REFERENCES `xref_comp_type_mapping` (`xref_comp_type_map_id`),
  CONSTRAINT `compliance_audit_audittrail_ibfk_2` FOREIGN KEY (`Org_Hier_ID`) REFERENCES `org_hier` (`org_hier_id`),
  CONSTRAINT `compliance_audit_audittrail_ibfk_3` FOREIGN KEY (`Auditor_ID`) REFERENCES `user` (`user_id`),
  CONSTRAINT `compliance_audit_audittrail_ibfk_4` FOREIGN KEY (`Vendor_ID`) REFERENCES `org_hier` (`org_hier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compliance_audit_audittrail`
--

LOCK TABLES `compliance_audit_audittrail` WRITE;
/*!40000 ALTER TABLE `compliance_audit_audittrail` DISABLE KEYS */;
/*!40000 ALTER TABLE `compliance_audit_audittrail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compliance_branch_mapping`
--

DROP TABLE IF EXISTS `compliance_branch_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `compliance_branch_mapping` (
  `Branch_Mapping_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Org_Hier_ID` int(11) NOT NULL,
  `Is_Active` bit(1) DEFAULT NULL,
  `UpdatedByLogin_ID` int(11) DEFAULT NULL,
  `Allocation_Date` datetime DEFAULT NULL,
  `Vendor_ID` int(11) DEFAULT NULL,
  `Xref_Comp_Type_Map_ID` int(11) NOT NULL,
  PRIMARY KEY (`Branch_Mapping_ID`),
  KEY `Org_Hier_ID` (`Org_Hier_ID`),
  KEY `UpdatedByLogin_ID` (`UpdatedByLogin_ID`),
  KEY `Vendor_ID` (`Vendor_ID`),
  KEY `Xref_Comp_Type_Map_ID` (`Xref_Comp_Type_Map_ID`),
  CONSTRAINT `Vendor_ID` FOREIGN KEY (`Vendor_ID`) REFERENCES `org_hier` (`org_hier_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `compliance_branch_mapping_ibfk_1` FOREIGN KEY (`Org_Hier_ID`) REFERENCES `org_hier` (`org_hier_id`),
  CONSTRAINT `compliance_branch_mapping_ibfk_3` FOREIGN KEY (`UpdatedByLogin_ID`) REFERENCES `user` (`user_id`),
  CONSTRAINT `compliance_branch_mapping_ibfk_4` FOREIGN KEY (`Xref_Comp_Type_Map_ID`) REFERENCES `xref_comp_type_mapping` (`xref_comp_type_map_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compliance_branch_mapping`
--

LOCK TABLES `compliance_branch_mapping` WRITE;
/*!40000 ALTER TABLE `compliance_branch_mapping` DISABLE KEYS */;
INSERT INTO `compliance_branch_mapping` VALUES (11,8,_binary '',1,'2018-09-06 17:26:02',8,20),(12,8,_binary '',1,'2018-09-06 17:26:02',8,21),(13,8,_binary '',1,'2018-09-06 17:26:03',8,25),(14,8,_binary '',1,'2018-09-06 17:26:03',8,28);
/*!40000 ALTER TABLE `compliance_branch_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compliance_type`
--

DROP TABLE IF EXISTS `compliance_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `compliance_type` (
  `Compliance_Type_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Compliance_Type_Name` varchar(50) DEFAULT NULL,
  `Industry_Type_ID` int(11) NOT NULL,
  `Country_ID` int(11) NOT NULL,
  `Audit_Frequency` varchar(50) DEFAULT NULL,
  `End_Date` date DEFAULT NULL,
  `Start_Date` date DEFAULT NULL,
  PRIMARY KEY (`Compliance_Type_ID`),
  KEY `Industry_Type_ID` (`Industry_Type_ID`),
  KEY `Country_ID` (`Country_ID`),
  CONSTRAINT `compliance_type_ibfk_1` FOREIGN KEY (`Industry_Type_ID`) REFERENCES `industry_type_master` (`industry_type_id`),
  CONSTRAINT `compliance_type_ibfk_2` FOREIGN KEY (`Country_ID`) REFERENCES `country` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compliance_type`
--

LOCK TABLES `compliance_type` WRITE;
/*!40000 ALTER TABLE `compliance_type` DISABLE KEYS */;
INSERT INTO `compliance_type` VALUES (1,'Labour',1,1,'12','2018-01-31','2018-01-01'),(2,'Labour',2,1,'4','2018-03-30','2018-01-01'),(3,'Statutory',2,1,'2','2018-06-30','2018-01-01'),(4,'Safety compliance',2,1,'1','2018-12-31','2018-01-01'),(5,'Statutory Compliance',1,1,'3','2018-03-30','2018-01-01');
/*!40000 ALTER TABLE `compliance_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compliance_type_mapping`
--

DROP TABLE IF EXISTS `compliance_type_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `compliance_type_mapping` (
  `compliance_type_map_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Org_Hier_ID` int(11) NOT NULL,
  `Compliance_Type_ID` int(11) NOT NULL,
  PRIMARY KEY (`compliance_type_map_ID`),
  KEY `Org_Hier_ID` (`Org_Hier_ID`),
  KEY `Compliance_Type_ID` (`Compliance_Type_ID`),
  CONSTRAINT `compliance_type_mapping_ibfk_1` FOREIGN KEY (`Org_Hier_ID`) REFERENCES `org_hier` (`org_hier_id`),
  CONSTRAINT `compliance_type_mapping_ibfk_2` FOREIGN KEY (`Compliance_Type_ID`) REFERENCES `compliance_type` (`compliance_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compliance_type_mapping`
--

LOCK TABLES `compliance_type_mapping` WRITE;
/*!40000 ALTER TABLE `compliance_type_mapping` DISABLE KEYS */;
INSERT INTO `compliance_type_mapping` VALUES (1,2,1),(2,4,1),(3,6,1),(4,8,1),(5,9,1),(6,10,1),(7,11,1),(8,12,1),(9,14,2),(10,15,2),(11,18,2),(12,19,2),(13,20,2),(14,21,2),(15,22,2),(16,23,2),(17,23,3),(18,24,2),(19,24,3);
/*!40000 ALTER TABLE `compliance_type_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compliance_xref`
--

DROP TABLE IF EXISTS `compliance_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `compliance_xref` (
  `Compliance_Xref_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Compliance_Parent_ID` int(11) NOT NULL,
  `Comp_Category` varchar(45) DEFAULT NULL,
  `Compliance_Title` varchar(450) DEFAULT NULL,
  `Comp_Description` varchar(800) DEFAULT NULL,
  `Details` varchar(1000) DEFAULT NULL,
  `Consequence` varchar(1000) DEFAULT NULL,
  `Is_Header` bit(1) DEFAULT NULL,
  `level` int(3) DEFAULT NULL,
  `Periodicity` varchar(50) DEFAULT NULL,
  `Version` int(3) DEFAULT NULL,
  `Effective_Start_Date` datetime DEFAULT NULL,
  `Effective_End_Date` datetime DEFAULT NULL,
  `Country_ID` int(11) DEFAULT NULL,
  `State_ID` int(11) DEFAULT NULL,
  `City_ID` int(11) DEFAULT NULL,
  `User_ID` int(11) NOT NULL,
  `Is_Active` bit(1) DEFAULT NULL,
  `Last_Updated_Date` datetime DEFAULT NULL,
  PRIMARY KEY (`Compliance_Xref_ID`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `compliance_xref_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compliance_xref`
--

LOCK TABLES `compliance_xref` WRITE;
/*!40000 ALTER TABLE `compliance_xref` DISABLE KEYS */;
INSERT INTO `compliance_xref` VALUES (1,0,'Act','CLRA- Principal Employer','CLRA- Principal Employer is an Labour compliance type Act in india.',NULL,NULL,_binary '',1,'One time',1,'2000-01-01 00:00:00','9999-12-31 00:00:00',1,0,0,1,_binary '','2018-08-31 19:26:41'),(2,0,'Act','CLRA - Contractor',NULL,NULL,NULL,_binary '',1,NULL,1,'2000-01-01 00:00:00','9999-12-31 00:00:00',1,0,0,1,_binary '','2018-08-31 19:32:38'),(3,1,'Rule','Sec 1','1. 20 or more workers employed or were employed \r\n2. Work should not be casual or intermittent \r\nin nature\r\n3. Performed more than 120 days or more during the previous year','1. 20 or more workers employed or were employed 2. Work should not be casual or intermittent \nin nature\n3. Performed more than 120 days or more during the previous year','1. Shall be punishable with imprisonment for a term which may extend to three months, or with fine which may extend to one thousand rupees, or with both,  an additional fine which may extend to one hundred rupees for every day during which such contravention continues.\r\n2.If the person committing an offence under this Act is a company, the company as well as every person in charge of,  shall be deemed to be guilty of the offence and shall be liable to be proceeded against and punished accordingly',_binary '\0',2,'One Time',1,'2000-01-01 00:00:00','9999-12-31 00:00:00',1,0,0,1,_binary '','2018-08-31 19:38:33'),(4,1,'Rule','Sec 20 and Rule 74','Register of Contractors ( Form XII)',NULL,'1. Shall be punishable with imprisonment for a term which may extend to three months, or with fine which may extend to one thousand rupees, or with both,  an additional fine which may extend to one hundred rupees for every day during which such contravention continues.\r\n2.If the person committing an offence under this Act is a company, the company as well as every person in charge of,  shall be deemed to be guilty of the offence and shall be liable to be proceeded against and punished accordingly',_binary '\0',2,'Yearly',1,'2000-01-01 00:00:00','9999-12-31 00:00:00',1,0,0,1,_binary '','2018-08-31 19:41:52'),(5,2,'Rule','Sec 1 ','1. Every contractor employs twenty or more workers employed were employed during the prceeding 12 months\r\n2.Work performed is not casual or intermittent in nature - work performed more than 120 days or 90 days in case of seasonal in character',NULL,'1. Shall be punishable with imprisonment for a term which may extend to three months, or with fine which may extend to one thousand rupees, or with both,  an additional fine which may extend to one hundred rupees for every day during which such contravention continues.\r\n2.If the person committing an offence under this Act is a company, the company as well as every person in charge of,  shall be deemed to be guilty of the offence and shall be liable to be proceeded against and punished accordingly',_binary '\0',2,'One Time',1,'2000-01-01 00:00:00','9999-12-31 00:00:00',1,0,0,1,_binary '','2018-08-31 19:53:07'),(6,2,'Rule','Sec 12, Rule 21 and Rule 22','Licencing to Contractors\r\nValidity of license\r\nForm V - From Principal Employer\r\nForm IV - Application for License\r\nForm VI - License',NULL,'1. Shall be punishable with imprisonment for a term which may extend to three months, or with fine which may extend to one thousand rupees, or with both,  an additional fine which may extend to one hundred rupees for every day during which such contravention continues.\r\n2.If the person committing an offence under this Act is a company, the company as well as every person in charge of,  shall be deemed to be guilty of the offence and shall be liable to be proceeded against and punished accordingly',_binary '\0',2,'Contract period and Validay period',1,'2000-01-01 00:00:00','9999-12-31 00:00:00',1,0,0,1,_binary '','2018-08-31 19:54:35'),(7,1,'Form','Form 24',NULL,NULL,'Non Punishable',_binary '\0',2,'one time',1,'2000-01-01 00:00:00','9999-12-31 00:00:00',1,0,0,1,_binary '','2018-09-03 15:36:55'),(8,1,'Register','Register 1','','','Register',_binary '\0',2,'One Time',1,'2018-01-01 00:00:00','2020-01-31 00:00:00',1,0,0,1,_binary '','2018-09-26 13:05:44'),(9,0,'Act','THE EMPLOYEES\' PROVIDENT FUNDS AND MISCELLANEOUS PROVISIONS ACT, 1952','IT is a PF Act in India',NULL,NULL,_binary '',1,NULL,1,'2000-01-01 00:00:00','9999-12-31 00:00:00',1,0,0,1,_binary '','2018-09-06 16:19:56'),(10,9,'Rule','sec1','Applicability and registration','Twenty or more person employed','Any other person to avoid such payment, knowingly makes or causes to be made any false statement or false representation shall be punishable with imprisonment for a term which may extend to 4[one year, or with fine of five thousand rupees, or with both]. ',_binary '\0',2,'One Time',1,'2000-01-01 00:00:00','9999-12-31 00:00:00',1,0,0,1,_binary '','2018-09-06 16:32:49'),(11,9,'Rule','sec 2','Establishment','Include all brances and offices','Any other person to avoid such payment, knowingly makes or causes to be made any false statement or false representation shall be punishable with imprisonment for a term which may extend to 4[one year, or with fine of five thousand rupees, or with both]. ',_binary '\0',2,'one time',1,'2000-01-01 00:00:00','9999-12-31 00:00:00',1,0,0,1,_binary '','2018-09-06 17:21:48'),(12,2,'Rule','Sec 14,Rule 21, Rule 27 and Rule 28','Licencing to Contractors','Shall execute or undertake license and payment of sufficient fee to get the license','1. Shall be punishable with imprisonment for a term which may extend to three months, or with fine which may extend to one thousand rupees, or with both,  an additional fine which may extend to one hundred rupees for every day during which such contravention continues.',_binary '\0',2,'Contract period and Validay period',1,'2000-01-01 00:00:00','9999-12-31 00:00:00',1,0,0,1,_binary '','2018-09-26 17:21:48'),(13,2,'Rule','Rule 25',NULL,'1. Sufficient supply of wholesome driniking water \n2. Sufficient latrines and Unrinals\n3. Washing facilities',NULL,_binary '\0',2,'One time',1,'2000-01-01 00:00:00','9999-12-31 00:00:00',1,0,0,1,_binary '','2018-09-26 17:21:48'),(14,2,'Rule','Sec 16 and rule 42','Canteen','1.Licence is not transferable\n2. No of employees should not exceed no specified in the License - any day\n3. Similar kind of work profile by regular employee, same wage to be paid ','1. Shall be punishable with imprisonment for a term which may extend to three months, or with fine which may extend to one thousand rupees, or with both,  an additional fine which may extend to one hundred rupees for every day during which such contravention continues.',_binary '\0',2,'One time',1,'2000-01-01 00:00:00','9999-12-31 00:00:00',1,0,0,1,_binary '','2018-09-26 17:21:48'),(15,2,'Rule','Rule 43 to Rule 50','Canteen','More than 100 or more ordinarily employed by the contractor within 60 days\n   - Date of the Canteen\n  - Construction, Accomodation, Furniture and  equipment for the canteen adquate standard to be maintained\n- Foodstuff served and charges has be made thereof',NULL,_binary '\0',2,'One time',1,'2000-01-01 00:00:00','9999-12-31 00:00:00',1,0,0,1,_binary '','2018-09-26 17:21:48'),(16,2,'Rule','Sec 17 and Rule 41','Rest rooms','1.Dining hall, Kitchen, Storeroom, Pantry and washing places should be available\n2. Sufficiently lighted\n3.Clean and Sanitary Condition\n4. Waste disposable provision\n5. Waster water should be carried by suitable drains\n6. Dining hall to accommodate 30 % of strength\n7. Dining hall and chairs adquately spaced \n8. Separate place for women workers\n9. Washing place separately for women\n10. Clean clothes \n11. Hygienic condition\n12. Food stuff provided should be normal eating habits of labour\n13. Canteen should not be functioning no profit or no loss','1. Shall be punishable with imprisonment for a term which may extend to three months, or with fine which may extend to one thousand rupees, or with both,  an additional fine which may extend to one hundred rupees for every day during which such contravention continues.',_binary '\0',2,'One time',1,'2000-01-01 00:00:00','9999-12-31 00:00:00',1,0,0,1,_binary '','2018-09-26 17:21:48'),(17,2,'Rule','Sec 18','Other Facilities','Contract Labour if he/she halts at night\n    - rest room or alternative accommodation to be provided within 15 days\n   - Shall be sufficiently lighted and ventilated\n    - maintained clean and comfortable condition\n - Separate room for women to be provided\n-Adequate wholesome drinking water facitilites','1. Shall be punishable with imprisonment for a term which may extend to three months, or with fine which may extend to one thousand rupees, or with both,  an additional fine which may extend to one hundred rupees for every day during which such contravention continues.',_binary '\0',2,'One time',1,'2000-01-01 00:00:00','9999-12-31 00:00:00',1,0,0,1,_binary '','2018-09-26 17:21:48'),(18,2,'Rule','Sec 19','First aid Appliances','Maintained by the contractor readily accessible during all working hours','1. Shall be punishable with imprisonment for a term which may extend to three months, or with fine which may extend to one thousand rupees, or with both,  an additional fine which may extend to one hundred rupees for every day during which such contravention continues.',_binary '\0',2,'Monthly',1,'2000-01-01 00:00:00','9999-12-31 00:00:00',1,0,0,1,_binary '','2018-09-26 17:21:48'),(19,2,'Rule','Sec 21','Responsibility of payment of wages','On or before 7th - Less than 1000 employees On or before 10th - More than 1000 employees','1. Shall be punishable with imprisonment for a term which may extend to three months, or with fine which may extend to one thousand rupees, or with both,  an additional fine which may extend to one hundred rupees for every day during which such contravention continues.',_binary '\0',2,'One time',1,'2000-01-01 00:00:00','9999-12-31 00:00:00',1,0,0,1,_binary '','2018-09-26 17:21:48'),(20,2,'Rule','Rule 25 ','Creche Facilities','Twenty or more workmen employed \n1. Two rooms of reasonable dimension should be provided\n2. Play room  and bedroom for children\n3. Standard of constrcution as per creche facility norms\n4. Adqueate toys and cots \n5. Children less than 6 years has to be accommodated',NULL,_binary '\0',2,'Monthly',1,'2000-01-01 00:00:00','9999-12-31 00:00:00',1,0,0,1,_binary '','2018-09-26 17:21:48'),(21,2,'Rule','Rule 25 ','Timing of Female worker','No female worker is employed before 6 am and after 7 pm',NULL,_binary '\0',2,'One time',1,'2000-01-01 00:00:00','9999-12-31 00:00:00',1,0,0,1,_binary '','2018-09-26 17:21:48'),(22,2,'Rule','Rule 51','Latrine and Urinals','Female employees - One latrine for every 25 employees\nMale Employees - One latrine for every 25 male employees\nOne for 25 up to 100 and one for 50 thereafter',NULL,_binary '\0',2,'One time',1,'2000-01-01 00:00:00','9999-12-31 00:00:00',1,0,0,1,_binary '','2018-09-26 17:21:48'),(23,2,'Rule','Rule 52 and Rule 53','Latrine and Urinals','Adequate doors\nDisplayed in case of both sex employed ',NULL,_binary '\0',2,'One time',1,'2000-01-01 00:00:00','9999-12-31 00:00:00',1,0,0,1,_binary '','2018-09-26 17:21:48'),(24,2,'Rule','Rule 54','Latrine and Urinals','One urinal for male workers up to 50\nOne for female for every 50\nMore than 500 - one for every 100',NULL,_binary '\0',2,'One time',1,'2000-01-01 00:00:00','9999-12-31 00:00:00',1,0,0,1,_binary '','2018-09-26 17:21:48'),(25,2,'Rule','Rule 55','Latrine and Urinals','Sanitary conditions should be good\nAccessible easily by the employees\nGood sewage system\nAdequately lighted',NULL,_binary '\0',2,'One time',1,'2000-01-01 00:00:00','9999-12-31 00:00:00',1,0,0,1,_binary '','2018-09-26 17:21:48'),(26,2,'Rule','Rule 56','Water','Good water Facilities with Tap facilities',NULL,_binary '\0',2,'One time',1,'2000-01-01 00:00:00','9999-12-31 00:00:00',1,0,0,1,_binary '','2018-09-26 17:21:48'),(27,2,'Rule','Rule 57','Washing Facilities','Separate adquate screening facilities for Men and Women\nAccessible, shall be kept in clean and hygienic condition',NULL,_binary '\0',2,'One time',1,'2000-01-01 00:00:00','9999-12-31 00:00:00',1,0,0,1,_binary '','2018-09-26 17:21:48'),(28,2,'Rule','Rule 58','First aid Appliances','One box for 150 or part of employees employed thereof',NULL,_binary '\0',2,'One time',1,'2000-01-01 00:00:00','9999-12-31 00:00:00',1,0,0,1,_binary '','2018-09-26 17:21:48'),(29,2,'Rule','Rule 59','Contract employees  employed not exceed fifty','(i)  6 small sterilized dressings.) \n 3 medium size sterilized dressings.\n         (iii)  3 large size sterilized dressings.\n        (iv)  3 large sterilized burn dressings.\n         (v)  1 (30 ml.) bottle containing a two per cent. alcohol solution of iodine.\n        (vi)  1 (30 ml.) bottle containing salvolatile having the dose and mode of administration indicated on the label.\n        (vii)  1 snake-bite lancet.\n       (viii)  1 (30 gms.) bottle of potassium permanganate crystals.\n        (ix)  1 pair scissors.\n         (x)  1 copy of the first-aid leaflet issued by the Director General, Factory Advice Service and Labour Institutes, Government of India.\n        (xi)  A bottle containing 100 tablets (each of 5 grains) of aspirin.\n        (xii)  Ointment for burns.\n       (xiii)  A bottle of suitable surgical anti-septic solution.',NULL,_binary '\0',2,'One time',1,'2000-01-01 00:00:00','9999-12-31 00:00:00',1,0,0,1,_binary '','2018-09-26 17:21:48'),(30,2,'Rule','Rule 60','Responsible person for First aid box','Readily available during the working hours of the establishhment',NULL,_binary '\0',2,'One time',1,'2000-01-01 00:00:00','9999-12-31 00:00:00',1,0,0,1,_binary '','2018-09-26 17:21:48'),(31,2,'Rule','Rule 61','Trained First Aid box','Person incharge for Trained Frist Aid box - No of person more than 150',NULL,_binary '\0',2,'One time',1,'2000-01-01 00:00:00','9999-12-31 00:00:00',1,0,0,1,_binary '','2018-09-26 17:21:48'),(32,2,'Rule','Rule 62','Trained First Aid box','Person incharge for Trained Frist Aid box - No of person more than 150',NULL,_binary '\0',2,'One time',1,'2000-01-01 00:00:00','9999-12-31 00:00:00',1,0,0,1,_binary '','2018-09-26 17:21:48'),(33,2,'Rule','Rule 63','Fixation of wage period','Contractor has to fix the wage period',NULL,_binary '\0',2,'One time',1,'2000-01-01 00:00:00','9999-12-31 00:00:00',1,0,0,1,_binary '','2018-09-26 17:21:48'),(34,2,'Rule','Rule 65','Wage period','Should not exceed one month',NULL,_binary '\0',2,'Monthly',1,'2000-01-01 00:00:00','9999-12-31 00:00:00',1,0,0,1,_binary '','2018-09-26 17:21:48'),(35,2,'Rule','Rule 66','Date of Payment','On or Before 7th - Less than 1000 on or Before 10th - More than 1000',NULL,_binary '\0',2,'Monthly',1,'2000-01-01 00:00:00','9999-12-31 00:00:00',1,0,0,1,_binary '','2018-09-26 17:21:48'),(36,2,'Rule','Rule 67','Termination','Second working day after the termination',NULL,_binary '\0',2,'Monthly',1,'2000-01-01 00:00:00','9999-12-31 00:00:00',1,0,0,1,_binary '','2018-09-26 17:21:48'),(37,2,'Rule','Rule 68','','Substantial evidences for the payment of wages',NULL,_binary '\0',2,'Monthly',1,'2000-01-01 00:00:00','9999-12-31 00:00:00',1,0,0,1,_binary '','2018-09-26 17:21:48'),(38,2,'Rule','Rule 75','Register of Persons Employed','Form XIII',NULL,_binary '\0',2,'Monthly',1,'2000-01-01 00:00:00','9999-12-31 00:00:00',1,0,0,1,_binary '','2018-09-26 17:21:48'),(39,2,'Rule','Rule 76','Employment Card for all new joiners','Form XIV',NULL,_binary '\0',2,'Monthly',1,'2000-01-01 00:00:00','9999-12-31 00:00:00',1,0,0,1,_binary '','2018-09-26 17:21:48'),(40,2,'Rule','Rule 77','Service Certificate','Form XV',NULL,_binary '\0',2,'Monthly',1,'2000-01-01 00:00:00','9999-12-31 00:00:00',1,0,0,1,_binary '','2018-09-26 17:21:48'),(44,0,'Act','Child Labour',NULL,NULL,NULL,_binary '',1,NULL,1,'0001-01-01 00:00:00','9999-12-31 00:00:00',1,0,0,1,_binary '','2018-09-26 12:36:46'),(45,44,'Rule','Sec 3','Prohibition of Employment of Children','No child shall be employed or permitted to work of occupation set forth Part A','(1) Whoever employs any child or permits any child to work in contravention of the provisions of section 3 shall be punishable with imprisonment for a term which shall not be less than three months but which may extend to one year or with fine which shall not be less than ten thousand rupees but which may extend to twenty thousand rupees or with both. \r\n(2) Whoever, having been convicted of an offence under section 3, commits a like offence afterwards, he shall be punishable with imprisonment for a term which shall not be less than six months but which may extend to two years. ',_binary '\0',2,'One Time',1,'2000-01-01 00:00:00','9999-12-31 00:00:00',1,0,0,1,_binary '','2018-09-26 12:38:19');
/*!40000 ALTER TABLE `compliance_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compliance_xref_audittrail`
--

DROP TABLE IF EXISTS `compliance_xref_audittrail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `compliance_xref_audittrail` (
  `Compliance_Xref_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Comp_Category` varchar(45) DEFAULT NULL,
  `Comp_Description` varchar(800) DEFAULT NULL,
  `Is_Header` bit(1) DEFAULT NULL,
  `level` int(3) DEFAULT NULL,
  `Comp_Order` int(3) DEFAULT NULL,
  `Risk_Category` varchar(45) DEFAULT NULL,
  `Risk_Description` varchar(100) DEFAULT NULL,
  `Periodicity` varchar(50) DEFAULT NULL,
  `Is_Best_Practice` bit(1) DEFAULT NULL,
  `Version` int(3) DEFAULT NULL,
  `Effective_Start_Date` datetime DEFAULT NULL,
  `Effective_End_Date` datetime DEFAULT NULL,
  `Country_ID` int(11) DEFAULT NULL,
  `State_ID` int(11) DEFAULT NULL,
  `City_ID` int(11) DEFAULT NULL,
  `Last_Updated_Date` datetime DEFAULT NULL,
  `User_ID` int(11) NOT NULL,
  `Is_Active` bit(1) DEFAULT NULL,
  `Action_Type` varchar(10) DEFAULT NULL,
  `Audit_Type` varchar(45) DEFAULT NULL,
  `Compliance_Title` varchar(450) DEFAULT NULL,
  `Compliance_Parent_ID` int(11) DEFAULT NULL,
  `compl_def_consequence` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`Compliance_Xref_ID`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `compliance_xref_audittrail_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compliance_xref_audittrail`
--

LOCK TABLES `compliance_xref_audittrail` WRITE;
/*!40000 ALTER TABLE `compliance_xref_audittrail` DISABLE KEYS */;
/*!40000 ALTER TABLE `compliance_xref_audittrail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `country` (
  `Country_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Country_Code` varchar(5) NOT NULL,
  `Country_Name` varchar(70) NOT NULL,
  PRIMARY KEY (`Country_ID`),
  UNIQUE KEY `Country_Code_UNIQUE` (`Country_Code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'101','India'),(2,'102','UK');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_audit`
--

DROP TABLE IF EXISTS `custom_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `custom_audit` (
  `Custom_Audit_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Org_Hier_ID` int(11) NOT NULL,
  `Auditor_ID` int(11) NOT NULL,
  `Audit_Date` datetime DEFAULT NULL,
  `Audit_Followup_Date` datetime DEFAULT NULL,
  `Audit_Remarks` varchar(1000) DEFAULT NULL,
  `Is_Active` bit(1) DEFAULT NULL,
  `Version` int(11) DEFAULT NULL,
  `Compliance_Status` varchar(100) DEFAULT NULL,
  `Applicability` varchar(10) DEFAULT NULL,
  `Start_Date` datetime DEFAULT NULL,
  `End_Date` datetime DEFAULT NULL,
  `Risk_Category` varchar(10) DEFAULT NULL,
  `Vendor_ID` int(11) NOT NULL,
  `Evidences` varchar(1000) DEFAULT NULL,
  `Custom_Xref_ID` int(11) NOT NULL,
  PRIMARY KEY (`Custom_Audit_ID`),
  KEY `Org_Hier_ID` (`Org_Hier_ID`),
  KEY `Auditor_ID` (`Auditor_ID`),
  KEY `Vendor_ID` (`Vendor_ID`),
  KEY `custom_audit_ibfk_4_idx` (`Custom_Xref_ID`),
  CONSTRAINT `custom_audit_ibfk_1` FOREIGN KEY (`Org_Hier_ID`) REFERENCES `org_hier` (`org_hier_id`),
  CONSTRAINT `custom_audit_ibfk_2` FOREIGN KEY (`Auditor_ID`) REFERENCES `user` (`user_id`),
  CONSTRAINT `custom_audit_ibfk_3` FOREIGN KEY (`Vendor_ID`) REFERENCES `org_hier` (`org_hier_id`),
  CONSTRAINT `custom_audit_ibfk_4` FOREIGN KEY (`Custom_Xref_ID`) REFERENCES `custom_xref` (`custom_xref_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_audit`
--

LOCK TABLES `custom_audit` WRITE;
/*!40000 ALTER TABLE `custom_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_xref`
--

DROP TABLE IF EXISTS `custom_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `custom_xref` (
  `Custom_Xref_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Comp_Category` varchar(50) DEFAULT NULL,
  `Comp_Description` varchar(50) DEFAULT NULL,
  `Is_Header` bit(1) DEFAULT NULL,
  `Level` int(11) DEFAULT NULL,
  `Comp_Order` int(11) DEFAULT NULL,
  `Periodicity` varchar(50) DEFAULT NULL,
  `Is_Best_Practice` bit(1) DEFAULT NULL,
  `Version` int(11) DEFAULT NULL,
  `Effective_Start_Date` datetime DEFAULT NULL,
  `Effective_End_Date` datetime DEFAULT NULL,
  `Country_ID` int(11) DEFAULT NULL,
  `State_ID` int(11) DEFAULT NULL,
  `City_ID` int(11) DEFAULT NULL,
  `Last_Updated_Date` datetime DEFAULT NULL,
  `User_ID` int(11) NOT NULL,
  `Is_Active` bit(1) DEFAULT NULL,
  `Compliance_Title` varchar(50) DEFAULT NULL,
  `Compliance_Parent_ID` int(11) DEFAULT NULL,
  `Comp_def_consequence` varchar(1000) DEFAULT NULL,
  `Compliance_Type_ID` int(11) NOT NULL,
  PRIMARY KEY (`Custom_Xref_ID`),
  KEY `User_ID` (`User_ID`),
  KEY `custom_xref_ibfk_2_idx` (`Compliance_Type_ID`),
  CONSTRAINT `custom_xref_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`user_id`),
  CONSTRAINT `custom_xref_ibfk_2` FOREIGN KEY (`Compliance_Type_ID`) REFERENCES `compliance_type` (`compliance_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_xref`
--

LOCK TABLES `custom_xref` WRITE;
/*!40000 ALTER TABLE `custom_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `industry_type_master`
--

DROP TABLE IF EXISTS `industry_type_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `industry_type_master` (
  `Industry_Type_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Industry_Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Industry_Type_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `industry_type_master`
--

LOCK TABLES `industry_type_master` WRITE;
/*!40000 ALTER TABLE `industry_type_master` DISABLE KEYS */;
INSERT INTO `industry_type_master` VALUES (1,'IT'),(2,'Manaufacturing'),(3,'Sales'),(4,'Mining');
/*!40000 ALTER TABLE `industry_type_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `menus` (
  `Menu_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Parent_MenuID` int(11) DEFAULT NULL,
  `Menu_Name` varchar(45) DEFAULT NULL,
  `Page_URL` varchar(45) DEFAULT NULL,
  `Is_Active` bit(1) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Menu_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,0,'User Management','/Common/dashboard',_binary '','1_user.png'),(2,1,'Manage Role','/UserManagement/AddRoles',_binary '','ManageRoles.png'),(3,1,'Manage User Group','/UserManagement/AddUserGroup',_binary '','manageGroup.png'),(4,1,'Add User','/UserManagement/AddUser',_binary '','adduser.JPG'),(5,1,'Manage User ','/UserManagement/ListofUsers',_binary '','manageUsers.png'),(6,0,'Group Management','/Common/dashboard',_binary '','1_group.png'),(7,6,'Add Group ','/ManageOrganization/AddGroupCompany',_binary '','manageGroupCompany.png'),(8,6,'Manage Group ','/ManageOrganization/GroupCompanyList',_binary '','manageGroupCompany.png'),(9,0,'Company Management','/Common/dashboard',_binary '','1_company.png'),(10,9,'Add Company','/ManageOrganization/AddCompany',_binary '','manageCompany.png'),(11,9,'Manage Company','/ManageOrganization/SelectGroupCompany',_binary '','manageCompany.png'),(12,9,'Add Branch','/ManageOrganization/AddBranch',_binary '','manageBranch.png'),(13,9,'Manage Branch','/ManageOrganization/SelectCompany',_binary '','manageBranch.png'),(14,0,'Acts and Rules','/Common/dashboard',_binary '','1_acts.png'),(15,14,'Add Acts','/ManageCompliance/CreateActs',_binary '','manageActs.png'),(16,14,'Add Rules','/ManageCompliance/ListofCompliance',_binary '','manageRules.png'),(17,14,'Compliance Mapping','/ManageCompliance/Selectbranch',_binary '','manageActs.png'),(18,0,'Auditing','/Common/dashboard',_binary '','audit_tool.png'),(19,18,'Auditing','/ManageAudit/selectBranch',_binary '','Reports.png'),(20,0,'Reports','',_binary '','1_report.png'),(21,9,'Add Vendor','/ManageOrganization/AddVendor',_binary '','manageBranch.png'),(22,9,'Manage Vendor','/ManageOrganization/SelectCompanyForVendor',_binary '','manageBranch.png'),(23,9,'Vendor Branch Mapping','/ManageOrganization/AssignDessignVendors',_binary '','manageBranch.png'),(24,14,'Compliance Type Act Mapping','/ManageCompliance/ComplianceActMapping',_binary '','manageActs.png'),(25,6,'IndustryType Compliance Mapping','/ManageOrganization/IndustryTypeMapCompliance',_binary '','manageGroupCompany.png'),(26,20,'Reports','/Reporting/selectbranch',_binary '','Reports.png');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_hier`
--

DROP TABLE IF EXISTS `org_hier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `org_hier` (
  `Org_Hier_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Company_Name` varchar(45) DEFAULT NULL,
  `Company_Code` int(11) DEFAULT NULL,
  `Parent_Company_ID` int(11) DEFAULT NULL,
  `Description` varchar(450) DEFAULT NULL,
  `level` int(3) DEFAULT NULL,
  `Is_Leaf` bit(1) DEFAULT NULL,
  `Last_Updated_Date` datetime DEFAULT NULL,
  `User_ID` int(11) NOT NULL,
  `Is_Active` bit(1) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `Is_Delete` bit(1) DEFAULT NULL,
  `Is_Vendor` bit(1) DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Org_Hier_ID`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `fk_User` FOREIGN KEY (`User_ID`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_hier`
--

LOCK TABLES `org_hier` WRITE;
/*!40000 ALTER TABLE `org_hier` DISABLE KEYS */;
INSERT INTO `org_hier` VALUES (1,'Microsoft Group ',0,0,'Microsoft Group is working in multiple countries, and in multiple domains.',0,_binary '\0','2018-08-31 18:41:33',1,_binary '','noimage.png',_binary '\0',_binary '\0',NULL),(2,'Microsoft company 1',0,1,NULL,2,_binary '\0','2018-08-31 18:54:01',1,_binary '','noimage.png',_binary '\0',_binary '\0',NULL),(3,'HeadQuarterMicrosoft company 1',0,2,NULL,3,_binary '','2018-08-31 18:54:01',1,_binary '',NULL,_binary '\0',_binary '\0','Head Quarter'),(4,'Mysore Branch',0,2,NULL,3,_binary '','2018-08-31 18:55:12',1,_binary '',NULL,_binary '\0',_binary '\0','3'),(5,'Reliance Group',0,0,'Reliance Group is an indian group company.',1,_binary '\0','2018-08-31 19:03:06',1,_binary '','noimage.png',_binary '\0',_binary '\0',NULL),(6,'Reliance commmuncation',0,5,NULL,2,_binary '\0','2018-08-31 19:04:18',1,_binary '','noimage.png',_binary '\0',_binary '\0',NULL),(7,'HeadQuarterReliance commmuncation',0,6,NULL,3,_binary '','2018-08-31 19:04:18',1,_binary '',NULL,_binary '\0',_binary '\0','Head Quarter'),(8,'Banglore Branch',0,6,NULL,3,_binary '','2018-08-31 19:05:25',1,_binary '',NULL,_binary '\0',_binary '\0','3'),(9,'Vendor 1',0,6,NULL,3,_binary '','2018-08-31 19:08:00',1,_binary '','noimage.png',_binary '\0',_binary '',NULL),(10,'Microsoft  Company 2',0,1,NULL,2,_binary '\0','2018-09-05 17:51:37',1,_binary '','noimage.png',_binary '\0',_binary '\0',NULL),(11,'HeadQuarterMicrosoft  Company 2',0,10,NULL,3,_binary '','2018-09-05 17:51:38',1,_binary '',NULL,_binary '\0',_binary '\0','Head Quarter'),(12,'Mysore Branch',0,10,NULL,3,_binary '','2018-09-05 17:52:53',1,_binary '',NULL,_binary '\0',_binary '\0','1'),(13,'Adani Group',0,0,'Adani Group company description',1,_binary '\0','2018-09-07 11:10:06',1,_binary '','company1.JPG',_binary '\0',_binary '\0',NULL),(14,'Adani Power',0,13,NULL,2,_binary '\0','2018-09-07 11:13:07',1,_binary '','noimage.png',_binary '\0',_binary '\0',NULL),(15,'HeadQuarterAdani Power',0,14,NULL,3,_binary '','2018-09-07 11:13:08',1,_binary '',NULL,_binary '\0',_binary '\0','Head Quarter'),(16,'Adani Mining',0,13,NULL,2,_binary '\0','2018-09-07 11:14:47',1,_binary '','noimage.png',_binary '\0',_binary '\0',NULL),(17,'Adani Mining',0,13,NULL,2,_binary '\0','2018-09-07 11:18:24',1,_binary '','noimage.png',_binary '',_binary '\0',NULL),(18,'Korba Branch',0,14,NULL,3,_binary '','2018-09-07 11:25:25',1,_binary '',NULL,_binary '\0',_binary '\0','2'),(19,'Delhi Branch',0,14,NULL,3,_binary '','2018-09-07 11:29:14',1,_binary '',NULL,_binary '\0',_binary '\0','1'),(20,'Adani Power',0,13,NULL,2,_binary '\0','2018-09-07 11:50:26',1,_binary '','noimage.png',_binary '\0',_binary '\0',NULL),(21,'HeadQuarterAdani Power',0,20,NULL,3,_binary '','2018-09-07 11:50:26',1,_binary '',NULL,_binary '\0',_binary '\0','Head Quarter'),(22,'white feild',0,20,NULL,3,_binary '','2018-09-07 11:51:18',1,_binary '',NULL,_binary '\0',_binary '\0','1'),(23,'Adani enterprize',0,13,NULL,2,_binary '\0','2018-09-07 13:01:40',1,_binary '','noimage.png',_binary '\0',_binary '\0',NULL),(24,'HeadQuarterAdani enterprize',0,23,NULL,3,_binary '','2018-09-07 13:01:41',1,_binary '',NULL,_binary '\0',_binary '\0','Head Quarter');
/*!40000 ALTER TABLE `org_hier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privilege`
--

DROP TABLE IF EXISTS `privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `privilege` (
  `Privilege_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Privilege_Name` varchar(45) DEFAULT NULL,
  `Privilege_Type` varchar(45) DEFAULT NULL,
  `Is_Active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Privilege_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privilege`
--

LOCK TABLES `privilege` WRITE;
/*!40000 ALTER TABLE `privilege` DISABLE KEYS */;
INSERT INTO `privilege` VALUES (1,'Create','sys',_binary ''),(2,'Update','sys',_binary ''),(3,'Read','sys',_binary ''),(4,'Delete','sys',_binary '');
/*!40000 ALTER TABLE `privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `role` (
  `Role_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Role_Name` varchar(45) DEFAULT NULL,
  `Is_Active` bit(1) DEFAULT NULL,
  `Is_Group_Role` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Role_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Product Admin',_binary '',_binary ''),(2,'Admin',_binary '',_binary ''),(3,'SME',_binary '',_binary ''),(4,'Auditor',_binary '',_binary ''),(5,'StackHolder',_binary '',_binary ''),(6,'Guest',_binary '',_binary ''),(7,'Customer',_binary '',_binary '\0');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_priv_map`
--

DROP TABLE IF EXISTS `role_priv_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `role_priv_map` (
  `Role_Priv_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Is_Active` bit(1) DEFAULT NULL,
  `Role_ID` int(11) NOT NULL,
  `Privilege_ID` int(11) NOT NULL,
  PRIMARY KEY (`Role_Priv_ID`),
  KEY `Role_ID` (`Role_ID`),
  KEY `Privilege_ID` (`Privilege_ID`),
  CONSTRAINT `role_priv_map_ibfk_1` FOREIGN KEY (`Role_ID`) REFERENCES `role` (`role_id`),
  CONSTRAINT `role_priv_map_ibfk_2` FOREIGN KEY (`Privilege_ID`) REFERENCES `privilege` (`privilege_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_priv_map`
--

LOCK TABLES `role_priv_map` WRITE;
/*!40000 ALTER TABLE `role_priv_map` DISABLE KEYS */;
INSERT INTO `role_priv_map` VALUES (1,_binary '',1,1),(2,_binary '',1,2),(3,_binary '',1,3),(4,_binary '',1,4),(5,_binary '',2,1),(6,_binary '',2,2),(7,_binary '',2,3),(8,_binary '',2,4),(9,_binary '',3,1),(10,_binary '',3,2),(11,_binary '',3,3),(12,_binary '',3,4),(13,_binary '',4,1),(14,_binary '',4,2),(15,_binary '',4,3),(16,_binary '',4,4),(17,_binary '',7,1),(18,_binary '',7,3);
/*!40000 ALTER TABLE `role_priv_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `state` (
  `State_ID` int(11) NOT NULL AUTO_INCREMENT,
  `State_Code` varchar(5) NOT NULL,
  `State_Name` varchar(70) DEFAULT NULL,
  `Country_ID` int(11) NOT NULL,
  PRIMARY KEY (`State_ID`),
  UNIQUE KEY `State_Code_UNIQUE` (`State_Code`),
  KEY `FK_Country` (`Country_ID`),
  CONSTRAINT `FK_Country` FOREIGN KEY (`Country_ID`) REFERENCES `country` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (1,'101','	Andhra Pradesh	',1),(2,'102','	Arunachal Pradesh	',1),(3,'103','	Assam	',1),(4,'104','	Bihar	',1),(5,'105','	Chhattisgarh	',1),(6,'106','	Goa	',1),(7,'107','	Gujarat	',1),(8,'108','	Haryana	',1),(9,'109','	Himachal Pradesh	',1),(10,'110','	Jammu and Kashmir	',1),(11,'111','	Jharkhand	',1),(12,'112','	Karnataka	',1),(13,'113','	Kerala	',1),(14,'114','	Madhya Pradesh	',1),(15,'115','	Maharashtra	',1),(16,'116','	Manipur	',1),(17,'117','	Meghalaya	',1),(18,'118','	Mizoram	',1),(19,'119','	Nagaland	',1),(20,'120','	Orissa	',1),(21,'121','	Punjab	',1),(22,'122','	Rajasthan	',1),(23,'123','	Sikkim	',1),(24,'124','	Tamil Nadu	',1),(25,'125','	Tripura	',1),(26,'126','	Uttarakhand	',1),(27,'127','	Uttar Pradesh	',1),(28,'128','	West Bengal	',1),(29,'129','	Telangana	',1),(30,'130','	Andaman and Nicobar Islands	',1),(31,'131','	Chandigarh	',1),(32,'132','	Dadra and Nagar Haveli	',1),(33,'133','	Daman and Diu	',1),(34,'134','	Delhi	',1),(35,'135','	Lakshadweep	',1),(36,'136','	Pondicherry	',1);
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `User_ID` int(11) NOT NULL AUTO_INCREMENT,
  `User_Password` varchar(10) DEFAULT NULL,
  `First_Name` varchar(45) DEFAULT NULL,
  `Middle_Name` varchar(45) DEFAULT NULL,
  `Last_Name` varchar(45) DEFAULT NULL,
  `Email_ID` varchar(100) DEFAULT NULL,
  `Contact_Number` varchar(50) DEFAULT NULL,
  `Company_ID` int(11) DEFAULT NULL,
  `Gender` varchar(45) DEFAULT NULL,
  `Is_Active` bit(1) DEFAULT NULL,
  `Last_Login` datetime DEFAULT NULL,
  `Photo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','Admin',NULL,'Admin','admin@gmail.com','8909876543',0,'Male',_binary '','2018-11-04 01:44:40',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group`
--

DROP TABLE IF EXISTS `user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_group` (
  `User_Group_ID` int(11) NOT NULL AUTO_INCREMENT,
  `User_Group_Name` varchar(45) DEFAULT NULL,
  `User_Group_Description` varchar(450) DEFAULT NULL,
  `Role_ID` int(11) NOT NULL,
  `Is_Active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`User_Group_ID`),
  KEY `Role_ID` (`Role_ID`),
  CONSTRAINT `user_group_ibfk_1` FOREIGN KEY (`Role_ID`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group`
--

LOCK TABLES `user_group` WRITE;
/*!40000 ALTER TABLE `user_group` DISABLE KEYS */;
INSERT INTO `user_group` VALUES (1,'Product Admin',NULL,1,_binary ''),(2,'Admin',NULL,2,_binary ''),(3,'SME',NULL,3,_binary ''),(4,'Auditor',NULL,4,_binary ''),(5,'Stackholder',NULL,5,_binary ''),(6,'Guest',NULL,6,_binary '');
/*!40000 ALTER TABLE `user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_members`
--

DROP TABLE IF EXISTS `user_group_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_group_members` (
  `User_Group_Members_ID` int(11) NOT NULL AUTO_INCREMENT,
  `User_ID` int(11) NOT NULL,
  `User_Group_ID` int(11) NOT NULL,
  PRIMARY KEY (`User_Group_Members_ID`),
  KEY `User_ID` (`User_ID`),
  KEY `User_Group_ID` (`User_Group_ID`),
  CONSTRAINT `user_group_members_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`user_id`),
  CONSTRAINT `user_group_members_ibfk_2` FOREIGN KEY (`User_Group_ID`) REFERENCES `user_group` (`user_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_members`
--

LOCK TABLES `user_group_members` WRITE;
/*!40000 ALTER TABLE `user_group_members` DISABLE KEYS */;
INSERT INTO `user_group_members` VALUES (1,1,1);
/*!40000 ALTER TABLE `user_group_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role_map`
--

DROP TABLE IF EXISTS `user_role_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_role_map` (
  `User_Role_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Role_ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  PRIMARY KEY (`User_Role_ID`),
  KEY `Role_ID` (`Role_ID`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `user_role_map_ibfk_1` FOREIGN KEY (`Role_ID`) REFERENCES `role` (`role_id`),
  CONSTRAINT `user_role_map_ibfk_2` FOREIGN KEY (`User_ID`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role_map`
--

LOCK TABLES `user_role_map` WRITE;
/*!40000 ALTER TABLE `user_role_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_role_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroup_menu_map`
--

DROP TABLE IF EXISTS `usergroup_menu_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `usergroup_menu_map` (
  `UserGroup_Menu_ID` int(11) NOT NULL AUTO_INCREMENT,
  `User_Group_ID` int(11) NOT NULL,
  `Menu_ID` int(11) NOT NULL,
  PRIMARY KEY (`UserGroup_Menu_ID`),
  KEY `User_Group_Id_idx` (`User_Group_ID`),
  KEY `Menu_ID_idx` (`Menu_ID`),
  CONSTRAINT `Menu_ID` FOREIGN KEY (`Menu_ID`) REFERENCES `menus` (`menu_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `User_Group_Id` FOREIGN KEY (`User_Group_ID`) REFERENCES `user_group` (`user_group_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroup_menu_map`
--

LOCK TABLES `usergroup_menu_map` WRITE;
/*!40000 ALTER TABLE `usergroup_menu_map` DISABLE KEYS */;
INSERT INTO `usergroup_menu_map` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,1,20),(21,1,21),(22,1,22),(23,1,23),(24,2,1),(25,2,2),(26,2,3),(27,2,4),(28,2,5),(29,2,9),(30,2,10),(31,2,11),(32,2,12),(33,2,13),(34,2,14),(35,2,15),(36,2,16),(37,2,17),(38,2,18),(39,2,19),(40,2,20),(41,2,21),(42,2,22),(43,2,23),(44,3,14),(45,3,15),(46,3,16),(47,3,17),(48,4,18),(49,4,19),(50,1,24),(51,2,24),(52,1,25),(53,1,26);
/*!40000 ALTER TABLE `usergroup_menu_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor_branch_mapping`
--

DROP TABLE IF EXISTS `vendor_branch_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `vendor_branch_mapping` (
  `Vendor_Branch_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Branch_ID` int(11) NOT NULL,
  `Vendor_ID` int(11) NOT NULL,
  `Start_Date` datetime DEFAULT NULL,
  `End_Date` datetime DEFAULT NULL,
  `Is_Active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Vendor_Branch_ID`),
  KEY `Branch_ID` (`Branch_ID`),
  KEY `Vendor_ID` (`Vendor_ID`),
  CONSTRAINT `vendor_branch_mapping_ibfk_1` FOREIGN KEY (`Branch_ID`) REFERENCES `org_hier` (`org_hier_id`),
  CONSTRAINT `vendor_branch_mapping_ibfk_2` FOREIGN KEY (`Vendor_ID`) REFERENCES `org_hier` (`org_hier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor_branch_mapping`
--

LOCK TABLES `vendor_branch_mapping` WRITE;
/*!40000 ALTER TABLE `vendor_branch_mapping` DISABLE KEYS */;
INSERT INTO `vendor_branch_mapping` VALUES (1,8,9,'2018-04-01 00:00:00','2020-03-31 00:00:00',_binary '');
/*!40000 ALTER TABLE `vendor_branch_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xref_comp_type_mapping`
--

DROP TABLE IF EXISTS `xref_comp_type_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `xref_comp_type_mapping` (
  `Xref_Comp_Type_Map_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Compliance_Type_ID` int(11) NOT NULL,
  `Compliance_Xref_ID` int(11) NOT NULL,
  PRIMARY KEY (`Xref_Comp_Type_Map_ID`),
  KEY `Compliance_Type_ID` (`Compliance_Type_ID`),
  KEY `Compliance_Xref_ID` (`Compliance_Xref_ID`),
  CONSTRAINT `xref_comp_type_mapping_ibfk_1` FOREIGN KEY (`Compliance_Type_ID`) REFERENCES `compliance_type` (`compliance_type_id`),
  CONSTRAINT `xref_comp_type_mapping_ibfk_2` FOREIGN KEY (`Compliance_Xref_ID`) REFERENCES `compliance_xref` (`compliance_xref_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xref_comp_type_mapping`
--

LOCK TABLES `xref_comp_type_mapping` WRITE;
/*!40000 ALTER TABLE `xref_comp_type_mapping` DISABLE KEYS */;
INSERT INTO `xref_comp_type_mapping` VALUES (19,1,1),(20,1,3),(21,1,4),(25,1,7),(26,1,8),(27,1,9),(28,1,10),(29,1,11),(30,2,1),(31,2,3),(32,2,4),(33,2,7),(34,2,8),(35,2,9),(36,2,10),(37,2,11),(38,4,1),(39,4,3),(40,4,4),(41,4,7),(42,4,8),(43,4,9),(44,4,10),(45,4,11);
/*!40000 ALTER TABLE `xref_comp_type_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'compliancedb'
--

--
-- Dumping routines for database 'compliancedb'
--
/*!50003 DROP PROCEDURE IF EXISTS `getComplainceActlist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getComplainceActlist`(
p_Compliance_Type_ID int,
p_Org_Hier_ID int,
p_Vendor_ID int
)
BEGIN
select * from compliance_xref where Compliance_Xref_ID in
(select Compliance_Parent_ID from compliance_xref where  Compliance_Xref_ID in 
(Select Compliance_Xref_ID from  xref_comp_type_mapping where Compliance_Type_ID=p_Compliance_Type_ID and Xref_Comp_Type_Map_ID in 
(Select Xref_Comp_Type_Map_ID from compliance_branch_mapping where Org_Hier_ID=p_Org_Hier_ID and Vendor_ID=p_Vendor_ID
)));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getspecificcompliance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getspecificcompliance`(p_Compliance_Xref_ID int)
BEGIN
select * from compliance_xref where Compliance_Xref_ID=p_Compliance_Xref_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spinsertxref_comp_type_mapping` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spinsertxref_comp_type_mapping`(
p_Compliance_Type_ID int,
p_Compliance_Xref_ID int
)
BEGIN
if not exists(Select Xref_Comp_Type_Map_ID from xref_comp_type_mapping where Compliance_Xref_ID=p_Compliance_Xref_ID and Compliance_Type_ID=p_Compliance_Type_ID )
then
insert into xref_comp_type_mapping(Compliance_Type_ID,Compliance_Xref_ID) values(p_Compliance_Type_ID,p_Compliance_Xref_ID);
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ActivateOrgHier` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ActivateOrgHier`(
p_Org_Hier_ID int
)
begin
update org_hier set Is_Active = 1 where Org_Hier_ID=p_Org_Hier_ID;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ActivateVendorForBranch` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ActivateVendorForBranch`(
p_Vendor_Branch_ID int
)
begin
update vendor_branch_mapping set 
Is_Active = 1,
Effective_Start_Date= now()
 where Vendor_Branch_ID = p_Vendor_Branch_ID ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ActivateVendorForCompany` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ActivateVendorForCompany`(
p_Org_Hier_ID int
)
begin
update org_hier  

inner join company_details on company_details.Org_Hier_ID = org_hier.Org_Hier_ID  
set
Is_Active = 1 ,
Calender_StartDate = now() 
where org_hier.Org_Hier_ID=p_Org_Hier_ID;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_checkparentcompliancetype` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkparentcompliancetype`(
p_Compliance_Xref_Parent_ID int
)
BEGIN
Select Compliance_Type_ID from xref_comp_type_mapping where Compliance_Xref_ID=p_Compliance_Xref_Parent_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_closure_date` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_closure_date`(
p_Company_ID int

)
begin
if(p_Company_ID=0)
then
select
*
from org_hier ;
else
select * from compliance_audit where 
compliance_audit.Audit_Followup_Date is null and  Org_Hier_ID in 
(Select org_hier.Org_Hier_ID from org_hier where Parent_Company_ID = p_Company_ID)
and
Vendor_ID in
(Select org_hier.Org_Hier_ID from org_hier where Parent_Company_ID = p_Company_ID);

end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_DeactivateOrgHier` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_DeactivateOrgHier`(
p_Org_Hier_ID int
)
begin
update org_hier set Is_Active = 0 where Org_Hier_ID=p_Org_Hier_ID;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_DeactivateVendorForBranch` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_DeactivateVendorForBranch`(
p_Branch_ID int,
p_Vendor_ID int

)
begin
update vendor_branch_mapping set 
Is_Active = 0,
End_Date= now()
 where Branch_ID = p_Branch_ID and Vendor_ID = p_Vendor_ID ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_DeactivateVendorForCompany` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_DeactivateVendorForCompany`(
p_Org_Hier_ID int
)
begin
update org_hier  
set
Is_Active = 0 
where org_hier.Org_Hier_ID=p_Org_Hier_ID;
update company_details
set
Calender_EndDate = now() 
where company_details.Org_Hier_ID=p_Org_Hier_ID;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_deleteBranchAuditorMapping` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteBranchAuditorMapping`(
p_Branch_Allocation_ID int 
)
begin
update compliance_branch_mapping set Is_Active = 0 where Branch_Allocation_ID=p_Branch_Allocation_ID;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_deleteBranchLocation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteBranchLocation`(
p_Location_ID int
)
begin
delete from branch_location where Location_ID=p_Location_ID;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_deleteComplianceAudit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteComplianceAudit`(
p_Compliance_Audit_ID int
)
begin
update compliance_audit set Is_Active  =0 where Compliance_Audit_ID=p_Compliance_Audit_ID;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_deleteComplianceAuditTrail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteComplianceAuditTrail`(
p_Compliance_Audit_ID int
)
begin
update Compliance_Audit_AuditTrail set Is_Actice = 0 where Compliance_Audit_ID=p_Compliance_Audit_ID;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_DeleteComplianceBranchMapping` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_DeleteComplianceBranchMapping`(
p_Org_Hier_ID int ,
p_Vendor_ID int
)
begin
DELETE FROM `compliancedb`.`compliance_branch_mapping`
WHERE Org_Hier_ID=p_Org_Hier_ID and Vendor_ID=p_Vendor_ID;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_deleteComplianceOptionsXref` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteComplianceOptionsXref`(
p_Compliance_Opt_Xerf_ID int
)
begin
delete from compliance_xref where Compliance_Opt_Xerf_ID=p_Compliance_Opt_Xerf_ID;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_DeleteComplianceTypes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_DeleteComplianceTypes`(p_Org_Hier_ID int)
begin
DELETE FROM `compliancedb`.`compliance_type_mapping`
WHERE Org_Hier_ID= p_Org_Hier_ID;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_deleteComplianceXrefAuditTrail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteComplianceXrefAuditTrail`(
p_Compliance_Xref_ID int
)
begin
update compliance_xref_audittrail set Is_Active = 0 where Compliance_Xref_ID=p_Compliance_Xref_ID;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_deleteOrganizationHier` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteOrganizationHier`(
p_Org_Hier_ID int
)
begin
update org_hier set
Is_Delete=1
where org_hier.Org_Hier_ID= p_Org_Hier_ID;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_deleteRole` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteRole`(p_Role_ID int)
begin
UPDATE `compliancedb`.`role`
SET
`Is_Active` = 0
WHERE `Role_ID` = p_Role_ID ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_DeleteRolePrivilege` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_DeleteRolePrivilege`(p_Role_ID int)
begin
DELETE FROM `compliancedb`.`role_priv_map`
WHERE Role_ID= p_Role_ID;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_deleteUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteUser`(p_User_ID int)
begin
update `compliancedb`.`user` set Is_Active=0 
where User_ID = p_User_ID;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_DeleteUsergroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_DeleteUsergroup`(p_User_Group_ID int)
begin
DELETE FROM `compliancedb`.`user_group`
WHERE User_Group_ID= p_User_Group_ID;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_DeleteUserGroupMembers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_DeleteUserGroupMembers`(p_User_ID int)
begin
DELETE FROM `compliancedb`.`user_group_members`
WHERE User_ID= p_User_ID;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_DeleteUserRole` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_DeleteUserRole`(p_User_ID int)
begin
DELETE FROM `compliancedb`.`user_role_map`
WHERE User_ID=p_User_ID;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_DeleteVendorForCompany` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_DeleteVendorForCompany`(
p_Org_Hier_ID int

)
begin
update org_hier set 
Is_Delete = 1
where org_hier.Org_Hier_ID = p_Org_Hier_ID;
update company_details set
company_details.Calender_EndDate= now()
 where company_details.Org_Hier_ID = p_Org_Hier_ID;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_xref_comp_type_mapping` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_xref_comp_type_mapping`(
p_Compliance_Type_ID int,
p_Compliance_Xref_ID int
)
BEGIN
delete from xref_comp_type_mapping where Compliance_Type_ID=p_Compliance_Type_ID and  
Compliance_Xref_ID in(Select Compliance_Xref_ID from compliance_xref where Compliance_Parent_ID=p_Compliance_Xref_ID or Compliance_Xref_ID=p_Compliance_Xref_ID);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_fetchchangePassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_fetchchangePassword`(
p_User_ID int,
p_Email_ID varchar(100),
p_User_Password varchar(10)
)
begin
select User_ID from user where Email_ID= p_Email_ID and User_Password=p_User_Password;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getACTCompliancedBranchCompliance_ACTAuditReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getACTCompliancedBranchCompliance_ACTAuditReport`(p_Org_Hier_ID int,p_Compliance_Status varchar(100),
p_Vendor_ID int)
begin 
if(p_Org_Hier_ID = 0 && p_Vendor_ID = 0)
then
select * from compliance_audit ;
elseif(p_Compliance_Status= 'Compliant')
then
select distinct  compliance_xref.*     from compliance_audit
inner join Org_Hier on Org_Hier.Org_Hier_ID = compliance_audit.Org_Hier_ID
inner join xref_comp_type_mapping on xref_comp_type_mapping.Xref_Comp_Type_Map_ID = compliance_audit.Xref_Comp_Type_Map_ID
inner join compliance_xref on compliance_xref.Compliance_Xref_ID = compliance_xref.Compliance_Xref_ID
where compliance_xref.Compliance_Xref_ID in(
select distinct Compliance_Parent_ID from compliance_xref where compliance_xref.Compliance_Xref_ID in(
select xref_comp_type_mapping.Compliance_Xref_ID from xref_comp_type_mapping where xref_comp_type_mapping.Xref_Comp_Type_Map_ID in(
select compliance_audit.Xref_Comp_Type_Map_ID from compliance_audit where Org_Hier_ID = p_Org_Hier_ID and Vendor_ID = p_Vendor_ID and
compliance_audit.Compliance_Status=p_Compliance_Status)));
elseif(p_Compliance_Status= 'Non Compliant')
then

select distinct  compliance_xref.*    from compliance_audit
inner join Org_Hier on Org_Hier.Org_Hier_ID = compliance_audit.Org_Hier_ID
inner join xref_comp_type_mapping on xref_comp_type_mapping.Xref_Comp_Type_Map_ID = compliance_audit.Xref_Comp_Type_Map_ID
inner join compliance_xref on compliance_xref.Compliance_Xref_ID = compliance_xref.Compliance_Xref_ID
where compliance_xref.Compliance_Xref_ID in(
select distinct Compliance_Parent_ID from compliance_xref where compliance_xref.Compliance_Xref_ID in(
select xref_comp_type_mapping.Compliance_Xref_ID from xref_comp_type_mapping where xref_comp_type_mapping.Xref_Comp_Type_Map_ID in(
select compliance_audit.Xref_Comp_Type_Map_ID from compliance_audit where Org_Hier_ID = p_Org_Hier_ID and Vendor_ID = p_Vendor_ID and
 compliance_audit.Compliance_Status=p_Compliance_Status)));
elseif(p_Compliance_Status= 'Partially Compliant')
then

select distinct  compliance_xref.*    from compliance_audit
inner join Org_Hier on Org_Hier.Org_Hier_ID = compliance_audit.Org_Hier_ID
inner join xref_comp_type_mapping on xref_comp_type_mapping.Xref_Comp_Type_Map_ID = compliance_audit.Xref_Comp_Type_Map_ID
inner join compliance_xref on compliance_xref.Compliance_Xref_ID = compliance_xref.Compliance_Xref_ID
where compliance_xref.Compliance_Xref_ID in(
select distinct Compliance_Parent_ID from compliance_xref where compliance_xref.Compliance_Xref_ID in(
select xref_comp_type_mapping.Compliance_Xref_ID from xref_comp_type_mapping where xref_comp_type_mapping.Xref_Comp_Type_Map_ID in(
select compliance_audit.Xref_Comp_Type_Map_ID from compliance_audit where Org_Hier_ID = p_Org_Hier_ID and Vendor_ID = p_Vendor_ID and
compliance_audit.Compliance_Status=p_Compliance_Status)));

end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getActs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getActs`(
p_Compliance_Xref_ID int
)
begin
if(p_Compliance_Xref_ID=0)
then
SELECT * FROM `compliancedb`.`compliance_xref`
where Comp_Category='Act' and `compliance_xref`.`level`=1;
else
SELECT *
FROM `compliancedb`.`compliance_xref`
where Comp_Category='Act' and `compliance_xref`.`level`=1 and Compliance_Xref_ID=p_Compliance_Xref_ID;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getACT_Partially_CompliancedBranchCompliance_ACTAuditReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getACT_Partially_CompliancedBranchCompliance_ACTAuditReport`(p_Org_Hier_ID int)
begin 
if(p_Org_Hier_ID = 0)
then
select * from compliance_audit ;
else
select distinct  compliance_xref.*     from compliance_audit
inner join Org_Hier on Org_Hier.Org_Hier_ID = compliance_audit.Org_Hier_ID
inner join xref_comp_type_mapping on xref_comp_type_mapping.Xref_Comp_Type_Map_ID = compliance_audit.Xref_Comp_Type_Map_ID
inner join compliance_xref on compliance_xref.Compliance_Xref_ID = compliance_xref.Compliance_Xref_ID
where compliance_xref.Compliance_Xref_ID in(
select distinct Compliance_Parent_ID from compliance_xref where compliance_xref.Compliance_Xref_ID in(
select xref_comp_type_mapping.Compliance_Xref_ID from xref_comp_type_mapping where xref_comp_type_mapping.Xref_Comp_Type_Map_ID in(
select compliance_audit.Xref_Comp_Type_Map_ID from compliance_audit where Org_Hier_ID = p_Org_Hier_ID and 
compliance_audit.Compliance_Status= 'Partially_Compliant')));
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getAllCompanyBrnachAssignedtoAuditor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getAllCompanyBrnachAssignedtoAuditor`(
p_Auditor_ID int 
)
begin  
select * from org_hier where 
Org_Hier_ID IN(Select Org_Hier_ID from org_hier where Is_Active = 1 and Is_Vendor= 0 and level =3 ) 
Union
select * from org_hier where 
Org_Hier_ID IN(
Select distinct Parent_Company_ID from org_hier where 
Org_Hier_ID in (Select Org_Hier_ID from org_hier)) and Is_Active = 1 and Is_Vendor= 0 and level =2;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getAllUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getAllUser`(P_Company_ID int)
begin
SELECT `user`.`User_ID`,
    `user`.`User_Password`,
    `user`.`First_Name`,
    `user`.`Middle_Name`,
    `user`.`Last_Name`,
    `user`.`Email_ID`,
    `user`.`Contact_Number`,
    `user`.`Company_ID`,
    `user`.`Gender`,
    `user`.`Is_Active`,
    `user`.`Last_Login`,
    `user`.`Photo`
FROM `compliancedb`.`user` where `user`.`Company_ID`=P_Company_ID and Is_Active=1;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getAssignedCompliances` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getAssignedCompliances`(p_Org_Hier_ID int)
begin 
if(p_Org_Hier_ID = 0)
then
select * from compliance_type_mapping;
else
select Org_Hier_ID, compliance_type_map_ID,compliance_type_mapping.Compliance_Type_ID,
Compliance_Type_Name
from compliance_type_mapping
inner join compliance_type on compliance_type.Compliance_Type_ID = compliance_type_mapping.Compliance_Type_ID

where Org_Hier_ID= p_Org_Hier_ID ;
 end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getAuditorforBranch` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getAuditorforBranch`(p_Branch_Id int)
begin
SELECT `branch_auditor_mapping`.`Branch_Allocation_ID`,
    `branch_auditor_mapping`.`Auditor_ID`
FROM `compliancedb`.`branch_auditor_mapping`
where  `branch_auditor_mapping`.`Org_Hier_ID`=p_Branch_Id ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getBranchAssociatedWithVendors` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getBranchAssociatedWithVendors`(p_Vendor_ID int)
begin 
if(p_Vendor_ID=0)
then
select * from vendor_branch_mapping ;
else
select Vendor_Branch_ID,
Branch_ID,
Vendor_ID, Start_Date,End_Date,vendor_branch_mapping.Is_Active ,
Company_Name,Type,logo 
 from vendor_branch_mapping
inner join org_hier on org_hier.Org_Hier_ID = vendor_branch_mapping.Branch_ID
where Vendor_ID= p_Vendor_ID ;
 end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getBranchAuditorMapping` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getBranchAuditorMapping`(
p_Branch_Allocation_ID int 
)
begin
if(p_Branch_Allocation_ID=0)
then
select
Org_Hier_ID,
Auditor_ID,
Financial_Year,
Is_Active,
UpdatedByLogin_ID,
Allocation_Date
from compliance_branch_mapping; 
else
select 
Org_Hier_ID,
Auditor_ID,
Financial_Year,
Is_Active,
UpdatedByLogin_ID,
Allocation_Date
from compliance_branch_mapping 
where Branch_Allocation_ID=p_Branch_Allocation_ID;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getBranchCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getBranchCount`(p_Org_Hier_ID int)
begin 
if(p_Org_Hier_ID = 0 )
then
select * from org_hier ;
else
select * from org_hier where level = 3 and Is_Vendor = 0 and Parent_Company_ID = p_Org_Hier_ID;

end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getBranchCountFromAuditTable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getBranchCountFromAuditTable`(p_Org_Hier_ID int)
begin 
if(p_Org_Hier_ID = 0 )
then
select * from org_hier ;
else
select distinct compliance_audit.Org_Hier_ID, org_hier.*   from org_hier
inner join compliance_audit on compliance_audit.Org_Hier_ID = org_hier.Org_Hier_ID
 where level = 3 and Is_Vendor = 0  and Parent_Company_ID = 58 ;

end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getBranchesAssignedforAuditor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getBranchesAssignedforAuditor`(p_Auditor_ID int)
begin
select * from org_hier where 
Org_Hier_ID IN(Select Org_Hier_ID from branch_auditor_mapping where Auditor_ID=p_Auditor_ID) ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getBranchJoin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getBranchJoin`(
p_Org_Hier_ID int 
)
begin  
if(p_Org_Hier_ID = 0) then
select
Company_Name,
Company_Code, 
Parent_Company_ID, 
Description, 
level,
Is_Leaf, 
Type, 
Last_Updated_Date,
logo,
User_ID, 
Is_Active ,
Is_Vendor
from 
org_hier;
else 
select 
org_hier.Org_Hier_ID,
Company_Name, 
Company_Code, 
Parent_Company_ID, 
Description, 
level,
Is_Leaf, 
Type, 
Last_Updated_Date,
 logo,
User_ID, 
Is_Active,
Is_Delete,
Is_Vendor,
branch_location.Org_Hier_ID,
Location_ID,
Location_Name,
Address,
Country_ID,
State_ID,
City_ID,
Postal_Code,
Branch_Coordinates1,
Branch_Coordinates2,
Branch_CoordinateURL
from org_hier 
inner join branch_location on branch_location.Org_Hier_ID = org_hier.Org_Hier_ID
where org_hier.Org_Hier_ID= p_Org_Hier_ID;
End If;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getBranchList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getBranchList`()
begin  
select Company_Name, Org_Hier_ID,Type,Is_Active from org_hier where level=3 and Is_Delete = 0;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getBranchLocation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getBranchLocation`(
 p_Org_Hier_ID int
)
begin
SELECT `Location_ID`,
    `Location_Name`,
    `Address`,
    `Country_ID`,
    `State_ID`,
    `City_ID`,
    `Postal_Code`,
    `Branch_Coordinates1`,
    `Branch_Coordinates2`,
    `Branch_CoordinateURL`,
    `Org_Hier_ID`
FROM `branch_location`
where p_Org_Hier_ID=Org_Hier_ID;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getCity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getCity`(
p_State_ID int
)
begin
if(p_State_ID=0)
then
select *  from city;
else
select *  from city where State_ID = p_State_ID;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getCompaniesList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getCompaniesList`(p_Parent_Company_ID int)
begin  
select Company_Name, Org_Hier_ID,Type,Is_Active from org_hier where level= 2 and Parent_Company_ID=p_Parent_Company_ID;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getCompaniesListDropDown` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getCompaniesListDropDown`(
p_Parent_Company_ID int
)
begin
select org_hier.Org_Hier_ID,Company_Name,Calender_StartDate, Calender_EndDate  from org_hier
inner join company_details on company_details.Org_Hier_ID = org_hier.Org_Hier_ID 
 where Parent_Company_ID= p_Parent_Company_ID and Is_Active=1 and Is_Delete = 0 and level =2;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getCompanieyList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getCompanieyList`()
begin  
select Company_Name, Org_Hier_ID,Industry_Type,Is_Active from org_hier where level= 2 and Is_Delete=0 ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getCompanyLists` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getCompanyLists`(p_Parent_Company_ID int)
begin 
if( p_Parent_Company_ID=0)
then
select * from org_hier where level = 2 and Is_Delete=0;
else
select * from org_hier where level = 2 and Is_Delete=0 and Parent_Company_ID=p_Parent_Company_ID  ;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getCompanyListsforBranch` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getCompanyListsforBranch`(p_Org_Hier_ID int)
begin 
if( p_Org_Hier_ID=0)
then
select * from org_hier where level = 2;
else
select * from org_hier where Org_Hier_ID=p_Org_Hier_ID ;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getCompiledBranchComplianceAuditReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getCompiledBranchComplianceAuditReport`(p_Org_Hier_ID int,p_Compliance_Status varchar(100),p_Start_Date datetime, p_End_Date datetime, p_Compliance_Type_ID int, p_Vendor_ID int)
begin 
if(p_Org_Hier_ID = 0)
then
select * from compliance_audit ;
elseif(p_Compliance_Status= 'Compliant')
then
select compliance_audit.*,  compliance_xref.*, Org_Hier.Company_Name,
xref_comp_type_mapping.*, compliance_type.Compliance_Type_ID,compliance_type.Audit_Frequency,compliance_type.Compliance_Type_Name 
from compliance_audit
inner join Org_Hier on Org_Hier.Org_Hier_ID = compliance_audit.Org_Hier_ID
inner join xref_comp_type_mapping on xref_comp_type_mapping.Xref_Comp_Type_Map_ID = compliance_audit.Xref_Comp_Type_Map_ID
inner join compliance_xref on compliance_xref.Compliance_Xref_ID = xref_comp_type_mapping.Compliance_Xref_ID
inner join compliance_type on compliance_type.Compliance_Type_ID = xref_comp_type_mapping.Compliance_Type_ID
where  compliance_audit.Org_Hier_ID= p_Org_Hier_ID and compliance_audit.Start_Date >= p_Start_Date
and compliance_audit.End_Date <= p_End_Date and Compliance_Status= p_Compliance_Status 

and compliance_audit.Xref_Comp_Type_Map_ID in(
select xref_comp_type_mapping.Xref_Comp_Type_Map_ID from xref_comp_type_mapping where Compliance_Type_ID=p_Compliance_Type_ID)
and compliance_audit.Xref_Comp_Type_Map_ID in(
select compliance_audit.Xref_Comp_Type_Map_ID from compliance_audit where compliance_audit.Org_Hier_ID = p_Org_Hier_ID  and compliance_audit.Vendor_ID and
compliance_audit.Xref_Comp_Type_Map_ID 
group by compliance_audit.Xref_Comp_Type_Map_ID having (compliance_audit.Version) = max(compliance_audit.Version));


elseif(p_Compliance_Status= 'Non Compliant')
then
select compliance_audit.*,  compliance_xref.*, Org_Hier.Company_Name,
xref_comp_type_mapping.*, compliance_type.Compliance_Type_ID,compliance_type.Audit_Frequency,compliance_type.Compliance_Type_Name 
from compliance_audit
inner join Org_Hier on Org_Hier.Org_Hier_ID = compliance_audit.Org_Hier_ID
inner join xref_comp_type_mapping on xref_comp_type_mapping.Xref_Comp_Type_Map_ID = compliance_audit.Xref_Comp_Type_Map_ID
inner join compliance_xref on compliance_xref.Compliance_Xref_ID = xref_comp_type_mapping.Compliance_Xref_ID
inner join compliance_type on compliance_type.Compliance_Type_ID = xref_comp_type_mapping.Compliance_Type_ID
where  compliance_audit.Org_Hier_ID= p_Org_Hier_ID and compliance_audit.Start_Date >= p_Start_Date
and compliance_audit.End_Date <= p_End_Date and Compliance_Status= p_Compliance_Status and compliance_audit.Xref_Comp_Type_Map_ID in(
select xref_comp_type_mapping.Xref_Comp_Type_Map_ID from xref_comp_type_mapping where Compliance_Type_ID=p_Compliance_Type_ID)
and compliance_audit.Xref_Comp_Type_Map_ID in(
select compliance_audit.Xref_Comp_Type_Map_ID from compliance_audit where compliance_audit.Org_Hier_ID = p_Org_Hier_ID and compliance_audit.Vendor_ID and
compliance_audit.Xref_Comp_Type_Map_ID 
group by compliance_audit.Xref_Comp_Type_Map_ID having (compliance_audit.Version) = max(compliance_audit.Version));



elseif(p_Compliance_Status= 'Partially Compliant')
then
select compliance_audit.*,  compliance_xref.*, Org_Hier.Company_Name,
xref_comp_type_mapping.*, compliance_type.Compliance_Type_ID,compliance_type.Audit_Frequency,compliance_type.Compliance_Type_Name 
from compliance_audit
inner join Org_Hier on Org_Hier.Org_Hier_ID = compliance_audit.Org_Hier_ID
inner join xref_comp_type_mapping on xref_comp_type_mapping.Xref_Comp_Type_Map_ID = compliance_audit.Xref_Comp_Type_Map_ID
inner join compliance_xref on compliance_xref.Compliance_Xref_ID = xref_comp_type_mapping.Compliance_Xref_ID
inner join compliance_type on compliance_type.Compliance_Type_ID = xref_comp_type_mapping.Compliance_Type_ID
where  compliance_audit.Org_Hier_ID= p_Org_Hier_ID and compliance_audit.Start_Date >= p_Start_Date
and compliance_audit.End_Date <= p_End_Date and Compliance_Status= p_Compliance_Status and compliance_audit.Xref_Comp_Type_Map_ID in(
select xref_comp_type_mapping.Xref_Comp_Type_Map_ID from xref_comp_type_mapping where Compliance_Type_ID=p_Compliance_Type_ID)
and compliance_audit.Xref_Comp_Type_Map_ID in(
select compliance_audit.Xref_Comp_Type_Map_ID from compliance_audit where compliance_audit.Org_Hier_ID = p_Org_Hier_ID and compliance_audit.Vendor_ID and
compliance_audit.Xref_Comp_Type_Map_ID 
group by compliance_audit.Xref_Comp_Type_Map_ID having (compliance_audit.Version) = max(compliance_audit.Version));

end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getComplianceAudit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getComplianceAudit`(
p_Compliance_Audit_ID int 
)
begin
if(p_Compliance_Audit_ID=0)
then
select * from compliance_audit ;
else
select * from compliance_audit 
where Compliance_Audit_ID=p_Compliance_Audit_ID;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getComplianceAuditTrail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getComplianceAuditTrail`(
p_Compliance_Audit_ID int
)
begin
if(p_Compliance_Audit_ID =0)
then
select 
Comp_Schedule_Instance,
Penalty_nc,
Audit_Remarks,
Audit_artefacts,
Audit_Date,
Version,
Reviewer_ID,
Review_Comments,
Last_Updated_Date ,
Audit_Status,
Compliance_Xref_ID,
Org_Hier_ID,
Auditor_ID,
User_ID,
Is_Active,
Action_Type
from Compliance_Audit_AuditTrail;
else
select 
Comp_Schedule_Instance,
Penalty_nc,
Audit_Remarks,
Audit_artefacts,
Audit_Date,
Version,
Reviewer_ID,
Review_Comments,
Last_Updated_Date ,
Audit_Status,
Compliance_Xref_ID,
Org_Hier_ID,
Auditor_ID,
User_ID,
Is_Active,
Action_Type
from Compliance_Audit_AuditTrail
where Compliance_Audit_ID=p_Compliance_Audit_ID;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getComplianceBranchMapping` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getComplianceBranchMapping`(
p_Branch_Mapping_ID int 
)
begin
if(p_Branch_Mapping_ID=0)
then
select
Org_Hier_ID,
Compliance_Xref_ID,
Financial_Year,
Is_Active,
UpdatedByLogin_ID,
Allocation_Date
from compliance_branch_mapping ;
else
select 
Org_Hier_ID,
Compliance_Xref_ID,
Financial_Year,
Is_Active,
UpdatedByLogin_ID,
Allocation_Date
from compliance_branch_mapping 
where Branch_Mapping_ID=p_Branch_Mapping_ID;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getCompliancedBranchCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getCompliancedBranchCount`(p_Org_Hier_ID int, p_Start_Date datetime, p_End_Date datetime,
 p_Compliance_Type_ID int)
begin
if(p_Org_Hier_ID = 0 )
then
select * from org_hier ;
else
select distinct org_hier.Org_Hier_ID, Company_Name,compliance_audit.Org_Hier_ID, compliance_audit.Vendor_ID, Version , Compliance_Status
from org_hier
inner join compliance_audit on compliance_audit.Org_Hier_ID = org_hier.Org_Hier_ID
inner join xref_comp_type_mapping on xref_comp_type_mapping.Xref_Comp_Type_Map_ID = compliance_audit.Xref_Comp_Type_Map_ID
where
Compliance_Status ='Compliant' and compliance_audit.Applicability = 'Yes' and 
compliance_audit.Start_Date >= p_Start_Date and compliance_audit.End_Date >= p_End_Date and Compliance_Type_ID= p_Compliance_Type_ID and
compliance_audit.Org_Hier_ID =compliance_audit.Vendor_ID and
org_hier.Parent_Company_ID = p_Org_Hier_ID and
compliance_audit.Xref_Comp_Type_Map_ID in(

select compliance_audit.Xref_Comp_Type_Map_ID from compliance_audit where 
compliance_audit.Xref_Comp_Type_Map_ID 
group by compliance_audit.Xref_Comp_Type_Map_ID having (compliance_audit.Version) = max(compliance_audit.Version)
and org_hier.Org_Hier_ID  in (

select compliance_audit.Org_Hier_ID  from compliance_audit  where 
compliance_audit.Org_Hier_ID =compliance_audit.Vendor_ID and
compliance_audit.Xref_Comp_Type_Map_ID in(

select compliance_audit.Xref_Comp_Type_Map_ID from compliance_audit where 
compliance_audit.Xref_Comp_Type_Map_ID 
group by compliance_audit.Xref_Comp_Type_Map_ID having (compliance_audit.Version) = max(compliance_audit.Version) and
compliance_audit.Org_Hier_ID not in(

select compliance_audit.Org_Hier_ID   from compliance_audit
inner join xref_comp_type_mapping on xref_comp_type_mapping.Xref_Comp_Type_Map_ID = compliance_audit.Xref_Comp_Type_Map_ID
where compliance_audit.Applicability = 'Yes' and 
compliance_audit.Start_Date >= p_Start_Date and compliance_audit.End_Date <= p_End_Date  and  Compliance_Status != 'Compliant' and
Compliance_Type_ID= p_Compliance_Type_ID and
compliance_audit.Xref_Comp_Type_Map_ID in(

select compliance_audit.Xref_Comp_Type_Map_ID from compliance_audit where 
compliance_audit.Xref_Comp_Type_Map_ID 
group by compliance_audit.Xref_Comp_Type_Map_ID having (compliance_audit.Version) = max(compliance_audit.Version)
)))));
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getComplianceList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getComplianceList`(p_Country_ID int, p_Industry_Type_ID int)
begin 
if(p_Country_ID=0 && p_Industry_Type_ID=0)
then
select * from Compliance_Type ;
else
select Compliance_Type_ID,
Compliance_Type_Name,
Compliance_Type.Industry_Type_ID,Compliance_Type.Country_ID,Audit_Frequency,End_Date, Start_Date , Industry_Name, Country_Name

from Compliance_Type
 
inner join country on country.Country_ID = Compliance_Type.Country_ID
inner join industry_type_master on industry_type_master.Industry_Type_ID = Compliance_Type.Industry_Type_ID
where Compliance_Type.Country_ID= p_Country_ID and Compliance_Type.Industry_Type_ID=p_Industry_Type_ID ;
 end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getComplianceType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getComplianceType`(p_compliance_type_ID int)
begin
if(p_compliance_type_ID=0)
then
Select * from compliance_type;
else
Select * from Compliance_type where Compliance_Type_ID=p_compliance_type_ID;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getComplianceXref` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getComplianceXref`(
p_Audit_Type_ID int 
)
begin
if(p_Audit_Type_ID=0)
then
SELECT `compliance_xref`.`Compliance_Xref_ID`,
    `compliance_xref`.`Comp_Category`,
    `compliance_xref`.`Comp_Description`,
    `compliance_xref`.`Is_Header`,
    `compliance_xref`.`level`,
    `compliance_xref`.`Comp_Order`,
    `compliance_xref`.`Risk_Category`,
    `compliance_xref`.`Risk_Description`,
    `compliance_xref`.`Recurrence`,
    `compliance_xref`.`Form`,
    `compliance_xref`.`Type`,
    `compliance_xref`.`Is_Best_Practice`,
    `compliance_xref`.`Version`,
    `compliance_xref`.`Effective_Start_Date`,
    `compliance_xref`.`Effective_End_Date`,
    `compliance_xref`.`Country_ID`,
    `compliance_xref`.`State_ID`,
    `compliance_xref`.`City_ID`,
    `compliance_xref`.`Last_Updated_Date`,
    `compliance_xref`.`User_ID`,
    `compliance_xref`.`Is_Active`,
    `compliance_xref`.`Compliance_Title`,
    `compliance_xref`.`Compliance_Parent_ID`,
    `compliance_xref`.`compl_def_consequence`,
    `compliance_xref`.`Audit_Type_ID`
FROM `compliancedb`.`compliance_xref`;
else
SELECT `compliance_xref`.`Compliance_Xref_ID`,
    `compliance_xref`.`Comp_Category`,
    `compliance_xref`.`Comp_Description`,
    `compliance_xref`.`Is_Header`,
    `compliance_xref`.`level`,
    `compliance_xref`.`Comp_Order`,
    `compliance_xref`.`Risk_Category`,
    `compliance_xref`.`Risk_Description`,
    `compliance_xref`.`Recurrence`,
    `compliance_xref`.`Form`,
    `compliance_xref`.`Type`,
    `compliance_xref`.`Is_Best_Practice`,
    `compliance_xref`.`Version`,
    `compliance_xref`.`Effective_Start_Date`,
    `compliance_xref`.`Effective_End_Date`,
    `compliance_xref`.`Country_ID`,
    `compliance_xref`.`State_ID`,
    `compliance_xref`.`City_ID`,
    `compliance_xref`.`Last_Updated_Date`,
    `compliance_xref`.`User_ID`,
    `compliance_xref`.`Is_Active`,
    `compliance_xref`.`Compliance_Title`,
    `compliance_xref`.`Compliance_Parent_ID`,
    `compliance_xref`.`compl_def_consequence`,
    `compliance_xref`.`Audit_Type_ID`
FROM `compliancedb`.`compliance_xref`
where Audit_Type_ID= p_Audit_Type_ID;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getComplianceXrefAuditTrail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getComplianceXrefAuditTrail`(
p_Compliance_Xref_ID int
)
begin
if(p_Compliance_Xref_ID=0)
then
select Comp_Category, Comp_Description,Is_Header,level,Comp_Order,Option_ID,Risk_Category,
Risk_Description,Recurrence,Form,Type,Is_Best_Practice ,Version,Effective_Start_Date,Effective_End_Date,
Country_ID ,State_ID ,City_ID ,Last_Updated_Date,User_ID, Action_Type,Is_Active from compliance_xref_audittrail;
else
select Comp_Category, Comp_Description,Is_Header,level,Comp_Order,Option_ID,Risk_Category,
Risk_Description,Recurrence,Form,Type,Is_Best_Practice ,Version,Effective_Start_Date,Effective_End_Date,
Country_ID ,State_ID ,City_ID ,Last_Updated_Date,User_ID, Action_Type,Is_Active from compliance_xref_audittrail
where Compliance_Xref_ID = p_Compliance_Xref_ID;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getComplianceXrefData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getComplianceXrefData`(
p_Org_Hier_ID int,
p_Vendor_ID int,
p_compliancety_ID int,
p_Compliance_Parent_ID int 
)
begin
select * from compliance_xref where Compliance_Parent_ID=p_Compliance_Parent_ID and Compliance_Xref_ID in 
(Select Compliance_Xref_ID from  xref_comp_type_mapping where Compliance_Type_ID=p_compliancety_ID and Xref_Comp_Type_Map_ID in 
(Select Xref_Comp_Type_Map_ID from compliance_branch_mapping where Org_Hier_ID=p_Org_Hier_ID and Vendor_ID=p_Vendor_ID
));
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getComplianceXreftype` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getComplianceXreftype`(
p_Audit_Type_ID int,
p_Country_ID int,
p_State_ID int,
p_City_ID int,
flag int
)
begin
if(flag=0 and p_Audit_Type_ID=0)
then
SELECT * FROM `compliancedb`.`compliance_xref` where Country_ID=p_Country_ID;
else if(flag=0)
then
SELECT * FROM `compliancedb`.`compliance_xref`
where Compliance_Xref_ID in(Select Compliance_Xref_ID from xref_comp_type_mapping where Compliance_Type_ID=p_Audit_Type_ID) and Country_ID=p_Country_ID;
else
SELECT * FROM `compliancedb`.`compliance_xref`
where Compliance_Xref_ID in(Select Compliance_Xref_ID from xref_comp_type_mapping where Compliance_Type_ID=p_Audit_Type_ID)  and Country_ID=p_Country_ID and State_ID=p_State_ID and City_ID=p_City_ID;
end if;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getCountry` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getCountry`()
begin
select *  from Country;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getDefaultCompanyLists` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getDefaultCompanyLists`(p_Org_Hier_ID int)
begin 
if( p_Org_Hier_ID=0)
then
select * from org_hier where level = 2;
else
select org_hier.Org_Hier_ID,Company_Name,branch_location.Country_ID,Calender_StartDate, Calender_EndDate,
branch_location.State_ID,branch_location.City_ID, Country_Name, State_Name, City_Name from org_hier
inner join company_details on company_details.Org_Hier_ID = org_hier.Org_Hier_ID
inner join branch_location on branch_location.Org_Hier_ID = org_hier.Org_Hier_ID 
inner join Country on  Country.Country_ID= branch_location.Country_ID 
inner join State on  State.State_ID= branch_location.State_ID 
inner join city on  city.City_ID= branch_location.City_ID 
where org_hier.Org_Hier_ID=p_Org_Hier_ID;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getDefaultIndustryType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getDefaultIndustryType`(p_Org_Hier_ID int)
begin 
if(p_Org_Hier_ID = 0)
then
select Org_Hier_ID,company_details.Industry_Type_ID, Industry_Name
from company_details

inner join industry_type_master on industry_type_master.Industry_Type_ID = company_details.Industry_Type_ID;
else
select Org_Hier_ID,company_details.Industry_Type_ID, Industry_Name
from company_details
inner join industry_type_master on industry_type_master.Industry_Type_ID = company_details.Industry_Type_ID

where Org_Hier_ID= p_Org_Hier_ID ;
 end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getDetailedBranchComplianceAuditReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getDetailedBranchComplianceAuditReport`(p_Org_Hier_ID int,
p_Start_Date datetime,
p_End_Date datetime ,
p_Compliance_Type_ID int,
p_Vendor_ID int
)
begin 
if(p_Org_Hier_ID = 0)
then
select * from compliance_audit ;
else
select compliance_audit.*,  compliance_xref.*, Org_Hier.Company_Name,
xref_comp_type_mapping.*, compliance_type.Compliance_Type_ID,compliance_type.Audit_Frequency,compliance_type.Compliance_Type_Name 
from compliance_audit
inner join Org_Hier on Org_Hier.Org_Hier_ID = compliance_audit.Org_Hier_ID
inner join xref_comp_type_mapping on xref_comp_type_mapping.Xref_Comp_Type_Map_ID = compliance_audit.Xref_Comp_Type_Map_ID
inner join compliance_xref on compliance_xref.Compliance_Xref_ID = xref_comp_type_mapping.Compliance_Xref_ID
inner join compliance_type on compliance_type.Compliance_Type_ID = xref_comp_type_mapping.Compliance_Type_ID
where  compliance_audit.Org_Hier_ID = p_Org_Hier_ID and compliance_audit.Start_Date >= p_Start_Date 
and compliance_audit.End_Date <= p_End_Date
and compliance_audit.Xref_Comp_Type_Map_ID in(
select xref_comp_type_mapping.Xref_Comp_Type_Map_ID from xref_comp_type_mapping where Compliance_Type_ID=p_Compliance_Type_ID)
and compliance_audit.Xref_Comp_Type_Map_ID in(
select compliance_audit.Xref_Comp_Type_Map_ID from compliance_audit where compliance_audit.Org_Hier_ID = p_Org_Hier_ID
  and compliance_audit.Vendor_ID = p_Vendor_ID and
compliance_audit.Xref_Comp_Type_Map_ID 
group by compliance_audit.Xref_Comp_Type_Map_ID having (compliance_audit.Version) = max(compliance_audit.Version));
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getDetailedBranchCompliance_ACTAuditReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getDetailedBranchCompliance_ACTAuditReport`(p_Org_Hier_ID int, p_Vendor_ID int)
begin 
if(p_Org_Hier_ID = 0 && p_Vendor_ID = 0)
then
select * from compliance_audit ;
else
select distinct compliance_xref.*    from compliance_audit
inner join Org_Hier on Org_Hier.Org_Hier_ID = compliance_audit.Org_Hier_ID
inner join xref_comp_type_mapping on xref_comp_type_mapping.Xref_Comp_Type_Map_ID = compliance_audit.Xref_Comp_Type_Map_ID
inner join compliance_xref on compliance_xref.Compliance_Xref_ID = compliance_xref.Compliance_Xref_ID
where compliance_xref.Compliance_Xref_ID in(
select distinct Compliance_Parent_ID from compliance_xref where compliance_xref.Compliance_Xref_ID in(
select xref_comp_type_mapping.Compliance_Xref_ID from xref_comp_type_mapping where xref_comp_type_mapping.Xref_Comp_Type_Map_ID in(
select compliance_audit.Xref_Comp_Type_Map_ID from compliance_audit where Org_Hier_ID = p_Org_Hier_ID and Vendor_ID = p_Vendor_ID)));
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getGroupCompaniesList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getGroupCompaniesList`()
begin  

select Company_Name, Org_Hier_ID,Industry_Type,Is_Active, logo from org_hier where Parent_Company_ID=0 and Is_Delete = 0 and Is_Active = 1;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getGroupCompaniesListDropDown` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getGroupCompaniesListDropDown`()
begin
select Org_Hier_ID, Company_Name  from org_hier where Parent_Company_ID=0;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getGroupCompanyListActiveDeactive` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getGroupCompanyListActiveDeactive`()
begin
select Company_Name, Org_Hier_ID,Type,Is_Active, logo from org_hier where Parent_Company_ID=0 and Is_Delete = 0 ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getGroupCompanyListDropDown` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getGroupCompanyListDropDown`()
begin  

select Company_Name, Org_Hier_ID,Is_Active, logo from org_hier where Parent_Company_ID=0 and Is_Delete = 0 and Is_Active = 1 ;


end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getGroupHierJoin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getGroupHierJoin`(
p_Org_Hier_ID int 
)
begin  
if(p_Org_Hier_ID = 0) then
select
Company_Name,
Company_Code, 
Parent_Company_ID, 
Description,
level,
Is_Leaf,
Type,
Last_Updated_Date,
logo,
User_ID, 
Is_Active,
Is_Vendor 
from org_hier;
else 
select org_hier.Org_Hier_ID,
Company_Name, 
Company_COde, 
Parent_Company_ID,
Description,
level,
Is_Leaf, 
Type,
Last_Updated_Date,
logo,
User_ID, 
Is_Active,
Is_Delete,
Is_Vendor
from org_hier 
where org_hier.Org_Hier_ID= p_Org_Hier_ID;
End If;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getIndustryTypeList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getIndustryTypeList`()
begin  

select *from industry_type_master ;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getlineitems` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getlineitems`(p_Compliance_Parent_ID int)
BEGIN
if(p_Compliance_Parent_ID=0)
then
SELECT * FROM `compliancedb`.`compliance_xref`
where `compliance_xref`.`level`=2;
else
select * from `compliancedb`.`compliance_xref`
where Compliance_Parent_ID=p_Compliance_Parent_ID and `compliance_xref`.`level`=2;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getLoginData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getLoginData`(
p_Email_ID varchar(100),
p_User_Password varchar(10)
)
begin
select * from user where Email_ID= p_Email_ID and User_Password = p_User_Password;
update user set Last_Login=now() where User_ID in(Select User_ID where Email_ID= p_Email_ID);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getMenulist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getMenulist`()
BEGIN
SELECT Menu_ID,Parent_MenuID,Menu_Name,Page_URL,Is_Active,icon 
FROM `menus`
where Parent_MenuID>0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getMenus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getMenus`(p_User_ID int,p_Parent_MenuID int)
begin
SELECT distinct `menus`.`Menu_ID`,`Parent_MenuID`,Menu_Name,Page_URL,Is_Active,icon
FROM `menus` left join usergroup_menu_map on menus.Menu_ID=usergroup_menu_map.Menu_ID
WHERE `User_Group_ID` in (select User_Group_ID from user_group_members where User_ID = p_User_ID) and `Parent_MenuID`=p_Parent_MenuID;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getNonCompliancedPartiallyCompliancedBranchCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getNonCompliancedPartiallyCompliancedBranchCount`(p_Org_Hier_ID int, p_Start_Date datetime, p_End_Date datetime,
 p_Compliance_Type_ID int)
begin
if(p_Org_Hier_ID = 0 )
then
select * from org_hier ;
else
select distinct org_hier.Org_Hier_ID, Company_Name,compliance_audit.Org_Hier_ID, compliance_audit.Vendor_ID, Version , Compliance_Status
from org_hier
inner join compliance_audit on compliance_audit.Org_Hier_ID = org_hier.Org_Hier_ID
inner join xref_comp_type_mapping on xref_comp_type_mapping.Xref_Comp_Type_Map_ID = compliance_audit.Xref_Comp_Type_Map_ID
where
Compliance_Status !='Compliant' and compliance_audit.Applicability = 'Yes' and 
compliance_audit.Start_Date >= p_Start_Date and compliance_audit.End_Date <= p_End_Date and Compliance_Type_ID= p_Compliance_Type_ID and
compliance_audit.Org_Hier_ID =compliance_audit.Vendor_ID and
org_hier.Parent_Company_ID = p_Org_Hier_ID and
compliance_audit.Xref_Comp_Type_Map_ID in(
select compliance_audit.Xref_Comp_Type_Map_ID from compliance_audit where 
compliance_audit.Xref_Comp_Type_Map_ID 
group by compliance_audit.Xref_Comp_Type_Map_ID having (compliance_audit.Version) = max(compliance_audit.Version)
and org_hier.Org_Hier_ID  in (
select compliance_audit.Org_Hier_ID  from compliance_audit  where 
compliance_audit.Xref_Comp_Type_Map_ID in(
select compliance_audit.Xref_Comp_Type_Map_ID from compliance_audit where 
compliance_audit.Xref_Comp_Type_Map_ID 
group by compliance_audit.Xref_Comp_Type_Map_ID having (compliance_audit.Version) = max(compliance_audit.Version) and
compliance_audit.Org_Hier_ID  in(
select compliance_audit.Org_Hier_ID   from compliance_audit
inner join xref_comp_type_mapping on xref_comp_type_mapping.Xref_Comp_Type_Map_ID = compliance_audit.Xref_Comp_Type_Map_ID
where compliance_audit.Applicability = 'Yes' and 
compliance_audit.Start_Date >= p_Start_Date and compliance_audit.End_Date <= p_End_Date  and  Compliance_Status != 'Compliant' and
Compliance_Type_ID= p_Compliance_Type_ID and
compliance_audit.Xref_Comp_Type_Map_ID in(
select compliance_audit.Xref_Comp_Type_Map_ID from compliance_audit where 
compliance_audit.Xref_Comp_Type_Map_ID 
group by compliance_audit.Xref_Comp_Type_Map_ID having (compliance_audit.Version) = max(compliance_audit.Version)
)))));
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getOrganizationHier` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getOrganizationHier`(
p_Org_Hier_ID int 
)
begin  
if(p_Org_Hier_ID = 0) then
select Company_Name, Company_ID, Parent_Company_ID, Description, level,
Is_Leaf, Type, Last_Updated_Date, Location_ID, User_ID, Is_Active from org_hier;
else 

select Company_Name, Company_ID, Parent_Company_ID, Description, level,
Is_Leaf, Type, Last_Updated_Date, Location_ID, User_ID, Is_Active from org_hier
where Org_Hier_ID = p_Org_Hier_ID;
End If;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getOrganizationHierJoin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getOrganizationHierJoin`(
p_Org_Hier_ID int 
)
begin  
if(p_Org_Hier_ID = 0) then
select
Company_Name,
Company_Code, 
Parent_Company_ID, 
Description,
level,
Is_Leaf,
Type,
Last_Updated_Date,
 logo,
User_ID, 
Is_Active ,
Is_Vendor
from org_hier;
else 
select org_hier.Org_Hier_ID,
Company_Name, 
Company_COde, 
Parent_Company_ID,
Description,
level,
Is_Leaf, 
Type, 
Last_Updated_Date,
logo,
User_ID, 
Is_Active,
Is_Delete,
Is_Vendor,
company_details.Company_Details_ID,
company_details.Org_Hier_ID, 
Formal_Name, 
Calender_StartDate,
Calender_EndDate,
Auditing_Frequency,
Website,
Company_Email_ID,
Company_ContactNumber1,
Company_ContactNumber2,
branch_location.Location_ID,
branch_location.Org_Hier_ID,
Location_Name,
Address,
Country_ID,
State_ID,
City_ID,
Postal_Code,
Branch_Coordinates1,
Branch_Coordinates2,
Branch_CoordinateURL,
Industry_Type_ID
from org_hier 
inner join  company_Details  on company_details.Org_Hier_ID = org_hier.Org_Hier_ID
inner join branch_location on branch_location.Org_Hier_ID = org_hier.Org_Hier_ID
where org_hier.Org_Hier_ID= p_Org_Hier_ID;
End If;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getParticularComplianceType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getParticularComplianceType`(p_Compliance_Type_ID int)
begin 
if( p_Compliance_Type_ID=0)
then
select * from compliance_Type ;
else
select * from compliance_Type 
where Compliance_Type_ID=p_Compliance_Type_ID;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getParticularGroupCompaniesList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getParticularGroupCompaniesList`(p_Org_Hier_ID int)
begin  

select Company_Name, Org_Hier_ID,Is_Active, logo from org_hier where Parent_Company_ID=0 and Is_Delete = 0 and Is_Active = 1 and
Org_Hier_ID = p_Org_Hier_ID;


end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getpieDetailedBranchComplianceAuditReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getpieDetailedBranchComplianceAuditReport`(p_Org_Hier_ID int

)
begin 
if(p_Org_Hier_ID = 0)
then
select * from compliance_audit ;


else

select compliance_audit.*,  compliance_xref.*, Org_Hier.Company_Name from compliance_audit
inner join Org_Hier on Org_Hier.Org_Hier_ID = compliance_audit.Org_Hier_ID
inner join xref_comp_type_mapping on xref_comp_type_mapping.Xref_Comp_Type_Map_ID = compliance_audit.Xref_Comp_Type_Map_ID
inner join compliance_xref on compliance_xref.Compliance_Xref_ID = xref_comp_type_mapping.Compliance_Xref_ID
where  compliance_audit.Org_Hier_ID = p_Org_Hier_ID




 and compliance_audit.Xref_Comp_Type_Map_ID in(
select compliance_audit.Xref_Comp_Type_Map_ID from compliance_audit where compliance_audit.Xref_Comp_Type_Map_ID 
group by compliance_audit.Xref_Comp_Type_Map_ID having (compliance_audit.Version) = max(compliance_audit.Version));

end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getPrivilege` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getPrivilege`()
begin
select Privilege_ID,Privilege_Name,Privilege_Type,Is_Active from  privilege where Is_Active=1;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getRole` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getRole`(p_Role_ID int)
begin
if(p_Role_ID=0)
then
SELECT `role`.`Role_ID`,
    `role`.`Role_Name`,
    `role`.`Is_Active`,
    `role`.`Is_Group_Role`
FROM `compliancedb`.`role` where Is_Active=1;
else
SELECT `role`.`Role_ID`,
    `role`.`Role_Name`,
    `role`.`Is_Active`,
    `role`.`Is_Group_Role`
FROM `compliancedb`.`role`
WHERE `Role_ID` = p_Role_ID ;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getRoleList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getRoleList`(p_flag int)
begin
if(p_flag=0)
then
select Role_ID,Role_Name from role where Is_Group_Role=0 and Is_Active=1;
else
select Role_ID,Role_Name from role where Is_Group_Role=1 and Is_Active=1;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getRolePrivilege` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getRolePrivilege`(p_Role_ID int)
begin
select a.Privilege_ID,Privilege_Name,Privilege_Type,b.Is_Active from role_priv_map a left join privilege b 
on a.Privilege_ID=b.Privilege_ID where a.Role_ID=p_Role_ID;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getRuleforBranch` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getRuleforBranch`(p_Org_ID int,p_vendor_ID int)
begin
select Compliance_Xref_ID,Compliance_Title from compliance_xref where `compliance_xref`.`level`=2 and
Compliance_Xref_ID in(select Compliance_Xref_ID from xref_comp_type_mapping where Xref_Comp_Type_Map_ID in (select Xref_Comp_Type_Map_ID from compliance_branch_mapping where Org_Hier_ID= p_Org_ID and Vendor_ID=p_vendor_ID));
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getRules` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getRules`(p_Compliance_Parent_ID int)
begin
if(p_Compliance_Parent_ID=0)
then
SELECT * FROM `compliancedb`.`compliance_xref`
where Comp_Category='Rule' and `compliance_xref`.`level`=2;
else
SELECT `compliance_xref`.`Compliance_Xref_ID`,
  `compliance_xref`.`Compliance_Title`
  FROM `compliancedb`.`compliance_xref`
  where Comp_Category='Rule' and `compliance_xref`.`level`=2 and Compliance_Parent_ID=p_Compliance_Parent_ID;
  end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getSpecificBranchList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getSpecificBranchList`(p_Parent_Company_ID int)
begin 
if(p_Parent_Company_ID=0)
then
select Company_Name, Org_Hier_ID,Type,Is_Active,logo from org_hier where level=3 and Is_Delete = 0 and Is_Vendor=0;
else
 
select Company_Name, Org_Hier_ID,Type,Is_Active ,logo from org_hier where level=3 and Is_Delete = 0 and Is_Vendor=0
 and Parent_Company_ID= p_Parent_Company_ID ;
 end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getSpecificBranchListDropDown` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getSpecificBranchListDropDown`(p_Parent_Company_ID int)
begin 
select Company_Name, Org_Hier_ID,Type,Is_Active ,logo from org_hier where level=3 and Is_Delete = 0 and Is_Vendor=0 and Is_Active=1
 and Parent_Company_ID= p_Parent_Company_ID ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getSpecificVendorList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getSpecificVendorList`(p_Parent_Company_ID int)
begin 
if(p_Parent_Company_ID=0)
then
select Company_Name, Org_Hier_ID,Type,Is_Active,logo, Is_Vendor from org_hier where level=3 and Is_Vendor=1 and Is_Delete = 0;
else
 
select Company_Name, Org_Hier_ID,Type,Is_Active,logo, Is_Vendor from org_hier where level=3 and Is_Vendor=1  and Is_Delete = 0
 and Parent_Company_ID= p_Parent_Company_ID ;
 end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getSpecificVendorListDropDown` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getSpecificVendorListDropDown`(p_Parent_Company_ID int,p_Branch_ID int)
begin 
select * from org_hier where Parent_Company_ID=p_Parent_Company_ID and Is_Vendor=1 and level=3 and Is_Delete = 0 and Is_Active = 1 and Org_Hier_ID Not In
(select Vendor_ID from vendor_branch_mapping where Branch_ID=p_Branch_ID and vendor_branch_mapping.Is_Active = 1);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getState` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getState`(
p_Country_ID int
)
begin
if(p_Country_ID=0)
then
select *  from state;
else
select *  from state where Country_ID= p_Country_ID;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getUser`(p_User_ID int)
begin
if(p_User_ID=0)
then
SELECT `user`.`User_ID`,
    `user`.`User_Password`,
    `user`.`First_Name`,
    `user`.`Middle_Name`,
    `user`.`Last_Name`,
    `user`.`Email_ID`,
    `user`.`Contact_Number`,
    `user`.`Gender`,
    `user`.`Is_Active`,
    `user`.`Last_Login`
FROM `compliancedb`.`user` where Is_Active=1;
else
SELECT `user`.`User_ID`,
    `user`.`User_Password`,
    `user`.`First_Name`,
    `user`.`Middle_Name`,
    `user`.`Last_Name`,
    `user`.`Email_ID`,
    `user`.`Contact_Number`,
    `user`.`Gender`,
    `user`.`Is_Active`,
    `user`.`Last_Login`
FROM `compliancedb`.`user` 
where User_ID = p_User_ID;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getUserassignedGroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getUserassignedGroup`(p_User_ID int)
begin
SELECT a.User_Group_ID,a.User_Group_Name
FROM `compliancedb`.`user_group` a left join user_group_members b on a.User_Group_ID=b.User_Group_ID
WHERE b.User_ID =p_User_ID ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getUserGroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getUserGroup`(p_User_Group_ID int)
begin
if(p_User_Group_ID=0)
then
SELECT `user_group`.`User_Group_ID`,
    `user_group`.`User_Group_Name`,
    `user_group`.`User_Group_Description`,
    `user_group`.`Role_ID`
FROM `compliancedb`.`user_group`where Is_Active=1;
else
SELECT `user_group`.`User_Group_ID`,
    `user_group`.`User_Group_Name`,
    `user_group`.`User_Group_Description`,
    `user_group`.`Role_ID`,
    `user_group`.`Is_Active`
FROM `compliancedb`.`user_group`
WHERE `User_Group_ID` = p_User_Group_ID;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getUserGroupRole` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getUserGroupRole`()
begin
select Role_ID,Role_Name from role where Is_Group_Role=1 and Is_Active=1;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getUserRole` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getUserRole`(p_User_ID int)
begin
select a.Role_ID,Role_Name from user_role_map a left join role b on a.Role_ID=b.Role_ID where User_ID=p_User_ID;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getVendorJoin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getVendorJoin`(
p_Org_Hier_ID int 
)
begin  
if(p_Org_Hier_ID = 0) then
select
Company_Name,
Company_Code, 
Parent_Company_ID, 
Description,
level,
Is_Leaf,
Type,
Last_Updated_Date,
 logo,
User_ID, 
Is_Active ,
Is_Vendor
from org_hier;
else 
select org_hier.Org_Hier_ID,
Company_Name, 
Company_COde, 
Parent_Company_ID,
Description,
level,
Is_Leaf, 
Type, 
Last_Updated_Date,
logo,
User_ID, 
Is_Active,
Is_Delete,
Is_Vendor,
company_details.Company_Details_ID,
company_details.Org_Hier_ID, 
Formal_Name, 
Calender_StartDate,
Calender_EndDate,
Auditing_Frequency,
Website,
Company_Email_ID,
Company_ContactNumber1,
Company_ContactNumber2,
Industry_Type_ID

from org_hier 
inner join  company_Details  on company_details.Org_Hier_ID = org_hier.Org_Hier_ID

where org_hier.Org_Hier_ID= p_Org_Hier_ID;
End If;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getVendorsForBranch` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getVendorsForBranch`(p_Branch_ID int)
begin 
if(p_Branch_ID=0)
then
select Vendor_Branch_ID,
Branch_ID,
Vendor_ID, Start_Date,End_Date,vendor_branch_mapping.Is_Active ,
Company_Name,Type,logo 
 from vendor_branch_mapping
inner join org_hier on org_hier.Org_Hier_ID = vendor_branch_mapping.Vendor_ID;
else
select Vendor_Branch_ID,
Branch_ID,
Vendor_ID, Start_Date,End_Date,vendor_branch_mapping.Is_Active ,
Company_Name,Type,logo 
 from vendor_branch_mapping
inner join org_hier on org_hier.Org_Hier_ID = vendor_branch_mapping.Vendor_ID
where Branch_ID= p_Branch_ID  and vendor_branch_mapping.Is_Active = 1;
 end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getYearofAuditReports` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getYearofAuditReports`(p_Org_Hier_ID int)
begin 
if(p_Org_Hier_ID = 0)
then
select * from compliance_audit ;
else
select compliance_audit.Start_Date, compliance_audit.End_Date,
year(compliance_audit.Start_Date), year(compliance_audit.End_Date),
monthname(compliance_audit.Start_Date),monthname(compliance_audit.End_Date),
 compliance_audit.Org_Hier_ID from compliance_audit
where Org_Hier_ID =  p_Org_Hier_ID;


end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_ComplianceType_map_BranchorVendor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_ComplianceType_map_BranchorVendor`(
p_ComplinceTypeId int,
p_branchid int
)
BEGIN
Select * from org_hier inner join vendor_branch_mapping on Branch_ID=p_branchid 
where Org_Hier_ID in 
(select Org_Hier_ID from compliance_type_mapping where Compliance_Type_ID=p_ComplinceTypeId);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_compliance_audit_on_org` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_compliance_audit_on_org`(
p_Org_Hier_ID int,
p_Vendor_ID int,
p_Version int,
p_sdate datetime,
p_edate datetime)
BEGIN
select compliance_audit.* from compliance_audit where p_Org_Hier_ID=Org_Hier_ID
and p_Vendor_ID=Vendor_ID and Version=p_Version and p_sdate=Start_Date and End_Date=p_edate;
select Compliance_Xref_ID from xref_comp_type_mapping where Xref_Comp_Type_Map_ID in 
(select Xref_Comp_Type_Map_ID from compliance_audit where Org_Hier_ID=p_Org_Hier_ID
and Vendor_ID=p_Vendor_ID and Version=p_Version and Start_Date=p_sdate and End_Date=p_edate); 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_xref_comp_type_mapping` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_xref_comp_type_mapping`(
p_Compliance_Type_ID int,
p_Compliance_Xref_ID int)
BEGIN
if(p_Compliance_Xref_ID=0)
then
Select * from xref_comp_type_mapping where Compliance_Type_ID=p_Compliance_Type_ID and Compliance_Xref_ID
in (Select Compliance_Xref_ID from compliance_xref where Compliance_Parent_ID=0);
else if(p_Compliance_Type_ID=0)
then
Select Compliance_Type_ID from xref_comp_type_mapping where Compliance_Xref_ID=p_Compliance_Xref_ID;
else
Select Xref_Comp_Type_Map_ID from xref_comp_type_mapping where Compliance_Type_ID=p_Compliance_Type_ID and
 Compliance_Xref_ID=p_Compliance_Xref_ID;
end if;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertComplianceAuditTrail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertComplianceAuditTrail`(
p_Compliance_Audit_ID int ,
p_Comp_Schedule_Instance int,
p_Penalty_nc varchar(150),
p_Audit_Remarks varchar(150),
p_Audit_artefacts varchar(150),
p_Audit_Date datetime,
p_Version int,
p_Reviewer_ID int,
p_Review_Comments varchar(500),
p_Audit_Status varchar(10),
p_Compliance_Xref_ID int ,
p_Org_ID int ,
p_Auditor_ID int,
p_User_ID int ,
p_Is_Active bit,
p_Action_Type varchar(10)
)
begin
insert into Compliance_Audit_AuditTrail
(
Comp_Schedule_Instance,
Penalty_nc,
Audit_Remarks,
Audit_artefacts,
Audit_Date,
Version,
Reviewer_ID,
Review_Comments,
Last_Updated_Date ,
Audit_Status,
Compliance_Xref_ID,
Org_ID,
Auditor_ID,
User_ID,
Is_Active,
Action_Type
)
values
(
p_Comp_Schedule_Instance,
p_Penalty_nc,
p_Audit_Remarks,
p_Audit_artefacts,
p_Audit_Date,
p_Version,
p_Reviewer_ID,
p_Review_Comments,NOW(),
p_Audit_Status,
p_Compliance_Xref_ID,
p_Org_ID,
p_Auditor_ID,
p_User_ID,
p_Is_Active,
p_Action_Type
);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertComplianceXrefAuditTrail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertComplianceXrefAuditTrail`(
p_Compliance_Xref_ID int ,
p_Comp_Category varchar(45),
p_Comp_Description varchar(45),
p_Is_Header tinyint,
p_level varchar(5),
p_Comp_Order int(3),
p_Option_ID int,
p_Risk_Category varchar(45),
p_Risk_Description varchar(100),
p_Recurrence varchar(45),
p_Form varchar(45),
p_Type varchar(45),
p_Is_Best_Practice tinyint,
p_Version int(3),
p_Effective_Start_Date datetime,
p_Effective_End_Date datetime,
p_Country_ID int,
p_State_ID int,
p_City_ID int,
p_User_ID int ,
p_Action_Type varchar(10),
p_Is_Active bit
)
begin
insert into compliance_xref_audittrail(Comp_Category, Comp_Description,Is_Header,level,Comp_Order,Option_ID,Risk_Category,
Risk_Description,Recurrence,Form,Type,Is_Best_Practice ,Version,Effective_Start_Date,Effective_End_Date,
Country_ID ,State_ID ,City_ID ,User_ID, Action_Type,Is_Active )

values(p_Comp_Category, p_Comp_Description,p_Is_Header,p_level,p_Comp_Order,p_Option_ID,p_Risk_Category,
p_Risk_Description,p_Recurrence,p_Form,p_Type,p_Is_Best_Practice ,p_Version,p_Effective_Start_Date,p_Effective_End_Date,
p_Country_ID ,p_State_ID ,p_City_ID ,p_User_ID,p_Action_Type,p_Is_Active,Now()  );

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertLoginData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertLoginData`(
p_User_ID int,
p_User_Password varchar(10),
p_First_Name varchar(45),
p_Middle_Name varchar(45),
p_Last_Name varchar(45),
p_Email_ID varchar(100),
p_Contact_Number varchar(50),
p_Company_ID int,
p_Gender varchar(45),
p_Is_Active bit,
p_Last_Login datetime
)
BEGIN
insert into user values
(
p_User_Password,
p_First_Name,
p_Middle_Name,
p_Last_Name,
p_Email_ID,
p_Contact_Number,
p_Contact_ID,
p_Gender,
p_Is_Active,
p_Last_Login);
Select @@IDENTITY;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertRolePrivilege` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertRolePrivilege`(p_Role_ID int,p_Privilege_ID int,p_Is_Active bit)
begin
INSERT INTO `compliancedb`.`role_priv_map`
(`Is_Active`,
`Role_ID`,
`Privilege_ID`)
VALUES
(p_Is_Active,p_Role_ID,p_Privilege_ID);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertUpdateAuditCalender` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertUpdateAuditCalender`(
p_Flag char(1),
p_Audit_Calender_ID int ,
p_Org_Hier_ID int ,
p_Compliance_Type_ID int ,
p_Start_Date datetime,
p_End_Date datetime,
p_Audit_Year year
)
begin
if(p_Flag = 'I') then
insert into AuditCalender
(
Audit_Calender_ID,
Org_Hier_ID,
Compliance_Type_ID,
Start_Date,
End_Date,
Audit_Year
)
values
(
p_Audit_Calender_ID  ,
p_Org_Hier_ID  ,
p_Compliance_Type_ID ,
p_Start_Date,
p_End_Date ,
p_Audit_Year
);
select last_insert_id();
else
update AuditCalender set
Audit_Calender_ID=p_Audit_Calender_ID,
Org_Hier_ID=p_Org_Hier_ID,
Compliance_Type_ID=p_Compliance_Type_ID,
Start_Date=p_Start_Date,
End_Date=p_End_Date,
Audit_Year=p_Audit_Year

where Org_Hier_ID=p_Org_Hier_ID;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertupdateBranchAuditorMapping` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertupdateBranchAuditorMapping`(
p_Flag char(1),
p_Branch_Allocation_ID int ,
p_Org_Hier_ID int ,
p_Auditor_ID int ,
p_Financial_Year datetime,
p_Is_Active bit,
p_UpdatedByLogin_ID int,
p_Allocation_Date datetime
)
begin
if(p_Flag = 'I') then
insert into branch_auditor_mapping
(
Branch_Allocation_ID,
Org_Hier_ID,
Auditor_ID,
Financial_Year,
Is_Active,
UpdatedByLogin_ID,
Allocation_Date
)
values
(
p_Branch_Allocation_ID,
p_Org_Hier_ID,
p_Auditor_ID,
p_Financial_Year,
p_Is_Active,
p_UpdatedByLogin_ID,
p_Allocation_Date
);
else
update branch_auditor_mapping set
Branch_Allocation_ID=p_Branch_Allocation_ID,
Org_Hier_ID=p_Org_Hier_ID,
Auditor_ID=p_Auditor_ID,
Financial_Year=p_Financial_Year,
Is_Active=p_Is_Active,
UpdatedByLogin_ID=p_UpdatedByLogin_ID,
Allocation_Date=p_Allocation_Date
where Branch_Allocation_ID=p_Branch_Allocation_ID;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertupdateBranchLocation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertupdateBranchLocation`(
p_Flag char(1),
p_Location_ID int,
p_Location_Name varchar(75),
p_Address varchar(450), 
p_Country_ID int, 
p_State_ID int, 
p_City_ID int, 
p_Postal_Code int,
p_Branch_Coordinates1 varchar (100),
p_Branch_Coordinates2 varchar (100),
p_Branch_CoordinateURL varchar (100),
p_Org_Hier_ID int
)
begin
if(p_Flag = 'I')then
insert into branch_location
(
Location_ID,
Location_Name,
Address,
Country_ID,
State_ID,
City_ID,
Postal_Code,
Branch_Coordinates1,
Branch_Coordinates2,
Branch_CoordinateURL,
Org_Hier_ID
)
values
(
p_Location_ID,
p_Location_Name,
p_Address,
p_Country_ID,
p_State_ID,
p_City_ID,
p_Postal_Code,
p_Branch_Coordinates1,
p_Branch_Coordinates2,
p_Branch_CoordinateURL,
p_Org_Hier_ID
);
select last_insert_id();
else
update branch_location set
Location_Name=p_Location_Name,
Address=p_Address,
Country_ID=p_Country_ID,
State_ID=p_State_ID,
City_ID=p_City_ID,
Postal_Code=p_Postal_Code,
Branch_Coordinates1= p_Branch_Coordinates1,
Branch_Coordinates2=p_Branch_Coordinates2,
Branch_CoordinateURL= p_Branch_CoordinateURL,
Org_Hier_ID=p_Org_Hier_ID
where Location_ID=p_Location_ID;
select  row_count();
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertupdateCompanyDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertupdateCompanyDetails`(
p_Flag char (1),
p_Company_Details_ID int ,
p_Org_Hier_ID int ,
p_Formal_Name varchar(45),
p_Calender_StartDate datetime,
p_Calender_EndDate datetime,
p_Auditing_Frequency varchar(45),
p_Website varchar(45),
p_Company_Email_ID varchar(45),
p_Company_ContactNumber1 varchar(45),
p_Company_ContactNumber2 varchar(45),
p_Industry_Type_ID int,
p_Is_Active bit
)
begin
if(p_Flag ='I') then
insert into company_details
(
Org_Hier_ID,
Formal_Name, 
Calender_StartDate, 
Calender_EndDate, 
Auditing_Frequency, 
Website, 
Company_Email_ID,
Company_ContactNumber1,
Company_ContactNumber2,
Industry_Type_ID 
)
values
(
p_Org_Hier_ID,
p_Formal_Name, 
p_Calender_StartDate, 
p_Calender_EndDate, 
p_Auditing_Frequency, 
p_Website, 
p_Company_Email_ID,
p_Company_ContactNumber1,
p_Company_ContactNumber2,
p_Industry_Type_ID 
);
select last_insert_id();
else 
update company_details set
Company_Details_ID=p_Company_Details_ID,
Org_Hier_ID=p_Org_Hier_ID,
Formal_Name=p_Formal_Name,
Calender_StartDate= p_Calender_StartDate, 
Calender_EndDate=p_Calender_EndDate,
Auditing_Frequency= p_Auditing_Frequency,
Website= p_Website,
Company_Email_ID= p_Company_Email_ID,
Company_ContactNumber1=p_Company_ContactNumber1,
Company_ContactNumber2=p_Company_ContactNumber2,
Industry_Type_ID = p_Industry_Type_ID 

where Company_Details_ID=p_Company_Details_ID;
select row_count();
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertupdateComplianceAudit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertupdateComplianceAudit`(
p_flag char(1),
p_Compliance_Audit_ID int(11) , 
p_Xref_Comp_Type_Map_ID int(11), 
p_Org_Hier_ID int(11) ,
p_Auditor_ID int(11) ,
p_Audit_Followup_Date datetime ,
p_Audit_Remarks varchar(1000) ,
p_Is_Active bit(1) ,
p_Version int(11) ,
p_Compliance_Status varchar(100) ,
p_Applicability varchar(10) ,
p_Start_Date datetime ,
p_End_Date datetime ,
p_Vendor_ID int(11) ,
p_Risk_Category varchar(10) ,
p_Evidences varchar(1000),
p_Periodicity varchar(45)
)
Begin
if(p_flag = 'I') then
insert into compliance_audit
(
Xref_Comp_Type_Map_ID,
Org_Hier_ID,
Auditor_ID,
Audit_Date,
Audit_Followup_Date,
Audit_Remarks,
Is_Active,
Version,
Compliance_Status,
Applicability, 
Start_Date, 
End_Date, 
Vendor_ID, 
Risk_Category, 
Evidences,
Periodicity
)
values
(
p_Xref_Comp_Type_Map_ID,
p_Org_Hier_ID,
p_Auditor_ID,
Now(),
p_Audit_Followup_Date,
p_Audit_Remarks,
p_Is_Active,
p_Version,
p_Compliance_Status,
p_Applicability, 
p_Start_Date, 
p_End_Date, 
p_Vendor_ID, 
p_Risk_Category, 
p_Evidences,
p_Periodicity
);
else
INSERT INTO Compliance_Audit_AuditTrail
(
select
Xref_Comp_Type_Map_ID,
Org_Hier_ID,
Auditor_ID,
Audit_Date,
Audit_Followup_Date,
Audit_Remarks,
Is_Active,
Version,
Compliance_Status,
Applicability, 
Start_Date, 
End_Date, 
Vendor_ID, 
Risk_Category, 
Evidences,
"update" As 'Action_Type'
from compliance_audit Where Compliance_Audit_ID = p_Compliance_Audit_ID);
update compliance_audit set 
Xref_Comp_Type_Map_ID=p_Xref_Comp_Type_Map_ID, 
Org_Hier_ID=p_Org_Hier_ID,
Auditor_ID=p_Auditor_ID,
Audit_Date=Now(),
Audit_Followup_Date=p_Audit_Followup_Date,
Audit_Remarks=p_Audit_Remarks,
Is_Active=p_Is_Active,
Version=p_Version,
Compliance_Status=p_Compliance_Status,
Applicability= p_Applicability,
Start_Date= p_Start_Date,
End_Date= p_End_Date,
Vendor_ID= p_Vendor_ID,
Risk_Category= p_Risk_Category,
Evidences=p_Evidences
where Compliance_Audit_ID= p_Compliance_Audit_ID;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertupdateComplianceBranchMapping` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertupdateComplianceBranchMapping`(
p_Org_Hier_ID int ,
p_Compliance_ID int ,
p_Is_Active bit,
p_UpdatedByLogin_ID int,
p_Vendor_Id int,
p_Compliancetypeid int
)
begin
DECLARE p_xref_comp_type_map_Id int;
set p_xref_comp_type_map_Id=(Select Xref_Comp_Type_Map_ID from xref_comp_type_mapping where Compliance_Xref_ID=p_Compliance_ID and Compliance_Type_ID=p_Compliancetypeid);
insert into compliance_branch_mapping
(
Org_Hier_ID,
Xref_Comp_Type_Map_ID,
Is_Active,
UpdatedByLogin_ID,
Allocation_Date,
Vendor_ID
)
values
(
p_Org_Hier_ID,
p_xref_comp_type_map_Id,
p_Is_Active,
p_UpdatedByLogin_ID,
now(),
p_Vendor_Id
);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertupdateComplianceTypeMapping` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertupdateComplianceTypeMapping`(
p_Flag char(1),
p_compliance_type_map_ID int ,
p_Org_Hier_ID int ,
p_Compliance_Type_ID int
)
begin
if(p_Flag = 'I') then
insert into Compliance_Type_mapping
(

Org_Hier_ID,
Compliance_Type_ID
)
values
(

p_Org_Hier_ID,
p_Compliance_Type_ID
);
select last_insert_id();
else
update Compliance_Type_mapping set

Org_Hier_ID=p_Org_Hier_ID,
Compliance_Type_ID=p_Compliance_Type_ID
where compliance_type_map_ID=p_compliance_type_map_ID;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertupdateComplianceTypeWithIndustry` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertupdateComplianceTypeWithIndustry`(
p_Flag char(1),
p_Compliance_Type_ID int,
p_Compliance_Type_Name varchar(75),
p_Industry_Type_ID int, 
p_Country_ID int, 
p_Audit_Frequency varchar(50),
p_Start_Date date,
p_End_Date date

)
begin
if(p_Flag = 'I')then
insert into compliance_type
(
Compliance_Type_ID,
Compliance_Type_Name ,
Industry_Type_ID, 
Country_ID,
Audit_Frequency ,
Start_Date ,
End_Date
)
values
(
p_Compliance_Type_ID,
p_Compliance_Type_Name ,
p_Industry_Type_ID, 
p_Country_ID,
p_Audit_Frequency ,
p_Start_Date ,
p_End_Date
);
select last_insert_id();
else
update compliance_type set
Compliance_Type_ID=p_Compliance_Type_ID,
Compliance_Type_Name=p_Compliance_Type_Name ,
Industry_Type_ID=p_Industry_Type_ID, 
Country_ID=p_Country_ID,
Audit_Frequency =p_Audit_Frequency ,
Start_Date =p_Start_Date ,
End_Date=p_End_Date
where Compliance_Type_ID=p_Compliance_Type_ID;
select  row_count();
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertupdateComplianceXref` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertupdateComplianceXref`(
p_Flag char(1),
p_Compliance_Xref_ID int ,
p_Comp_Category varchar(45),
p_Compliance_Title varchar(450),
p_Comp_Description varchar(800),
p_compl_def_consequence varchar(800),
p_Is_Header tinyint,
p_level int(3),
p_Compliance_Parent_ID int,
p_Risk_Category varchar(45),
p_Risk_Description varchar(100),
p_Periodicity varchar(50),
p_Version int(3),
p_Effective_Start_Date datetime,
p_Effective_End_Date datetime,
p_Country_ID int,
p_State_ID int,
p_City_ID int,
p_User_ID int ,
p_Is_Active bit
)
begin
if(p_Flag ='I') then

insert into compliance_xref(Comp_Category,Compliance_Title,Comp_Description,Consequence,Is_Header,level,
Details,Periodicity,Version,Effective_Start_Date,Effective_End_Date,Country_ID ,State_ID ,City_ID ,User_ID, 
Is_Active,Last_Updated_Date,Compliance_Parent_ID )

values(p_Comp_Category,p_Compliance_Title, p_Comp_Description,p_compl_def_consequence,p_Is_Header,p_level,
p_Risk_Description,p_Periodicity,p_Version,p_Effective_Start_Date,p_Effective_End_Date,
p_Country_ID ,p_State_ID ,p_City_ID ,p_User_ID,p_Is_Active,Now(),p_Compliance_Parent_ID );
select last_insert_id();
else
update compliance_xref set
Compliance_Title=p_Compliance_Title, 
Comp_Description=p_Comp_Description,
Consequence=p_compl_def_consequence,
Details=p_Risk_Description,
Periodicity=p_Periodicity,
Version=p_Version,
Effective_Start_Date=p_Effective_Start_Date,
Effective_End_Date=p_Effective_End_Date,
Country_ID=p_Country_ID ,
State_ID=p_State_ID ,
City_ID=p_City_ID ,
Last_Updated_Date=Now(),
User_ID=p_User_ID, 
Is_Active=p_Is_Active
where Compliance_Xref_ID=p_Compliance_Xref_ID;
select row_count();
select row_count();
end if;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertupdateOrganizationHier` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertupdateOrganizationHier`(
 p_Flag char(1),
 p_Org_Hier_ID int,
 p_Company_Name varchar(45),
 p_Company_Code int,
 p_Parent_Company_ID int,
 p_Description varchar(1000),
 p_level int,
 p_Is_Leaf tinyint,
 p_Type varchar(50),
 p_Last_Updated_Date datetime,
 p_logo varchar(100),
 p_User_ID int,
 p_Is_Active bit,
 p_Is_Delete bit,
 p_Is_Vendor bit
)
begin
if(p_Flag = 'I')then
insert into org_hier
(
Company_Name,
Company_Code,
Parent_Company_ID,
Description,
level,
Is_Leaf, 
Type,
Last_Updated_Date,
logo,
User_ID, 
Is_Active,
Is_Delete,
Is_Vendor)
values
(
p_Company_Name,
p_Company_Code, 
p_Parent_Company_ID, 
p_Description, 
p_level,
p_Is_Leaf,
p_Type,
now(),
p_logo,
p_User_ID,
p_Is_Active,
p_Is_Delete,
p_Is_Vendor);
select last_insert_id();
else
update org_hier
set
org_hier.Org_Hier_ID=p_Org_Hier_ID,
Company_Name=p_Company_Name,
Company_Code=p_Company_Code,
Parent_Company_ID=p_Parent_Company_ID,
Description=p_Description,
level=p_level,
Is_Leaf=p_Is_Leaf, 
Type = p_Type,
Last_Updated_Date=now(),
 logo= p_logo,
User_ID=p_User_ID,
Is_Active=p_Is_Active,
Is_Delete = p_Is_Delete,
Is_Vendor = p_Is_Vendor
where org_hier.Org_Hier_ID=p_Org_Hier_ID ;
select row_count();
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertupdateRole` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertupdateRole`(p_flag char(1),p_Role_ID int,p_Role_Name varchar(45),p_Is_Active bit,p_Is_Group_Role bit)
begin
if(p_flag='I')
then
INSERT INTO `compliancedb`.`role`
(`Role_Name`,
`Is_Active`,
`Is_Group_Role`)
VALUES
(p_Role_Name,p_Is_Active,p_Is_Group_Role);
select last_insert_id();
else
UPDATE `compliancedb`.`role`
SET
`Role_Name` = p_Role_Name,
`Is_Active` = p_Is_Active,
`Is_Group_Role` = p_Is_Group_Role
WHERE `Role_ID` = p_Role_ID ;
select last_insert_id();
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertupdateUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertupdateUser`(
p_flag char(1),
p_User_ID int,
p_User_Password varchar(10),
p_First_Name varchar(45),
p_Middle_Name varchar(45),
p_Last_Name varchar(45),
p_Email_ID varchar(100),
p_Contact_Number varchar(50),
p_Gender varchar(45),
p_Is_Active bit,
p_Photo varchar(100),
p_compnay_Id int
)
begin
if(p_flag='I')
then
if exists(select Email_ID from `user` where Email_ID=p_Email_ID)
then
select "EXISTS";
else
INSERT INTO `user`(`User_ID`,
`User_Password`,
`First_Name`,
`Middle_Name`,
`Last_Name`,
`Email_ID`,
`Contact_Number`,
`Gender`,
`Is_Active`,
`Last_Login`,
`Photo`,
`Company_ID`)
VALUES(p_User_ID,p_User_Password,p_First_Name,p_Middle_Name,p_Last_Name,p_Email_ID,
p_Contact_Number,p_Gender,p_Is_Active,now(),p_Photo,p_compnay_Id);
select last_insert_id();
end if;
else
UPDATE `user`
SET
`First_Name` = p_First_Name,
`Middle_Name` = p_Middle_Name,
`Last_Name` = p_Last_Name,
`Contact_Number` = p_Contact_Number,
`Is_Active` = p_Is_Active,
`Last_Login` = now(),
`Photo`=p_Photo
WHERE `User_ID` = p_User_ID;
select row_count();
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertupdateUserGroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertupdateUserGroup`(p_flag char(1),p_User_Group_ID int,p_User_Group_Name varchar(45),
p_User_Group_Description varchar(45),p_Role_ID int,p_Is_Active bit)
begin
if(p_flag='I')
then
INSERT INTO `compliancedb`.`user_group`
(`User_Group_Name`,
`User_Group_Description`,
`Role_ID`,
`Is_Active`)
VALUES
(p_User_Group_Name,p_User_Group_Description,p_Role_ID,p_Is_Active);
else
UPDATE `compliancedb`.`user_group`
SET
`User_Group_Name` = p_User_Group_Name,
`User_Group_Description` = p_User_Group_Description,
`Role_ID` = p_Role_ID
WHERE `User_Group_ID` = p_User_Group_ID;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertupdateVendorForBranch` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertupdateVendorForBranch`(
p_Flag char(1),
p_Vendor_Branch_ID int,
p_Vendor_ID int,
p_Branch_ID int,
p_Start_Date datetime,
p_End_Date datetime,
p_Is_Active bit 
)
begin
if(p_Flag = 'I')then
insert into vendor_branch_mapping
(
Vendor_Branch_ID ,
Vendor_ID ,
Branch_ID,
Start_Date,
End_Date,
Is_Active
)
values
(
p_Vendor_Branch_ID ,
p_Vendor_ID ,
p_Branch_ID,
p_Start_Date,
p_End_Date ,
p_Is_Active 
);
select last_insert_id();
else
update vendor_branch_mapping set
Vendor_ID= p_Vendor_ID ,
Branch_ID =p_Branch_ID,
Start_Date=p_Start_Date,
End_Date=p_End_Date ,
Is_Active=p_Is_Active 
where Vendor_Branch_ID =p_Vendor_Branch_ID;
select last_insert_id();
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertupdate_custom_xref` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertupdate_custom_xref`(
p_Custom_Xref_ID int(11), 
p_Comp_Category varchar(50) ,
p_Comp_Description varchar(50), 
p_Is_Header bit(1), 
p_Level int(11), 
p_Comp_Order int(11), 
p_Periodicity varchar(50),
p_Is_Best_Practice bit(1), 
p_Version int(11),
p_Effective_Start_Date datetime,
p_Effective_End_Date datetime,
p_Country_ID int(11),
p_State_ID int(11),
p_City_ID int(11),
p_User_ID int(11),
p_Is_Active bit(1), 
p_Compliance_Title varchar(50),
p_Compliance_Parent_ID int(11),
p_Comp_def_consequence varchar(1000)
)
BEGIN
INSERT INTO `compliancedb`.`custom_xref`
(`Custom_Xref_ID`,
`Comp_Category`,
`Comp_Description`,
`Is_Header`,
`Level`,
`Comp_Order`,
`Periodicity`,
`Is_Best_Practice`,
`Version`,
`Effective_Start_Date`,
`Effective_End_Date`,
`Country_ID`,
`State_ID`,
`City_ID`,
`Last_Updated_Date`,
`User_ID`,
`Is_Active`,
`Compliance_Title`,
`Compliance_Parent_ID`,
`Comp_def_consequence`)
VALUES
(p_Custom_Xref_ID, 
p_Comp_Category ,
p_Comp_Description, 
p_Is_Header , 
p_Level , 
p_Comp_Order , 
p_Periodicity ,
p_Is_Best_Practice , 
p_Version ,
p_Effective_Start_Date ,
p_Effective_End_Date ,
p_Country_ID ,
p_State_ID ,
p_City_ID ,
now() ,
p_User_ID ,
p_Is_Active , 
p_Compliance_Title ,
p_Compliance_Parent_ID ,
p_Comp_def_consequence 
);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertUserGroupMembers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertUserGroupMembers`(p_User_ID int,p_User_Group_ID int)
begin
INSERT INTO `compliancedb`.`user_group_members`
(`User_ID`,
`User_Group_ID`)
VALUES
(p_User_ID,p_User_Group_ID);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertUserRole` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertUserRole`(p_Role_ID int,p_User_ID int)
begin
INSERT INTO `compliancedb`.`user_role_map`
(`Role_ID`,
`User_ID`)
VALUES
(p_Role_ID,p_User_ID);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_update_Custom_audit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_update_Custom_audit`(
p_Custom_Audit_ID int(11), 
p_Org_Hier_ID int(11) ,
p_Auditor_ID int(11) ,
p_Audit_Followup_Date datetime, 
p_Audit_Remarks varchar(1000) ,
p_Is_Active bit(1) ,
p_Version int(11) ,
p_Compliance_Status varchar(100) ,
p_Applicability varchar(10) ,
p_Start_Date datetime ,
p_End_Date datetime ,
p_Risk_Category varchar(10) ,
p_Vendor_ID int(11) ,
p_Evidences varchar(1000),
p_Custom_Xref_ID int(11)
)
BEGIN
if(p_Custom_Audit_ID=0)
then
INSERT INTO `compliancedb`.`custom_audit`
(
`Org_Hier_ID`,
`Auditor_ID`,
`Audit_Date`,
`Audit_Followup_Date`,
`Audit_Remarks`,
`Is_Active`,
`Version`,
`Compliance_Status`,
`Applicability`,
`Start_Date`,
`End_Date`,
`Risk_Category`,
`Vendor_ID`,
`Evidences`,
`Custom_Xref_ID`)
VALUES
(
p_Org_Hier_ID,
p_Auditor_ID,
now(),
p_Audit_Followup_Date,
p_Audit_Remarks,
p_Is_Active,
p_Version,
p_Compliance_Status,
p_Applicability,
p_Start_Date,
p_End_Date,
p_Risk_Category,
p_Vendor_ID,
p_Evidences,
p_Custom_Xref_ID 
);
else
UPDATE `compliancedb`.`custom_audit`
SET
`Org_Hier_ID` = p_Org_Hier_ID,
`Auditor_ID` = p_Auditor_ID,
`Audit_Date` = p_Audit_Date,
`Audit_Followup_Date` = p_Audit_Followup_Date,
`Audit_Remarks` = p_Audit_Remarks,
`Is_Active` = p_Is_Active,
`Version` = p_Version,
`Compliance_Status` = p_Compliance_Status,
`Applicability` =p_Applicability,
`Start_Date` = p_Start_Date,
`End_Date` = p_End_Date,
`Risk_Category` = p_Risk_Category,
`Vendor_ID` = p_Vendor_ID,
`Evidences` = p_Evidences
WHERE `Custom_Audit_ID` = p_Custom_Audit_ID;


end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_update_custom_xref` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_update_custom_xref`(
p_Custom_Xref_ID int(11) ,
p_Comp_Category varchar(50) ,
p_Comp_Description varchar(50) ,
p_Is_Header bit(1) ,
p_Level int(11) ,
p_Comp_Order int(11) ,
p_Periodicity varchar(50) ,
p_Is_Best_Practice bit(1) ,
p_Version int(11) ,
p_Effective_Start_Date datetime ,
p_Effective_End_Date datetime ,
p_Country_ID int(11) ,
p_State_ID int(11) ,
p_City_ID int(11) ,
p_User_ID int(11) ,
p_Is_Active bit(1) ,
p_Compliance_Title varchar(50) ,
p_Compliance_Parent_ID int(11) ,
p_Comp_def_consequence varchar(1000) ,
p_Compliance_Type_ID int(11)
)
BEGIN
if(p_Custom_Xref_ID=0)
then
INSERT INTO `compliancedb`.`custom_xref`
(
`Comp_Category`,
`Comp_Description`,
`Is_Header`,
`Level`,
`Comp_Order`,
`Periodicity`,
`Is_Best_Practice`,
`Version`,
`Effective_Start_Date`,
`Effective_End_Date`,
`Country_ID`,
`State_ID`,
`City_ID`,
`Last_Updated_Date`,
`User_ID`,
`Is_Active`,
`Compliance_Title`,
`Compliance_Parent_ID`,
`Comp_def_consequence`,
`Compliance_Type_ID`
)
VALUES
(
p_Custom_Xref_ID,
p_Comp_Category,
p_Comp_Description,
p_Is_Header,
p_Level,
p_Comp_Order,
p_Periodicity,
p_Is_Best_Practice,
p_Version,
p_Effective_Start_Date,
p_Effective_End_Date,
p_Country_ID,
p_State_ID,
p_City_ID,
Now(),
p_User_ID,
p_Is_Active,
p_Compliance_Title,
Compliance_Parent_ID,
p_Comp_def_consequence,
p_Compliance_Type_ID
);
else
UPDATE `compliancedb`.`custom_xref`
SET
`Comp_Category` = p_Comp_Category,
`Comp_Description` = p_Comp_Description,
`Is_Header` = p_Is_Header,
`Level` = p_Level,
`Comp_Order` = p_Comp_Order,
`Periodicity` = p_Periodicity,
`Is_Best_Practice` = p_Is_Best_Practice,
`Version` = p_Version,
`Effective_Start_Date` = p_Effective_Start_Date,
`Effective_End_Date` = p_Effective_End_Date,
`Country_ID` = p_Country_ID,
`State_ID` = p_State_ID,
`City_ID` = p_City_ID,
`Last_Updated_Date` = p_Last_Updated_Date,
`User_ID` = p_User_ID,
`Is_Active` = p_Is_Active,
`Compliance_Title` = p_Compliance_Title,
`Compliance_Parent_ID` = p_Compliance_Parent_ID,
`Comp_def_consequence` = p_Comp_def_consequence
WHERE `Custom_Xref_ID` = p_Custom_Xref_ID;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_User_Menu_Map` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_User_Menu_Map`(p_UserGroup_Id int,p_Menu_Id int)
begin
INSERT INTO `compliancedb`.`usergroup_menu_map`
(`User_Group_ID`,
`Menu_ID`)
VALUES
(p_UserGroup_Id,p_Menu_Id);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_updatePassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updatePassword`(
p_User_ID int,
p_Email_ID varchar(100),
p_User_Password varchar(10)
)
begin
update user set User_Password = p_User_Password where User_ID = p_User_ID;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_compliance_audit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_compliance_audit`(
p_Compliance_Audit_ID int(11) , 
p_Version int(11) ,
p_Org_Hier_ID int(11) ,
p_Auditor_ID int(11) ,
p_Vendor_ID int(11) ,
p_Start_Date datetime ,
p_End_Date datetime ,
p_Audit_Remarks varchar(1000),
p_Is_Active bit
)
BEGIN
UPDATE `compliancedb`.`compliance_audit`
SET
`Version` = 1,
`Audit_Date`=now()
WHERE `Compliance_Audit_ID` = p_Compliance_Audit_ID;
INSERT INTO `compliancedb`.`compliance_audit`
(
`Org_Hier_ID`,
`Auditor_ID`,
`Audit_Date`,
`Audit_Remarks`,
`Is_Active`,
`Version`,
`Start_Date`,
`End_Date`,
`Vendor_ID`)
VALUES
(
p_Org_Hier_ID,
p_Auditor_ID,
NoW(),
p_Audit_Remarks,
p_Is_Active,
p_Version,
p_Start_Date,
p_End_Date,
p_Vendor_ID
);
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

-- Dump completed on 2018-11-04  1:49:25
