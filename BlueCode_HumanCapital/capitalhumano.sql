-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.21 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for capital_humano
CREATE DATABASE IF NOT EXISTS `capital_humano` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `capital_humano`;


-- Dumping structure for table capital_humano.candidatos
CREATE TABLE IF NOT EXISTS `candidatos` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(255) NOT NULL,
  `apellidos` varchar(255) NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `universidad` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `expectativas` varchar(255) DEFAULT NULL,
  `estado` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table capital_humano.certificados
CREATE TABLE IF NOT EXISTS `certificados` (
  `candidatoID` int(11) NOT NULL,
  `certificado` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`candidatoID`,`certificado`),
  CONSTRAINT `certificados_ibfk_1` FOREIGN KEY (`candidatoID`) REFERENCES `candidatos` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table capital_humano.empleados
CREATE TABLE IF NOT EXISTS `empleados` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `salario` double NOT NULL,
  `puesto` varchar(255) NOT NULL,
  `diasDeVacaciones` int(11) DEFAULT NULL,
  `esEntrevistador` bit(1) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`),
  CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `candidatos` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table capital_humano.entrevistas
CREATE TABLE IF NOT EXISTS `entrevistas` (
  `candidatoID` int(11) NOT NULL,
  `entrevistadorID` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `entrevistaID` int(11) NOT NULL AUTO_INCREMENT,
  `plataforma` varchar(255) NOT NULL,
  `feedback` varchar(1023) DEFAULT NULL,
  PRIMARY KEY (`entrevistaID`),
  KEY `FK_entrevistas_candidatos` (`candidatoID`),
  KEY `FK_entrevistas_empleados` (`entrevistadorID`),
  CONSTRAINT `FK_entrevistas_candidatos` FOREIGN KEY (`candidatoID`) REFERENCES `candidatos` (`ID`),
  CONSTRAINT `FK_entrevistas_empleados` FOREIGN KEY (`entrevistadorID`) REFERENCES `empleados` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table capital_humano.trabajosanteriores
CREATE TABLE IF NOT EXISTS `trabajosanteriores` (
  `candidatoID` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`candidatoID`,`nombre`),
  CONSTRAINT `trabajosanteriores_ibfk_1` FOREIGN KEY (`candidatoID`) REFERENCES `candidatos` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table capital_humano.usuarioadmin
CREATE TABLE IF NOT EXISTS `usuarioadmin` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `empleadoID` int(11) NOT NULL,
  PRIMARY KEY (`username`),
  KEY `FK_usuarioadmin_empleados` (`empleadoID`),
  CONSTRAINT `FK_usuarioadmin_empleados` FOREIGN KEY (`empleadoID`) REFERENCES `empleados` (`ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
