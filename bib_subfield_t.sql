/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib_subfield_t` (
  `subfield_id` int(11) NOT NULL AUTO_INCREMENT,
  `dfield_id` int(11) DEFAULT NULL,
  `code` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`subfield_id`),
  KEY `subfield_dfield_idx` (`dfield_id`),
  KEY `subfield_code_idx` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=61023795 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
