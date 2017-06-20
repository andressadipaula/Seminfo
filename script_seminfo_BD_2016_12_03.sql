CREATE DATABASE  IF NOT EXISTS `seminfo_bd` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `seminfo_bd`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: seminfo_bd
-- ------------------------------------------------------
-- Server version	5.7.16-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adiciona_evento`
--

DROP TABLE IF EXISTS `adiciona_evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adiciona_evento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_Evento` int(11) NOT NULL,
  `id_Inscricao` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_adicionaEvento_Inscricao_idx` (`id_Inscricao`),
  KEY `FK_adicionaEvento_Evento_idx` (`id_Evento`),
  CONSTRAINT `FK_adicionaEvento_Evento` FOREIGN KEY (`id_Evento`) REFERENCES `evento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_adicionaEvento_Inscricao` FOREIGN KEY (`id_Inscricao`) REFERENCES `inscricao` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adiciona_evento`
--

LOCK TABLES `adiciona_evento` WRITE;
/*!40000 ALTER TABLE `adiciona_evento` DISABLE KEYS */;
/*!40000 ALTER TABLE `adiciona_evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(200) NOT NULL,
  `data` varchar(45) DEFAULT NULL,
  `horario` varchar(45) DEFAULT NULL,
  `idPalestrante` int(11) NOT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `local` varchar(45) DEFAULT NULL,
  `observacoes` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Evento_Palestrante_idx` (`idPalestrante`),
  CONSTRAINT `FK_Evento_Palestrante` FOREIGN KEY (`idPalestrante`) REFERENCES `palestrante` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
INSERT INTO `evento` VALUES (3,'Store Procedure','2016-12-04','19:00',3,'miniCurso','Cire','Laboratório 140'),(4,'Padrões de Projeto','2016-12-04','21:00',6,'palestra','Cire','Sala 111'),(5,'Segurança e Rede','2016-12-05','19:00',4,'outros','Cire','Discussão Aberta - Sala 111');
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscricao`
--

DROP TABLE IF EXISTS `inscricao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inscricao` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `id_Participante` int(11) NOT NULL,
  `id_adicionaEvento` int(11) NOT NULL,
  `data` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Inscricao_Participante_idx` (`id_Participante`),
  CONSTRAINT `FK_Inscricao_Participante` FOREIGN KEY (`id_Participante`) REFERENCES `participante` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscricao`
--

LOCK TABLES `inscricao` WRITE;
/*!40000 ALTER TABLE `inscricao` DISABLE KEYS */;
/*!40000 ALTER TABLE `inscricao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `palestrante`
--

DROP TABLE IF EXISTS `palestrante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `palestrante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `resumo` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `palestrante`
--

LOCK TABLES `palestrante` WRITE;
/*!40000 ALTER TABLE `palestrante` DISABLE KEYS */;
INSERT INTO `palestrante` VALUES (3,'Fernando Roberto Proença','35900000000','fernando.proenca@uemg.br','Graduado em Sistemas de Informação.'),(4,'Luiz Fernando Moura Piantino','35900000000','luiz.piantino@uemg.br','Graduado em Sistemas de Informção'),(6,'João Paulo Silva Araujo','35900000000','joao.paulo@uemg.br','Graduado em Sistemas de Informção');
/*!40000 ALTER TABLE `palestrante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participante`
--

DROP TABLE IF EXISTS `participante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cpf` varchar(11) NOT NULL,
  `email` varchar(45) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `periodo` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `permissao` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participante`
--

LOCK TABLES `participante` WRITE;
/*!40000 ALTER TABLE `participante` DISABLE KEYS */;
INSERT INTO `participante` VALUES (1,'11548272671','andressadipaula@hotmail.com','Maria Andressa de Paula Silva','6','1234',1),(4,'11548272671','teste@teste.com','Teste','1','teste',0);
/*!40000 ALTER TABLE `participante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'seminfo_bd'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-03 22:57:26
