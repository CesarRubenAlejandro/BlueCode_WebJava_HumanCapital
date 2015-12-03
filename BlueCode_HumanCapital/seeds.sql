
USE capital_humano;
################################################################################

-- Unicamente Candidatos
INSERT INTO Candidatos VALUES (
  NULL,
  'Giacomo',
  'Guilizzoni',
  'Ingeniero en Pizzas',
  'Universitá della Pizza di Milano',
  'giacomo@gmail.com',
  '10218392',
  'Coliseo Romano 435 Col. Roma',
  '4000/mes',
  0
);

INSERT INTO Candidatos VALUES (
  NULL,
  'Marco',
  'Botton Tuttofare',
  'Ingeniero en Sistemas',
  'Politecnico di Milano',
  'marco@marco.com',
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
  'Memo',
  'Ochoa',
  'Ingeniero en Redes y Porterias',
  'Universidad Televisora de Nayarit SA',
  'memo_temo@televisa.com',
  '428379932',
  'Estadio Azteca 123',
  '50000/mes',
  1
);

INSERT INTO Candidatos VALUES (
  NULL,
  'Pedrito',
  'Tutto',
  'Ingeniero en Tecnologías de la Información',
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
  'Sarah',
  'Licenciado en Peluqueria',
  'Universidad Televisora de Nayarit SA',
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
  'Portero',
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
  'Peluquera',
  14,
  1
);
################################################################################

-- Administradores
INSERT INTO usuarioadmin VALUES ('sara', '1234', 6);
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
  'El candidato hablo en italiano y no le entendi'
);
################################################################################
