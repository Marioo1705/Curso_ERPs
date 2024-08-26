# Ejercicios de bases de datos relacionales

Este directorio contiene una colección de ejercicios de bases de datos realizados en pgAdmin4, así como de diagramas E/R realizados en dia.

## Lista de ejercicios

### Ejercicio 1:

A partir del siguiente enunciado se desea realizar el modelo entidad-relación.

“Una empresa vende productos a varios clientes. Se necesita conocer los datos personales de los clientes (nombre, apellidos, dni, dirección y fecha de nacimiento). Cada producto tiene un nombre y un código, así como un precio unitario. Un cliente puede comprar varios productos a la empresa, y un mismo producto puede ser comprado por varios clientes.

Los productos son suministrados por diferentes proveedores. Se debe tener en cuenta que un producto sólo puede ser suministrado por un proveedor, y que un proveedor puede suministrar diferentes productos. De cada proveedor se desea conocer el NIF, nombre y dirección”.

**Archivos:** [ejercicio1.dia](./ejercicio1.dia) / [ejercicio1.sql](./ejercicio1.sql)

---

### Ejercicio 2:

A partir del siguiente enunciado se desea realizar el modelo entidad-relación. “Se desea informatizar la gestión de una empresa de transportes que reparte paquetes por toda España. Los encargados de llevar los paquetes son los camioneros, de los que se quiere guardar el dni, nombre, teléfono, dirección, salario y población en la que vive.

De los paquetes transportados interesa conocer el código de paquete, descripción,destinatario y dirección del destinatario. Un camionero distribuye muchos paquetes, y un paquete sólo puede ser distribuido por un camionero.

De las provincias a las que llegan los paquetes interesa guardar el código de provincia y el nombre. Un paquete sólo puede llegar a una provincia. Sin embargo, a una provincia pueden llegar varios paquetes.

De los camiones que llevan los camioneros, interesa conocer la matrícula, modelo, tipo y potencia. Un camionero puede conducir diferentes camiones en fechas diferentes, y un camión puede ser conducido por varios camioneros”.

**Archivos:** [ejercicio2.dia](./ejercicio2.dia) / [ejercicio2.sql](./ejercicio2.sql)

---

### Ejercicio 3:

A partir del siguiente enunciado diseñar el modelo entidad-relación. “Se desea diseñar la base de datos de un Instituto. En la base de datos se desea guardar los datos de los profesores del Instituto (DNI, nombre, dirección y teléfono). Los profesores imparten módulos, y cada módulo tiene un código y un nombre. Cada alumno está matriculado en uno o varios módulos. De cada alumno se desea guardar el nº de expediente, nombre, apellidos y fecha de nacimiento. Los profesores pueden impartir varios módulos, pero un módulo sólo puede ser impartido por un profesor. Cada curso tiene un grupo de alumnos, uno de los cuales es el delegado del grupo”.

**Archivos:** [ejercicio3.dia](./ejercicio3.dia) / [ejercicio3.sql](./ejercicio3.sql)

---

### Ejercicio 4:

A partir del siguiente supuesto diseñar el modelo entidad-relación: “Se desea diseñar una base de datos para almacenar y gestionar la información empleada por una empresa dedicada a la venta de automóviles, teniendo en cuenta los siguientes aspectos:

* La empresa dispone de una serie de coches para su venta. Se necesita conocer la matrícula, marca y modelo, el color y el precio de venta de cada coche.

* Los datos que interesa conocer de cada cliente son el NIF, nombre, dirección, ciudad y número de teléfono: además, los clientes se diferencian por un código interno de la empresa que se incrementa automáticamente cuando un cliente se da de alta en ella. Un cliente puede comprar tantos coches como desee a la empresa. Un coche determinado solo puede ser comprado por un único cliente.

* El concesionario también se encarga de llevar a cabo las revisiones que se realizan a cada coche. Cada revisión tiene asociado un código que se incrementa automáticamente por cada revisión que se haga. De cada revisión se desea saber si se ha hecho cambio de filtro, si se ha hecho cambio de aceite, si se ha hecho cambio de frenos u otros. Los coches pueden pasar varias revisiones en el concesionario”.

