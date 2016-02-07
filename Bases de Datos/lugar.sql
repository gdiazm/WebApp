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

-- Dumping structure for table java.lugar
CREATE TABLE IF NOT EXISTS `lugar` (
  `nombre` varchar(30) NOT NULL,
  `id` int(5) NOT NULL,
  `ciudad` varchar(20) NOT NULL,
  `tipo` char(1) NOT NULL,
  `imagen` varchar(50) NOT NULL,
  `valoracion` float NOT NULL,
  `comentario` longtext NOT NULL,
  `url` varchar(50) NOT NULL,
  `direccion` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table java.lugar: ~8 rows (approximately)
/*!40000 ALTER TABLE `lugar` DISABLE KEYS */;
INSERT INTO `lugar` (`nombre`, `id`, `ciudad`, `tipo`, `imagen`, `valoracion`, `comentario`, `url`, `direccion`) VALUES
	('Restaurante Casa Manolo\r\n', 123, 'Madrid', 'R', '/Entregable/images/casamanolo.jpg', 8, 'Comida tradicional a buen precio. No necesita reserva', 'http://www.manolorestaurante.com/', 'c/ Princesa 83, 28008 Madrid'),
	('Museo del Prado', 128, 'Madrid', 'M', '/Entregable/images/museodelprado.jpg', 9, 'Uno de los museos más importantes del mundo. Visita imprescindible ', 'http://www.museodelprado.es/', 'c/ Ruiz de Alarcón, 23  28014 Madrid'),
	('Discoteca Kapital', 234, 'Madrid', 'O', '/Entregable/images/discotecakapital.jpg', 7, 'Discoteca grande con 7 plantas y múltiples espacios. La entrada ronda los 20 euros.', 'http://www.grupo-kapital.com/kapital/', 'c/ Atocha, 125  28012 Madrid'),
	('Torre Eiffel', 457, 'Paris', 'M', '/Entregable/images/torreeiffel.jpg', 9, 'Símbolo de París y uno de los monumentos más famosos del mundo.', 'http://www.tour-eiffel.fr/', 'Champ de Mars  5 Avenue Anatole France, '),
	('Brasserie Bofinger', 543, 'Paris', 'R', '/Entregable/images/bofinger.JPG', 7.5, 'Una de las "brasseries" más importantes de París.', 'http://www.bofingerparis.com/fr/', '5-7 rue de la Bastille Paris'),
	('Hotel Ritz', 567, 'Madrid', 'A', '/Entregable/images/hotelritz.jpg', 7, 'Hotel de lujo en el centro de Madrid.', 'www.ritz.es/', 'Plaza Lealtad, 5  28014 Madrid'),
	('Galerías Lafayette', 876, 'Paris', 'O', '/Entregable/images/galeriaslafayette.jpg', 8, 'Espectacular centro comercial en el corazón de París.', 'http://www.galerieslafayette.com/', '40 Boulevard Haussmann  75009 Paris'),
	('Hotel San Regis', 956, 'Paris', 'A', '/Entregable/images/hotelregis.jpg', 9, 'Excelente hotel en el centro de París', 'http://www.hotel-sanregis.fr/', '12 Rue Jean Goujon  75008 Paris');
/*!40000 ALTER TABLE `lugar` ENABLE KEYS */;
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
