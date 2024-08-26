-- Database: ejercicio2

-- DROP DATABASE IF EXISTS ejercicio2;

-- Crear la tabla Camiones
CREATE TABLE Camiones (
	id SERIAL PRIMARY KEY,
	matricula VARCHAR (20) UNIQUE,
	modelo VARCHAR (50),
	tipo VARCHAR (50),
	potencia VARCHAR (20)
);

-- Crear la tabla Camioneros
CREATE TABLE Camioneros (
	id SERIAL PRIMARY KEY,
	dni VARCHAR (20) UNIQUE,
	nombre VARCHAR (50),
	telefono VARCHAR (15),
	direccion TEXT,
	salario DECIMAL (10, 2),
	poblacion VARCHAR (50)
);

-- Crear la tabla Provincias
CREATE TABLE Provincias (
	id SERIAL PRIMARY KEY,
	codigo VARCHAR (10),
	nombre VARCHAR (20)
);

-- Crear la tabla Paquetes
CREATE TABLE Paquetes (
	id SERIAL PRIMARY KEY,
	fk_id_camionero INT REFERENCES Camioneros(id),
	fk_id_provincia INT REFERENCES Provincias(id),
	codigo VARCHAR (50) UNIQUE,
	descripcion TEXT,
	destinatario VARCHAR (100),
	dir_destinatario TEXT,
	FOREIGN KEY (fk_id_camionero) REFERENCES Camioneros(id),
	FOREIGN KEY (fk_id_provincia) REFERENCES Provincias(id)
);

-- Crear la tabla Camioneros_Camiones para la relacion muchos a muchos entre Camioneros y Camiones
CREATE TABLE Camioneros_Camiones (
	id SERIAL PRIMARY KEY,
	fk_id_camion INT REFERENCES Camiones(id),
	fk_id_camionero INT REFERENCES Camioneros(id),
	fecha DATE,
	FOREIGN KEY (fk_id_camion) REFERENCES Camiones(id),
	FOREIGN KEY (fk_id_camionero) REFERENCES Camioneros(id)
);

-- Inserciones de ejercicio2 para la tabla Camiones
INSERT INTO Camiones (matricula, modelo, tipo, potencia)
VALUES ('1234ABC', 'Iveco', 'A', '700 cv');

INSERT INTO Camiones (matricula, modelo, tipo, potencia)
VALUES ('3245CBG', 'Pegaso', 'B', '800 cv');

INSERT INTO Camiones (matricula, modelo, tipo, potencia)
VALUES ('7654DGT', 'Reanult', 'C', '650 cv');

-- Inserciones de ejercicio2 para la tabla Camioneros
INSERT INTO Camioneros (dni, nombre, telefono, direccion, salario, poblacion)
VALUES ('12345678A', 'Aitor Tilla', '6223344', 'Calle Carlos Sainz, 10', 2600.50, 'Madrid');

INSERT INTO Camioneros (dni, nombre, telefono, direccion, salario, poblacion)
VALUES ('98765432B', 'Armando Bulla', '6545556', 'Avenida Fernando Alonso, 33', 2544.40, 'Cuenca');

INSERT INTO Camioneros (dni, nombre, telefono, direccion, salario, poblacion)
VALUES ('54354352C', 'Leo Diario', '6758546', 'Plaza de Sito Pons, 7', 2325, 'Zaragoza');

-- Inserciones de ejercicio2 para la tabla Provincias
INSERT INTO Provincias (codigo, nombre)
VALUES ('28002', 'Madrid');

INSERT INTO Provincias (codigo, nombre)
VALUES ('08005', 'Barcelona');

INSERT INTO Provincias (codigo, nombre)
VALUES ('46010', 'Valencia');

-- Inserciones de ejercicio2 para la tabla Paquetes
INSERT INTO Paquetes (fk_id_camionero, fk_id_provincia, codigo, descripcion, destinatario, dir_destinatario)
VALUES (1, 1, '99999', 'Play Station', 'Elvis Nieto', 'Plaza Mayor, s/n');

INSERT INTO Paquetes (fk_id_camionero, fk_id_provincia, codigo, descripcion, destinatario, dir_destinatario)
VALUES (2, 2, '66666', 'Tevevisor 55 pulgadas', 'Elsa Capunta', 'Paseo del Viento, 55');

INSERT INTO Paquetes (fk_id_camionero, fk_id_provincia, codigo, descripcion, destinatario, dir_destinatario)
VALUES (3, 3, '54321', 'Enciclopedia Espasa', 'Inés Esario', 'Calle sin salida, 175');

INSERT INTO Paquetes (fk_id_camionero, fk_id_provincia, codigo, descripcion, destinatario, dir_destinatario)
VALUES (3, 2, '12345', 'Monopoly Edición Lux', 'Carlos Pérez Gil', 'Calle Gran Vía, 45');

-- Inserciones de ejercicio2 para la tabla Camioneros_Camiones
INSERT INTO Camioneros_Camiones (fk_id_camion, fk_id_camionero, fecha)
VALUES (1, 2, '2024-01-05');

INSERT INTO Camioneros_Camiones (fk_id_camion, fk_id_camionero, fecha)
VALUES (2, 3, '2024-03-15');

INSERT INTO Camioneros_Camiones (fk_id_camion, fk_id_camionero, fecha)
VALUES (3, 3, '2024-01-05');

INSERT INTO Camioneros_Camiones (fk_id_camion, fk_id_camionero, fecha)
VALUES (1, 1, '2024-03-15');

