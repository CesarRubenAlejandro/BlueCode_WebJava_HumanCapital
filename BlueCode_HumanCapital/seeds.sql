
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
