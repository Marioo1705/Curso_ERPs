-- Crear tabla Clientes
CREATE TABLE Clientes (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(15),
    dni VARCHAR(15) UNIQUE NOT NULL
);

-- Crear tabla Copia_Clientes con la misma estructura que Clientes
CREATE TABLE Copia_Clientes (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(15),
    dni VARCHAR(15) UNIQUE NOT NULL
);

-- Función para hacer inserciones
CREATE OR REPLACE FUNCTION copiar_cliente_insertar()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Copia_Clientes (id, nombre, telefono, dni)
    VALUES (NEW.id, NEW.nombre, NEW.telefono, NEW.dni);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Función para hacer borrados
CREATE OR REPLACE FUNCTION copiar_cliente_eliminar()
RETURNS TRIGGER AS $$
BEGIN
    DELETE FROM Copia_Clientes WHERE id = OLD.id;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

-- Trigger para hacer inserciones
CREATE TRIGGER trigger_copiar_cliente_insertar
AFTER INSERT ON Clientes
FOR EACH ROW
EXECUTE FUNCTION copiar_cliente_insertar();

-- Trigger para hacer borrados
CREATE TRIGGER trigger_copiar_cliente_eliminar
AFTER DELETE ON Clientes
FOR EACH ROW
EXECUTE FUNCTION copiar_cliente_eliminar();

-- Insertar un cliente
INSERT INTO Clientes (nombre, telefono, dni) VALUES ('Juan Fernández', '654987321', '12345678A');

-- Comprobar el contenido de Copia_Clientes
SELECT * FROM Copia_Clientes;

-- Eliminar un cliente
DELETE FROM Clientes WHERE dni = '12345678A';

-- Comprobar el contenido de Copia_Clientes nuevamente
SELECT * FROM Copia_Clientes;