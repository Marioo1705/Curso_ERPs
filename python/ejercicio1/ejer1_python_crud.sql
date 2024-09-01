--DROP TABLE Clientes CASCADE;
--DROP TABLE Proveedores CASCADE;
--DROP TABLE Productos CASCADE;
--DROP TABLE ClientesProductos CASCADE;

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
CREATE TABLE ClientesProductos (
	id SERIAL PRIMARY KEY,
	fk_id_producto INT REFERENCES Productos(id),
	fk_id_cliente INT REFERENCES Clientes(id),
	FOREIGN KEY (fk_id_producto) REFERENCES Productos(id),
	FOREIGN KEY (fk_id_cliente) REFERENCES Clientes(id)
);

-- SELECTS CRUD

SELECT * FROM Clientes;
SELECT * FROM Proveedores;
SELECT * FROM Productos;
SELECT * FROM ClientesProductos;

SELECT c.nombre AS nombre_cliente, c.apellidos AS apellidos_cliente, p.nombre AS nombre_producto_comprado, 
p.precio_unitario FROM Clientes c
JOIN ClientesProductos cp ON c.id = cp.fk_id_cliente
JOIN Productos p ON cp.fk_id_producto = p.id;

SELECT pr.nombre AS nombre_proveedor, pr.nif, pr.direccion, p.nombre AS nombre_producto, p.codigo
FROM Proveedores pr
JOIN Productos p ON pr.id = p.fk_id_proveedor;

SELECT c.nombre AS nombre_cliente, c.apellidos AS apellidos_cliente, SUM(p.precio_unitario) AS importe_total_compras
FROM Clientes c
JOIN ClientesProductos cp ON c.id = cp.fk_id_cliente
JOIN Productos p ON cp.fk_id_producto = p.id
GROUP BY c.nombre, c.apellidos;