**Archivos:** [ejercicio4.dia](./ejercicio4.dia) / [ejercicio4.sql](./ejercicio4.sql)

---

### Ejercicio 5:

Una base de datos para una pequeña empresa debe contener información acerca de clientes, artículos y pedidos. Hasta el momento se registran los siguientes datos en documentos varios:

* Para cada cliente: Número de cliente (único), Direcciones de envío (varias por cliente), Saldo, Límite de crédito (depende del cliente, pero en ningún caso debe superar los 3.000.000 pts), Descuento.

* Para cada artículo: Número de artículo (único), Fábricas que lo distribuyen, Existencias de ese artículo en cada fábrica, Descripción del artículo.

* Para cada pedido: Cada pedido tiene una cabecera y el cuerpo del pedido. La cabecera está formada por el número de cliente, dirección de envío y fecha del pedido. El cuerpo del pedido son varias líneas, en cada línea se especifican el número del artículo pedido y la cantidad.

Además, se ha determinado que se debe almacenar la información de las fábricas. Sin embargo, dado el uso de distribuidores, se usará: Número de la fábrica (único) y Teléfono de contacto. Y se desean ver cuántos artículos (en total) provee la fábrica. También, por información estratégica, se podría incluir información de fábricas alternativas respecto de las que ya fabrican artículos para esta empresa. Nota: Una dirección se entenderá como Nº, Calle, Comuna y Ciudad. Una fecha incluye hora. Se pide hacer el diagrama ER para la base de datos que represente esta información

**Archivos:** [ejercicio5.dia](./ejercicio5.dia) / [ejercicio5.sql](./ejercicio5.sql)

---

### Ejercicio 6:

Diseñar un esquema E/R que recoja la organización de una base de datos para contener la información sobre todas las carreteras del país, sabiendo que se deben cumplir las siguientes especificaciones:

* Las carreteras están divididas en varias categorías (locales, comerciales, regionales, nacionales, autovías, etc).

* Las carreteras se dividen en tramos. Un tramo siempre pertenece a una única carretera y no puede cambiar de carretera.

* Un tramo puede pasar por varias comunas, interesando conocer el Km de la carretera y la comuna donde empieza el tramo y en donde termina.

* Para los tramos que suponen principio o final de carretera, interesa saber si es que la carretera concluye físicamente o es que confluye en otra carretera. En este caso, interesa conocer con qué carretera confluye y en qué kilómetro, tramo y comuna.

**Archivos:** [ejercicio6.dia](./ejercicio6.dia) / [ejercicio6.sql](./ejercicio6.sql)

---

### Ejercicio 7:

Obtener el diagrama E/R para un sistema de control de vuelos adaptado a las siguientes reglas de gestión (indicar las entidades, interrelaciones, etc., que se deducen de cada una de las reglas):

a) De cada aeropuerto se conoce su código, nombre, ciudad y país.

b) En cada aeropuerto pueden tomar tierra diversos modelos de aviones (el modelo de un avión determina su capacidad, es decir, el número de plazas.

c) En cada aeropuerto existe una colección de programas de vuelo. En cada programa de vuelo se indica el número de vuelo, línea aérea y días de la semana en que existe dicho vuelo.

d) Cada programa de vuelo despega de un aeropuerto y aterriza en otro.

e) Los números de vuelo son únicos para todo el mundo.

f) En cada aeropuerto hay múltiples aterrizajes y despegues. Todos los aeropuertos contemplados están en activo, es decir, tienen algún aterrizaje y algún despegue.

g) Cada vuelo realizado pertenece a un cierto programa de vuelo. Para cada vuelo se quiere conocer su fecha, plazas vacías y el modelo de avión utilizado.

h) Algunos programas de vuelo incorporan escalas técnicas intermedias entre los aeropuertos de salida y de llegada. Se entiende por escala técnica a un aterrizaje y despegue consecutivos sin altas ó bajas de pasajeros.

