
USE capital_humano;
################################################################################

-- Unicamente Candidatos
INSERT INTO Candidatos VALUES (
  NULL,
  'Pedro',
  'Sanchez',
  'Ingeniero en Informatica',
  'Tecnologico de Monterrey',
  'giacomo@gmail.com',
  '10218392',
  'Fidel Velazquez 1600 Monterrey, Nuevo Leon',
  '4000/mes',
  0
);

INSERT INTO Candidatos VALUES (
  NULL,
  'Marco',
  'Juarez',
  'Licenciado en Sistemas',
  'Politecnico di Milano',
  'marco@yahoo.com',
  '5551890321',
  'Piazza Leonardo da Vinci, 32',
  '6000/mes',
  1
);

INSERT INTO Candidatos VALUES (
  NULL,
  'Mariah',
  'Maclachlan',
  'Ingeniero Civil',
  'Arizona State University',
  'mmaclachlan@gmail.com',
  '5782214592',
  'Av Fernando Garcia Roel 54',
  '5000/mes',
  2
);
################################################################################

-- Candidatos que ya son empleados
INSERT INTO Candidatos VALUES (
  NULL,
  'Francisco Guillermo',
  'Perez Herrera',
  'Ingeniero en Redes y Telecomunicaciones',
  'Universidad de Guadalajara',
  'memo_memo@udg.com',
  '428379932',
  'Periferico 293 Mexico DF',
  '50000/mes',
  1
);

INSERT INTO Candidatos VALUES (
  NULL,
  'Pedrito',
  'Tutto',
  'Ingeniero en Informatica',
  'Instituto Politécnico Nacional',
  'pedriot@marco.com',
  '4359676512',
  'Av Insurgentes Nte 2345',
  '40000/mes',
  1
);

INSERT INTO Candidatos VALUES (
  NULL,
  'Sara',
  'Vazquez',
  'Licenciado en Animacion',
  'Universidad del Valle de Veracruz',
  'sarasarah@gmail.com',
  '654902942',
  'Junco de la Vega 432',
  '10000/mes',
  1
);
################################################################################

-- Certificados y Trabajos Anteriores
INSERT INTO Certificados VALUES (1, 'Certificado en Salsa Roja 2013-2014');

INSERT INTO TrabajosAnteriores VALUES (
  1, 
  'Ingeniero en Software'
);

INSERT INTO TrabajosAnteriores VALUES (
  4, 
  'Ingeniero en Software'
);
################################################################################

-- Empleados
INSERT INTO Empleados VALUES (
  4,
  44000,
  'Tester',
  10,
  0
);

INSERT INTO Empleados VALUES (
  5,
  30000,
  'Programador',
  7,
  0
);

INSERT INTO Empleados VALUES (
  6,
  15000,
  'Diseñador',
  14,
  1
);
################################################################################

-- Administradores
INSERT INTO usuarioadmin VALUES ('admin', 'root', 6);
################################################################################

-- Entrevistas
INSERT INTO Entrevistas VALUES (
  4,
  6,
  '2015-10-01',
  1,
  'Skype',
  'Muy buena entrevista'
);

INSERT INTO Entrevistas VALUES (
  1,
  6,
  '2015-10-10',
  2,
  'Skype',
  'El candidato muestra una vasta experiencia en el ambito de su carrera'
);
################################################################################

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
-- Dumping data for table capital_humano.candidatos: ~4 rows (approximately)
/*!40000 ALTER TABLE `candidatos` DISABLE KEYS */;
INSERT INTO `candidatos` (`ID`, `nombres`, `apellidos`, `titulo`, `universidad`, `email`, `telefono`, `direccion`, `expectativas`, `estado`) VALUES
	(14, 'Angela', 'Romo', 'ITC', 'ITESM', 'angela@angela', '67452919', 'valle de contry', '50000', 1),
	(15, 'Cesar', 'Rodriguez', 'INT', 'ITESM', 'cesar.ruben@gmail.com', '567899999', 'Acrux 405', '5000', 1),
	(16, 'Ricardo', 'Mendez', 'ITC', 'UANL', 'hector@hectos', '810204981', 'Monterrey 1010', '1200', 0),
	(18, 'Aaron', 'Rodriguez', 'IME', 'ITESM', 'aaron@uanl', '71889900', 'Acrux 405', '2000', 0),
	(19, 'Carlos', 'Ponce', 'INT', 'ITESM', 'carlos@carlos', '89808080', 'San pedro #10', '30000', 0),
	(20, 'Javier', 'Garza', 'LAE', 'UANL', 'javier.garza@correo', '81716253', 'Apodaca 2210', '40000', 0),
	(21, 'Alejandra', 'Villa', 'LAE', 'UDEM', 'ale.villa@correo', '80685742', 'republica mexicana 2105', '10000', 1),
	(22, 'Cristian', 'Sanchez', 'IME', 'ITESM', 'cris.san@correo', '81818174', 'Direccion de cristian', '5000', 2),
	(23, 'Antonio', 'Perez', 'LAE', 'UANL', 'anton.pz@correo', '89653010', 'Direccion de antonio', '3000', 2),
	(24, 'Marta', 'Vega', 'ITC', 'ITESM', 'marta@correo', '76905040', 'Direccion de marta', '3000', 0);
