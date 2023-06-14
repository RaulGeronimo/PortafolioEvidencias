-- MariaDB dump 10.19  Distrib 10.10.2-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: Repertorio
-- ------------------------------------------------------
-- Server version	10.10.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `album`
--

/* ------------------------------------------------------------------------------------- FUNCIONES ------------------------------------------------------------------------------------- */
DROP function IF EXISTS `Mayuscula`;
DELIMITER $$
CREATE FUNCTION `Mayuscula` (cadena TEXT)
RETURNS TEXT
BEGIN
	DECLARE pos INT DEFAULT 0; 
	DECLARE tmp TEXT 
	DEFAULT ''; 
	DECLARE result TEXT DEFAULT ''; 
	REPEAT SET pos = LOCATE(' ', cadena); 
	 IF pos = 0 THEN SET pos = CHAR_LENGTH(cadena); 
	 END IF; 
	 SET tmp = LEFT(cadena,pos); 
	 IF CHAR_LENGTH(tmp) < 4 THEN SET result = CONCAT(result, tmp); 
	 ELSE SET result = CONCAT(result, UPPER(LEFT(tmp,1)),SUBSTR(tmp,2)); 
	 END IF; 
	 SET cadena = RIGHT(cadena,CHAR_LENGTH(cadena)-pos); 
	UNTIL CHAR_LENGTH(cadena) = 0 END REPEAT; 
RETURN result; 
END$$

