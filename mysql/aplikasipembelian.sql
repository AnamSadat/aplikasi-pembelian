-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: aplikasipembelian
-- ------------------------------------------------------
-- Server version	9.4.0

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
-- Table structure for table `tabelbarang`
--

DROP TABLE IF EXISTS `tabelbarang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabelbarang` (
  `Kode` varchar(100) NOT NULL,
  `NamaBarang` varchar(50) DEFAULT NULL,
  `HargaBeli` int DEFAULT NULL,
  `HargaJual` int DEFAULT NULL,
  `Stok` int DEFAULT NULL,
  PRIMARY KEY (`Kode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabelpembelian`
--

DROP TABLE IF EXISTS `tabelpembelian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabelpembelian` (
  `NoTransaksi` varchar(100) NOT NULL,
  `Tgl` date DEFAULT NULL,
  `KodeSupp` varchar(100) NOT NULL,
  KEY `fk_tabelpembelian_tabelsuplier` (`KodeSupp`),
  CONSTRAINT `fk_tabelpembelian_tabelsuplier` FOREIGN KEY (`KodeSupp`) REFERENCES `tabelsuplier` (`KodeSuplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabelpembeliandetail`
--

DROP TABLE IF EXISTS `tabelpembeliandetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabelpembeliandetail` (
  `NoTransaksi` varchar(100) NOT NULL,
  `KodeBarang` varchar(100) NOT NULL,
  `Jumlah` int DEFAULT NULL,
  `TotalHarga` int DEFAULT NULL,
  KEY `fk_tabelpembeliandetail_tabelbarang` (`KodeBarang`),
  CONSTRAINT `fk_tabelpembeliandetail_tabelbarang` FOREIGN KEY (`KodeBarang`) REFERENCES `tabelbarang` (`Kode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabelsuplier`
--

DROP TABLE IF EXISTS `tabelsuplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabelsuplier` (
  `KodeSuplier` varchar(60) NOT NULL,
  `NamaSuplier` varchar(60) DEFAULT NULL,
  `Kontak` varchar(60) DEFAULT NULL,
  `Telpon` int DEFAULT NULL,
  `Fax` varchar(60) DEFAULT NULL,
  `Alamat` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`KodeSuplier`)
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

-- Dump completed on 2025-11-04 23:04:05
