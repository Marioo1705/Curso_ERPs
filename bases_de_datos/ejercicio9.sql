CREATE TABLE Departamentos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE Empleados (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    salario DECIMAL(10, 2),
    fk_departamento INT,
    FOREIGN KEY (fk_departamento) REFERENCES Departamentos(id)
);

CREATE TABLE Proyectos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT
);

CREATE TABLE Asignaciones (
    id SERIAL PRIMARY KEY,
    fk_empleado INT,
    fk_proyecto INT,
    FOREIGN KEY (fk_empleado) REFERENCES Empleados(id),
    FOREIGN KEY (fk_proyecto) REFERENCES Proyectos(id)
);

-- Inserts en Departamentos
INSERT INTO Departamentos (nombre) VALUES
('Ventas'),
('Marketing'),
('Desarrollo'),
('Recursos Humanos');

-- Inserts en Empleados
INSERT INTO Empleados (nombre, apellido, salario, fk_departamento) VALUES
('Juan', 'Gómez', 3500, 3),
('María', 'López', 3200, 1),
('Carlos', 'Martínez', 3800, 3),
('Laura', 'Pérez', 3000, 2),
('Ana', 'García', 4000, 3),
('Pedro', 'Rodríguez', 2900, 4);

-- Inserts en Proyectos
INSERT INTO Proyectos (nombre, descripcion) VALUES
('Proyecto A', 'Desarrollo de nueva aplicación móvil'),
('Proyecto B', 'Campaña de publicidad en redes sociales'),
('Proyecto C', 'Actualización del sitio web corporativo'),
('Proyecto D', 'Implementación de políticas de bienestar laboral');

-- Inserts en Asignaciones
INSERT INTO Asignaciones (fk_empleado, fk_proyecto) VALUES
(1, 1),
(2, 2),
(3, 1),
(4, 3),
(5, 4),
(6, 3);

SELECT * FROM Departamentos;
SELECT * FROM Empleados;
SELECT * FROM Proyectos;
SELECT * FROM Asignaciones;

-- 1. Elimina el departamento con id 3
UPDATE Empleados 
SET fk_departamento = 1
WHERE fk_departamento = 3;

DELETE FROM Departamentos
WHERE id = 3;

-- 2. Actualiza el salario de los empleados del departamento de Ventas
UPDATE Empleados
SET salario = (salario + 500)
WHERE fk_departamento IN (SELECT id FROM Departamentos WHERE nombre = 'Ventas');

-- 3. Obtener todos los proyectos en los que esté trabajando Ana García
SELECT *
FROM Proyectos
WHERE id IN (SELECT fk_proyecto FROM Asignaciones WHERE fk_empleado IN (SELECT id FROM Empleados WHERE nombre = 'Ana' AND apellido = 'García'));

-- 4. Obtener todos los empleados de los departamentos que empiecen por M
SELECT nombre, apellido
FROM Empleados
WHERE fk_departamento IN (SELECT id FROM Departamentos WHERE nombre LIKE 'M%');

-- 5. Obtener los proyectos de los empleados de Recursos Humanos
SELECT *
FROM Proyectos
WHERE id IN (SELECT fk_proyecto FROM Asignaciones WHERE fk_empleado IN (SELECT id FROM Empleados WHERE fk_departamento IN (SELECT id FROM Departamentos WHERE nombre = 'Recursos Humanos')));

-- 6. Obtener los empleados que ganen más de 3500
SELECT nombre, apellido
FROM Empleados
WHERE salario > 3500;

-- 7. Seleccionar los departamentos de los empleados Carlos Martínez y Juan Gómez
Select nombre
FROM Departamentos
WHERE id IN (SELECT fk_departamento FROM Empleados WHERE (nombre = 'Carlos' AND apellido = 'Martínez') OR (nombre = 'Juan' AND apellido = 'Gómez'));