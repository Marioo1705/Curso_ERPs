-- Database: ejercicio4

-- DROP DATABASE IF EXISTS ejercicio4;

-- Crear la tabla Clientes
CREATE TABLE Clientes (
	id SERIAL,
	nif VARCHAR(20) UNIQUE NOT NULL,
	nombre VARCHAR(100) NOT NULL,
	direccion TEXT,
	ciudad VARCHAR(50),
	telefono VARCHAR(15),
	PRIMARY KEY (id)
);

-- Crear la tabla Coches
CREATE TABLE Coches (
	id SERIAL,
	fk_id_cliente INT,
	matricula VARCHAR(15) UNIQUE NOT NULL,
	marca VARCHAR(20),
	modelo VARCHAR(100),
	color VARCHAR(30),
	precio DECIMAL(10,2),
	PRIMARY KEY (id),
	FOREIGN KEY (fk_id_cliente) REFERENCES Clientes (id)
);

-- Crear la tabla Revisiones
CREATE TABLE Revisiones (
	id SERIAL,
	fk_id_coche INT,
	cambio_filtro BOOLEAN,
	cambio_aceite BOOLEAN,
	cambio_frenos BOOLEAN,
	otros VARCHAR(50),
	PRIMARY KEY (id),
	FOREIGN KEY (fk_id_coche) REFERENCES Coches (id)
);

-- Inserciones de ejercicio4 para la tabla Clientes
INSERT INTO Clientes (nif, nombre, direccion, ciudad, telefono)
VALUES ('B5496827', 'Grouplance, S.L.', 'Calle Iriarte, 3', 'Madrid', '645978312');

INSERT INTO Clientes (nif, nombre, direccion, ciudad, telefono)
VALUES ('23456789T', 'Fernando Alonso', 'Calle Cortada, 9', 'Oviedo', '623458796');

INSERT INTO Clientes (nif, nombre, direccion, ciudad, telefono)
VALUES ('35875642C', 'Carlos Sainz Hijo', 'Calle sin Sentido, 2', 'Toledo', '645454545');

-- Inserciones de ejercicio4 para la tabla Coches
INSERT INTO Coches (fk_id_cliente, matricula, marca, modelo, color,	precio)
VALUES (1, '4567GPL', 'Renault', '2 CV', 'Rojo', 6000);
 
INSERT INTO Coches (fk_id_cliente, matricula, marca, modelo, color,	precio)
VALUES (2, '5732FAL', 'BMW', 'X5', 'Blanco', 80000);

INSERT INTO Coches (fk_id_cliente, matricula, marca, modelo, color,	precio)
VALUES (3, '6275CSA', 'Ferrari', 'SF90', 'Rojo', 550000);

-- Inserciones de ejercicio4 para la tabla Revisiones
INSERT INTO Revisiones (fk_id_coche, cambio_filtro,	cambio_aceite, cambio_frenos, otros)
VALUES (1, 'True', 'True', 'False', 'Cambio de neumáticos');

INSERT INTO Revisiones (fk_id_coche, cambio_filtro,	cambio_aceite, cambio_frenos, otros)
VALUES (2, 'False', 'False', 'True', 'Sustitución de limpiaparabrisas');

INSERT INTO Revisiones (fk_id_coche, cambio_filtro,	cambio_aceite, cambio_frenos)
VALUES (3, 'False', 'False', 'True');
select * from Clientes
select * from Coches
select * from Revisiones
