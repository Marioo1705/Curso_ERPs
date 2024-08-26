-- Database: ejercicio1

-- DROP DATABASE IF EXISTS ejercicio1;

-- Crear la tabla Clientes
CREATE TABLE Clientes (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(50),
	apellidos VARCHAR (100),
	dni VARCHAR (20) UNIQUE,
	direccion TEXT,
	fecha_nacimiento DATE
);

-- Crear la tabla Proveedores
CREATE TABLE Proveedores (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR (100),
	nif VARCHAR (20) UNIQUE,
	direccion TEXT
);

-- Crear la tabla Productos
CREATE TABLE Productos (
	id SERIAL PRIMARY KEY,
	fk_id_proveedor INT REFERENCES Proveedores(id),
	codigo VARCHAR (50),
	nombre VARCHAR (100),
	precio_unitario DECIMAL(10,2),
	FOREIGN KEY (fk_id_proveedor) REFERENCES Proveedores(id)
);

-- Crear la tabla Compras para la relación muchos a muchos entre Clientes y Productos
CREATE TABLE Compras (
	id SERIAL PRIMARY KEY,
	fk_id_producto INT REFERENCES Productos(id),
	fk_id_cliente INT REFERENCES Clientes(id),
	FOREIGN KEY (fk_id_producto) REFERENCES Productos(id),
	FOREIGN KEY (fk_id_cliente) REFERENCES Clientes(id)
);

-- Inserciones de ejercicio1 para la tabla Clientes
INSERT INTO Clientes (nombre, apellidos, dni, direccion, fecha_nacimiento)
VALUES ('Juan', 'Gómez García', '11234432A', 'Paseo de la Castellana 101', '1970-01-31');

INSERT INTO Clientes (nombre, apellidos, dni, direccion, fecha_nacimiento)
VALUES ('Pedro', 'Picapiedra González', '000012789B', 'Plaza Mayor s/n', '1985-06-15');

INSERT INTO Clientes (nombre, apellidos, dni, direccion, fecha_nacimiento)
VALUES ('Pablo', 'Mármol Pérez', '245679536C', 'Calle Principal, 7', '1982-05-01');

-- Inserciones de ejercicio1 para la tabla Proveedores
INSERT INTO Proveedores (nombre, nif, direccion)
VALUES ('Adidas, S.A.', 'A3456789', 'Calle del Comercio, 33');

INSERT INTO Proveedores (nombre, nif, direccion)
VALUES ('Nike, S.A.', 'A2457689', 'Calle Estafeta, 1');

INSERT INTO Proveedores (nombre, nif, direccion)
VALUES ('Reebook, S.A.', 'A4657896', 'Calle Gran Vía, 165');

-- Inserciones de ejercicio1 para la tabla Productos
INSERT INTO Productos (fk_id_proveedor, codigo, nombre, precio_unitario)
VALUES (1, '1234', 'Zapatillas', 49.99);

INSERT INTO Productos (fk_id_proveedor, codigo, nombre, precio_unitario)
VALUES (2, '765A', 'Chándal', 59.99);

INSERT INTO Productos (fk_id_proveedor, codigo, nombre, precio_unitario)
VALUES (3, '799', 'Camiseta', 24.99);

-- Inserciones de ejercicio1 para la tabla Compras
INSERT INTO Compras (fk_id_producto, fk_id_cliente)
VALUES (1, 2);

INSERT INTO Compras (fk_id_producto, fk_id_cliente)
VALUES (2, 3);

INSERT INTO Compras (fk_id_producto, fk_id_cliente)
VALUES (3, 1);

INSERT INTO Compras (fk_id_producto, fk_id_cliente)
VALUES (3, 3);
select * from Compras