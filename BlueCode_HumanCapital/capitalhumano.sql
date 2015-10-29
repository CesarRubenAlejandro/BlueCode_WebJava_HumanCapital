DROP DATABASE capital_humano;

CREATE DATABASE capital_humano;

USE capital_humano;

CREATE TABLE Candidatos
(
    ID int NOT NULL AUTO_INCREMENT,
    nombres varchar(255) NOT NULL,
    apellidos varchar(255) NOT NULL,
    titulo varchar(255),
    universidad varchar(255),
    email varchar(255),
    telefono varchar(255),
    direccion varchar(255),
    expectativas varchar(255),
    estado int DEFAULT 0,
    PRIMARY KEY(ID),
    UNIQUE(ID)
);

CREATE TABLE Certificados
(
    candidatoID int NOT NULL,
    certificado varchar(255),
    PRIMARY KEY(candidatoID, certificado),
    FOREIGN KEY(candidatoID) REFERENCES Candidatos(ID) ON DELETE CASCADE
);

CREATE TABLE TrabajosAnteriores
(
    candidatoID int NOT NULL,
    nombre varchar(255),
    PRIMARY KEY(candidatoID, nombre),
    FOREIGN KEY(candidatoID) REFERENCES Candidatos(ID) ON DELETE CASCADE
);

CREATE TABLE Empleados
(
    ID int NOT NULL,
    salario double NOT NULL,
    puesto varchar(255) NOT NULL,
    diasDeVacaciones int,
    PRIMARY KEY(ID),
    UNIQUE(ID),
    FOREIGN KEY(ID) references Candidatos(ID) ON DELETE CASCADE
);

CREATE TABLE Entrevistadores
(
    ID int NOT NULL,
    PRIMARY KEY(ID),
    UNIQUE(ID),
    FOREIGN KEY(ID) references Empleados(ID) ON DELETE CASCADE
);

CREATE TABLE Administradores
(
    ID int NOT NULL,
    username varchar(255) NOT NULL,
    password varchar(255),
    PRIMARY KEY(ID),
    UNIQUE(ID, username),
    FOREIGN KEY(ID) references Empleados(ID) ON DELETE CASCADE
);

CREATE TABLE Entrevistas
(
    candidatoID int NOT NULL,
    entrevistadorID int NOT NULL,
    fecha DateTime NOT NULL,
    plataforma varchar(255) NOT NULL,
    feedback varchar(1023),
    PRIMARY KEY(candidatoID, entrevistadorID, fecha),
    FOREIGN KEY(candidatoID) references Candidatos(ID) ON DELETE CASCADE,
    FOREIGN KEY(entrevistadorID) references Entrevistadores(ID) ON DELETE CASCADE
);