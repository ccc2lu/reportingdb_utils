/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib_leader_t` (
  `leader_id` int(11) NOT NULL AUTO_INCREMENT,
  `bib_id` int(11) DEFAULT NULL,
  `reclength` int(5) DEFAULT NULL,
  `recstatus` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rectype` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `biblevel` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controltype` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charcoding` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `indcount` int(2) DEFAULT NULL,
  `codecount` int(2) DEFAULT NULL,
  `baseaddr` int(5) DEFAULT NULL,
  `encodinglevel` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `catform` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multresreclevel` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`leader_id`),
  KEY `bib_leader_idx` (`bib_id`),
  KEY `leader_status_idx` (`recstatus`),
  KEY `leader_type_idx` (`rectype`),
  KEY `leader_level_idx` (`biblevel`),
  KEY `leader_controltype_idx` (`controltype`),
  KEY `leader_enclevel_idx` (`encodinglevel`),
  KEY `leader_catform_idx` (`catform`),
  KEY `leader_multresreclevel_idx` (`multresreclevel`)
) ENGINE=InnoDB AUTO_INCREMENT=1132235 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