i) De cada vuelo se quieren conocer las escalas técnicas ordenadas asignándole a cada una un número de orden.

Por ejemplo, el programa de vuelo 555 de Iberia con vuelos los lunes y jueves despega de BarajasMadrid-España y aterriza en Caudell-Sydney-Australia teniendo las siguientes escalas técnicas: 1- LosPradiños-Sao Paulo-Brasil, 2-El Emperador-Santiago-Chile y 3-Saint Kitts-Auckland-Nueva Zelanda.

¿Que cambios se producirán en el caso anterior si en las escalas pudiesen bajar o subir pasajeros?

**Archivos:** [ejercicio7.dia](./ejercicio7.dia)

---

### Ejercicio 8:

En la biblioteca del centro se manejan fichas de autores y libros. En la ficha de cada autor se tiene el código de autor y el nombre. De cada libro se guarda el código, título,ISBN, editorial y número de página. Un autor puede escribir varios libros, y un libro puede ser escrito por varios autores. Un libro está formado por ejemplares. Cada ejemplar tiene un código y una localización. Un libro tiene muchos ejemplares y un ejemplar pertenece sólo a un libro.

Los usuarios de la biblioteca del centro también disponen de ficha en la biblioteca y sacan ejemplares de ella. De cada usuario se guarda el código, nombre, dirección y teléfono. Los ejemplares son prestados a los usuarios. Un usuario puede tomar prestados varios ejemplares, y un ejemplar puede ser prestado a varios usuarios. De cada préstamos interesa guardar la fecha de préstamo y la fecha de devolución”.

**Archivos:** [ejercicio8.dia](./ejercicio8.dia) / [ejercicio8.sql](./ejercicio8.sql)

---

### Ejercicio 9:

A partir de la BD siguiente:

```
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
```

1. Elimina el departamento con id 3
2. Actualiza el salario de los empleados del departamento de Ventas.
3. Obtener todos los proyectos en los que esté trabajando Ana García
4. Obtener todos los empleados de los departamentos que empiecen por M
5. Obtener los proyectos de los empleados de Recursos Humanos
6. Obtener los empleados que ganen más de 3500
7. Seleccionar el departamentos de los empleados Carlos Martínez y Juan Gómez


**Archivos:** [ejercicio9.dia](./ejercicio9.dia) / [ejercicio9.sql](./ejercicio9.sql)

---

### Ejercicio 10:

Se desea mantener una base de datos para una cadena de farmacias distribuida en diferentes ciudades.

Cada farmacia tiene sus empleados propios y un farmacéutico.

Por cada ciudad existe un único farmacéutico; esto es, si en una ciudad hubiera más de una farmacia, el mismo farmacéutico estaría afectado a todas las farmacias de esa ciudad. Cada farmacia tiene a su vez su stock de medicamentos.

El mismo se mantiene por medicamento y presentación. Los medicamentos se organizan según la o las monodrogas que lo componen, su presentación (por ejemplo ampollas de 5 unidades, jarabe de 100ml, inyecciones por 10 unidades, pomada 60gr, etc.), el laboratorio que lo comercializa, y su acción terapéutica (analgésico, antibiótico, etc.).

Por cada medicamento se mantiene su precio y la cantidad en existencia del mismo. El sistema deberá permitir consultar la base de datos de diferentes alternativas para medicamentos compuestos por una monodroga, medicamentos de un laboratorio, presentaciones de un medicamento, entre otras.

**Archivo:** [ejercicio10.dia](./ejercicio10.dia)

---

### Ejercicio 11:

Crea y ejecuta todo el SQL de esta BD:

