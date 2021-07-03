-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.5.10-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para bd_agenda
CREATE DATABASE IF NOT EXISTS `bd_agenda` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `bd_agenda`;

-- Volcando estructura para tabla bd_agenda.agenda
CREATE TABLE IF NOT EXISTS `agenda` (
  `id_agenda` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` varchar(50) NOT NULL,
  `hora` varchar(50) NOT NULL,
  `registro` varchar(50) NOT NULL,
  `fk_id_carnet` varchar(50) NOT NULL,
  PRIMARY KEY (`id_agenda`),
  KEY `fk_id_carnet` (`fk_id_carnet`),
  CONSTRAINT `fk_id_carnet` FOREIGN KEY (`fk_id_carnet`) REFERENCES `usuario` (`id_carnet`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bd_agenda.agenda: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `agenda` DISABLE KEYS */;
INSERT INTO `agenda` (`id_agenda`, `fecha`, `hora`, `registro`, `fk_id_carnet`) VALUES
	(11, '15/10/2021', '22:03', 'Hacer tareas', 'ABC123'),
	(12, '15/10/2021', '22:03', 'Hacer tareas', 'ABC123'),
	(13, '15/10/2021', '22:05', 'Ir a jugar futbol', 'PM20072'),
	(14, '15/10/2021', '12:09', 'Jugar Futbol', 'PM20072'),
	(15, '3/07/2021', '14:07', 'Entregar proyecto', 'GR20035');
/*!40000 ALTER TABLE `agenda` ENABLE KEYS */;

-- Volcando estructura para tabla bd_agenda.entradas
CREATE TABLE IF NOT EXISTS `entradas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_entrada` varchar(50) NOT NULL DEFAULT '0',
  `entrada` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entrada` (`entrada`),
  CONSTRAINT `entrada` FOREIGN KEY (`entrada`) REFERENCES `usuario` (`id_carnet`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bd_agenda.entradas: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `entradas` DISABLE KEYS */;
INSERT INTO `entradas` (`id`, `fecha_entrada`, `entrada`) VALUES
	(1, '2021/07/03 11:45:07', 'PM20072'),
	(2, '2021/07/03 12:29:17', 'PM20072'),
	(3, '2021/07/03 12:35:02', 'ABC123'),
	(4, '2021/07/03 12:35:44', 'ABC123'),
	(5, '2021/07/03 12:36:25', 'ABC123'),
	(6, '2021/07/03 12:52:39', 'PM20072'),
	(7, '2021/07/03 13:04:10', 'ABC123'),
	(8, '2021/07/03 13:23:09', 'ABC123'),
	(9, '2021/07/03 14:00:51', 'PM20072'),
	(10, '2021/07/03 14:06:52', 'GR20035'),
	(11, '2021/07/03 14:26:59', 'ABC123');
/*!40000 ALTER TABLE `entradas` ENABLE KEYS */;

-- Volcando estructura para tabla bd_agenda.salidas
CREATE TABLE IF NOT EXISTS `salidas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_salida` varchar(50) DEFAULT NULL,
  `salida` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salida` (`salida`),
  CONSTRAINT `salida` FOREIGN KEY (`salida`) REFERENCES `usuario` (`id_carnet`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bd_agenda.salidas: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `salidas` DISABLE KEYS */;
INSERT INTO `salidas` (`id`, `fecha_salida`, `salida`) VALUES
	(1, '2021/07/03 11:30:54', 'ABC123'),
	(2, '2021/07/03 11:37:19', 'PM20072'),
	(3, '2021/07/03 11:50:01', 'PM20072'),
	(4, '2021/07/03 13:05:25', 'ABC123'),
	(5, '2021/07/03 13:50:47', 'ABC123'),
	(6, '2021/07/03 14:04:44', 'PM20072'),
	(7, '2021/07/03 14:25:35', 'GR20035');
/*!40000 ALTER TABLE `salidas` ENABLE KEYS */;

-- Volcando estructura para tabla bd_agenda.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id_carnet` varchar(50) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `contraseña` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_carnet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bd_agenda.usuario: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`id_carnet`, `nombre`, `apellido`, `direccion`, `telefono`, `contraseña`) VALUES
	('ABC123', 'Alexis', 'pss', 'adnlak', '21', '123'),
	('GR20035', 'Carlos', 'Gomez', 'Col x', '2781892', '12345'),
	('PM20072', 'Gerson', 'Monterroza', 'Col Bella Samaria', '70884595', '1234');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
