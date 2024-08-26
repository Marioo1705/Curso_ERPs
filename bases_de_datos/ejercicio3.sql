-- Database: ejercicio3

-- DROP DATABASE IF EXISTS ejercicio3;

-- Crear la tabla Profesores
CREATE TABLE Profesores (
	id SERIAL, 
	dni VARCHAR(20) UNIQUE,
	nombre VARCHAR(100) NOT NULL,
	direccion TEXT,
	telefono VARCHAR(15),
	PRIMARY KEY (id)
);

-- Crear la tabla Modulos
CREATE TABLE Modulos (
	id SERIAL,
	fk_id_profesor INT,
	codigo VARCHAR(15) UNIQUE NOT NULL,
	nombre VARCHAR(100),
	PRIMARY KEY (id),
	FOREIGN KEY (fk_id_profesor) REFERENCES Profesores (id)
);

-- Crear la tabla Alumnos
CREATE TABLE Alumnos (
	id SERIAL,
	num_expediente VARCHAR(15) UNIQUE NOT NULL,
	nombre VARCHAR(50),
	apellidos VARCHAR(100),
	fecha_nacimiento DATE,
	PRIMARY KEY (id)
);

-- Crear la tabla Cursos
CREATE TABLE Cursos (
	id SERIAL,
	nombre VARCHAR(100) NOT NULL,
	PRIMARY KEY (id)
);

-- Crear la tabla Modulos_Alumnos para la relacion muchos a muchos
CREATE TABLE Modulos_Alumnos (
	id SERIAL,
	fk_id_modulo INT,
	fk_id_alumno INT,
	PRIMARY KEY (id),
	FOREIGN KEY (fk_id_modulo) REFERENCES Modulos (id),
	FOREIGN KEY (fk_id_alumno) REFERENCES Alumnos (id)
);

-- Crear la tabla Alumnos_Cursos para la relacion muchos a uno
CREATE TABLE Alumnos_Cursos (
	id SERIAL,
	fk_id_alumno INT,
	fk_id_curso INT,
	fk_id_delegado INT,
	PRIMARY KEY (id),
	FOREIGN KEY (fk_id_alumno) REFERENCES Alumnos (id),
	FOREIGN KEY (fk_id_curso) REFERENCES Cursos (id),
	FOREIGN KEY (fk_id_delegado) REFERENCES Alumnos (id)
);

-- Inserciones de ejercicio3 para la tabla Profesores
INSERT INTO Profesores (dni, nombre, direccion, telefono)
VALUES ('37254675F', 'Armando Bronca Segura', 'Calle A, 1', '6324578');

INSERT INTO Profesores (dni, nombre, direccion, telefono)
VALUES ('24567842D', 'Amparo Loro Raro', 'Calle B, 2', '6425896');

INSERT INTO Profesores (dni, nombre, direccion, telefono)
VALUES ('15785666H', 'Luz Cuesta Mogollón', 'Calle C, 3', '6875696');

-- Inserciones de ejercicio3 para la tabla Modulos
INSERT INTO Modulos (fk_id_profesor, codigo, nombre)
VALUES (1, 'MF001', 'Matemáticas');

INSERT INTO Modulos (fk_id_profesor, codigo, nombre)
VALUES (2, 'MF002', 'Lenguaje');

INSERT INTO Modulos (fk_id_profesor, codigo, nombre)
VALUES (3, 'MF003', 'Inglés');

-- Inserciones de ejercicio3 para la tabla Alumnos
INSERT INTO Alumnos (num_expediente, nombre, apellidos, fecha_nacimiento)
VALUES ('34373', 'Eva', 'Fina Segura', '2007-07-15');

INSERT INTO Alumnos (num_expediente, nombre, apellidos, fecha_nacimiento)
VALUES ('33765', 'Rafael', 'Nieto de Dios', '2007-11-30');

INSERT INTO Alumnos (num_expediente, nombre, apellidos, fecha_nacimiento)
VALUES ('32745', 'Miguel', 'Marco Gol', '2007-03-07');

-- Inserciones de ejercicio3 para la tabla Cursos
INSERT INTO Cursos (nombre)
VALUES ('Primero Bachillerato: Ciencia y tecnología');

INSERT INTO Cursos (nombre)
VALUES ('Primero Bachillerato: Humanidades y Ciencias Sociales');

INSERT INTO Cursos (nombre)
VALUES ('Primero Bachillerato: Artes');

-- Inserciones de ejercicio3 para la tabla Modulos_Alumnos
INSERT INTO Modulos_Alumnos (fk_id_modulo, fk_id_alumno)
VALUES (1, 1);

INSERT INTO Modulos_Alumnos (fk_id_modulo, fk_id_alumno)
VALUES (2, 1);

INSERT INTO Modulos_Alumnos (fk_id_modulo, fk_id_alumno)
VALUES (2, 2);

INSERT INTO Modulos_Alumnos (fk_id_modulo, fk_id_alumno)
VALUES (2, 3);

INSERT INTO Modulos_Alumnos (fk_id_modulo, fk_id_alumno)
VALUES (3, 1);

INSERT INTO Modulos_Alumnos (fk_id_modulo, fk_id_alumno)
VALUES (3, 2);

INSERT INTO Modulos_Alumnos (fk_id_modulo, fk_id_alumno)
VALUES (3, 3);

-- Inserciones de ejercicio3 para la tabla Alumnos_Cursos
INSERT INTO Alumnos_Cursos (fk_id_alumno, fk_id_curso, fk_id_delegado)
VALUES (1, 1, 1);

INSERT INTO Alumnos_Cursos (fk_id_alumno, fk_id_curso, fk_id_delegado)
VALUES (2, 2, 3);

INSERT INTO Alumnos_Cursos (fk_id_alumno, fk_id_curso, fk_id_delegado)
VALUES (3, 2, 3);
select * from Profesores;
select * from Modulos;
select * from Alumnos;
select * from Cursos;
select * from Modulos_Alumnos;
select * from Alumnos_Cursos;