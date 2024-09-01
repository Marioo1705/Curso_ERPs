DROP TABLE Empleados;

CREATE TABLE Empleados (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(50),
	apellidos VARCHAR (100),
	trabaja_desde INT
);

SELECT * FROM Empleados;