DELIMITER ;

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `album` (
  `idAlbum` int(11) NOT NULL AUTO_INCREMENT,
  `idGrupo` int(11) DEFAULT NULL,
  `idDisquera` int(11) DEFAULT NULL,
  `Nombre` varchar(60) DEFAULT NULL,
  `Duracion` time DEFAULT NULL,
  `Lanzamiento` date DEFAULT NULL,
  `Grabacion` varchar(200) DEFAULT NULL,
  `Genero` varchar(100) DEFAULT NULL,
  `Portada` text DEFAULT NULL,
  PRIMARY KEY (`idAlbum`),
  KEY `idGrupo` (`idGrupo`),
  KEY `idDisquera` (`idDisquera`),
  CONSTRAINT `album_ibfk_1` FOREIGN KEY (`idGrupo`) REFERENCES `grupo` (`idGrupo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `album_ibfk_2` FOREIGN KEY (`idDisquera`) REFERENCES `disquera` (`idDisquera`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artista`
--

DROP TABLE IF EXISTS `artista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artista` (
  `idArtista` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(70) DEFAULT NULL,
  `NombreArtistico` varchar(50) DEFAULT NULL,
  `Genero` char(1) DEFAULT NULL,
  `FechaNacimiento` date DEFAULT NULL,
  `FechaFinado` varchar(50) DEFAULT NULL,
  `Estatura` double DEFAULT NULL,
  `idNacionalidad` int(11) DEFAULT NULL,
  `Instrumentos` text DEFAULT NULL,
  `TipoVoz` varchar(50) DEFAULT NULL,
  `Foto` text DEFAULT NULL,
  PRIMARY KEY (`idArtista`),
  KEY `idNacionalidad` (`idNacionalidad`),
  CONSTRAINT `artista_ibfk_1` FOREIGN KEY (`idNacionalidad`) REFERENCES `pais` (`idPais`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artista`
--

LOCK TABLES `artista` WRITE;
/*!40000 ALTER TABLE `artista` DISABLE KEYS */;
/*!40000 ALTER TABLE `artista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artista_grupo`
--

DROP TABLE IF EXISTS `artista_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artista_grupo` (
  `Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `idArtista` int(11) DEFAULT NULL,
  `idGrupo` int(11) DEFAULT NULL,
  `FechaInicio` date DEFAULT NULL,
  `FechaFin` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `idArtista` (`idArtista`),
  KEY `idGrupo` (`idGrupo`),
  CONSTRAINT `artista_grupo_ibfk_1` FOREIGN KEY (`idArtista`) REFERENCES `artista` (`idArtista`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `artista_grupo_ibfk_2` FOREIGN KEY (`idGrupo`) REFERENCES `grupo` (`idGrupo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artista_grupo`
--

LOCK TABLES `artista_grupo` WRITE;
/*!40000 ALTER TABLE `artista_grupo` DISABLE KEYS */;
/*!40000 ALTER TABLE `artista_grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canciones`
--

DROP TABLE IF EXISTS `canciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canciones` (
  `idCancion` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(70) DEFAULT NULL,
  `Duracion` time DEFAULT NULL,
  `Publicacion` date DEFAULT NULL,
  `Genero` varchar(100) DEFAULT NULL,
  `Interpretacion` varchar(50) DEFAULT NULL,
  `idGrupo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCancion`),
  KEY `idGrupo` (`idGrupo`),
  CONSTRAINT `canciones_ibfk_1` FOREIGN KEY (`idGrupo`) REFERENCES `grupo` (`idGrupo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canciones`
--

LOCK TABLES `canciones` WRITE;
/*!40000 ALTER TABLE `canciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `canciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canciones_album`
--

DROP TABLE IF EXISTS `canciones_album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canciones_album` (
  `Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `idAlbum` int(11) DEFAULT NULL,
  `idCancion` int(11) DEFAULT NULL,
  `Numero` int(11) DEFAULT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `idAlbum` (`idAlbum`),
  KEY `idCancion` (`idCancion`),
  CONSTRAINT `canciones_album_ibfk_1` FOREIGN KEY (`idAlbum`) REFERENCES `album` (`idAlbum`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `canciones_album_ibfk_2` FOREIGN KEY (`idCancion`) REFERENCES `canciones` (`idCancion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canciones_album`
--

LOCK TABLES `canciones_album` WRITE;
/*!40000 ALTER TABLE `canciones_album` DISABLE KEYS */;
/*!40000 ALTER TABLE `canciones_album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disquera`
--

DROP TABLE IF EXISTS `disquera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disquera` (
  `idDisquera` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(60) DEFAULT NULL,
  `Fundacion` date DEFAULT NULL,
  `Fundador` varchar(100) DEFAULT NULL,
  `Generos` varchar(100) DEFAULT NULL,
  `idPais` int(11) DEFAULT NULL,
  `Logo` text DEFAULT NULL,
  PRIMARY KEY (`idDisquera`),
  KEY `idPais` (`idPais`),
  CONSTRAINT `disquera_ibfk_1` FOREIGN KEY (`idPais`) REFERENCES `pais` (`idPais`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disquera`
--

LOCK TABLES `disquera` WRITE;
/*!40000 ALTER TABLE `disquera` DISABLE KEYS */;
/*!40000 ALTER TABLE `disquera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo` (
  `idGrupo` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) DEFAULT NULL,
  `Origen` varchar(200) DEFAULT NULL,
  `Genero` varchar(200) DEFAULT NULL,
  `Inicio` date DEFAULT NULL,
  `Fin` varchar(50) DEFAULT NULL,
  `Sellos` varchar(150) DEFAULT NULL,
  `Estado` varchar(50) DEFAULT NULL,
  `SitioWeb` varchar(50) DEFAULT NULL,
  `Idioma` varchar(50) DEFAULT NULL,
  `Logo` text DEFAULT NULL,
  PRIMARY KEY (`idGrupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instrumento`
--

DROP TABLE IF EXISTS `instrumento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instrumento` (
  `idInstrumento` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(70) DEFAULT NULL,
  `Descripcion` text DEFAULT NULL,
  `Foto` text DEFAULT NULL,
  PRIMARY KEY (`idInstrumento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instrumento`
--

LOCK TABLES `instrumento` WRITE;
/*!40000 ALTER TABLE `instrumento` DISABLE KEYS */;
/*!40000 ALTER TABLE `instrumento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instrumento_artista`
--

DROP TABLE IF EXISTS `instrumento_artista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instrumento_artista` (
  `Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `idArtista` int(11) DEFAULT NULL,
  `idInstrumento` int(11) DEFAULT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `idArtista` (`idArtista`),
  KEY `idInstrumento` (`idInstrumento`),
  CONSTRAINT `instrumento_artista_ibfk_1` FOREIGN KEY (`idArtista`) REFERENCES `artista_grupo` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `instrumento_artista_ibfk_2` FOREIGN KEY (`idInstrumento`) REFERENCES `instrumento` (`idInstrumento`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instrumento_artista`
--

LOCK TABLES `instrumento_artista` WRITE;
/*!40000 ALTER TABLE `instrumento_artista` DISABLE KEYS */;
/*!40000 ALTER TABLE `instrumento_artista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pais` (
  `idPais` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) DEFAULT NULL,
  `Nacionalidad` varchar(70) DEFAULT NULL,
  `Continente` varchar(50) DEFAULT NULL,
  `Bandera` text DEFAULT NULL,
  PRIMARY KEY (`idPais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vista_album`
--

DROP TABLE IF EXISTS `vista_album`;
/*!50001 DROP VIEW IF EXISTS `vista_album`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_album` AS SELECT
 1 AS `idAlbum`,
  1 AS `idGrupo`,
  1 AS `Nombre`,
  1 AS `Grupo`,
  1 AS `Canciones`,
  1 AS `Disquera`,
  1 AS `Duracion`,
  1 AS `Lanzamiento`,
  1 AS `Grabacion`,
  1 AS `Genero`,
  1 AS `Portada` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_artista`
--

DROP TABLE IF EXISTS `vista_artista`;
/*!50001 DROP VIEW IF EXISTS `vista_artista`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_artista` AS SELECT
 1 AS `idArtista`,
  1 AS `Nombre`,
  1 AS `NombreArtistico`,
  1 AS `Genero`,
  1 AS `FechaNacimiento`,
  1 AS `FechaFinado`,
  1 AS `Edad`,
  1 AS `Estatura`,
  1 AS `Pais`,
  1 AS `Instrumentos`,
  1 AS `TipoVoz`,
  1 AS `Foto` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_canciones`
--

DROP TABLE IF EXISTS `vista_canciones`;
/*!50001 DROP VIEW IF EXISTS `vista_canciones`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_canciones` AS SELECT
 1 AS `idCancion`,
  1 AS `Nombre`,
  1 AS `Duracion`,
  1 AS `Publicacion`,
  1 AS `Genero`,
  1 AS `Interpretacion`,
  1 AS `Grupo` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_cancionesalbum`
--

DROP TABLE IF EXISTS `vista_cancionesalbum`;
/*!50001 DROP VIEW IF EXISTS `vista_cancionesalbum`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_cancionesalbum` AS SELECT
 1 AS `Codigo`,
  1 AS `idCancion`,
  1 AS `idAlbum`,
  1 AS `Album`,
  1 AS `Numero`,
  1 AS `Nombre`,
  1 AS `Duracion`,
  1 AS `Publicacion`,
  1 AS `Genero` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_cancionesgrupo`
--

DROP TABLE IF EXISTS `vista_cancionesgrupo`;
/*!50001 DROP VIEW IF EXISTS `vista_cancionesgrupo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_cancionesgrupo` AS SELECT
 1 AS `idCancion`,
  1 AS `idGrupo`,
  1 AS `Grupo`,
  1 AS `Nombre`,
  1 AS `Albums`,
  1 AS `Duracion`,
  1 AS `Publicacion`,
  1 AS `Genero`,
  1 AS `Interpretacion` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_disquera`
--

DROP TABLE IF EXISTS `vista_disquera`;
/*!50001 DROP VIEW IF EXISTS `vista_disquera`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_disquera` AS SELECT
 1 AS `idDisquera`,
  1 AS `Nombre`,
  1 AS `Fundacion`,
  1 AS `Fundador`,
  1 AS `Generos`,
  1 AS `Pais`,
  1 AS `Logo` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_grupo`
--

DROP TABLE IF EXISTS `vista_grupo`;
/*!50001 DROP VIEW IF EXISTS `vista_grupo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_grupo` AS SELECT
 1 AS `idGrupo`,
  1 AS `Nombre`,
  1 AS `Albumes`,
  1 AS `Cancion`,
  1 AS `Origen`,
  1 AS `Genero`,
  1 AS `FechaInicio`,
  1 AS `Sellos`,
  1 AS `Estado`,
  1 AS `SitioWeb`,
  1 AS `Idioma`,
  1 AS `Logo` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_grupointegrantes`
--

DROP TABLE IF EXISTS `vista_grupointegrantes`;
/*!50001 DROP VIEW IF EXISTS `vista_grupointegrantes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_grupointegrantes` AS SELECT
 1 AS `Codigo`,
  1 AS `idArtista`,
  1 AS `idGrupo`,
  1 AS `NombreArtistico`,
  1 AS `Nombre`,
  1 AS `Genero`,
  1 AS `FechaNacimiento`,
  1 AS `Instrumento`,
  1 AS `Edad`,
  1 AS `Pais`,
  1 AS `TipoVoz`,
  1 AS `Foto`,
  1 AS `Periodo`,
  1 AS `Grupo` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_instrumentointegrantes`
--

DROP TABLE IF EXISTS `vista_instrumentointegrantes`;
/*!50001 DROP VIEW IF EXISTS `vista_instrumentointegrantes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_instrumentointegrantes` AS SELECT
 1 AS `Codigo`,
  1 AS `idArtista`,
  1 AS `idInstrumento`,
  1 AS `Artista`,
  1 AS `Nombre`,
  1 AS `Foto`,
  1 AS `Grupo`,
  1 AS `Instrumento` */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista_album`
--

/*!50001 DROP VIEW IF EXISTS `vista_album`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_album` AS select `album`.`idAlbum` AS `idAlbum`,`grupo`.`idGrupo` AS `idGrupo`,`album`.`Nombre` AS `Nombre`,`grupo`.`Nombre` AS `Grupo`,count(`canciones_album`.`idCancion`) AS `Canciones`,`disquera`.`Nombre` AS `Disquera`,if(date_format(`album`.`Duracion`,'%H') = '00',date_format(`album`.`Duracion`,'%i:%s'),date_format(`album`.`Duracion`,'%H:%i:%s')) AS `Duracion`,`album`.`Lanzamiento` AS `Lanzamiento`,`album`.`Grabacion` AS `Grabacion`,`Mayuscula`(`album`.`Genero`) AS `Genero`,`album`.`Portada` AS `Portada` from (((`album` join `grupo` on(`album`.`idGrupo` = `grupo`.`idGrupo`)) join `disquera` on(`album`.`idDisquera` = `disquera`.`idDisquera`)) left join `canciones_album` on(`album`.`idAlbum` = `canciones_album`.`idAlbum`)) group by `album`.`idAlbum` order by `album`.`Nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_artista`
--

/*!50001 DROP VIEW IF EXISTS `vista_artista`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_artista` AS select `artista`.`idArtista` AS `idArtista`,`artista`.`Nombre` AS `Nombre`,`artista`.`NombreArtistico` AS `NombreArtistico`,if(`artista`.`Genero` = 'H','Hombre','Mujer') AS `Genero`,`artista`.`FechaNacimiento` AS `FechaNacimiento`,`artista`.`FechaFinado` AS `FechaFinado`,case when `artista`.`FechaFinado` is null or `artista`.`FechaFinado` <= 0 then concat_ws(' ',timestampdiff(YEAR,`artista`.`FechaNacimiento`,current_timestamp()),'años') when `artista`.`FechaFinado` <= 0 then 'Fecha Invalida' when `artista`.`FechaNacimiento` <= `artista`.`FechaFinado` then concat_ws(' ',timestampdiff(YEAR,`artista`.`FechaNacimiento`,`artista`.`FechaFinado`),'años') else 'Fecha Invalida' end AS `Edad`,format(`artista`.`Estatura`,2) AS `Estatura`,concat_ws(' - ',`pais`.`Nombre`,`pais`.`Nacionalidad`) AS `Pais`,`Mayuscula`(`artista`.`Instrumentos`) AS `Instrumentos`,`artista`.`TipoVoz` AS `TipoVoz`,`artista`.`Foto` AS `Foto` from (`artista` join `pais` on(`artista`.`idNacionalidad` = `pais`.`idPais`)) order by `artista`.`Nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_canciones`
--

/*!50001 DROP VIEW IF EXISTS `vista_canciones`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_canciones` AS select `canciones`.`idCancion` AS `idCancion`,case when `canciones`.`Interpretacion` <> 'Original' then concat(`canciones`.`Nombre`,' ( ',`canciones`.`Interpretacion`,' ) ') else `canciones`.`Nombre` end AS `Nombre`,date_format(`canciones`.`Duracion`,'%i:%s') AS `Duracion`,`canciones`.`Publicacion` AS `Publicacion`,`Mayuscula`(`canciones`.`Genero`) AS `Genero`,`canciones`.`Interpretacion` AS `Interpretacion`,`grupo`.`Nombre` AS `Grupo` from (`canciones` left join `grupo` on(`grupo`.`idGrupo` = `canciones`.`idGrupo`)) order by case when `canciones`.`Interpretacion` <> 'Original' then concat(`canciones`.`Nombre`,' ( ',`canciones`.`Interpretacion`,' ) ') else `canciones`.`Nombre` end */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_cancionesalbum`
--

/*!50001 DROP VIEW IF EXISTS `vista_cancionesalbum`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_cancionesalbum` AS select `canciones_album`.`Codigo` AS `Codigo`,`canciones`.`idCancion` AS `idCancion`,`album`.`idAlbum` AS `idAlbum`,`album`.`Nombre` AS `Album`,`canciones_album`.`Numero` AS `Numero`,case when `canciones`.`Interpretacion` <> 'Original' then concat(`canciones`.`Nombre`,' ( ',`canciones`.`Interpretacion`,' ) ') else `canciones`.`Nombre` end AS `Nombre`,date_format(`canciones`.`Duracion`,'%i:%s') AS `Duracion`,`canciones`.`Publicacion` AS `Publicacion`,`Mayuscula`(`canciones`.`Genero`) AS `Genero` from ((`canciones` join `canciones_album` on(`canciones`.`idCancion` = `canciones_album`.`idCancion`)) join `album` on(`album`.`idAlbum` = `canciones_album`.`idAlbum`)) order by case when `canciones`.`Interpretacion` <> 'Original' then concat(`canciones`.`Nombre`,' ( ',`canciones`.`Interpretacion`,' ) ') else `canciones`.`Nombre` end */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_cancionesgrupo`
--

/*!50001 DROP VIEW IF EXISTS `vista_cancionesgrupo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_cancionesgrupo` AS select `canciones`.`idCancion` AS `idCancion`,`grupo`.`idGrupo` AS `idGrupo`,`grupo`.`Nombre` AS `Grupo`,case when `canciones`.`Interpretacion` <> 'Original' then concat(`canciones`.`Nombre`,' ( ',`canciones`.`Interpretacion`,' ) ') else `canciones`.`Nombre` end AS `Nombre`,group_concat(`album`.`Nombre` order by `album`.`Nombre` ASC separator ', ') AS `Albums`,date_format(`canciones`.`Duracion`,'%i:%s') AS `Duracion`,date_format(`canciones`.`Publicacion`,'%Y') AS `Publicacion`,`canciones`.`Genero` AS `Genero`,`canciones`.`Interpretacion` AS `Interpretacion` from (((`canciones` left join `grupo` on(`grupo`.`idGrupo` = `canciones`.`idGrupo`)) left join `canciones_album` on(`canciones`.`idCancion` = `canciones_album`.`idCancion`)) left join `album` on(`album`.`idAlbum` = `canciones_album`.`idAlbum`)) group by `canciones`.`idCancion` order by case when `canciones`.`Interpretacion` <> 'Original' then concat(`canciones`.`Nombre`,' ( ',`canciones`.`Interpretacion`,' ) ') else `canciones`.`Nombre` end,`album`.`Nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_disquera`
--

/*!50001 DROP VIEW IF EXISTS `vista_disquera`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_disquera` AS select `disquera`.`idDisquera` AS `idDisquera`,`disquera`.`Nombre` AS `Nombre`,`disquera`.`Fundacion` AS `Fundacion`,`disquera`.`Fundador` AS `Fundador`,`disquera`.`Generos` AS `Generos`,`pais`.`Nombre` AS `Pais`,`disquera`.`Logo` AS `Logo` from (`disquera` join `pais` on(`disquera`.`idPais` = `pais`.`idPais`)) order by `disquera`.`Nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_grupo`
--

/*!50001 DROP VIEW IF EXISTS `vista_grupo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_grupo` AS select `g`.`idGrupo` AS `idGrupo`,`g`.`Nombre` AS `Nombre`,sum(`g`.`Albumes`) AS `Albumes`,sum(`g`.`Cancion`) AS `Cancion`,`g`.`Origen` AS `Origen`,`Mayuscula`(`g`.`Genero`) AS `Genero`,`g`.`FechaInicio` AS `FechaInicio`,`g`.`Sellos` AS `Sellos`,`g`.`Estado` AS `Estado`,`g`.`SitioWeb` AS `SitioWeb`,`g`.`Idioma` AS `Idioma`,`g`.`Logo` AS `Logo` from (select `a`.`idGrupo` AS `idGrupo`,`a`.`Nombre` AS `Nombre`,count(`c2`.`idAlbum`) AS `Albumes`,0 AS `Cancion`,`a`.`Origen` AS `Origen`,`a`.`Genero` AS `Genero`,date_format(`a`.`Inicio`,'%Y') AS `FechaInicio`,`a`.`Sellos` AS `Sellos`,`a`.`Estado` AS `Estado`,`a`.`SitioWeb` AS `SitioWeb`,`a`.`Idioma` AS `Idioma`,`a`.`Logo` AS `Logo` from (`grupo` `a` left join `album` `c2` on(`a`.`idGrupo` = `c2`.`idGrupo`)) group by `a`.`idGrupo` union all select `b`.`idGrupo` AS `idGrupo`,`b`.`Nombre` AS `Nombre`,0 AS `Albumes`,count(`c1`.`idCancion`) AS `Cancion`,`b`.`Origen` AS `Origen`,`b`.`Genero` AS `Genero`,date_format(`b`.`Inicio`,'%Y') AS `FechaInicio`,`b`.`Sellos` AS `Sellos`,`b`.`Estado` AS `Estado`,`b`.`SitioWeb` AS `SitioWeb`,`b`.`Idioma` AS `Idioma`,`b`.`Logo` AS `Logo` from (`grupo` `b` left join `canciones` `c1` on(`b`.`idGrupo` = `c1`.`idGrupo`)) group by `b`.`idGrupo`) `g` group by `g`.`idGrupo` order by `g`.`Nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_grupointegrantes`
--

/*!50001 DROP VIEW IF EXISTS `vista_grupointegrantes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_grupointegrantes` AS select `artista_grupo`.`Codigo` AS `Codigo`,`artista`.`idArtista` AS `idArtista`,`grupo`.`idGrupo` AS `idGrupo`,`artista`.`NombreArtistico` AS `NombreArtistico`,`artista`.`Nombre` AS `Nombre`,if(`artista`.`Genero` = 'H','Hombre','Mujer') AS `Genero`,`artista`.`FechaNacimiento` AS `FechaNacimiento`,group_concat(`instrumento`.`Nombre` order by `instrumento`.`Nombre` ASC separator ', ') AS `Instrumento`,case when `artista`.`FechaFinado` is null or `artista`.`FechaFinado` <= 0 then concat_ws(' ',timestampdiff(YEAR,`artista`.`FechaNacimiento`,current_timestamp()),'años') when `artista`.`FechaFinado` <= 0 then 'Fecha Invalida' when `artista`.`FechaNacimiento` <= `artista`.`FechaFinado` then concat_ws(' ',timestampdiff(YEAR,`artista`.`FechaNacimiento`,`artista`.`FechaFinado`),'años') else 'Fecha Invalida' end AS `Edad`,concat_ws(' - ',`pais`.`Nombre`,`pais`.`Nacionalidad`) AS `Pais`,`artista`.`TipoVoz` AS `TipoVoz`,`artista`.`Foto` AS `Foto`,case when `artista_grupo`.`FechaFin` is null or `artista_grupo`.`FechaFin` <= 0 then concat_ws(' - ',year(`artista_grupo`.`FechaInicio`),'Actualidad') else concat_ws(' - ',year(`artista_grupo`.`FechaInicio`),year(`artista_grupo`.`FechaFin`)) end AS `Periodo`,`grupo`.`Nombre` AS `Grupo` from (((((`artista` join `pais` on(`artista`.`idNacionalidad` = `pais`.`idPais`)) left join `artista_grupo` on(`artista`.`idArtista` = `artista_grupo`.`idArtista`)) left join `grupo` on(`grupo`.`idGrupo` = `artista_grupo`.`idGrupo`)) left join `instrumento_artista` on(`artista_grupo`.`Codigo` = `instrumento_artista`.`idArtista`)) left join `instrumento` on(`instrumento_artista`.`idInstrumento` = `instrumento`.`idInstrumento`)) group by `grupo`.`idGrupo`,`artista`.`idArtista` order by `artista`.`Nombre`,`instrumento`.`Nombre`,`artista_grupo`.`FechaInicio` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_instrumentointegrantes`
--

/*!50001 DROP VIEW IF EXISTS `vista_instrumentointegrantes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_instrumentointegrantes` AS select `instrumento_artista`.`Codigo` AS `Codigo`,`instrumento_artista`.`idArtista` AS `idArtista`,`instrumento_artista`.`idInstrumento` AS `idInstrumento`,`artista`.`NombreArtistico` AS `Artista`,`artista`.`Nombre` AS `Nombre`,`artista`.`Foto` AS `Foto`,`grupo`.`Nombre` AS `Grupo`,`instrumento`.`Nombre` AS `Instrumento` from ((((`instrumento_artista` join `instrumento` on(`instrumento`.`idInstrumento` = `instrumento_artista`.`idInstrumento`)) join `artista_grupo` on(`artista_grupo`.`Codigo` = `instrumento_artista`.`idArtista`)) join `artista` on(`artista_grupo`.`idArtista` = `artista`.`idArtista`)) join `grupo` on(`artista_grupo`.`idGrupo` = `grupo`.`idGrupo`)) order by `artista`.`Nombre`,`grupo`.`Nombre`,`instrumento`.`Nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-13 20:18:22



/* --------------------------------------------------------------------------------------- VISTAS --------------------------------------------------------------------------------------- */
/* --------------------------------------------------------------------- ARTISTA --------------------------------------------------------------------- */
CREATE OR REPLACE VIEW
Vista_Artista AS
SELECT
Artista.idArtista,
Artista.Nombre,
Artista.NombreArtistico,
IF (Artista.Genero = 'H', 'Hombre', 'Mujer') AS Genero,
Artista.FechaNacimiento,
Artista.FechaFinado,
CASE
WHEN Artista.FechaFinado IS NULL OR Artista.FechaFinado <= 0 THEN CONCAT_WS(' ', TIMESTAMPDIFF(YEAR, Artista.FechaNacimiento, NOW()), 'años')
WHEN Artista.FechaFinado <= 0 THEN 'Fecha Invalida'
WHEN Artista.FechaNacimiento <= Artista.FechaFinado THEN CONCAT_WS(' ', TIMESTAMPDIFF(YEAR, Artista.FechaNacimiento, Artista.FechaFinado), 'años')
ELSE 'Fecha Invalida'
END AS Edad,
FORMAT(Artista.Estatura, 2) AS Estatura,
CONCAT_WS(' - ', Pais.Nombre, Pais.Nacionalidad) AS Pais,
/*Artista.Instrumentos,*/
Mayuscula(Artista.Instrumentos) AS Instrumentos,
Artista.TipoVoz,
Artista.Foto
FROM Artista
INNER JOIN Pais
ON Artista.idNacionalidad = Pais.idPais
ORDER BY Nombre;

/* ---------------------------------------------------------------------- GRUPO ---------------------------------------------------------------------- */
CREATE OR REPLACE VIEW
Vista_Grupo AS
SELECT 
G.idGrupo,
G.Nombre,
SUM(G.Albumes) AS Albumes,
SUM(G.Cancion) AS Cancion,
G.Origen,
Mayuscula(G.Genero) AS Genero,
G.FechaInicio,
G.Sellos,
G.Estado,
G.SitioWeb,
G.Idioma,
G.Logo
FROM(
    SELECT 
    a.idGrupo,
    a.Nombre,
    COUNT(idAlbum) AS Albumes,
    0 AS Cancion,
    a.Origen,
    a.Genero,
    DATE_FORMAT(a.Inicio, "%Y") AS FechaInicio,
    a.Sellos,
    a.Estado,
    a.SitioWeb,
    a.Idioma,
    a.Logo
    FROM Grupo AS a
    LEFT JOIN Album as c2
    ON a.idGrupo = c2.idGrupo
    GROUP BY (a.idGrupo)

    UNION ALL

    SELECT
    b.idGrupo,
    b.Nombre,
    0 AS Albumes,
    COUNT(idCancion) AS Cancion,
    b.Origen,
    b.Genero,
    DATE_FORMAT(b.Inicio, "%Y") AS FechaInicio,
    b.Sellos,
    b.Estado,
    b.SitioWeb,
    b.Idioma,
    b.Logo
    FROM Grupo AS b
    LEFT JOIN Canciones AS c1
    ON b.idGrupo = c1.idGrupo
    GROUP BY (b.idGrupo)
) AS G 
GROUP BY G.idGrupo
ORDER BY (G.Nombre);

/* ------------------------------------------------------------------ ARTISTA GRUPO ------------------------------------------------------------------ */
CREATE OR REPLACE VIEW
Vista_GrupoIntegrantes AS
SELECT
Artista_Grupo.Codigo,
Artista.idArtista,
Grupo.idGrupo,
Artista.NombreArtistico,
Artista.Nombre,
IF (Artista.Genero = 'H', 'Hombre', 'Mujer') AS Genero,
Artista.FechaNacimiento,
GROUP_CONCAT(Instrumento.Nombre ORDER BY Instrumento.Nombre SEPARATOR ', ' ) AS Instrumento,
/*Instrumento.Nombre AS Instrumento,*/
CASE
WHEN Artista.FechaFinado IS NULL OR Artista.FechaFinado <= 0 THEN CONCAT_WS(' ', TIMESTAMPDIFF(YEAR, Artista.FechaNacimiento, NOW()), 'años')
WHEN Artista.FechaFinado <= 0 THEN 'Fecha Invalida'
WHEN Artista.FechaNacimiento <= Artista.FechaFinado THEN CONCAT_WS(' ', TIMESTAMPDIFF(YEAR, Artista.FechaNacimiento, Artista.FechaFinado), 'años')
ELSE 'Fecha Invalida'
END AS Edad,
CONCAT_WS(' - ', Pais.Nombre, Pais.Nacionalidad) AS Pais,
Artista.TipoVoz,
Artista.Foto,
CASE
WHEN Artista_Grupo.FechaFin IS NULL OR Artista_Grupo.FechaFin <= 0 THEN CONCAT_WS(' - ', YEAR(Artista_Grupo.FechaInicio), 'Actualidad')
ELSE CONCAT_WS(' - ', YEAR(Artista_Grupo.FechaInicio), YEAR(Artista_Grupo.FechaFin))
END AS Periodo,
Grupo.Nombre AS Grupo

FROM Artista
INNER JOIN Pais
ON Artista.idNacionalidad = Pais.idPais

LEFT JOIN Artista_Grupo
ON Artista.idArtista = Artista_Grupo.idArtista

LEFT JOIN Grupo
ON Grupo.idGrupo = Artista_Grupo.idGrupo

LEFT JOIN Instrumento_Artista
ON Artista_Grupo.Codigo = Instrumento_Artista.idArtista

LEFT JOIN Instrumento
ON Instrumento_Artista.idInstrumento = Instrumento.idInstrumento

GROUP BY Grupo.idGrupo, Artista.idArtista
ORDER BY Artista.Nombre, Instrumento.Nombre, FechaInicio;

/* ---------------------------------------------------------------- INSTRUMENTO ARTISTA ---------------------------------------------------------------- */
CREATE OR REPLACE VIEW
Vista_InstrumentoIntegrantes AS
SELECT
Instrumento_Artista.Codigo,
Instrumento_Artista.idArtista,
Instrumento_Artista.idInstrumento,
Artista.NombreArtistico AS Artista,
Artista.Nombre,
Artista.Foto,
Grupo.Nombre AS Grupo,
Instrumento.Nombre AS Instrumento
FROM Instrumento_Artista

INNER JOIN Instrumento
ON Instrumento.idInstrumento = Instrumento_Artista.idInstrumento

INNER JOIN Artista_Grupo
ON Artista_Grupo.Codigo = Instrumento_Artista.idArtista

INNER JOIN Artista
ON Artista_Grupo.idArtista = Artista.idArtista

INNER JOIN Grupo
ON Artista_Grupo.idGrupo = Grupo.idGrupo

ORDER BY Artista.Nombre, Grupo.Nombre, Instrumento.Nombre;

/* --------------------------------------------------------------------- DISQUERA --------------------------------------------------------------------- */
CREATE OR REPLACE VIEW
Vista_Disquera AS
SELECT
Disquera.idDisquera,
Disquera.Nombre,
Disquera.Fundacion,
Disquera.Fundador,
Disquera.Generos,
Pais.Nombre AS Pais,
Disquera.Logo
FROM Disquera
INNER JOIN Pais
ON Disquera.idPais = Pais.idPais
ORDER BY Nombre;

/* ---------------------------------------------------------------------- ALBUM ---------------------------------------------------------------------- */
CREATE OR REPLACE VIEW
Vista_Album AS
SELECT
Album.idAlbum,
Grupo.idGrupo,
Album.Nombre AS Nombre,
Grupo.Nombre AS Grupo,
COUNT(Canciones_Album.idCancion) AS Canciones,
Disquera.Nombre AS Disquera,
IF(DATE_FORMAT(Album.Duracion, "%H") = '00', DATE_FORMAT(Album.Duracion, "%i:%s"), DATE_FORMAT(Album.Duracion, "%H:%i:%s")) AS Duracion,
Album.Lanzamiento,
Album.Grabacion,
Mayuscula(Album.Genero) AS Genero,
Album.Portada

FROM Album
INNER JOIN Grupo
ON Album.idGrupo = Grupo.idGrupo

INNER JOIN Disquera
ON Album.idDisquera = Disquera.idDisquera

LEFT JOIN Canciones_Album
ON Album.idAlbum = Canciones_Album.idAlbum

GROUP BY(Album.idAlbum)
ORDER BY (Album.Nombre);

/* -------------------------------------------------------------------- CANCIONES -------------------------------------------------------------------- */
CREATE OR REPLACE VIEW
Vista_Canciones AS
SELECT
Canciones.idCancion,
CASE
WHEN Canciones.Interpretacion <> 'Original' THEN CONCAT(Canciones.Nombre, ' ( ', Canciones.Interpretacion, ' ) ')
ELSE Canciones.Nombre
END AS Nombre,
DATE_FORMAT(Canciones.Duracion, "%i:%s") AS Duracion,
Canciones.Publicacion,
Mayuscula(Canciones.Genero) AS Genero,
Canciones.Interpretacion,
Grupo.Nombre AS Grupo
FROM Canciones
LEFT JOIN Grupo
ON Grupo.idGrupo = Canciones.idGrupo
ORDER BY Nombre;

/* ----------------------------------------------------------------- CANCIONES ALBUM ----------------------------------------------------------------- */
CREATE OR REPLACE VIEW
Vista_CancionesAlbum AS
SELECT
Canciones_Album.Codigo,
Canciones.idCancion,
Album.idAlbum,
Album.Nombre AS Album,
Canciones_Album.Numero,
/* Canciones.Nombre, */
CASE
WHEN Canciones.Interpretacion <> 'Original' THEN CONCAT(Canciones.Nombre, ' ( ', Canciones.Interpretacion, ' ) ')
ELSE Canciones.Nombre
END AS Nombre,
DATE_FORMAT(Canciones.Duracion, "%i:%s") AS Duracion,
Publicacion,
Mayuscula(Canciones.Genero) AS Genero
FROM Canciones
INNER JOIN Canciones_Album
ON Canciones.idCancion = Canciones_Album.idCancion
INNER JOIN Album
ON Album.idAlbum = Canciones_Album.idAlbum
ORDER BY Nombre;

/* ----------------------------------------------------------------- CANCIONES GRUPO ----------------------------------------------------------------- */
CREATE OR REPLACE VIEW
Vista_CancionesGrupo AS
SELECT
Canciones.idCancion,
Grupo.idGrupo,
Grupo.Nombre AS Grupo,
CASE
WHEN Canciones.Interpretacion <> 'Original' THEN CONCAT(Canciones.Nombre, ' ( ', Canciones.Interpretacion, ' ) ')
ELSE Canciones.Nombre
END AS Nombre,
GROUP_CONCAT(Album.Nombre ORDER BY Album.Nombre SEPARATOR ', ') AS Albums,
DATE_FORMAT(Canciones.Duracion, "%i:%s") AS Duracion,
DATE_FORMAT(Canciones.Publicacion, "%Y") AS Publicacion,
Canciones.Genero,
Canciones.Interpretacion
FROM Canciones
LEFT JOIN Grupo
ON Grupo.idGrupo = Canciones.idGrupo
LEFT JOIN Canciones_Album
ON Canciones.idCancion = Canciones_Album.idCancion
LEFT JOIN Album
ON Album.idAlbum = Canciones_Album.idAlbum
GROUP BY idCancion
ORDER BY Nombre, Album.Nombre;

/* ----------------------------------------------------------------------------- PROCEDIMIENTOS ALMACENADOS ----------------------------------------------------------------------------- */
/* ------------------------------------------------------------------ ARTISTA GRUPO ------------------------------------------------------------------ */
DROP procedure IF EXISTS `obtener_integrantes`;
DELIMITER $$
CREATE PROCEDURE `obtener_integrantes`(IN idGrupoB INT)
BEGIN
SELECT * FROM Vista_GrupoIntegrantes WHERE idGrupo = idGrupoB GROUP BY idGrupo, idArtista;
END$$

DELIMITER ;

/* ------------------------------------------------------------------- ALBUM GRUPO ------------------------------------------------------------------- */
DROP procedure IF EXISTS `obtener_album`;
DELIMITER $$
CREATE PROCEDURE `obtener_album`(IN idGrupoB INT)
BEGIN
SELECT idAlbum, idGrupo, Nombre, Grabacion, Canciones, Duracion, Lanzamiento, Disquera, Genero, Portada FROM Vista_Album WHERE idGrupo = idGrupoB ORDER BY Lanzamiento;
END$$

DELIMITER ;

/* ----------------------------------------------------------------- CANCIONES ALBUM ----------------------------------------------------------------- */
DROP procedure IF EXISTS `obtener_cancionesAlbum`;
DELIMITER $$
CREATE PROCEDURE `obtener_cancionesAlbum`(IN idAlbumA INT)
BEGIN
SELECT 
	Codigo,   
	Numero, 
    GROUP_CONCAT(Nombre ORDER BY Codigo SEPARATOR ' / ') AS Nombre,
    DATE_FORMAT(sec_to_time(SUM(time_to_sec(Duracion))), "%H:%i")  AS Duracion,
    Publicacion
FROM Vista_CancionesAlbum WHERE idAlbum = idAlbumA GROUP BY Numero ORDER BY Numero;
END$$

DELIMITER ;

/* ----------------------------------------------------------------- CANCIONES GRUPO ----------------------------------------------------------------- */
DROP procedure IF EXISTS `obtener_canciones`;
DELIMITER $$
CREATE PROCEDURE `obtener_canciones`(IN idGrupoB INT)
BEGIN
SELECT idCancion, Nombre, Albums, Duracion, Publicacion FROM Vista_CancionesGrupo WHERE idGrupo = idGrupoB;
END$$

DELIMITER ;