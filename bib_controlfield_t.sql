/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib_controlfield_t` (
  `cfield_id` int(11) NOT NULL AUTO_INCREMENT,
  `bib_id` int(11) DEFAULT NULL,
  `tag` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`cfield_id`),
  KEY `cfield_bib_idx` (`bib_id`),
  KEY `cfield_tag_idx` (`tag`)
) ENGINE=InnoDB AUTO_INCREMENT=5285988 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
