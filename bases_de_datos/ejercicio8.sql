-- Crear la tabla Autores
CREATE TABLE Autores (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
	codigo VARCHAR(100)
);

-- Crear la tabla Libros
CREATE TABLE Libros (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(100),
	codigo VARCHAR(100),
	isbn VARCHAR(50),
	editorial VARCHAR (50),
	num_pag VARCHAR(10)
);
-- Crear la tabla Ejemplares
CREATE TABLE Ejemplares (
    id SERIAL PRIMARY KEY,
	codigo VARCHAR(100),
	localizacion VARCHAR(50),
	fk_id_libro INT REFERENCES Libros(id),
	FOREIGN KEY (fk_id_libro) REFERENCES Libros(id)
);
-- Crear la tabla Usuarios
CREATE TABLE Usuarios (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
	codigo VARCHAR(100),
	direccion TEXT,
	telefono VARCHAR (12)
);

-- Crear la tabla relacion muchos a muchos Autores_Libros
CREATE TABLE Autores_Libros(
    id SERIAL PRIMARY KEY,
	fk_id_libro INT REFERENCES Libros(id),
	FOREIGN KEY (fk_id_libro) REFERENCES Libros(id),
	fk_id_autor INT REFERENCES Autores(id),
	FOREIGN KEY (fk_id_autor) REFERENCES Autores(id)
);

-- Crear la tabla relacion muchos a muchos Ejemplares_Usuarios
CREATE TABLE Ejemplares_Usuarios(
    id SERIAL PRIMARY KEY,
	fecha_pr DATE,
	fecha_dev DATE,
	fk_id_usuario INT REFERENCES Usuarios(id),
	FOREIGN KEY (fk_id_usuario) REFERENCES Usuarios(id),
	fk_id_ejemplar INT REFERENCES Ejemplares(id),
	FOREIGN KEY (fk_id_ejemplar) REFERENCES Ejemplares(id)
);

-- Inserciones de prueba para la tabla Autores
INSERT INTO Autores (nombre, codigo)
VALUES ('Gabriel García Marquez', 'GAR1234A');
INSERT INTO Autores (nombre, codigo)
VALUES ('José Saramago', 'SAR1354A');
INSERT INTO Autores (nombre, codigo)
VALUES ('Agatha Cristie', 'CRI6534A');
select * from Autores;

-- Inserciones de prueba para la tabla Libros
INSERT INTO Libros (titulo, codigo, isbn, editorial, num_pag)
VALUES ('Cien años de soledad', 'GAR1234CIE', '7954368712364', 'Planeta', '527');
INSERT INTO Libros (titulo, codigo, isbn, editorial, num_pag)
VALUES ('Ensaio sobre a segueira', 'SAR1354AENS', '2365498135487', 'Lua', '860');
INSERT INTO Libros (titulo, codigo, isbn, editorial, num_pag)
VALUES ('Asesinato en el Orient Express', 'CRI6534AASE', '6541987324685', 'Maeva', '503');
select * from Libros;

-- Inserciones de prueba para la tabla Ejemplares
INSERT INTO Ejemplares (codigo,	localizacion, fk_id_libro)
VALUES ('001GAR1234CIE', 'Novelas estantería 13 nivel 2', 1);
INSERT INTO Ejemplares (codigo,	localizacion, fk_id_libro)
VALUES ('002GAR1234CIE', 'Deposito', 1);
INSERT INTO Ejemplares (codigo,	localizacion, fk_id_libro)
VALUES ('001SAR1354AENS', 'Idiomas estanteria 1 nivel 1', 2);
INSERT INTO Ejemplares (codigo,	localizacion, fk_id_libro)
VALUES ('CRI6534AASE', 'Suspense estantería 37 nivel 3', 3);
select * from Ejemplares;

-- Inserciones de prueba para la tabla Usuarios
INSERT INTO Usuarios (nombre, codigo, telefono, direccion)
VALUES ('Mario de la Torre Guerrero', 'MAR0001VIP', '+34946584661', 'calle Mayor, 65');
INSERT INTO Usuarios (nombre, codigo, telefono, direccion)
VALUES ('Gisele Moura Sousa', 'GIS0002VIP', '+34613584668', 'Plaza España, 12');
INSERT INTO Usuarios (nombre, codigo, telefono, direccion)
VALUES ('Davinia de la Rosa', 'DAV0003VIP', '+34543685642', 'Av REal de Pinto, 153');
select * from Usuarios;

-- Inserciones de prueba para la tabla Autores_Libros
INSERT INTO Autores_Libros (fk_id_libro, fk_id_autor)
VALUES (1, 1);
INSERT INTO Autores_Libros (fk_id_libro, fk_id_autor)
VALUES (2, 2);
INSERT INTO Autores_Libros (fk_id_libro, fk_id_autor)
VALUES (3, 3);
select * from Autores_Libros;

-- Inserciones de prueba para la tabla Ejemplares_Usuarios
INSERT INTO Ejemplares_Usuarios (fecha_pr, fecha_dev, fk_id_usuario, fk_id_ejemplar)
VALUES ('2024-04-01', '2024-05-01', 1, 2);
INSERT INTO Ejemplares_Usuarios (fecha_pr, fecha_dev, fk_id_usuario, fk_id_ejemplar)
VALUES ('2024-02-23', '2024-03-23', 2, 3);
INSERT INTO Ejemplares_Usuarios (fecha_pr, fecha_dev, fk_id_usuario, fk_id_ejemplar)
VALUES ('2024-03-20', '2024-04-20', 3, 1);
INSERT INTO Ejemplares_Usuarios (fecha_pr, fecha_dev, fk_id_usuario, fk_id_ejemplar)
VALUES ('2024-03-30', '2024-04-30', 3, 4);
select * from Ejemplares_Usuarios;