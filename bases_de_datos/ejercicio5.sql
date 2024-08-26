-- Database: ejercicio5

-- DROP DATABASE IF EXISTS ejercicio5;

-- Crear la tabla Clientes
CREATE TABLE Clientes (
	id SERIAL,
	numero_cliente INT UNIQUE NOT NULL,
	saldo DECIMAL(9,2),
	limite_credito DECIMAL(9,2) NOT NULL,
	descuento DECIMAL(5,2),
	PRIMARY KEY (id)
);

-- Crear la tabla Direcciones_envio
CREATE TABLE Direcciones_envio (
	id SERIAL,
	fk_id_cliente INT,
	calle VARCHAR(50),
	numero VARCHAR(10),
	ciudad VARCHAR(50),
	provincia VARCHAR(30),
	PRIMARY KEY (id),
	FOREIGN KEY (fk_id_cliente) REFERENCES Clientes (id)
);

-- Crear la tabla Articulos
CREATE TABLE Articulos (
	id SERIAL,
	numero_articulo VARCHAR(20),
	descripcion TEXT,
	PRIMARY KEY (id)
);

-- Crear la tabla Pedidos
CREATE TABLE Pedidos (
	id SERIAL,
	fk_id_cliente INT,
	fk_id_direccion INT,
	fk_id_articulo INT,
	fecha DATE,
	cantidad DECIMAL(15,3) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (fk_id_cliente) REFERENCES Clientes (id),
	FOREIGN KEY (fk_id_direccion) REFERENCES Direcciones_envio (id),
	FOREIGN KEY (fk_id_articulo) REFERENCES Articulos (id)
);

-- Crear la tabla Fabricas
CREATE TABLE Fabricas (
	id SERIAL,
	numero_fabrica INT NOT NULL,
	nombre VARCHAR(50),
	telefono VARCHAR(15),
	fabrica_alternativa BOOLEAN,
	PRIMARY KEY (id)
);

-- Crear la tabla Articulos_Fabricas
CREATE TABLE Articulos_Fabricas (
	id SERIAL,
	fk_id_articulo INT,
	fk_id_fabrica INT,
	existencias DECIMAL(20,3),
	articulos_provee DECIMAL(20,3),
	fecha DATE,
	PRIMARY KEY (id)
	FOREIGN KEY (fk_id_articulo) REFERENCES Articulos (id),
	FOREIGN KEY (fk_id_fabrica) REFERENCES Fabricas (id)
);