[Supermercado](https://github.com/andresWeitzel/db_supermercado_PostgreSQL)

**Archivo:** [ejercicio11.sql](./ejercicio11.sql)

---

### Ejercicio 12:

Realiza el Modelo Entidad/Relación de la Base de Datos, con las siguientes especificaciones: 

* El departamento de formación de una empresa desea construir una base de datos para planificar y gestionar la formación de sus empleados. 

* La empresa organiza cursos internos de formación de los que se desea conocer el código de curso, el nombre, una descripción, el número de horas de duración y el coste del curso. 

* Un mismo curso tiene diferentes ediciones, es decir, se imparte en diferentes lugares, fechas y con diferentes horarios (intensivo, de mañana o de tarde). En una misma fecha de inicio sólo puede impartirse una edición de un mismo curso. 

* Los cursos se imparten por personal de la propia empresa. 

* De los empleados se desea almacenar su código de empleado, nombre y apellidos, dirección, teléfono, NIF (Número de Identificación Fiscal), fecha de nacimiento, nacionalidad, sexo, firma y salario, así como si está o no capacitado para impartir cursos. 

* Un mismo empleado puede ser docente en una edición de un curso y alumno en otra edición, pero nunca puede ser ambas cosas a la vez (en una misma edición de curso o lo imparte o lo recibe). 

**Archivo:** [ejercicio12.dia](./ejercicio12.dia)

---

### Ejercicio 13:

Crea los triggers necesarios y las tablas necesarias para resolver lo siguiente:

* Cuando se produce una acción (inserción o borrado) en una tabla Clientes (que contiene id, nombre, telefono y DNI) se pase la información a otra tabla que se va a llamar Copia_Clientes

**Archivo:** [ejercicio13.sql](./ejercicio12.sql)

---

### Ejercicio 14:

Dada la siguiente Base de Datos:

```
CREATE TABLE Trabajos (
    id SERIAL PRIMARY KEY,
    descripcion TEXT,
    fecha_inicio DATE,
    fecha_fin DATE,
    fk_id_lugar INT,
    fk_id_responsable INT,
    realizado BOOLEAN,
    FOREIGN KEY(fk_id_lugar) REFERENCES Lugares(id),
    FOREIGN KEY(fk_id_responsable) REFERENCES Personal(id)
);


INSERT INTO Trabajos (descripcion, fecha_inicio, fecha_fin, fk_id_lugar, fk_id_responsable)
VALUES ('Reparación de fachada', '2024-03-15', '2024-03-30', 1, 1);

INSERT INTO Trabajos (descripcion, fecha_inicio, fecha_fin, costo, lugar_id, responsable_id)
VALUES ('Reemplazo de ventanas', '2024-04-01', '2024-04-10', 2000.00, 2, 2);


CREATE TABLE Lugares (
    id SERIAL PRIMARY KEY,
    direccion VARCHAR(200),
    ciudad VARCHAR(100),
    codigo_postal VARCHAR(10)
);


INSERT INTO Lugares (direccion, ciudad, codigo_postal)
VALUES ('Calle Principal 123', 'Ciudad A', '12345');

INSERT INTO Lugares (direccion, ciudad, codigo_postal)
VALUES ('Avenida Central 456', 'Ciudad B', '67890');


CREATE TABLE Personal (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    cargo VARCHAR(100)
);


INSERT INTO Personal (nombre, cargo)
VALUES ('Juan Pérez', 'Técnico de Reparaciones');

INSERT INTO Personal (nombre, cargo)
VALUES ('María López', 'Encargada de Proyectos');


CREATE TABLE Clientes (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    telefono VARCHAR(20),
    email VARCHAR(100)
);


INSERT INTO Clientes (nombre, telefono, email)
VALUES ('Empresa XYZ', '123-456-7890', 'info@empresaxyz.com');

INSERT INTO Clientes (nombre, telefono, email)
VALUES ('Edificio ABC', '987-654-3210', 'contacto@edificioabc.com');


CREATE TABLE Materiales (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    precio_unitario NUMERIC(10, 2)
);


INSERT INTO Materiales (nombre, descripcion, precio_unitario)
VALUES ('Pintura blanca', 'Pintura de exterior para fachadas', 50.00);

INSERT INTO Materiales (nombre, descripcion, precio_unitario)
VALUES ('Cristales dobles', 'Ventanas de doble acristalamiento', 100.00);
```

1. El script tiene errores, debes solucionarlo.
2. Crea una nueva tabla CitasEvaluacion que sirva para registrar la primera cita de evaluación de un trabajo para presupuestarlo (debe figurar el lugar,  el cliente, el personal, la fecha y el presupuesto al menos)
3. Realiza lo necesario para que cuando se inserte una cita se cree un trabajo con realizado a false.
4. Configura los ON UPDATE y ON DELETE de las fks, de una manera que te parezca lógica.
5. Realiza más relaciones, de manera que se puedan saber los materiales usados en los trabajos realizados.
6. Realiza todos los cambios que consideres en la BD.
7. Realiza las siguientes consultas:
    * Obtener los datos del personal de trabajos presupuestados por encima de 1000€
    * Obtener las citas de trabajos que hayan usado "Pintura blanca"
    * Obtener los clientes de trabajos de María López.
    * Mostrar los trabajos realizados en la ciudad 'Ciudad A'.
    * Mostrar los trabajos realizados junto con la información del lugar.
    * Calcular el presupuesto total de los trabajos realizados por cada personal.
    * Contar cuántos trabajos se han realizado en cada lugar.

**Archivo:** [ejercicio14.sql](./ejercicio14.sql)

---

### Ejercicio 15:

Crea un procedimiento y una función que calculen el área de un círculo.

**Archivo:** [ejercicio15.sql](./ejercicio15.sql)

---

### Ejercicio 16:

Crea un procedimiento y una función que indiquen si un número pasado por parámetros es par o impar.

**Archivo:** [ejercicio16.sql](./ejercicio16.sql)

---

### Ejercicio 17:

Crea un procedimiento que permita devolver la suma, resta, multiplicación y división de dos números.

**Archivo:** [ejercicio17.sql](./ejercicio17.sql)

---

### Ejercicio 18:

Crea un procedimiento que permita recibir un número, sumarle 100 y devolverlo modificado.

**Archivo:** [ejercicio18.sql](./ejercicio18.sql)

---

### Ejercicio 19:

Realiza el Diagrama ER, la creación de la BD incluyendo una configuración que consideres lógica para los ON UPDATE y ON DELETE, inserts, prueba de funcionamiento de ON UPDATE y ON DELETE, a partir del siguiente enunciado:

La liga de fútbol profesional, presidida por Don Ángel María Villar, ha decidido informatizar sus instalaciones creando una base de datos para guardar la información de los partidos que se juegan en la liga.

Se desea guardar en primer lugar los datos de los jugadores. De cada jugador se quiere guardar el nombre, fecha de nacimiento y posición en la que juega (portero, defensa, centrocampista...). Cada jugador tiene un código de jugador que lo identifica de manera única.

De cada uno de los equipos de la liga es necesario registrar el nombre del equipo, nombre del estadio en el que juega, el aforo que tiene, el año de fundación del equipo y la ciudad de la que es el equipo. Cada equipo también tiene un código que lo identifica de manera única. Un jugador solo puede pertenecer a un único equipo.

De cada partido que los equipos de la liga juegan hay que registrar la fecha en la que se juega el partido, los goles que ha metido el equipo de casa y los goles que ha metido el equipo de fuera. Cada partido tendrá un código numérico para identificar el partido.

También se quiere llevar un recuento de los goles que hay en cada partido. Se quiere almacenar el minuto en el que se realizar el gol y la descripción del gol. Un partido tiene varios goles y un jugador puede meter varios goles en un partido.

Por último se quiere almacenar, en la base de datos, los datos de los presidentes de los equipos de fútbol (dni, nombre, apellidos, fecha de nacimiento, equipo del que es presidente y año en el que fue elegido presidente). Un equipo de fútbol tan sólo puede tener un presidente, y una persona sólo puede ser presidente de un equipo de la liga.

Además, debes incluir un trigger que realice una copia de seguirdad de la tabla que consideres y pruebas de funcionamiento en tu script.

Por último, realiza al menos un SELECT que use JOIN y dos que no.

**Archivos:** [ejercicio19.dia](./ejercicio19.dia) / [ejercicio19.sql](./ejercicio19.sql)

