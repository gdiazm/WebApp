-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               6.0.10-alpha-community - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2013-05-20 21:32:30
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping structure for table java.comentario
CREATE TABLE IF NOT EXISTS `comentario` (
  `usuario` varchar(20) NOT NULL,
  `idcomentario` int(11) NOT NULL,
  `idlugar` int(11) NOT NULL,
  `nota` float NOT NULL,
  `opinion` longtext NOT NULL,
  PRIMARY KEY (`idcomentario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table java.comentario: ~2 rows (approximately)
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
INSERT INTO `comentario` (`usuario`, `idcomentario`, `idlugar`, `nota`, `opinion`) VALUES
	('gonzalo', 1, 123, 8, 'Muy bueno'),
	('pepe', 2, 123, 7, 'Regular');
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