/*!40000 ALTER TABLE `candidatos` ENABLE KEYS */;

-- Dumping data for table capital_humano.certificados: ~8 rows (approximately)
/*!40000 ALTER TABLE `certificados` DISABLE KEYS */;
INSERT INTO `certificados` (`candidatoID`, `certificado`) VALUES
	(14, 'c'),
	(14, 'c++'),
	(14, 'css'),
	(14, 'java'),
	(15, 'html'),
	(15, 'java'),
	(15, 'psp'),
	(16, 'c'),
	(16, 'html'),
	(16, 'java'),
	(16, 'psp'),
	(18, 'electronica'),
	(18, 'fisica'),
	(18, 'mecanica'),
	(19, 'html'),
	(19, 'psp'),
	(21, 'leyes'),
	(24, 'java'),
	(24, 'ruby');
/*!40000 ALTER TABLE `certificados` ENABLE KEYS */;

-- Dumping data for table capital_humano.empleados: ~2 rows (approximately)
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` (`ID`, `salario`, `puesto`, `diasDeVacaciones`, `esEntrevistador`) VALUES
	(14, 2000, 'Gerente', 20, b'1'),
	(15, 1000, 'Developer', 10, b'1'),
	(21, 15000, 'Coordinadora de ventas', 15, b'1');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;

-- Dumping data for table capital_humano.entrevistas: ~4 rows (approximately)
/*!40000 ALTER TABLE `entrevistas` DISABLE KEYS */;
INSERT INTO `entrevistas` (`candidatoID`, `entrevistadorID`, `fecha`, `entrevistaID`, `plataforma`, `feedback`) VALUES
	(16, 15, '2015-01-11 00:00:00', 1, 'Telefono', 'Esta muy guapo.'),
	(18, 15, '2015-01-12 00:00:00', 2, 'VoIP', 'No estaba preparado.'),
	(19, 15, '2015-06-12 00:00:00', 3, 'Prescencial', 'Excelente ingeniero.'),
	(19, 14, '2015-02-11 00:00:00', 4, 'Skype', 'Nada'),
	(24, 14, '2015-12-01 00:00:00', 5, 'Telefono', 'Durante la entrevista, Marta se mostro segura de sus ideas. Tiene buen conocimiento tecnico.'),
	(24, 15, '2015-12-02 00:00:00', 6, 'Personal', 'En la entrevista personal, Martha se noto nerviosa y fallo en argumentar sus ideas.'),
	(22, 15, '2015-12-07 00:00:00', 7, 'Skype', 'No tenia conocimiento de la empresa  y no supo contestar las preguntas.'),
	(16, 14, '2015-12-23 00:00:00', 8, 'Personal', 'Contesto correctamente las preguntas y demostro conocimiento de la empresa.'),
	(24, 21, '2015-12-31 00:00:00', 9, 'Personal', 'Contesto las preguntas de manera correcta. Sin embargo, tiene poca experiencia profesional.'),
	(20, 15, '2015-12-04 00:00:00', 10, 'VoIP', 'Tiene mucho conocimiento. Puede ser util en el area de ventas.'),
	(23, 14, '2015-12-18 00:00:00', 11, 'Personal', 'No se presento a la junta. Favor de marcar como rechazado.');
/*!40000 ALTER TABLE `entrevistas` ENABLE KEYS */;

-- Dumping data for table capital_humano.trabajosanteriores: ~4 rows (approximately)
/*!40000 ALTER TABLE `trabajosanteriores` DISABLE KEYS */;
INSERT INTO `trabajosanteriores` (`candidatoID`, `nombre`) VALUES
	(14, 'Coach TSP'),
	(19, 'Analista'),
	(24, '');
/*!40000 ALTER TABLE `trabajosanteriores` ENABLE KEYS */;

-- Dumping data for table capital_humano.usuarioadmin: ~0 rows (approximately)
/*!40000 ALTER TABLE `usuarioadmin` DISABLE KEYS */;
INSERT INTO `usuarioadmin` (`username`, `password`, `empleadoID`) VALUES
	('user', 'admin', 14);
/*!40000 ALTER TABLE `usuarioadmin` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

