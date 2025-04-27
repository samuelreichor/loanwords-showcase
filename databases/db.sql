-- MySQL dump 10.13  Distrib 8.0.40, for Linux (aarch64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int NOT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `addressLine3` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_jkxncslgnfdkkzdgrlrbfwqntjcjjfmfelmx` (`primaryOwnerId`),
  CONSTRAINT `fk_jkxncslgnfdkkzdgrlrbfwqntjcjjfmfelmx` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nmuphkijjtxghnurnsdeliofkelnocnfxovw` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `pluginId` int DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_lcyztxgxplvboagijrskzfwmkycvtayowlqc` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_fmpjoiowsrmcmybsjcewpcgaogzedfzqqxqf` (`dateRead`),
  KEY `fk_svcmflrjyxnazsqshckbxmqtrvqbdejngdpi` (`pluginId`),
  CONSTRAINT `fk_nboetistowgbicdfhwvusfzfuvpxzjtfkuhg` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_svcmflrjyxnazsqshckbxmqtrvqbdejngdpi` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assetindexdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sessionId` int NOT NULL,
  `volumeId` int NOT NULL,
  `uri` text,
  `size` bigint unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT '0',
  `recordId` int DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT '0',
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jibhwpadhomqwrpaogzldpvaxxmqfpzvddiu` (`sessionId`,`volumeId`),
  KEY `idx_vuwkxlxvlfabuqosfyliunqwrhkevftqjkqu` (`volumeId`),
  CONSTRAINT `fk_qdlpetjhyhjkpozqbryksgdhbmwpayvfcciv` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ydhoglxqwduvxcdidlbaddtxusxcyhoqrpjq` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexingsessions`
--

DROP TABLE IF EXISTS `assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assetindexingsessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text,
  `totalEntries` int DEFAULT NULL,
  `processedEntries` int NOT NULL DEFAULT '0',
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `listEmptyFolders` tinyint(1) DEFAULT '0',
  `isCli` tinyint(1) DEFAULT '0',
  `actionRequired` tinyint(1) DEFAULT '0',
  `processIfRootEmpty` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets` (
  `id` int NOT NULL,
  `volumeId` int DEFAULT NULL,
  `folderId` int NOT NULL,
  `uploaderId` int DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text,
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `size` bigint unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_qbkcjkycbasvesjzcmpefyftyfdryynjdhtr` (`filename`,`folderId`),
  KEY `idx_vgjewccgdjttfdznqkqkbangqawoepukdapf` (`folderId`),
  KEY `idx_czrfaidoiyvlayafltrdcwctcqwybkmnjlba` (`volumeId`),
  KEY `fk_eamtuleqnlnewclbwniszlbrxdfsdtalaffe` (`uploaderId`),
  CONSTRAINT `fk_eamtuleqnlnewclbwniszlbrxdfsdtalaffe` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_eatlxbuazsabqqdnwhjiazpaxhrpagmqkdxt` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tsdpomkqstenhskvlqulsxjoclizyicphayw` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wkkjtrxbjnbynnlccyimysapgfrwzxhidtjx` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets_sites`
--

DROP TABLE IF EXISTS `assets_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets_sites` (
  `assetId` int NOT NULL,
  `siteId` int NOT NULL,
  `alt` text,
  PRIMARY KEY (`assetId`,`siteId`),
  KEY `fk_umtzpwxycixisymlentxnorqktvnyqrqxibr` (`siteId`),
  CONSTRAINT `fk_kdrzrpfdaupzjbnsnkxllpwtxwnuhlfxqlen` FOREIGN KEY (`assetId`) REFERENCES `assets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_umtzpwxycixisymlentxnorqktvnyqrqxibr` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `authenticator`
--

DROP TABLE IF EXISTS `authenticator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authenticator` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `auth2faSecret` varchar(255) DEFAULT NULL,
  `oldTimestamp` int unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_qliewullzxncjvqsnzhvwhreepdlqknyyukr` (`userId`),
  CONSTRAINT `fk_qliewullzxncjvqsnzhvwhreepdlqknyyukr` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bulkopevents`
--

DROP TABLE IF EXISTS `bulkopevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bulkopevents` (
  `key` char(10) NOT NULL,
  `senderClass` varchar(255) NOT NULL,
  `eventName` varchar(255) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`key`,`senderClass`,`eventName`),
  KEY `idx_omimwecolagcdfbejlsmuybxehouebwdueik` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ijkjjcndhvalnbftvftvgpsveywboimxyzyn` (`groupId`),
  KEY `fk_hqarbntxojaytvdjekbcjstbnqiygzdluucz` (`parentId`),
  CONSTRAINT `fk_hqarbntxojaytvdjekbcjstbnqiygzdluucz` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_ngyxtqkhfdtpnrvfblxevtqrliyzzbaboybj` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zsuwgdyxyprymhhjwpvrbbcbuzudasyqhhuh` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorygroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tpxwqghzhyirywkhsddyyqigljlgtslleazh` (`name`),
  KEY `idx_vjoszyldsvgxqtgcmxforgmbgpyiyuaanhsd` (`handle`),
  KEY `idx_sfxuatxngswkyrvdzkjgbaqjzrxtderjovic` (`structureId`),
  KEY `idx_trunexqfgyrzaknwqfsuxnjlhtajcmvtnizq` (`fieldLayoutId`),
  KEY `idx_qpsqwokxqcfpjwfmguyvsbdxuxhghtwwibwn` (`dateDeleted`),
  CONSTRAINT `fk_sekonbdwjhmutepmqnpyzakvfkzreggajyue` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_ypcgxbhbicudaunxflqkonqygxkdmlpnwytn` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorygroups_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ewbirwpwwtnuzabjmpaidemeussossnqzxed` (`groupId`,`siteId`),
  KEY `idx_mktsnorajjbkykvweziypewypikrdsqjvrcc` (`siteId`),
  CONSTRAINT `fk_fyaxbqepkrqlawgklcsxroibcemhsikdlcal` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tvapdsvvzxvadkrhwrbwwmgovdumxsvmqjsg` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changedattributes` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_vyopomeginejzrdqzssqwpncmlfdamzkiche` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_jjnymqjzpigtpcbwjrvbdmvhzfghmixpncgd` (`siteId`),
  KEY `fk_tgkfvpeqeutmbgstbfhodyblpsnkehdijyzt` (`userId`),
  CONSTRAINT `fk_bkibrwfdvqhkvgwkxcjyeeqhgtkkxplbgdis` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_jjnymqjzpigtpcbwjrvbdmvhzfghmixpncgd` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tgkfvpeqeutmbgstbfhodyblpsnkehdijyzt` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changedfields` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `fieldId` int NOT NULL,
  `layoutElementUid` char(36) NOT NULL DEFAULT '0',
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`,`layoutElementUid`),
  KEY `idx_nuvvrbzfaysxjynevacxtyutenybqizdqjlf` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_lbsinryllfhdogljecfbtvmblvygcqxbazgf` (`siteId`),
  KEY `fk_ptsfcjgtwsqsynqvrrubsaudgswsgazzceip` (`fieldId`),
  KEY `fk_yzipbpnkffoinqruvmvokltthmmkjlgcuymj` (`userId`),
  CONSTRAINT `fk_bexlzxxfjvsiunwwxlcqongujhpwdmcefzru` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_lbsinryllfhdogljecfbtvmblvygcqxbazgf` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ptsfcjgtwsqsynqvrrubsaudgswsgazzceip` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_yzipbpnkffoinqruvmvokltthmmkjlgcuymj` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `craftidtokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_entwjabazsdqncezsaudephutsyrpihnksog` (`userId`),
  CONSTRAINT `fk_entwjabazsdqncezsaudephutsyrpihnksog` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deprecationerrors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint unsigned DEFAULT NULL,
  `message` text,
  `traces` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rkveqlzpcnvpruawxwppjdhnapmfqpoodjyl` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drafts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `creatorId` int DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_dbgdgckgkirnfnctryqfswszeksooblslgps` (`creatorId`,`provisional`),
  KEY `idx_dzlvyxbhqselvbxcxwsvrcqogheinxvlmqku` (`saved`),
  KEY `fk_hgtniguehznedndtkilazrpyhaubneuegioq` (`canonicalId`),
  CONSTRAINT `fk_bipwsrhhzqthuppcfhxmnhcwxxnnkqrhguhi` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_hgtniguehznedndtkilazrpyhaubneuegioq` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elementactivity`
--

DROP TABLE IF EXISTS `elementactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elementactivity` (
  `elementId` int NOT NULL,
  `userId` int NOT NULL,
  `siteId` int NOT NULL,
  `draftId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`elementId`,`userId`,`type`),
  KEY `idx_fbylkdztkgafihjmxmfuxnllenqdrgngnppr` (`elementId`,`timestamp`,`userId`),
  KEY `fk_ucvzlfahqizedcjixxexibcaqgzutgeqyaud` (`userId`),
  KEY `fk_xiobvwfbxlbueorhlfuhyswmpllfvolowgim` (`siteId`),
  KEY `fk_dsbucmulmpmufzyazjqhivyawbkgjpphdlwi` (`draftId`),
  CONSTRAINT `fk_ayyuzzxowonszxpkksusvpvfpybdjvpenbor` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_dsbucmulmpmufzyazjqhivyawbkgjpphdlwi` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ucvzlfahqizedcjixxexibcaqgzutgeqyaud` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xiobvwfbxlbueorhlfuhyswmpllfvolowgim` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `draftId` int DEFAULT NULL,
  `revisionId` int DEFAULT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jvdubgxggfyvdhuclujyesdzhgbjvvcwhbig` (`dateDeleted`),
  KEY `idx_vknioftapmsqvnljwnofawvlwnxjfrostwga` (`fieldLayoutId`),
  KEY `idx_fobvcifdartzhzqdcivrtimjcezsrsvmsbqo` (`type`),
  KEY `idx_jrrvhrdjwmkmyhurxyqkufxayyazdqekictg` (`enabled`),
  KEY `idx_gjdubfqgrlxpxpxszgnmgbownxrnarwnfzht` (`canonicalId`),
  KEY `idx_adwcllepxnwakalnxkbftsuwdfkwkcsfelwa` (`archived`,`dateCreated`),
  KEY `idx_cbtbmoxteqsbfbimncdrxreorghxzfyjntyg` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_ahbtgqiwdimewaozvyvtquhaibjrqkcjljbu` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_ekyfawkqlcqxqpkuyxqytoobfdvrjijchwes` (`draftId`),
  KEY `fk_wbrfpcmraaoojmfkfdmrgojqrhgaswzxrixf` (`revisionId`),
  CONSTRAINT `fk_ekyfawkqlcqxqpkuyxqytoobfdvrjijchwes` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hdxpptupkfchbqnlmvjvuccjmomhbcwgzeyy` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_lqsvtzzbtxolwjkhwsjobgydrdlpdqqxlded` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_wbrfpcmraaoojmfkfdmrgojqrhgaswzxrixf` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_bulkops`
--

DROP TABLE IF EXISTS `elements_bulkops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_bulkops` (
  `elementId` int NOT NULL,
  `key` char(10) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`elementId`,`key`),
  KEY `idx_idmjcuqxzlshufubqoecxumayxryzlkqknov` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_owners`
--

DROP TABLE IF EXISTS `elements_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_owners` (
  `elementId` int NOT NULL,
  `ownerId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`elementId`,`ownerId`),
  KEY `fk_xjrjozerxqadidhzqcsyrjncrzrljwsdascj` (`ownerId`),
  CONSTRAINT `fk_lsnzgdyatmkncwoledzgwqkicspnzqmctshf` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xjrjozerxqadidhzqcsyrjncrzrljwsdascj` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `content` json DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_fxwlnlxopaxgqxbidnzlnbeisdlvguzpvcis` (`elementId`,`siteId`),
  KEY `idx_qdwxjrfwkujixsmbafyrdnevnaqocrwldtjv` (`siteId`),
  KEY `idx_fsawlfpxhalgzxnnwjyoummbvikaasuckdos` (`title`,`siteId`),
  KEY `idx_wjkajhqhmdulxnntxnhtlltgqlsbudvltcua` (`slug`,`siteId`),
  KEY `idx_bzxfkajlwzvkmwepupmijmxfkbitxbxvtmtp` (`enabled`),
  KEY `idx_cnttoxtdfuckbcqcixagsyyjfzujljcighbu` (`uri`,`siteId`),
  CONSTRAINT `fk_eomzbcaqbpdkqwuqjnqlaegzzodpqpaukxde` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_gupyjundpmttqmgvvdonmktqfguozjovfqdo` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entries` (
  `id` int NOT NULL,
  `sectionId` int DEFAULT NULL,
  `parentId` int DEFAULT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `typeId` int NOT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `status` enum('live','pending','expired') NOT NULL DEFAULT 'live',
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `deletedWithSection` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_natyuvyvohqylpcggfeaqlakgmxkuswvjdey` (`postDate`),
  KEY `idx_dhehvdfopwugvotegztslhxfazkcmoxtlkaz` (`expiryDate`),
  KEY `idx_qhqtiulnrujtnyyomuvvaahxfbtbqctgorua` (`sectionId`),
  KEY `idx_ydxwoshmsfjbzovejzbzqdrdzkwfagupvvqe` (`typeId`),
  KEY `idx_wagiiltovllvdktiwbosfgsyhkjfsoohdltz` (`primaryOwnerId`),
  KEY `idx_kavrngzkuhvocssvrzymtpqclmihtninntbv` (`fieldId`),
  KEY `fk_edavnpanvicsbjbpdlxcjevwepkjleevdrcw` (`parentId`),
  KEY `idx_ndpxqnwisvqqgzolihszwmwpwkommuxruuxl` (`status`),
  CONSTRAINT `fk_bnscmadwltngrpkymuktsdcqbrdjrmrzvnag` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_cmqlashhdlfefdhrxvfvwrcfqlqqnrubqeul` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_edavnpanvicsbjbpdlxcjevwepkjleevdrcw` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_icpemmzkkupxnqckiizxdnfzgcklxmahifdd` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nmpvreajgrlseihopqnydqoprfrlmznmyrsg` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ztwvizfppjkpuuhyqfrzvoaobjoaczadrqso` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries_authors`
--

DROP TABLE IF EXISTS `entries_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entries_authors` (
  `entryId` int NOT NULL,
  `authorId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`entryId`,`authorId`),
  KEY `idx_heolotvmygwvtctxhgfiutclclpsfxeppppo` (`authorId`),
  KEY `idx_ghpkrzzybvavxqwwljqlxhcfktlwbgexhsci` (`entryId`,`sortOrder`),
  CONSTRAINT `fk_agdpvxholbqkzdmcteaohwnwkhzwdyvftejr` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_dbkobiylifucswaidrmthnjdrsrhfjcuxitm` FOREIGN KEY (`entryId`) REFERENCES `entries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrytypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `titleFormat` varchar(255) DEFAULT NULL,
  `showSlugField` tinyint(1) DEFAULT '1',
  `slugTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `slugTranslationKeyFormat` text,
  `showStatusField` tinyint(1) DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tfjsqvohtmtnbjnybhcdcmoqykkjvnmurvxc` (`fieldLayoutId`),
  KEY `idx_yfiaiowpfnjftwotaprybusxsyjmrmnxzexx` (`dateDeleted`),
  CONSTRAINT `fk_jnfgxvkdheecprrmpthqljvlwlfftbisfwqf` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldlayouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `config` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lwydlxadxgfunokjlsuvzrandfigpxkrwdle` (`dateDeleted`),
  KEY `idx_itxxccxvwvxuccebhwfhpsmqqvaonytrwhol` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_aqygdecauqsrszfnjqqxoxmjpghzzghajdgj` (`handle`,`context`),
  KEY `idx_boquijdfwtiycmfjhmnggfikbrpbembowerj` (`context`),
  KEY `idx_xybqfhhglxbhenvmhzokzgzdamqfuldvgdmj` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `globalsets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vmlpebugxauzbqqdgmfkarkdxxgdyxdlgeqs` (`name`),
  KEY `idx_cjtngrowklqodsndxhdlvuwanrlnoksuvjfp` (`handle`),
  KEY `idx_xlgcfbaehvtxblzpexrkaysjfkkkmxifumkc` (`fieldLayoutId`),
  KEY `idx_qptdebdokrfwdtbmriccgwrfmakgewtqeinn` (`sortOrder`),
  CONSTRAINT `fk_lubudfouolqycgdyijnusoozbyqanbiysbok` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qsdvyycahvggnvxhchlhokbffmhxfxdfxbvd` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gqlschemas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` json DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gqltokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uhpzbmhlfgiyudiuasoefrjshfnchqnanevs` (`accessToken`),
  UNIQUE KEY `idx_mmwcfthqpxrivizqnkvvgxbyaoslbcypmhac` (`name`),
  KEY `fk_giilsyiabmmkjtjaukftfwufhesjzygoxgbe` (`schemaId`),
  CONSTRAINT `fk_giilsyiabmmkjtjaukftfwufhesjzygoxgbe` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransformindex`
--

DROP TABLE IF EXISTS `imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagetransformindex` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assetId` int NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_guxmhyihrszjwsqxvqoafoyqcuepmergxfwk` (`assetId`,`transformString`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransforms`
--

DROP TABLE IF EXISTS `imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagetransforms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop','letterbox') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `fill` varchar(11) DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT '1',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_easykhjqvbeqvblyfjwjbvuxlkzsspjsrrje` (`name`),
  KEY `idx_udhtikluousepobfmtcagjmwavongtuvtahe` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `loanwords`
--

DROP TABLE IF EXISTS `loanwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loanwords` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `lang` varchar(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_smijpbiasvnowzpanftwvuyuxsnflwjznydo` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qzfoeyxjpaxrvmozflbyfibltplyyzwviydp` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_zmurqgvwubbohrrjtvdzfrveurxepecbaiwd` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int NOT NULL,
  `ttr` int NOT NULL,
  `delay` int NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int DEFAULT NULL,
  `progress` smallint NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `idx_gjwnchbycfrqbsskyrkuaxcsbjpwccnkusza` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_asbjzyfifrqxvrftbbfuemajiammmipqvbnt` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recoverycodes`
--

DROP TABLE IF EXISTS `recoverycodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recoverycodes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `recoveryCodes` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `sourceId` int NOT NULL,
  `sourceSiteId` int DEFAULT NULL,
  `targetId` int NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wtltyafqzpepttsexxwaxvzjeazxmusviaon` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_ywqlycntscdtcekuwqdslwrrsnpmgioffgvm` (`sourceId`),
  KEY `idx_txlhoerowsjzraebdvumslazgruflawxticd` (`targetId`),
  KEY `idx_ibpqisqvkjwtulmokgcqmtfezxfikslvorms` (`sourceSiteId`),
  CONSTRAINT `fk_asvfxzwmaaaywtjpokkeqgxtfnwpxpotkcrx` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_msczathjkwftjrtmfacfizwjcbxweiviopae` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ndyrinufetycaxifzzbxwsmurprbtglxtdsq` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int NOT NULL,
  `creatorId` int DEFAULT NULL,
  `num` int NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_bncjwzdzibmjmvspbdrfngabeyaowcpkykng` (`canonicalId`,`num`),
  KEY `fk_kbsidopityfqcatsvsgsedrzubznffameowz` (`creatorId`),
  CONSTRAINT `fk_flapfznuxzgmtoqzhrsicxvxkefuwusbesgp` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kbsidopityfqcatsvsgsedrzubznffameowz` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchindex` (
  `elementId` int NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int NOT NULL,
  `siteId` int NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_glbzwmwewabqwmdfpgukeomenypvmfanvofe` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindexqueue`
--

DROP TABLE IF EXISTS `searchindexqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchindexqueue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `reserved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ejtmzwzhtrnqumnrrjzlnctmywqjcjntdowy` (`elementId`,`siteId`,`reserved`),
  CONSTRAINT `fk_catxackvnacyjckcmbpujeobutqpmjvvaytr` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindexqueue_fields`
--

DROP TABLE IF EXISTS `searchindexqueue_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchindexqueue_fields` (
  `jobId` int NOT NULL,
  `fieldHandle` varchar(255) NOT NULL,
  PRIMARY KEY (`jobId`,`fieldHandle`),
  UNIQUE KEY `idx_sxktuvogtlnwnxnfqbrqyfieorjcssuosfps` (`jobId`,`fieldHandle`),
  CONSTRAINT `fk_eyzbcbaumtcyahjplbmcmebgfvpavzlerary` FOREIGN KEY (`jobId`) REFERENCES `searchindexqueue` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `maxAuthors` smallint unsigned DEFAULT NULL,
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qjdafigndhimwncjovuwpwoewuvycihfjpza` (`handle`),
  KEY `idx_mlefwijjdsixoaajxydpfqmvurybicthgdjo` (`name`),
  KEY `idx_qfvspfcjapxzicxlqlmjveoxrgcxvxninsgj` (`structureId`),
  KEY `idx_tczereftahhimpfgiqzythzpqqadumfkqxqe` (`dateDeleted`),
  CONSTRAINT `fk_hwjwbpjhvgfbsaraajptvreoxxqsibqgnssp` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_entrytypes`
--

DROP TABLE IF EXISTS `sections_entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections_entrytypes` (
  `sectionId` int NOT NULL,
  `typeId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `handle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sectionId`,`typeId`),
  KEY `fk_txsiujkyyyxnedgmbbjtoaoyaffnovneuhua` (`typeId`),
  CONSTRAINT `fk_bsuipthxkrgjfflfodyztibpckwhpfyzoywq` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_txsiujkyyyxnedgmbbjtoaoyaffnovneuhua` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wcvdopxrsbeipfaxfaxfrjxjcqmrwthjbmpy` (`sectionId`,`siteId`),
  KEY `idx_pgsbdotyvjxkkucuwxciisatuapdlumgtkhg` (`siteId`),
  CONSTRAINT `fk_isqrorxvxjmhbhbtuqyitzluurpfublqabwe` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_qdfjpnxyqtxpsqbpmcmqrkchtdmzbxkwbprm` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gnfszsnkuutjgytwtdureaykpukrmhehddeq` (`uid`),
  KEY `idx_okoskvvztqqqgwwylqdgxbxzycldxlwfyhty` (`token`),
  KEY `idx_oqwgwikjxentryarawuvltguseyqvejwebsu` (`dateUpdated`),
  KEY `idx_bqoiemmhdnbcbvwyhkmvtaoerczihrfouksa` (`userId`),
  CONSTRAINT `fk_mxbieeabycanzwpwbpgkrznclhiaohkhertj` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shunnedmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jwgbghqksrgckihpqqjjgueqhuhlmrdbwyxx` (`userId`,`message`),
  CONSTRAINT `fk_fwqrxtzpmugjwdcenosewdzzyhqsmpxbfbca` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sitegroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fablamtvamxwpxolebsqzuxhtufhpbziqgvl` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jacolgsyctgyxcdooqkiedtrasavbfusvzyj` (`dateDeleted`),
  KEY `idx_ticabedwcjjawtzzvveywmmcedozfkojggeh` (`handle`),
  KEY `idx_kwuigsjkusaohemiqevfohvtajljtrqsiejt` (`sortOrder`),
  KEY `fk_ujrzumuzmsmtxocmaupzfqdnljliucfjqkee` (`groupId`),
  CONSTRAINT `fk_ujrzumuzmsmtxocmaupzfqdnljliucfjqkee` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sso_identities`
--

DROP TABLE IF EXISTS `sso_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sso_identities` (
  `provider` varchar(255) NOT NULL,
  `identityId` varchar(255) NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`provider`,`identityId`,`userId`),
  KEY `fk_yirqchidnnxespdfprowuklpyqteluqyrzqb` (`userId`),
  CONSTRAINT `fk_yirqchidnnxespdfprowuklpyqteluqyrzqb` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structureelements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `elementId` int DEFAULT NULL,
  `root` int unsigned DEFAULT NULL,
  `lft` int unsigned NOT NULL,
  `rgt` int unsigned NOT NULL,
  `level` smallint unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dsgsuewzoaqfvystqxvojoijbaedjmhwckxl` (`structureId`,`elementId`),
  KEY `idx_ncrkhafmytjzhuvpltfkasbxrwcoswwccrxp` (`root`),
  KEY `idx_lvmpryaqxvhwcceyhpwavbjsbefszyjdqxmc` (`lft`),
  KEY `idx_mdwjkbmomgbmvseiysoiwcrxyeauorhnfxov` (`rgt`),
  KEY `idx_kxsnabqwzjfsqlepaolnpnxggyiwpxafauta` (`level`),
  KEY `idx_auewtcgvexwzsjegyvhxejlctbsoxlwprbwq` (`elementId`),
  CONSTRAINT `fk_ibehufgcmjnzfiyhofcwqujdrzkepqaskjak` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xieejippdkfilodswxbnrfxjnkdyzpmjugqo` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `systemmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_fahkztcxoouxwylkrwjswvaraapwozwwmofu` (`key`,`language`),
  KEY `idx_kolesbokudvmzepgigfcxrmktenuvvtdgnav` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taggroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cokzgfeskzfapndhrarjrptmhazvlkkthkqw` (`name`),
  KEY `idx_pjawjfocihbgldymsfymhysntiqjqgqzodvd` (`handle`),
  KEY `idx_eyhhyeqcpdkdaugjbsqipepuycyvurykapwx` (`dateDeleted`),
  KEY `fk_okberzqnhsdordxnsytjufrivyctrjadivic` (`fieldLayoutId`),
  CONSTRAINT `fk_okberzqnhsdordxnsytjufrivyctrjadivic` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_xijhtbvacbdkhwfrxusotxwbyllykmikdimm` (`groupId`),
  CONSTRAINT `fk_nnepqrmetectrimezjeodnndfvuklhhxprek` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_oafrbqzokflpnniohvxcmgmyhshdczubrupg` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint unsigned DEFAULT NULL,
  `usageCount` tinyint unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ewpxofnyxcgunoocmlzzkxfwygvtpskeegsl` (`token`),
  KEY `idx_vvbrbigpuuzakswsmzjpqvkktlfrolgyjzch` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bdyfocgpgusrytgtbodbkulwswuikwdwwngb` (`handle`),
  KEY `idx_zkxddbfmmiuordlixmpdkugadlbxwnmxxjgc` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroups_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_udqscvdysyxdfckxhftnwcjalasgcdhgxuca` (`groupId`,`userId`),
  KEY `idx_czstqeiuidnmzsfjqyfrpdkrzqkiuplbxxqw` (`userId`),
  CONSTRAINT `fk_qjxdixgftlcoknluhlfouyljmzpizbfxfohl` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ttwepprrwntbzqpxybrjpujkqdzwqaxfrzbj` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kdemjizlrepyovusxcjiwhjbcjuabyuraupq` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `groupId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_bntzoyhysoeryyxbukcuoqrbpxkbbazkbvek` (`permissionId`,`groupId`),
  KEY `idx_gkosacvqkpuflalqjnhpnwukkgfpdrexwpnw` (`groupId`),
  CONSTRAINT `fk_ilvjzuyhutvsuzvzmveakawitgfhnobqmwkg` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vzlrwtlfpuyetqqhozlxexhpokwuyyzvzjeg` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uwmzegjehpnluwwaqrbhbyryhnmrwwjvsfoe` (`permissionId`,`userId`),
  KEY `idx_fnhmjmbpfqilakhvtccsjplrvnzsnlwfjrpk` (`userId`),
  CONSTRAINT `fk_llnkvldhztnlvidpgywuxwcbiaqlwoemojge` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_untypyiariycqhijqegqibylevsmqvshrswy` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpreferences` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `preferences` json DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_fgntlddwjtcmyajanhwoxburwsywontwivtk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `photoId` int DEFAULT NULL,
  `affiliatedSiteId` int DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ydgzcnokfybcflosrcwmjuxlvojiweuvevzo` (`active`),
  KEY `idx_twykpoddsvswzkklsgyfljemqshrsvhavfob` (`locked`),
  KEY `idx_oydquohmiwszhiwojlpbuxqfclmozgvndkxa` (`pending`),
  KEY `idx_orcwlnyjluqklpljgbuktmntajtiyulysuyj` (`suspended`),
  KEY `idx_footrpljvjffurdpomvnhtvbtgvwbiwvmlny` (`verificationCode`),
  KEY `idx_vuurdafdulqkwwxwxtayptrqmekdsjpoxmug` (`email`),
  KEY `idx_bxgnugxssmjagqjltrgyhmpxykjcistrekfd` (`username`),
  KEY `fk_pyypkifnnggudmurbmwjqmwlmaojvscadull` (`photoId`),
  KEY `fk_vayapwwbvptztvzlusestkuhkonkynmhsrbp` (`affiliatedSiteId`),
  CONSTRAINT `fk_brfjyagupkhonmxqhbcxpcjqjxhlzxvxdbjw` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pyypkifnnggudmurbmwjqmwlmaojvscadull` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_vayapwwbvptztvzlusestkuhkonkynmhsrbp` FOREIGN KEY (`affiliatedSiteId`) REFERENCES `sites` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volumefolders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentId` int DEFAULT NULL,
  `volumeId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_icfjlosizlrtfadwyfguzhqyijcrureppffn` (`name`,`parentId`,`volumeId`),
  KEY `idx_mlcaezuzkboyjrpgoklmzmfdifpdgkriadmx` (`parentId`),
  KEY `idx_sflmglmkasywysdxkfkvedoafbtaqdyhnrin` (`volumeId`),
  CONSTRAINT `fk_gzwbsomekpignggfktmhkcwueldmgfklralt` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wmdmtsohrndzvyntgtzbiaogmaxisuiqnuzl` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volumes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `subpath` varchar(255) DEFAULT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `altTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `altTranslationKeyFormat` text,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_nfpmxxibxknfuinkkhqswrhauxjuztzngqxj` (`name`),
  KEY `idx_uvpcktlysuenoqkqpayjbyygdhdnjbsobarr` (`handle`),
  KEY `idx_nqgmhbqycbxrefytunftkinwjbtviiqazlia` (`fieldLayoutId`),
  KEY `idx_vnjhenlrahzglnomoxozamlpuwxtvpcsomgk` (`dateDeleted`),
  CONSTRAINT `fk_srnhfavoebtkheptclraqljnzzkkrqkbjjdu` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webauthn`
--

DROP TABLE IF EXISTS `webauthn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webauthn` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `credentialId` varchar(255) DEFAULT NULL,
  `credential` text,
  `credentialName` varchar(255) DEFAULT NULL,
  `dateLastUsed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_yyoayvqfbrmguqlatpxlqntziilxqzewywkf` (`userId`),
  CONSTRAINT `fk_yyoayvqfbrmguqlatpxlqntziilxqzewywkf` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `colspan` tinyint DEFAULT NULL,
  `settings` json DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zrgaxwgiktmexoewvlnkfwzusdrizqasocag` (`userId`),
  CONSTRAINT `fk_wsihsmorizdclosvfqvnitcsbsbhhxgqbowz` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-27 21:44:22
-- MySQL dump 10.13  Distrib 8.0.40, for Linux (aarch64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assetindexingsessions`
--

LOCK TABLES `assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `assetindexingsessions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets_sites`
--

LOCK TABLES `assets_sites` WRITE;
/*!40000 ALTER TABLE `assets_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assets_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `authenticator`
--

LOCK TABLES `authenticator` WRITE;
/*!40000 ALTER TABLE `authenticator` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `authenticator` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `bulkopevents`
--

LOCK TABLES `bulkopevents` WRITE;
/*!40000 ALTER TABLE `bulkopevents` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `bulkopevents` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedattributes` VALUES (1,1,'uri','2025-04-20 08:49:07',0,3),(1,2,'uri','2025-04-20 08:49:07',1,3),(1,3,'uri','2025-04-20 08:49:07',1,3),(1,4,'uri','2025-04-20 08:49:07',1,3),(9,1,'uri','2025-04-20 08:49:17',1,3),(9,2,'uri','2025-04-20 08:49:17',1,3),(9,3,'uri','2025-04-20 08:49:17',0,3),(9,4,'uri','2025-04-20 08:49:16',1,3);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedfields` VALUES (9,1,2,'dae4c745-4baf-4bc5-b0ea-f2929f532b11','2025-04-20 08:52:45',1,3),(9,2,2,'dae4c745-4baf-4bc5-b0ea-f2929f532b11','2025-04-20 08:52:45',1,3),(9,3,2,'dae4c745-4baf-4bc5-b0ea-f2929f532b11','2025-04-20 08:52:45',1,3),(9,4,1,'4f96e89d-4f5e-453d-bf67-2b02d149bebe','2025-04-20 08:52:45',0,3),(9,4,2,'dae4c745-4baf-4bc5-b0ea-f2929f532b11','2025-04-20 08:52:45',0,3);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elementactivity`
--

LOCK TABLES `elementactivity` WRITE;
/*!40000 ALTER TABLE `elementactivity` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elementactivity` VALUES (9,3,4,NULL,'edit','2025-04-20 08:52:39'),(9,3,4,NULL,'save','2025-04-20 08:52:45');
/*!40000 ALTER TABLE `elementactivity` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2025-04-20 08:39:37','2025-04-20 08:49:07',NULL,'2025-04-20 08:49:29',NULL,'f51b1a75-d341-47f1-9147-8072793c1b21'),(2,1,NULL,1,1,'craft\\elements\\Entry',1,0,'2025-04-20 08:39:37','2025-04-20 08:39:37',NULL,NULL,NULL,'98196cb6-bcc8-4cb9-a80b-e53666ef4913'),(3,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2025-04-20 08:39:37','2025-04-20 08:39:37',NULL,NULL,NULL,'c5bea95a-1915-4331-b774-086e22d94b9c'),(4,NULL,NULL,NULL,NULL,'samuelreichor\\loanwords\\elements\\Loanword',1,0,'2025-04-20 08:40:42','2025-04-20 08:53:11',NULL,NULL,NULL,'3650bf9d-45eb-488f-9892-a0a71ae35fac'),(5,NULL,NULL,NULL,NULL,'samuelreichor\\loanwords\\elements\\Loanword',1,0,'2025-04-20 08:41:23','2025-04-20 08:53:21',NULL,NULL,NULL,'c483a6f7-fc01-410a-9479-f674aef15262'),(6,1,NULL,2,1,'craft\\elements\\Entry',1,0,'2025-04-20 08:42:50','2025-04-20 08:42:50',NULL,NULL,NULL,'da47fecf-8bde-4e41-80d5-686f1f7be60e'),(7,1,NULL,3,1,'craft\\elements\\Entry',1,0,'2025-04-20 08:43:09','2025-04-20 08:43:09',NULL,NULL,NULL,'ecb45646-8d73-4ade-b2d6-4c9e3d79ddc1'),(8,1,NULL,4,1,'craft\\elements\\Entry',1,0,'2025-04-20 08:48:12','2025-04-20 08:48:12',NULL,NULL,NULL,'43c7d8be-7622-4d59-8438-07e7964ca2ac'),(9,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2025-04-20 08:48:58','2025-04-20 08:52:45',NULL,NULL,NULL,'3f23d4d8-8376-44ad-a53d-76e6f17ac7c6'),(10,9,NULL,5,1,'craft\\elements\\Entry',1,0,'2025-04-20 08:48:58','2025-04-20 08:48:58',NULL,NULL,NULL,'cd9ecc6b-6ff4-470f-ae85-ee0cc4a1139e'),(11,1,NULL,6,1,'craft\\elements\\Entry',1,0,'2025-04-20 08:49:07','2025-04-20 08:49:07',NULL,NULL,NULL,'e26ca5de-2a07-415a-8ab8-57a71ace8c96'),(12,9,NULL,7,1,'craft\\elements\\Entry',1,0,'2025-04-20 08:49:16','2025-04-20 08:49:17',NULL,NULL,NULL,'afa4dc06-ca75-4f50-baab-69772082b5fb'),(13,9,NULL,8,1,'craft\\elements\\Entry',1,0,'2025-04-20 08:49:17','2025-04-20 08:49:17',NULL,NULL,NULL,'c0fe7c82-6453-4789-a4fd-0405aa5c39b3'),(15,9,NULL,9,1,'craft\\elements\\Entry',1,0,'2025-04-20 08:52:45','2025-04-20 08:52:45',NULL,NULL,NULL,'5147216b-2cee-4bc9-8bd5-4bf2b31d7398'),(16,NULL,NULL,NULL,NULL,'samuelreichor\\loanwords\\elements\\Loanword',1,0,'2025-04-20 08:53:35','2025-04-20 08:53:35',NULL,NULL,NULL,'6f3ac6be-599a-4809-a764-8e9a5d72321d'),(17,NULL,NULL,NULL,NULL,'samuelreichor\\loanwords\\elements\\Loanword',1,0,'2025-04-20 08:54:20','2025-04-20 08:54:20',NULL,NULL,NULL,'2fe0f94f-ffa8-4580-8efa-373cbba64cc2'),(18,NULL,NULL,NULL,NULL,'samuelreichor\\loanwords\\elements\\Loanword',1,0,'2025-04-20 08:54:30','2025-04-20 08:54:30',NULL,NULL,NULL,'a338164f-8b1c-4171-92c6-a8c90ec5628f');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_bulkops`
--

LOCK TABLES `elements_bulkops` WRITE;
/*!40000 ALTER TABLE `elements_bulkops` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `elements_bulkops` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_owners`
--

LOCK TABLES `elements_owners` WRITE;
/*!40000 ALTER TABLE `elements_owners` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `elements_owners` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES (1,1,4,'Home','home',NULL,NULL,1,'2025-04-20 08:39:37','2025-04-20 08:49:07','b4b3c165-84fb-45bf-90e8-7c55a34cb958'),(2,1,1,'Home','home',NULL,NULL,1,'2025-04-20 08:39:37','2025-04-20 08:49:07','d5ae68bd-0219-416b-83df-73e98761cbd5'),(3,1,3,'Home','home',NULL,NULL,1,'2025-04-20 08:39:37','2025-04-20 08:49:07','c0105525-5c23-4f92-a4e3-3f11ef3aebff'),(4,1,2,'Home','home',NULL,NULL,1,'2025-04-20 08:39:37','2025-04-20 08:49:07','a3932dfb-5b82-4cc7-b1f0-208c8a3441ef'),(5,2,4,'Home','home','__home__',NULL,1,'2025-04-20 08:39:37','2025-04-20 08:39:37','9dfe1130-ff62-4e1e-93e6-cc1e5be0073b'),(6,2,1,'Home','home',NULL,NULL,1,'2025-04-20 08:39:37','2025-04-20 08:49:08','ce1639b0-3c6d-4bf7-80d3-20996e32ba43'),(7,2,2,'Home','home',NULL,NULL,1,'2025-04-20 08:39:37','2025-04-20 08:49:08','60c1b8fb-3251-421e-920a-9359e1566c3e'),(8,2,3,'Home','home',NULL,NULL,1,'2025-04-20 08:39:37','2025-04-20 08:49:08','80ee459a-ffe1-4e27-93fb-b031360cc60c'),(9,3,4,NULL,NULL,NULL,NULL,1,'2025-04-20 08:39:37','2025-04-20 08:39:37','4937b887-bb33-4a38-a826-75871bbe963c'),(10,4,4,NULL,NULL,NULL,NULL,1,'2025-04-20 08:40:42','2025-04-20 08:40:42','f9ecaa1b-16c6-4969-b6d2-f6de4bb9bee8'),(11,5,4,NULL,NULL,NULL,NULL,1,'2025-04-20 08:41:23','2025-04-20 08:41:23','952a19ae-cc35-496c-8938-513a4a0759c1'),(12,6,1,'Home','home',NULL,NULL,1,'2025-04-20 08:42:50','2025-04-20 08:49:08','76a555a1-aa5d-4e25-b0e8-11eaf1774d54'),(13,6,2,'Home','home',NULL,NULL,1,'2025-04-20 08:42:50','2025-04-20 08:49:08','ee72aabc-b4fc-4f7e-8909-4c0a1c6d0ec0'),(14,6,3,'Home','home',NULL,NULL,1,'2025-04-20 08:42:50','2025-04-20 08:49:08','ae4c36aa-2ae4-4bb9-9962-ab4db2db8bd5'),(15,6,4,'Home','home','__home__',NULL,1,'2025-04-20 08:42:50','2025-04-20 08:42:50','27a7b482-6be8-4a8d-84cb-fdb3cfb70ef0'),(16,7,1,'Home','home',NULL,NULL,1,'2025-04-20 08:43:09','2025-04-20 08:49:08','3291dd2b-04e6-417a-8511-14ae7d98562f'),(17,7,2,'Home','home',NULL,NULL,1,'2025-04-20 08:43:09','2025-04-20 08:49:08','a59667c4-905a-42c7-ba54-39270dcac606'),(18,7,3,'Home','home',NULL,NULL,1,'2025-04-20 08:43:09','2025-04-20 08:49:08','39989d79-54b5-42e1-bb08-820d267cc318'),(19,7,4,'Home','home','__home__',NULL,1,'2025-04-20 08:43:09','2025-04-20 08:43:09','66e47f0f-a9c2-4609-bcaf-9e1a09afd471'),(20,8,1,'Home','home',NULL,NULL,1,'2025-04-20 08:48:12','2025-04-20 08:49:08','facafc11-7e08-4f06-8cbc-29db9bb80e21'),(21,8,2,'Home','home',NULL,NULL,1,'2025-04-20 08:48:12','2025-04-20 08:49:08','61cf4f90-bf4e-4045-9dcd-5c02d2dd25ba'),(22,8,3,'Home','home',NULL,NULL,1,'2025-04-20 08:48:12','2025-04-20 08:49:08','1c39581c-8870-4da6-a509-d410bf3d0d0e'),(23,8,4,'Home','home','__home__',NULL,1,'2025-04-20 08:48:12','2025-04-20 08:48:12','f3a6a631-4633-4417-a6ac-1e7399908790'),(24,9,4,'Home','home','__home__','{\"4f96e89d-4f5e-453d-bf67-2b02d149bebe\": \"Letzte Woche war ich im Coworking-Space und habe an einem neuen Konzept für ein Startup gepitcht. Nach dem Meeting haben wir ein bisschen Small Talk gemacht und uns über das nächste Get-together ausgetauscht. Später gabs noch ein Quick Lunch mit Wraps und Smoothies – super casual, aber total nice!\", \"dae4c745-4baf-4bc5-b0ea-f2929f532b11\": \"<p>Letzte Woche war ich im Coworking-Space und habe an einem neuen Konzept für ein Startup gepitcht. Nach dem Meeting haben wir ein bisschen Small Talk gemacht und uns über das nächste Get-together ausgetauscht. Später gabs noch ein Quick Lunch mit Wraps und Smoothies – super casual, aber total nice!</p>\"}',1,'2025-04-20 08:48:58','2025-04-20 08:52:45','ac2a28d6-a9b8-4914-ac54-e1c5d4bf25ff'),(25,9,1,'Home','home','__home__','{\"dae4c745-4baf-4bc5-b0ea-f2929f532b11\": \"<p>Letzte Woche war ich im Coworking-Space und habe an einem neuen Konzept für ein Startup gepitcht. Nach dem Meeting haben wir ein bisschen Small Talk gemacht und uns über das nächste Get-together ausgetauscht. Später gabs noch ein Quick Lunch mit Wraps und Smoothies – super casual, aber total nice!</p>\"}',1,'2025-04-20 08:48:58','2025-04-20 08:52:45','561e6862-1d95-46ee-b5b8-914d9ae60982'),(26,9,3,'Home','home','__home__','{\"dae4c745-4baf-4bc5-b0ea-f2929f532b11\": \"<p>Letzte Woche war ich im Coworking-Space und habe an einem neuen Konzept für ein Startup gepitcht. Nach dem Meeting haben wir ein bisschen Small Talk gemacht und uns über das nächste Get-together ausgetauscht. Später gabs noch ein Quick Lunch mit Wraps und Smoothies – super casual, aber total nice!</p>\"}',1,'2025-04-20 08:48:58','2025-04-20 08:52:45','b90da3a2-52ab-47fc-8adf-96bfbd34131b'),(27,9,2,'Home','home','__home__','{\"dae4c745-4baf-4bc5-b0ea-f2929f532b11\": \"<p>Letzte Woche war ich im Coworking-Space und habe an einem neuen Konzept für ein Startup gepitcht. Nach dem Meeting haben wir ein bisschen Small Talk gemacht und uns über das nächste Get-together ausgetauscht. Später gabs noch ein Quick Lunch mit Wraps und Smoothies – super casual, aber total nice!</p>\"}',1,'2025-04-20 08:48:58','2025-04-20 08:52:45','59511055-a21d-4e68-a9da-a1b1449e31ac'),(28,10,4,'Home','home','__home__',NULL,1,'2025-04-20 08:48:58','2025-04-20 08:49:17','7942aa5e-51ed-4f4c-a0f0-dbee5aa8d1dc'),(29,10,1,'Home','home','__home__',NULL,1,'2025-04-20 08:48:58','2025-04-20 08:49:17','69d4969f-e72c-4452-ae94-fb715964efbc'),(30,10,2,'Home','home','__home__',NULL,1,'2025-04-20 08:48:58','2025-04-20 08:49:17','621f7338-31e8-4f87-bb65-7ee5ddefabee'),(31,10,3,'Home','home','__home__',NULL,1,'2025-04-20 08:48:58','2025-04-20 08:49:17','4719c723-7f0d-47a7-9d49-ff651b0a9cc4'),(32,11,1,'Home','home',NULL,NULL,1,'2025-04-20 08:49:07','2025-04-20 08:49:07','ba13fdac-1d13-4528-992f-b1a05940a007'),(33,11,2,'Home','home',NULL,NULL,1,'2025-04-20 08:49:07','2025-04-20 08:49:07','bc654bdd-c48e-47af-85f3-b4a5bc1481f1'),(34,11,3,'Home','home',NULL,NULL,1,'2025-04-20 08:49:07','2025-04-20 08:49:07','cb3d1664-d760-416e-b08b-56818ff9d945'),(35,11,4,'Home','home',NULL,NULL,1,'2025-04-20 08:49:07','2025-04-20 08:49:07','c5c56f3d-d645-46d0-b39c-02906c29a149'),(36,12,3,'Home','home','__home__',NULL,1,'2025-04-20 08:49:17','2025-04-20 08:49:17','7d2aaae4-929d-4021-9c4b-f2037c8d124c'),(37,12,1,'Home','home','__home__',NULL,1,'2025-04-20 08:49:17','2025-04-20 08:49:17','1d4dd2bb-f693-4ae0-babc-3fce94edbd13'),(38,12,2,'Home','home','__home__',NULL,1,'2025-04-20 08:49:17','2025-04-20 08:49:17','8beb8f2a-082b-4c56-a948-e9e593e1009e'),(39,12,4,'Home','home','__home__',NULL,1,'2025-04-20 08:49:17','2025-04-20 08:49:17','2362599a-fcb7-4fff-8306-06e814c0a3ef'),(40,13,1,'Home','home','__home__',NULL,1,'2025-04-20 08:49:17','2025-04-20 08:49:17','39711579-2c17-43d9-b8e1-3d97ee6922a7'),(41,13,2,'Home','home','__home__',NULL,1,'2025-04-20 08:49:17','2025-04-20 08:49:17','51fc9b28-15ef-4229-a6ea-7696e62fe0de'),(42,13,3,'Home','home','__home__',NULL,1,'2025-04-20 08:49:17','2025-04-20 08:49:17','e0d15d16-35e2-44a7-867e-c6014d8c5d71'),(43,13,4,'Home','home','__home__',NULL,1,'2025-04-20 08:49:17','2025-04-20 08:49:17','abbcd3ee-b520-4662-bdb3-c26f04b89d77'),(48,15,4,'Home','home','__home__','{\"4f96e89d-4f5e-453d-bf67-2b02d149bebe\": \"Letzte Woche war ich im Coworking-Space und habe an einem neuen Konzept für ein Startup gepitcht. Nach dem Meeting haben wir ein bisschen Small Talk gemacht und uns über das nächste Get-together ausgetauscht. Später gabs noch ein Quick Lunch mit Wraps und Smoothies – super casual, aber total nice!\", \"dae4c745-4baf-4bc5-b0ea-f2929f532b11\": \"<p>Letzte Woche war ich im Coworking-Space und habe an einem neuen Konzept für ein Startup gepitcht. Nach dem Meeting haben wir ein bisschen Small Talk gemacht und uns über das nächste Get-together ausgetauscht. Später gabs noch ein Quick Lunch mit Wraps und Smoothies – super casual, aber total nice!</p>\"}',1,'2025-04-20 08:52:45','2025-04-20 08:52:45','a1523c46-d412-4918-bdeb-839e959e05c2'),(49,15,1,'Home','home','__home__','{\"dae4c745-4baf-4bc5-b0ea-f2929f532b11\": \"<p>Letzte Woche war ich im Coworking-Space und habe an einem neuen Konzept für ein Startup gepitcht. Nach dem Meeting haben wir ein bisschen Small Talk gemacht und uns über das nächste Get-together ausgetauscht. Später gabs noch ein Quick Lunch mit Wraps und Smoothies – super casual, aber total nice!</p>\"}',1,'2025-04-20 08:52:45','2025-04-20 08:52:45','96852fa6-86c1-4e12-9b21-7b0b79d4628d'),(50,15,2,'Home','home','__home__','{\"dae4c745-4baf-4bc5-b0ea-f2929f532b11\": \"<p>Letzte Woche war ich im Coworking-Space und habe an einem neuen Konzept für ein Startup gepitcht. Nach dem Meeting haben wir ein bisschen Small Talk gemacht und uns über das nächste Get-together ausgetauscht. Später gabs noch ein Quick Lunch mit Wraps und Smoothies – super casual, aber total nice!</p>\"}',1,'2025-04-20 08:52:45','2025-04-20 08:52:45','7b14ce7b-617d-43a5-a89f-d40e6a3d0211'),(51,15,3,'Home','home','__home__','{\"dae4c745-4baf-4bc5-b0ea-f2929f532b11\": \"<p>Letzte Woche war ich im Coworking-Space und habe an einem neuen Konzept für ein Startup gepitcht. Nach dem Meeting haben wir ein bisschen Small Talk gemacht und uns über das nächste Get-together ausgetauscht. Später gabs noch ein Quick Lunch mit Wraps und Smoothies – super casual, aber total nice!</p>\"}',1,'2025-04-20 08:52:45','2025-04-20 08:52:45','ee0fda47-b8d9-497c-9a22-78306bb73b3b'),(52,16,4,NULL,NULL,NULL,NULL,1,'2025-04-20 08:53:35','2025-04-20 08:53:35','d75c0757-fcc8-445f-9215-9559ddf55855'),(53,17,4,NULL,NULL,NULL,NULL,1,'2025-04-20 08:54:20','2025-04-20 08:54:20','916af9db-f85a-4233-a464-2f6c19425f4e'),(54,18,4,NULL,NULL,NULL,NULL,1,'2025-04-20 08:54:30','2025-04-20 08:54:30','6642fdfe-27bc-47d2-93e3-90c87582dcea');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES (1,1,NULL,NULL,NULL,1,'2025-04-20 08:39:00',NULL,'live',NULL,1,'2025-04-20 08:39:37','2025-04-20 08:39:37'),(2,1,NULL,NULL,NULL,1,'2025-04-20 08:39:00',NULL,'live',NULL,NULL,'2025-04-20 08:39:37','2025-04-20 08:39:37'),(6,1,NULL,NULL,NULL,1,'2025-04-20 08:39:00',NULL,'live',NULL,NULL,'2025-04-20 08:42:50','2025-04-20 08:42:50'),(7,1,NULL,NULL,NULL,1,'2025-04-20 08:39:00',NULL,'live',NULL,NULL,'2025-04-20 08:43:09','2025-04-20 08:43:09'),(8,1,NULL,NULL,NULL,1,'2025-04-20 08:39:00',NULL,'live',NULL,NULL,'2025-04-20 08:48:12','2025-04-20 08:48:12'),(9,2,NULL,NULL,NULL,1,'2025-04-20 08:48:00',NULL,'live',NULL,NULL,'2025-04-20 08:48:58','2025-04-20 08:48:58'),(10,2,NULL,NULL,NULL,1,'2025-04-20 08:48:00',NULL,'live',NULL,NULL,'2025-04-20 08:48:58','2025-04-20 08:48:58'),(11,1,NULL,NULL,NULL,1,'2025-04-20 08:39:00',NULL,'live',NULL,NULL,'2025-04-20 08:49:07','2025-04-20 08:49:07'),(12,2,NULL,NULL,NULL,1,'2025-04-20 08:48:00',NULL,'live',NULL,NULL,'2025-04-20 08:49:17','2025-04-20 08:49:17'),(13,2,NULL,NULL,NULL,1,'2025-04-20 08:48:00',NULL,'live',NULL,NULL,'2025-04-20 08:49:17','2025-04-20 08:49:17'),(15,2,NULL,NULL,NULL,1,'2025-04-20 08:48:00',NULL,'live',NULL,NULL,'2025-04-20 08:52:45','2025-04-20 08:52:45');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries_authors`
--

LOCK TABLES `entries_authors` WRITE;
/*!40000 ALTER TABLE `entries_authors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `entries_authors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entrytypes` VALUES (1,1,'Entry: Default','entry_default','',NULL,1,'site','','',1,'site','',1,'2025-04-20 08:39:36','2025-04-20 08:39:36',NULL,'52ee9207-fdfc-4374-89b3-e879e80fb194');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"db89ec7c-025b-4c22-9143-b8815f4a6f01\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"65fcf4a1-9e59-42f1-b074-3fbb31a5fe5f\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2024-11-25T16:35:57+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"4f96e89d-4f5e-453d-bf67-2b02d149bebe\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"3e030166-231b-437d-9f6a-f0817da70142\", \"required\": false, \"dateAdded\": \"2024-11-25T16:37:55+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"dae4c745-4baf-4bc5-b0ea-f2929f532b11\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"9397563a-7373-4f22-aa43-aa6d89b53212\", \"required\": false, \"dateAdded\": \"2024-11-29T15:16:23+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}','2025-04-20 08:39:36','2025-04-20 08:39:36',NULL,'0d164c42-7368-4a06-b708-1b04e5068030');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fields` VALUES (1,'Plain Text Translatable','plainTextTranslatable','global',NULL,NULL,0,'language',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":true,\"placeholder\":null,\"uiMode\":\"normal\"}','2025-04-20 08:39:36','2025-04-20 08:39:36',NULL,'3e030166-231b-437d-9f6a-f0817da70142'),(2,'Richtext','richtext','global',NULL,NULL,0,'none',NULL,'craft\\ckeditor\\Field','{\"availableTransforms\":\"\",\"availableVolumes\":\"\",\"ckeConfig\":\"a710df0a-1928-4ca9-ab8d-6cd7d0b2ec49\",\"createButtonLabel\":null,\"defaultTransform\":null,\"enableSourceEditingForNonAdmins\":false,\"purifierConfig\":null,\"purifyHtml\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"showWordCount\":false,\"wordLimit\":null}','2025-04-20 08:39:36','2025-04-20 08:39:36',NULL,'9397563a-7373-4f22-aa43-aa6d89b53212');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `imagetransforms`
--

LOCK TABLES `imagetransforms` WRITE;
/*!40000 ALTER TABLE `imagetransforms` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `info` VALUES (1,'5.7.1.1','5.7.0.3',0,'ohsxdxtekuhl','3@vohxolcicv','2025-04-20 08:39:36','2025-04-20 08:54:04','0a2dd349-7690-46c2-8a47-d5527f256260');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `loanwords`
--

LOCK TABLES `loanwords` WRITE;
/*!40000 ALTER TABLE `loanwords` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `loanwords` VALUES (4,'Coworking-Space','en-AT','2025-04-20 08:40:42','2025-04-20 08:53:11','ff6a5f18-8b9a-497b-b7e7-962fc49517c1'),(5,'Startup','en-AT','2025-04-20 08:41:23','2025-04-20 08:53:21','1b1a679f-3974-4572-bb78-edf1e79cfe25'),(16,'gepitcht','en-AT','2025-04-20 08:53:35','2025-04-20 08:53:35','ff33bf3f-af2b-49af-adcb-96b779410445'),(17,'Meeting','en-AT','2025-04-20 08:54:20','2025-04-20 08:54:20','b1de5c43-c7f8-4092-b8c5-e5a37c7ad274'),(18,'Small Talk','en-AT','2025-04-20 08:54:30','2025-04-20 08:54:30','689afada-9bd3-4380-96fb-aeca63cc1d44');
/*!40000 ALTER TABLE `loanwords` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES (1,'plugin:ckeditor','Install','2025-04-20 08:39:36','2025-04-20 08:39:36','2025-04-20 08:39:36','27bcf75e-03d4-4f54-bc25-e41d9c69d0e8'),(2,'plugin:ckeditor','m230408_163704_v3_upgrade','2025-04-20 08:39:36','2025-04-20 08:39:36','2025-04-20 08:39:36','cede0178-1578-477d-bea8-f7cc5c0fa595'),(3,'plugin:loanwords','Install','2025-04-20 08:39:36','2025-04-20 08:39:36','2025-04-20 08:39:36','6cfda2b0-e8c6-4f1b-83ba-90b06329824b'),(4,'craft','Install','2025-04-20 08:39:37','2025-04-20 08:39:37','2025-04-20 08:39:37','858bc99c-c69c-45d3-a778-6bd6b17276c1'),(5,'craft','m221101_115859_create_entries_authors_table','2025-04-20 08:39:37','2025-04-20 08:39:37','2025-04-20 08:39:37','6d992f69-55bd-4a5a-9ca1-fd2dc2b1f4a3'),(6,'craft','m221107_112121_add_max_authors_to_sections','2025-04-20 08:39:37','2025-04-20 08:39:37','2025-04-20 08:39:37','a43b183f-4dbe-4a35-9643-050bd5dbdde9'),(7,'craft','m221205_082005_translatable_asset_alt_text','2025-04-20 08:39:37','2025-04-20 08:39:37','2025-04-20 08:39:37','bad1fc6b-4154-4b7e-ae7c-0f210423c073'),(8,'craft','m230314_110309_add_authenticator_table','2025-04-20 08:39:37','2025-04-20 08:39:37','2025-04-20 08:39:37','c7b15b5b-7b08-48fd-a501-41bb49867e3a'),(9,'craft','m230314_111234_add_webauthn_table','2025-04-20 08:39:37','2025-04-20 08:39:37','2025-04-20 08:39:37','d4067000-008f-4c6c-8e6d-c4c526e2e2df'),(10,'craft','m230503_120303_add_recoverycodes_table','2025-04-20 08:39:37','2025-04-20 08:39:37','2025-04-20 08:39:37','b722d1c4-4cb6-4eca-ac14-f935acbfaf13'),(11,'craft','m230511_000000_field_layout_configs','2025-04-20 08:39:37','2025-04-20 08:39:37','2025-04-20 08:39:37','53ce34b3-bf1f-4551-b483-4f532ca883d1'),(12,'craft','m230511_215903_content_refactor','2025-04-20 08:39:37','2025-04-20 08:39:37','2025-04-20 08:39:37','729a5af5-c201-4d71-9dbb-82959ea35ab8'),(13,'craft','m230524_000000_add_entry_type_show_slug_field','2025-04-20 08:39:37','2025-04-20 08:39:37','2025-04-20 08:39:37','5a10720b-1e72-4863-8db8-82f3de079ded'),(14,'craft','m230524_000001_entry_type_icons','2025-04-20 08:39:37','2025-04-20 08:39:37','2025-04-20 08:39:37','2f523e1a-783e-46b2-a18f-265dafa02785'),(15,'craft','m230524_000002_entry_type_colors','2025-04-20 08:39:37','2025-04-20 08:39:37','2025-04-20 08:39:37','20000b2d-60f3-4f41-86e5-2fe424feee71'),(16,'craft','m230524_220029_global_entry_types','2025-04-20 08:39:37','2025-04-20 08:39:37','2025-04-20 08:39:37','8e3c8a7f-804c-42cf-ba95-78d395dd805d'),(17,'craft','m230531_123004_add_entry_type_show_status_field','2025-04-20 08:39:37','2025-04-20 08:39:37','2025-04-20 08:39:37','1a9b8fa8-fab1-4daa-b914-b81bb103faf5'),(18,'craft','m230607_102049_add_entrytype_slug_translation_columns','2025-04-20 08:39:37','2025-04-20 08:39:37','2025-04-20 08:39:37','c780a814-3c27-486a-b614-e25370548f70'),(19,'craft','m230616_173810_kill_field_groups','2025-04-20 08:39:37','2025-04-20 08:39:37','2025-04-20 08:39:37','b847cec9-11df-4e23-aef2-59f10fa9e022'),(20,'craft','m230616_183820_remove_field_name_limit','2025-04-20 08:39:37','2025-04-20 08:39:37','2025-04-20 08:39:37','ef068e90-2f83-484a-bf97-6d86c981b462'),(21,'craft','m230617_070415_entrify_matrix_blocks','2025-04-20 08:39:37','2025-04-20 08:39:37','2025-04-20 08:39:37','13c13c26-25d5-46f1-b915-25657d35fe61'),(22,'craft','m230710_162700_element_activity','2025-04-20 08:39:37','2025-04-20 08:39:37','2025-04-20 08:39:37','5c8ffbf3-14ef-428e-b808-4ec6452665ee'),(23,'craft','m230820_162023_fix_cache_id_type','2025-04-20 08:39:37','2025-04-20 08:39:37','2025-04-20 08:39:37','440b6745-949d-44be-b78b-7e14737ff1d5'),(24,'craft','m230826_094050_fix_session_id_type','2025-04-20 08:39:37','2025-04-20 08:39:37','2025-04-20 08:39:37','cf452f59-5b15-4508-bb88-360fb5a01c9d'),(25,'craft','m230904_190356_address_fields','2025-04-20 08:39:37','2025-04-20 08:39:37','2025-04-20 08:39:37','6732cf18-f48f-4fad-bc82-f93975acb923'),(26,'craft','m230928_144045_add_subpath_to_volumes','2025-04-20 08:39:37','2025-04-20 08:39:37','2025-04-20 08:39:37','3c9d6d60-c174-44b2-92c7-11f68c992222'),(27,'craft','m231013_185640_changedfields_amend_primary_key','2025-04-20 08:39:37','2025-04-20 08:39:37','2025-04-20 08:39:37','66e31a15-5fdb-46f1-9020-7f143821b538'),(28,'craft','m231213_030600_element_bulk_ops','2025-04-20 08:39:37','2025-04-20 08:39:37','2025-04-20 08:39:37','58f7a3e0-8faf-4fd2-931e-28875ed97a7d'),(29,'craft','m240129_150719_sites_language_amend_length','2025-04-20 08:39:37','2025-04-20 08:39:37','2025-04-20 08:39:37','2156f188-a801-4b9e-9b2a-eb89e30c45e0'),(30,'craft','m240206_035135_convert_json_columns','2025-04-20 08:39:37','2025-04-20 08:39:37','2025-04-20 08:39:37','7c81a58f-148d-480a-b5d9-374081704361'),(31,'craft','m240207_182452_address_line_3','2025-04-20 08:39:37','2025-04-20 08:39:37','2025-04-20 08:39:37','a1a21b5e-8b1a-457e-a053-82de9d47ab1b'),(32,'craft','m240302_212719_solo_preview_targets','2025-04-20 08:39:37','2025-04-20 08:39:37','2025-04-20 08:39:37','75a06697-a11b-4bc1-9e93-6cd5591f2ff5'),(33,'craft','m240619_091352_add_auth_2fa_timestamp','2025-04-20 08:39:37','2025-04-20 08:39:37','2025-04-20 08:39:37','fbad86a0-3fef-4be1-9885-0eb00fffbae0'),(34,'craft','m240723_214330_drop_bulkop_fk','2025-04-20 08:39:37','2025-04-20 08:39:37','2025-04-20 08:39:37','4fed67a0-3fd8-4466-8a4e-f7829d644f21'),(35,'craft','m240731_053543_soft_delete_fields','2025-04-20 08:39:37','2025-04-20 08:39:37','2025-04-20 08:39:37','2d6528b8-ba8a-4272-bcdc-99773c7e10c6'),(36,'craft','m240805_154041_sso_identities','2025-04-20 08:39:37','2025-04-20 08:39:37','2025-04-20 08:39:37','79acf2ab-3f75-45b8-bf6d-6d34d25783d9'),(37,'craft','m240926_202248_track_entries_deleted_with_section','2025-04-20 08:39:37','2025-04-20 08:39:37','2025-04-20 08:39:37','b5d72b23-7038-41b8-abec-c4e2325370ad'),(38,'craft','m241120_190905_user_affiliated_sites','2025-04-20 08:47:09','2025-04-20 08:47:09','2025-04-20 08:47:09','7cf55b59-d445-46b6-a671-83a216a7b574'),(39,'craft','m241125_122914_add_viewUsers_permission','2025-04-20 08:47:09','2025-04-20 08:47:09','2025-04-20 08:47:09','ae139dd2-f87c-4fd2-9be5-e6efc6d9bb39'),(40,'craft','m250119_135304_entry_type_overrides','2025-04-20 08:47:10','2025-04-20 08:47:10','2025-04-20 08:47:10','b964cb05-bf79-46ed-b017-783cecebd06d'),(41,'craft','m250206_135036_search_index_queue','2025-04-20 08:47:10','2025-04-20 08:47:10','2025-04-20 08:47:10','e56672de-af46-48d1-91cb-aa1c7f9b906c'),(42,'craft','m250207_172349_bulkop_events','2025-04-20 08:47:10','2025-04-20 08:47:10','2025-04-20 08:47:10','57ae6f34-1b30-4a96-a19d-c44ee866e7a8'),(43,'craft','m250315_131608_unlimited_authors','2025-04-20 08:47:10','2025-04-20 08:47:10','2025-04-20 08:47:10','8047c6c5-d8c2-4323-92fe-7f088e98ef61'),(44,'craft','m250403_171253_static_statuses','2025-04-20 08:47:10','2025-04-20 08:47:10','2025-04-20 08:47:10','7c48f69f-59cf-4e1c-bdf9-6b872f9c194a');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `plugins` VALUES (1,'ckeditor','4.6.0','3.0.0.0','2025-04-20 08:39:36','2025-04-20 08:39:36','2025-04-20 08:47:30','d435a782-f96b-4117-83ef-39137ea1c66f'),(2,'loanwords','5.0.0','1.0.0','2025-04-20 08:39:36','2025-04-20 08:39:36','2025-04-20 08:47:11','88f104e9-9607-4d19-8416-574c859d2370');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES ('ckeditor.configs.a710df0a-1928-4ca9-ab8d-6cd7d0b2ec49.headingLevels.0','1'),('ckeditor.configs.a710df0a-1928-4ca9-ab8d-6cd7d0b2ec49.headingLevels.1','2'),('ckeditor.configs.a710df0a-1928-4ca9-ab8d-6cd7d0b2ec49.headingLevels.2','3'),('ckeditor.configs.a710df0a-1928-4ca9-ab8d-6cd7d0b2ec49.headingLevels.3','4'),('ckeditor.configs.a710df0a-1928-4ca9-ab8d-6cd7d0b2ec49.headingLevels.4','5'),('ckeditor.configs.a710df0a-1928-4ca9-ab8d-6cd7d0b2ec49.headingLevels.5','6'),('ckeditor.configs.a710df0a-1928-4ca9-ab8d-6cd7d0b2ec49.name','\"Simple\"'),('ckeditor.configs.a710df0a-1928-4ca9-ab8d-6cd7d0b2ec49.toolbar.0','\"heading\"'),('ckeditor.configs.a710df0a-1928-4ca9-ab8d-6cd7d0b2ec49.toolbar.1','\"|\"'),('ckeditor.configs.a710df0a-1928-4ca9-ab8d-6cd7d0b2ec49.toolbar.2','\"bold\"'),('ckeditor.configs.a710df0a-1928-4ca9-ab8d-6cd7d0b2ec49.toolbar.3','\"italic\"'),('ckeditor.configs.a710df0a-1928-4ca9-ab8d-6cd7d0b2ec49.toolbar.4','\"link\"'),('dateModified','1745139244'),('elementSources.craft\\elements\\Entry.0.defaultSort.0','\"postDate\"'),('elementSources.craft\\elements\\Entry.0.defaultSort.1','\"desc\"'),('elementSources.craft\\elements\\Entry.0.defaultViewMode','\"\"'),('elementSources.craft\\elements\\Entry.0.disabled','true'),('elementSources.craft\\elements\\Entry.0.key','\"*\"'),('elementSources.craft\\elements\\Entry.0.tableAttributes.0','\"status\"'),('elementSources.craft\\elements\\Entry.0.tableAttributes.1','\"section\"'),('elementSources.craft\\elements\\Entry.0.tableAttributes.2','\"postDate\"'),('elementSources.craft\\elements\\Entry.0.tableAttributes.3','\"expiryDate\"'),('elementSources.craft\\elements\\Entry.0.tableAttributes.4','\"link\"'),('elementSources.craft\\elements\\Entry.0.type','\"native\"'),('elementSources.craft\\elements\\Entry.1.defaultSort.0','\"title\"'),('elementSources.craft\\elements\\Entry.1.defaultSort.1','\"asc\"'),('elementSources.craft\\elements\\Entry.1.defaultViewMode','\"\"'),('elementSources.craft\\elements\\Entry.1.disabled','false'),('elementSources.craft\\elements\\Entry.1.key','\"singles\"'),('elementSources.craft\\elements\\Entry.1.tableAttributes.0','\"status\"'),('elementSources.craft\\elements\\Entry.1.tableAttributes.1','\"link\"'),('elementSources.craft\\elements\\Entry.1.type','\"native\"'),('elementSources.craft\\elements\\Entry.2.heading','\"\"'),('elementSources.craft\\elements\\Entry.2.type','\"heading\"'),('elementSources.craft\\elements\\Entry.3.defaultSort.0','\"postDate\"'),('elementSources.craft\\elements\\Entry.3.defaultSort.1','\"desc\"'),('elementSources.craft\\elements\\Entry.3.defaultViewMode','\"\"'),('elementSources.craft\\elements\\Entry.3.disabled','false'),('elementSources.craft\\elements\\Entry.3.key','\"section:83bd2e7a-7bdb-4812-b5a6-f568c59b1572\"'),('elementSources.craft\\elements\\Entry.3.tableAttributes.0','\"status\"'),('elementSources.craft\\elements\\Entry.3.tableAttributes.1','\"postDate\"'),('elementSources.craft\\elements\\Entry.3.tableAttributes.2','\"expiryDate\"'),('elementSources.craft\\elements\\Entry.3.tableAttributes.3','\"link\"'),('elementSources.craft\\elements\\Entry.3.type','\"native\"'),('email.fromEmail','\"samuelreichor@gmail.com\"'),('email.fromName','\"loanword-library\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.color','null'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elementCondition','null'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.0.autocapitalize','true'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.0.autocomplete','false'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.0.autocorrect','true'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.0.class','null'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.0.dateAdded','\"2024-11-25T16:35:57+00:00\"'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.0.disabled','false'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.0.elementCondition','null'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.0.id','null'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.0.includeInCards','false'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.0.inputType','null'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.0.instructions','null'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.0.label','null'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.0.max','null'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.0.min','null'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.0.name','null'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.0.orientation','null'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.0.placeholder','null'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.0.providesThumbs','false'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.0.readonly','false'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.0.required','true'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.0.size','null'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.0.step','null'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.0.tip','null'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.0.title','null'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.0.uid','\"65fcf4a1-9e59-42f1-b074-3fbb31a5fe5f\"'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.0.userCondition','null'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.0.warning','null'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.0.width','100'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.1.dateAdded','\"2024-11-25T16:37:55+00:00\"'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.1.elementCondition','null'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.1.fieldUid','\"3e030166-231b-437d-9f6a-f0817da70142\"'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.1.handle','null'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.1.includeInCards','false'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.1.instructions','null'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.1.label','null'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.1.providesThumbs','false'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.1.required','false'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.1.tip','null'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.1.uid','\"4f96e89d-4f5e-453d-bf67-2b02d149bebe\"'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.1.userCondition','null'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.1.warning','null'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.1.width','100'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.2.dateAdded','\"2024-11-29T15:16:23+00:00\"'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.2.elementCondition','null'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.2.fieldUid','\"9397563a-7373-4f22-aa43-aa6d89b53212\"'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.2.handle','null'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.2.includeInCards','false'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.2.instructions','null'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.2.label','null'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.2.providesThumbs','false'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.2.required','false'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.2.tip','null'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.2.uid','\"dae4c745-4baf-4bc5-b0ea-f2929f532b11\"'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.2.userCondition','null'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.2.warning','null'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.elements.2.width','100'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.name','\"Content\"'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.uid','\"db89ec7c-025b-4c22-9143-b8815f4a6f01\"'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.fieldLayouts.0d164c42-7368-4a06-b708-1b04e5068030.tabs.0.userCondition','null'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.handle','\"entry_default\"'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.hasTitleField','true'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.icon','\"\"'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.name','\"Entry: Default\"'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.showSlugField','true'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.showStatusField','true'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.slugTranslationKeyFormat','\"\"'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.slugTranslationMethod','\"site\"'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.titleFormat','\"\"'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.titleTranslationKeyFormat','\"\"'),('entryTypes.52ee9207-fdfc-4374-89b3-e879e80fb194.titleTranslationMethod','\"site\"'),('fields.3e030166-231b-437d-9f6a-f0817da70142.columnSuffix','null'),('fields.3e030166-231b-437d-9f6a-f0817da70142.handle','\"plainTextTranslatable\"'),('fields.3e030166-231b-437d-9f6a-f0817da70142.instructions','null'),('fields.3e030166-231b-437d-9f6a-f0817da70142.name','\"Plain Text Translatable\"'),('fields.3e030166-231b-437d-9f6a-f0817da70142.searchable','false'),('fields.3e030166-231b-437d-9f6a-f0817da70142.settings.byteLimit','null'),('fields.3e030166-231b-437d-9f6a-f0817da70142.settings.charLimit','null'),('fields.3e030166-231b-437d-9f6a-f0817da70142.settings.code','false'),('fields.3e030166-231b-437d-9f6a-f0817da70142.settings.initialRows','4'),('fields.3e030166-231b-437d-9f6a-f0817da70142.settings.multiline','true'),('fields.3e030166-231b-437d-9f6a-f0817da70142.settings.placeholder','null'),('fields.3e030166-231b-437d-9f6a-f0817da70142.settings.uiMode','\"normal\"'),('fields.3e030166-231b-437d-9f6a-f0817da70142.translationKeyFormat','null'),('fields.3e030166-231b-437d-9f6a-f0817da70142.translationMethod','\"language\"'),('fields.3e030166-231b-437d-9f6a-f0817da70142.type','\"craft\\\\fields\\\\PlainText\"'),('fields.9397563a-7373-4f22-aa43-aa6d89b53212.columnSuffix','null'),('fields.9397563a-7373-4f22-aa43-aa6d89b53212.handle','\"richtext\"'),('fields.9397563a-7373-4f22-aa43-aa6d89b53212.instructions','null'),('fields.9397563a-7373-4f22-aa43-aa6d89b53212.name','\"Richtext\"'),('fields.9397563a-7373-4f22-aa43-aa6d89b53212.searchable','false'),('fields.9397563a-7373-4f22-aa43-aa6d89b53212.settings.availableTransforms','\"\"'),('fields.9397563a-7373-4f22-aa43-aa6d89b53212.settings.availableVolumes','\"\"'),('fields.9397563a-7373-4f22-aa43-aa6d89b53212.settings.ckeConfig','\"a710df0a-1928-4ca9-ab8d-6cd7d0b2ec49\"'),('fields.9397563a-7373-4f22-aa43-aa6d89b53212.settings.createButtonLabel','null'),('fields.9397563a-7373-4f22-aa43-aa6d89b53212.settings.defaultTransform','null'),('fields.9397563a-7373-4f22-aa43-aa6d89b53212.settings.enableSourceEditingForNonAdmins','false'),('fields.9397563a-7373-4f22-aa43-aa6d89b53212.settings.purifierConfig','null'),('fields.9397563a-7373-4f22-aa43-aa6d89b53212.settings.purifyHtml','true'),('fields.9397563a-7373-4f22-aa43-aa6d89b53212.settings.showUnpermittedFiles','false'),('fields.9397563a-7373-4f22-aa43-aa6d89b53212.settings.showUnpermittedVolumes','false'),('fields.9397563a-7373-4f22-aa43-aa6d89b53212.settings.showWordCount','false'),('fields.9397563a-7373-4f22-aa43-aa6d89b53212.settings.wordLimit','null'),('fields.9397563a-7373-4f22-aa43-aa6d89b53212.translationKeyFormat','null'),('fields.9397563a-7373-4f22-aa43-aa6d89b53212.translationMethod','\"none\"'),('fields.9397563a-7373-4f22-aa43-aa6d89b53212.type','\"craft\\\\ckeditor\\\\Field\"'),('meta.__names__.322ec983-b3ed-4bd9-8f24-cbb5e82c31b8','\"Home\"'),('meta.__names__.3e030166-231b-437d-9f6a-f0817da70142','\"Plain Text Translatable\"'),('meta.__names__.46d40ab4-3fc0-4b2c-ac81-b763fbcef3ab','\"IT\"'),('meta.__names__.48f40e40-bc3e-400d-9502-051298b4de6b','\"EN\"'),('meta.__names__.52ee9207-fdfc-4374-89b3-e879e80fb194','\"Entry: Default\"'),('meta.__names__.6bfbbea2-b2f8-4714-a584-cc45884e1a6b','\"loanword-library\"'),('meta.__names__.83bd2e7a-7bdb-4812-b5a6-f568c59b1572','\"Another Section\"'),('meta.__names__.9397563a-7373-4f22-aa43-aa6d89b53212','\"Richtext\"'),('meta.__names__.a5ece01f-f2c4-4f4a-a3eb-0351b339fd9a','\"DE\"'),('meta.__names__.a710df0a-1928-4ca9-ab8d-6cd7d0b2ec49','\"Simple\"'),('meta.__names__.d1cc2006-ac2a-45a3-b0e5-fbf10f1137c3','\"FR\"'),('plugins.ckeditor.edition','\"standard\"'),('plugins.ckeditor.enabled','true'),('plugins.ckeditor.schemaVersion','\"3.0.0.0\"'),('plugins.loanwords.edition','\"standard\"'),('plugins.loanwords.enabled','true'),('plugins.loanwords.licenseKey','\"HE0UKOZAMBCML0HLX0GCFNCL\"'),('plugins.loanwords.schemaVersion','\"1.0.0\"'),('plugins.loanwords.settings.caseSensitive','false'),('plugins.loanwords.settings.cssClass','\"inline\"'),('plugins.loanwords.settings.defaultLang','\"en-AT\"'),('sections.322ec983-b3ed-4bd9-8f24-cbb5e82c31b8.defaultPlacement','\"end\"'),('sections.322ec983-b3ed-4bd9-8f24-cbb5e82c31b8.enableVersioning','true'),('sections.322ec983-b3ed-4bd9-8f24-cbb5e82c31b8.entryTypes.0.uid','\"52ee9207-fdfc-4374-89b3-e879e80fb194\"'),('sections.322ec983-b3ed-4bd9-8f24-cbb5e82c31b8.handle','\"home\"'),('sections.322ec983-b3ed-4bd9-8f24-cbb5e82c31b8.maxAuthors','1'),('sections.322ec983-b3ed-4bd9-8f24-cbb5e82c31b8.name','\"Home\"'),('sections.322ec983-b3ed-4bd9-8f24-cbb5e82c31b8.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.322ec983-b3ed-4bd9-8f24-cbb5e82c31b8.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),('sections.322ec983-b3ed-4bd9-8f24-cbb5e82c31b8.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.322ec983-b3ed-4bd9-8f24-cbb5e82c31b8.previewTargets.0.__assoc__.1.1','\"{url}\"'),('sections.322ec983-b3ed-4bd9-8f24-cbb5e82c31b8.previewTargets.0.__assoc__.2.0','\"refresh\"'),('sections.322ec983-b3ed-4bd9-8f24-cbb5e82c31b8.previewTargets.0.__assoc__.2.1','\"1\"'),('sections.322ec983-b3ed-4bd9-8f24-cbb5e82c31b8.propagationMethod','\"all\"'),('sections.322ec983-b3ed-4bd9-8f24-cbb5e82c31b8.siteSettings.46d40ab4-3fc0-4b2c-ac81-b763fbcef3ab.enabledByDefault','true'),('sections.322ec983-b3ed-4bd9-8f24-cbb5e82c31b8.siteSettings.46d40ab4-3fc0-4b2c-ac81-b763fbcef3ab.hasUrls','true'),('sections.322ec983-b3ed-4bd9-8f24-cbb5e82c31b8.siteSettings.46d40ab4-3fc0-4b2c-ac81-b763fbcef3ab.template','null'),('sections.322ec983-b3ed-4bd9-8f24-cbb5e82c31b8.siteSettings.46d40ab4-3fc0-4b2c-ac81-b763fbcef3ab.uriFormat','\"__home__\"'),('sections.322ec983-b3ed-4bd9-8f24-cbb5e82c31b8.siteSettings.48f40e40-bc3e-400d-9502-051298b4de6b.enabledByDefault','true'),('sections.322ec983-b3ed-4bd9-8f24-cbb5e82c31b8.siteSettings.48f40e40-bc3e-400d-9502-051298b4de6b.hasUrls','true'),('sections.322ec983-b3ed-4bd9-8f24-cbb5e82c31b8.siteSettings.48f40e40-bc3e-400d-9502-051298b4de6b.template','null'),('sections.322ec983-b3ed-4bd9-8f24-cbb5e82c31b8.siteSettings.48f40e40-bc3e-400d-9502-051298b4de6b.uriFormat','\"__home__\"'),('sections.322ec983-b3ed-4bd9-8f24-cbb5e82c31b8.siteSettings.a5ece01f-f2c4-4f4a-a3eb-0351b339fd9a.enabledByDefault','true'),('sections.322ec983-b3ed-4bd9-8f24-cbb5e82c31b8.siteSettings.a5ece01f-f2c4-4f4a-a3eb-0351b339fd9a.hasUrls','true'),('sections.322ec983-b3ed-4bd9-8f24-cbb5e82c31b8.siteSettings.a5ece01f-f2c4-4f4a-a3eb-0351b339fd9a.template','null'),('sections.322ec983-b3ed-4bd9-8f24-cbb5e82c31b8.siteSettings.a5ece01f-f2c4-4f4a-a3eb-0351b339fd9a.uriFormat','\"__home__\"'),('sections.322ec983-b3ed-4bd9-8f24-cbb5e82c31b8.siteSettings.d1cc2006-ac2a-45a3-b0e5-fbf10f1137c3.enabledByDefault','true'),('sections.322ec983-b3ed-4bd9-8f24-cbb5e82c31b8.siteSettings.d1cc2006-ac2a-45a3-b0e5-fbf10f1137c3.hasUrls','true'),('sections.322ec983-b3ed-4bd9-8f24-cbb5e82c31b8.siteSettings.d1cc2006-ac2a-45a3-b0e5-fbf10f1137c3.template','null'),('sections.322ec983-b3ed-4bd9-8f24-cbb5e82c31b8.siteSettings.d1cc2006-ac2a-45a3-b0e5-fbf10f1137c3.uriFormat','\"__home__\"'),('sections.322ec983-b3ed-4bd9-8f24-cbb5e82c31b8.type','\"single\"'),('sections.83bd2e7a-7bdb-4812-b5a6-f568c59b1572.defaultPlacement','\"end\"'),('sections.83bd2e7a-7bdb-4812-b5a6-f568c59b1572.enableVersioning','true'),('sections.83bd2e7a-7bdb-4812-b5a6-f568c59b1572.entryTypes.0.uid','\"52ee9207-fdfc-4374-89b3-e879e80fb194\"'),('sections.83bd2e7a-7bdb-4812-b5a6-f568c59b1572.handle','\"anotherSection\"'),('sections.83bd2e7a-7bdb-4812-b5a6-f568c59b1572.maxAuthors','1'),('sections.83bd2e7a-7bdb-4812-b5a6-f568c59b1572.name','\"Another Section\"'),('sections.83bd2e7a-7bdb-4812-b5a6-f568c59b1572.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.83bd2e7a-7bdb-4812-b5a6-f568c59b1572.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),('sections.83bd2e7a-7bdb-4812-b5a6-f568c59b1572.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.83bd2e7a-7bdb-4812-b5a6-f568c59b1572.previewTargets.0.__assoc__.1.1','\"{url}\"'),('sections.83bd2e7a-7bdb-4812-b5a6-f568c59b1572.previewTargets.0.__assoc__.2.0','\"refresh\"'),('sections.83bd2e7a-7bdb-4812-b5a6-f568c59b1572.previewTargets.0.__assoc__.2.1','\"1\"'),('sections.83bd2e7a-7bdb-4812-b5a6-f568c59b1572.propagationMethod','\"all\"'),('sections.83bd2e7a-7bdb-4812-b5a6-f568c59b1572.siteSettings.46d40ab4-3fc0-4b2c-ac81-b763fbcef3ab.enabledByDefault','true'),('sections.83bd2e7a-7bdb-4812-b5a6-f568c59b1572.siteSettings.46d40ab4-3fc0-4b2c-ac81-b763fbcef3ab.hasUrls','true'),('sections.83bd2e7a-7bdb-4812-b5a6-f568c59b1572.siteSettings.46d40ab4-3fc0-4b2c-ac81-b763fbcef3ab.template','\"another-section/_entry.twig\"'),('sections.83bd2e7a-7bdb-4812-b5a6-f568c59b1572.siteSettings.46d40ab4-3fc0-4b2c-ac81-b763fbcef3ab.uriFormat','\"another-section/{slug}\"'),('sections.83bd2e7a-7bdb-4812-b5a6-f568c59b1572.siteSettings.48f40e40-bc3e-400d-9502-051298b4de6b.enabledByDefault','true'),('sections.83bd2e7a-7bdb-4812-b5a6-f568c59b1572.siteSettings.48f40e40-bc3e-400d-9502-051298b4de6b.hasUrls','true'),('sections.83bd2e7a-7bdb-4812-b5a6-f568c59b1572.siteSettings.48f40e40-bc3e-400d-9502-051298b4de6b.template','\"another-section/_entry.twig\"'),('sections.83bd2e7a-7bdb-4812-b5a6-f568c59b1572.siteSettings.48f40e40-bc3e-400d-9502-051298b4de6b.uriFormat','\"another-section/{slug}\"'),('sections.83bd2e7a-7bdb-4812-b5a6-f568c59b1572.siteSettings.a5ece01f-f2c4-4f4a-a3eb-0351b339fd9a.enabledByDefault','true'),('sections.83bd2e7a-7bdb-4812-b5a6-f568c59b1572.siteSettings.a5ece01f-f2c4-4f4a-a3eb-0351b339fd9a.hasUrls','true'),('sections.83bd2e7a-7bdb-4812-b5a6-f568c59b1572.siteSettings.a5ece01f-f2c4-4f4a-a3eb-0351b339fd9a.template','\"another-section/_entry.twig\"'),('sections.83bd2e7a-7bdb-4812-b5a6-f568c59b1572.siteSettings.a5ece01f-f2c4-4f4a-a3eb-0351b339fd9a.uriFormat','\"another-section/{slug}\"'),('sections.83bd2e7a-7bdb-4812-b5a6-f568c59b1572.siteSettings.d1cc2006-ac2a-45a3-b0e5-fbf10f1137c3.enabledByDefault','true'),('sections.83bd2e7a-7bdb-4812-b5a6-f568c59b1572.siteSettings.d1cc2006-ac2a-45a3-b0e5-fbf10f1137c3.hasUrls','true'),('sections.83bd2e7a-7bdb-4812-b5a6-f568c59b1572.siteSettings.d1cc2006-ac2a-45a3-b0e5-fbf10f1137c3.template','\"another-section/_entry.twig\"'),('sections.83bd2e7a-7bdb-4812-b5a6-f568c59b1572.siteSettings.d1cc2006-ac2a-45a3-b0e5-fbf10f1137c3.uriFormat','\"another-section/{slug}\"'),('sections.83bd2e7a-7bdb-4812-b5a6-f568c59b1572.type','\"channel\"'),('siteGroups.6bfbbea2-b2f8-4714-a584-cc45884e1a6b.name','\"loanword-library\"'),('sites.46d40ab4-3fc0-4b2c-ac81-b763fbcef3ab.baseUrl','\"$IT_URL\"'),('sites.46d40ab4-3fc0-4b2c-ac81-b763fbcef3ab.enabled','\"1\"'),('sites.46d40ab4-3fc0-4b2c-ac81-b763fbcef3ab.handle','\"it\"'),('sites.46d40ab4-3fc0-4b2c-ac81-b763fbcef3ab.hasUrls','true'),('sites.46d40ab4-3fc0-4b2c-ac81-b763fbcef3ab.language','\"it\"'),('sites.46d40ab4-3fc0-4b2c-ac81-b763fbcef3ab.name','\"IT\"'),('sites.46d40ab4-3fc0-4b2c-ac81-b763fbcef3ab.primary','false'),('sites.46d40ab4-3fc0-4b2c-ac81-b763fbcef3ab.siteGroup','\"6bfbbea2-b2f8-4714-a584-cc45884e1a6b\"'),('sites.46d40ab4-3fc0-4b2c-ac81-b763fbcef3ab.sortOrder','3'),('sites.48f40e40-bc3e-400d-9502-051298b4de6b.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.48f40e40-bc3e-400d-9502-051298b4de6b.enabled','true'),('sites.48f40e40-bc3e-400d-9502-051298b4de6b.handle','\"en\"'),('sites.48f40e40-bc3e-400d-9502-051298b4de6b.hasUrls','true'),('sites.48f40e40-bc3e-400d-9502-051298b4de6b.language','\"en\"'),('sites.48f40e40-bc3e-400d-9502-051298b4de6b.name','\"EN\"'),('sites.48f40e40-bc3e-400d-9502-051298b4de6b.primary','true'),('sites.48f40e40-bc3e-400d-9502-051298b4de6b.siteGroup','\"6bfbbea2-b2f8-4714-a584-cc45884e1a6b\"'),('sites.48f40e40-bc3e-400d-9502-051298b4de6b.sortOrder','1'),('sites.a5ece01f-f2c4-4f4a-a3eb-0351b339fd9a.baseUrl','\"$DE_URL\"'),('sites.a5ece01f-f2c4-4f4a-a3eb-0351b339fd9a.enabled','\"1\"'),('sites.a5ece01f-f2c4-4f4a-a3eb-0351b339fd9a.handle','\"de\"'),('sites.a5ece01f-f2c4-4f4a-a3eb-0351b339fd9a.hasUrls','true'),('sites.a5ece01f-f2c4-4f4a-a3eb-0351b339fd9a.language','\"de\"'),('sites.a5ece01f-f2c4-4f4a-a3eb-0351b339fd9a.name','\"DE\"'),('sites.a5ece01f-f2c4-4f4a-a3eb-0351b339fd9a.primary','false'),('sites.a5ece01f-f2c4-4f4a-a3eb-0351b339fd9a.siteGroup','\"6bfbbea2-b2f8-4714-a584-cc45884e1a6b\"'),('sites.a5ece01f-f2c4-4f4a-a3eb-0351b339fd9a.sortOrder','2'),('sites.d1cc2006-ac2a-45a3-b0e5-fbf10f1137c3.baseUrl','\"$FR_URL\"'),('sites.d1cc2006-ac2a-45a3-b0e5-fbf10f1137c3.enabled','\"1\"'),('sites.d1cc2006-ac2a-45a3-b0e5-fbf10f1137c3.handle','\"fr\"'),('sites.d1cc2006-ac2a-45a3-b0e5-fbf10f1137c3.hasUrls','true'),('sites.d1cc2006-ac2a-45a3-b0e5-fbf10f1137c3.language','\"fr\"'),('sites.d1cc2006-ac2a-45a3-b0e5-fbf10f1137c3.name','\"FR\"'),('sites.d1cc2006-ac2a-45a3-b0e5-fbf10f1137c3.primary','false'),('sites.d1cc2006-ac2a-45a3-b0e5-fbf10f1137c3.siteGroup','\"6bfbbea2-b2f8-4714-a584-cc45884e1a6b\"'),('sites.d1cc2006-ac2a-45a3-b0e5-fbf10f1137c3.sortOrder','4'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"loanword-library\"'),('system.schemaVersion','\"5.7.0.3\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.require2fa','false'),('users.requireEmailVerification','true');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `recoverycodes`
--

LOCK TABLES `recoverycodes` WRITE;
/*!40000 ALTER TABLE `recoverycodes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `recoverycodes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `revisions` VALUES (1,1,NULL,1,NULL),(2,1,3,2,NULL),(3,1,NULL,3,NULL),(4,1,3,4,NULL),(5,9,3,1,NULL),(6,1,3,5,NULL),(7,9,3,2,NULL),(8,9,3,3,NULL),(9,9,3,4,'Applied “Draft 1”');
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES (1,'slug',0,1,' home '),(1,'slug',0,2,' home '),(1,'slug',0,3,' home '),(1,'slug',0,4,' home '),(1,'title',0,1,' home '),(1,'title',0,2,' home '),(1,'title',0,3,' home '),(1,'title',0,4,' home '),(3,'email',0,4,' samuelreichor gmail com '),(3,'firstname',0,4,''),(3,'fullname',0,4,''),(3,'lastname',0,4,''),(3,'slug',0,4,''),(3,'username',0,4,' admin '),(4,'slug',0,4,''),(5,'slug',0,4,''),(9,'slug',0,1,' home '),(9,'slug',0,2,' home '),(9,'slug',0,3,' home '),(9,'slug',0,4,' home '),(9,'title',0,1,' home '),(9,'title',0,2,' home '),(9,'title',0,3,' home '),(9,'title',0,4,' home '),(16,'slug',0,4,''),(17,'slug',0,4,''),(18,'slug',0,4,'');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindexqueue`
--

LOCK TABLES `searchindexqueue` WRITE;
/*!40000 ALTER TABLE `searchindexqueue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `searchindexqueue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindexqueue_fields`
--

LOCK TABLES `searchindexqueue_fields` WRITE;
/*!40000 ALTER TABLE `searchindexqueue_fields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `searchindexqueue_fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections` VALUES (1,NULL,'Home-depr','homeDepr','single',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2025-04-20 08:39:36','2025-04-20 08:48:11','2025-04-20 08:49:29','fcf075d2-5a60-4d77-afa6-e822876d289b'),(2,NULL,'Home','home','single',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2025-04-20 08:48:58','2025-04-20 08:48:58',NULL,'322ec983-b3ed-4bd9-8f24-cbb5e82c31b8'),(3,NULL,'Another Section','anotherSection','channel',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2025-04-20 08:51:17','2025-04-20 08:51:17',NULL,'83bd2e7a-7bdb-4812-b5a6-f568c59b1572');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_entrytypes`
--

LOCK TABLES `sections_entrytypes` WRITE;
/*!40000 ALTER TABLE `sections_entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_entrytypes` VALUES (1,1,1,NULL,NULL),(2,1,1,NULL,NULL),(3,1,1,NULL,NULL);
/*!40000 ALTER TABLE `sections_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_sites` VALUES (1,1,3,0,NULL,NULL,1,'2025-04-20 08:39:36','2025-04-20 08:49:07','5c6aa33f-5e09-4fb4-a6bd-69a2eba12ad9'),(2,1,4,0,NULL,NULL,1,'2025-04-20 08:39:36','2025-04-20 08:49:07','5e917752-28ec-4c64-973d-d91dcfadad87'),(3,1,1,0,NULL,NULL,1,'2025-04-20 08:39:37','2025-04-20 08:49:07','20d98194-4f1c-469e-b4a7-6eaa0849ff43'),(4,1,2,0,NULL,NULL,1,'2025-04-20 08:39:37','2025-04-20 08:49:07','c4599e41-d6f8-4631-b967-98e7f540be53'),(5,2,3,1,'__home__',NULL,1,'2025-04-20 08:48:58','2025-04-20 08:49:16','184f2363-5dbc-47f7-9fec-2c7832da7fce'),(6,2,4,1,'__home__',NULL,1,'2025-04-20 08:48:58','2025-04-20 08:49:16','6e834753-8f4b-4cfd-a583-59e0c6bb6a15'),(7,2,1,1,'__home__',NULL,1,'2025-04-20 08:48:58','2025-04-20 08:49:16','66f4cb00-82a3-4fa5-a8a0-1ec1e3564034'),(8,2,2,1,'__home__',NULL,1,'2025-04-20 08:48:58','2025-04-20 08:49:16','6cd716fb-d7df-42a1-91dd-071d829d9794'),(9,3,3,1,'another-section/{slug}','another-section/_entry.twig',1,'2025-04-20 08:51:17','2025-04-20 08:51:17','1e36a361-74b0-4f58-90ad-c8b2154d0e27'),(10,3,4,1,'another-section/{slug}','another-section/_entry.twig',1,'2025-04-20 08:51:17','2025-04-20 08:51:17','9ca4da61-7095-4fc5-aa17-3152fd2c3ecc'),(11,3,1,1,'another-section/{slug}','another-section/_entry.twig',1,'2025-04-20 08:51:17','2025-04-20 08:51:17','e3ad4dcc-e0f2-4ab3-8720-a96fcca00fed'),(12,3,2,1,'another-section/{slug}','another-section/_entry.twig',1,'2025-04-20 08:51:17','2025-04-20 08:51:17','a29c555e-e5fd-4f02-a5e2-7d7f92c631ad');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sitegroups` VALUES (1,'loanword-library','2025-04-20 08:39:36','2025-04-20 08:39:36',NULL,'6bfbbea2-b2f8-4714-a584-cc45884e1a6b');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sites` VALUES (1,1,0,'1','DE','de','de',1,'$DE_URL',2,'2025-04-20 08:39:36','2025-04-20 08:39:36',NULL,'a5ece01f-f2c4-4f4a-a3eb-0351b339fd9a'),(2,1,0,'1','FR','fr','fr',1,'$FR_URL',4,'2025-04-20 08:39:36','2025-04-20 08:39:36',NULL,'d1cc2006-ac2a-45a3-b0e5-fbf10f1137c3'),(3,1,0,'1','IT','it','it',1,'$IT_URL',3,'2025-04-20 08:39:36','2025-04-20 08:39:36',NULL,'46d40ab4-3fc0-4b2c-ac81-b763fbcef3ab'),(4,1,1,'1','EN','en','en',1,'$PRIMARY_SITE_URL',1,'2025-04-20 08:39:36','2025-04-20 08:43:09',NULL,'48f40e40-bc3e-400d-9502-051298b4de6b');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sso_identities`
--

LOCK TABLES `sso_identities` WRITE;
/*!40000 ALTER TABLE `sso_identities` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sso_identities` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpreferences` VALUES (3,'{\"language\": \"en\"}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES (3,NULL,NULL,1,0,0,0,1,'admin',NULL,NULL,NULL,'samuelreichor@gmail.com','$2y$13$x.NLv240kANiisvTHe7vNu/yZholUjg96JdMLTehEVpUfF3Q0ZkNi','2025-04-27 19:44:15',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2025-04-20 08:39:37','2025-04-20 08:39:37','2025-04-27 19:44:15');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `webauthn`
--

LOCK TABLES `webauthn` WRITE;
/*!40000 ALTER TABLE `webauthn` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `webauthn` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `widgets` VALUES (1,3,'craft\\widgets\\RecentEntries',1,NULL,'{\"limit\": 10, \"siteId\": 4, \"section\": \"*\"}',1,'2025-04-20 08:39:38','2025-04-20 08:39:38','c666e716-1fa2-40b4-9852-869fc753a175'),(2,3,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2025-04-20 08:39:38','2025-04-20 08:39:38','47bd8673-5c49-415f-bc92-d4fb2776de3a'),(3,3,'craft\\widgets\\Updates',3,NULL,'[]',1,'2025-04-20 08:39:38','2025-04-20 08:39:38','5458f58c-14b0-4526-85eb-104e4ebc0861'),(4,3,'craft\\widgets\\Feed',4,NULL,'{\"url\": \"https://craftcms.com/news.rss\", \"limit\": 5, \"title\": \"Craft News\"}',1,'2025-04-20 08:39:38','2025-04-20 08:39:38','bf37e53e-c202-4833-a064-74ab4bbbfe8b');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-27 21:44:22
