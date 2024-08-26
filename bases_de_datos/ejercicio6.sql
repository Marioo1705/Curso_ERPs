-- Database: ejercicio6

-- DROP DATABASE IF EXISTS ejercicio6;

-- Crear la tabla Categorias
CREATE TABLE Categorias (
	id SERIAL,
	local BOOLEAN,
	comercial BOOLEAN,
	regional BOOLEAN,
	nacional BOOLEAN,
	autovia BOOLEAN,
	otras BOOLEAN,
	PRIMARY KEY (id)
);

-- Crear la tabla Carreteras
CREATE TABLE Carreteras (
	id SERIAL,
	fk_id_categoria INT,
	nombre VARCHAR(50),
	PRIMARY KEY (id),
	FOREIGN KEY (fk_id_categoria) REFERENCES Categorias (id)
);

-- Crear la tabla Tramos
CREATE TABLE Tramos (
	id SERIAL,
	nombre VARCHAR(50),
	PRIMARY KEY (id)
);

-- Crear la tabla Comunas
CREATE TABLE Comunas (
	id SERIAL,
	nombre VARCHAR(50),
	PRIMARY KEY (id)
);

-- Crear la tabla Carreteras_Tramos_Comunas
CREATE TABLE Carreteras_Tramos_Comunas (
	id SERIAL,
	fk_id_carretera INT,
	fk_id_tramo INT,
	km_inicio_tramo VARCHAR(10),
	km_fin_tramo VARCHAR(10),
	fk_id_comuna_inicio INT,
	fk_id_comuna_fin INT,
	inicio_o_fin_carretera BOOLEAN,
	carretera_confluye BOOLEAN,
	fk_id_carretera_confluye INT,
	km_confluye VARCHAR(10),
	fk_id_tramo_confluye INT,
	fk_id_comuna_confluye INT,
	PRIMARY KEY (id),
	FOREIGN KEY (fk_id_carretera) REFERENCES Carreteras (id),
	FOREIGN KEY (fk_id_tramo) REFERENCES Tramos (id),
	FOREIGN KEY (fk_id_comuna_inicio) REFERENCES Comunas (id),
	FOREIGN KEY (fk_id_comuna fin) REFERENCES Comunas (id),
	FOREIGN KEY (fk_id_carretera_confluye) REFERENCES Carreteras (id),
	FOREIGN KEY (fk_id_tramo_confluye) REFERENCES Tramos (id),
	FOREIGN KEY (fk_id_comuna_confluye) REFERENCES Comunas (id)
);

