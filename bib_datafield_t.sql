/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib_datafield_t` (
  `dfield_id` int(11) NOT NULL AUTO_INCREMENT,
  `bib_id` int(11) DEFAULT NULL,
  `tag` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind1` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind2` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`dfield_id`),
  KEY `dfield_bib_idx` (`bib_id`),
  KEY `dfield_tag_idx` (`tag`)
) ENGINE=InnoDB AUTO_INCREMENT=25650396 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
