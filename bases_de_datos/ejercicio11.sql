-- TABLAS

drop table if exists proveedores cascade;
drop table if exists productos cascade;
drop table if exists empleados cascade;
drop table if exists ventas cascade;
drop table if exists clientes cascade;
drop table if exists compras_clientes cascade;
drop table if exists ventas_productos  cascade;
drop table if exists facturas cascade;
drop table if exists facturas_detalles cascade;

-- ENUMERADOS
-- Enumerados tabla facturas_detalles
drop type if exists tipo_factura_enum cascade;
drop type if exists tipo_pago_enum cascade;

-- Todos lo id PK auto_increment

drop sequence if exists id_sec_provee cascade;
drop sequence if exists id_sec_produc cascade;
drop sequence if exists id_sec_empl cascade;
drop sequence if exists id_sec_vent cascade;
drop sequence if exists id_sec_cli cascade;
drop sequence if exists id_sec_compr_cli cascade;
drop sequence if exists id_sec_vent_prod cascade;
drop sequence if exists id_sec_fact cascade;
drop sequence if exists id_sec_fact_det cascade;

-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------


-- =====================================
-- ======= TABLA PROVEEDORES ===========
-- =====================================

create table proveedores(
	
id int primary key,
empresa varchar(60) not null,-- Food S.A. , Alimentos Refrigerados S.A. ,  Tapalque Alimentos S.A. , etc
tipo_producto varchar(100) not null,
direccion varchar(60) not null, 
nro_tel_princ varchar(40) not null,
nro_tel_sec varchar(40),
email varchar(60) not null
);

-- ======= Restricciones Tabla proveedores ===========

-- UNIQUE ID
alter table proveedores
add constraint UNIQUE_proveedores_id
unique(id);

-- CHECK EMPRESA | TIPO_PRODUCTOS | DIRECCION | NRO_TEL_PRINC | EMAIL
alter table proveedores 
add constraint CHECK_proveedores_empresa_tipo_productos_direccion_nro_tel_princ_email
check((empresa <> '') and (tipo_producto <> '') and (direccion <> '') and 
(nro_tel_princ <> '') and (nro_tel_sec <> '') and (email <> ''));

-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------


-- ===================================
-- ======= TABLA EMPLEADOS ===========
-- ==================================

create table empleados(
	
id int primary key,
nombre varchar(30) not null,
apellido varchar(30) not null,
edad int not null,
fecha_nac date not null,
tipo_doc varchar(50) not null, -- Pasaporte, DNI, Etc
nro_doc varchar(20) not null,
cuil varchar(30) not null, -- Si no tiene DNI, cuil provisorio
direccion varchar(40) not null, 
nro_tel_princ varchar(40) not null,
nro_tel_sec varchar(40),
email varchar(40),
cargo varchar(40) not null,
antiguedad varchar(30) not null,
fecha_ingreso date not null,
salario_anual decimal(10,2) not null
);

-- ======= Restricciones Tabla Empleados ===========

-- UNIQUE ID
alter table empleados 
add constraint UNIQUE_empleados_id
unique(id);

-- UNIQUE NOMBRE/APELLIDO
alter table empleados 
add constraint UNIQUE_empleados_nombre_apellido
unique(nombre,apellido);


-- CHECK EDAD
alter table empleados 
add constraint CHECK_empleados_edad
check (edad >= 18);

-- CHECK FECHA_NACIMIENTO
alter table empleados 
add constraint CHECK_empleados_fecha_nac
check (fecha_nac < current_date);

--UNIQUE TIPO_NRO_DOC 
alter table empleados
add constraint UNIQUE_tipo_nro_doc 
unique(tipo_doc, nro_doc);


--- UNIQUE NRO_DOC_CUIL
alter table empleados 
add constraint UNIQUE_empleados_nro_doc_cuil
unique(nro_doc, cuil);


-- UNIQUE NRO_TEL
alter table empleados
add constraint UNIQUE_empleados_nro_tel_princ
unique(nro_tel_princ);


-- CHECK FECHA_INGR
alter table empleados 
add constraint CHECK_empleados_fecha_ingreso
check (fecha_ingreso <= current_date);


-- CHECK SALARIO_ANUAL
alter table empleados 
add constraint CHECK_empleados_salario_anual
check (salario_anual > 0);

-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------


-- ===================================
-- ======= TABLA CLIENTES ===========
-- ===================================

create table clientes(
	
id int primary key,
nombre varchar(30) not null,
apellido varchar(30) not null,
tipo_doc varchar(20) not null,
nro_doc varchar(20) not null,
nro_tel_princ varchar(40) not null,
nro_tel_sec varchar(40),
email varchar(40)
);

-- ======= Restricciones Tabla clientes ===========

-- UNIQUE ID
alter table clientes 
add constraint UNIQUE_clientes_id
unique(id);


-- UNIQUE NOMBRE_APELLIDO
alter table clientes 
add constraint UNIQUE_clientes_nombre_apellido
unique(nombre,apellido);


--- UNIQUE TIPO_NRO_DOCUMENTO
alter table clientes 
add constraint UNIQUE_clientes_tipo_nro_documento
unique(nro_doc, tipo_doc);



-- UNIQUE TELEFONO
alter table clientes
add constraint UNIQUE_clientes_nro_tel_princ
unique(nro_tel_princ);

-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------



-- ===================================
-- ======= TABLA FACTURAS ===========
-- ===================================

create table facturas(
	
id int primary key,
numero varchar(200) not null,-- 00008
codigo varchar(200) not null, -- 00059374
fecha date not null,-- ej '2001-10-07'
hora time not null,  -- ej '09:00:07'
importe_total decimal(10,2) not null -- + impuestos + costos + etc
);

-- ======= Restricciones Tabla facturas ===========

-- UNIQUE ID
alter table facturas 
add constraint UNIQUE_facturas_id
unique(id);


-- CHECK NUMERO Y CODIGO
alter table facturas 
add constraint CHECK_facturas_numero_codigo
check ((codigo <> '') and (numero <> ''));


-- CHECK FECHA
alter table facturas
add constraint CHECK_facturas_fecha
check ( (fecha <= current_date) or (fecha >= current_date));


-- CHECK HORA
alter table facturas
add constraint CHECK_facturas_hora
check ( (hora <= current_time) or (hora >= current_time));

--CHECK IMPORTE_TOTAL
alter table facturas
add constraint CHECK_facturas_importe_total
check(importe_total > 0);

-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ===================================
-- == TABLA FACTURAS_DETALLES ========
-- ===================================
-- Los enumerados deben estar declarados fuera de la creacion de tabla 

create type tipo_factura_enum as enum('A','B','C','D');
create type tipo_pago_enum as enum('EFECTIVO','CHEQUE','TARJETA CREDITO', 'TARJETA DEBITO');



create table facturas_detalles(
	
id int primary key,
id_factura int not null,
tipo tipo_factura_enum not null, -- A,C ETC
descr_factura varchar(100) not null,-- 
costo_asoc decimal(8,2) not null, -- servicios, comisiones, etc
iva decimal(10,2) not null,
medio_de_pago tipo_pago_enum not null,
descr_pago varchar(100) not null

);

-- ======= Restricciones Tabla facturas_detalles ===========

-- UNIQUE ID
alter table facturas_detalles
add constraint UNIQUE_facturas_detalles_id
unique(id);

-- UNIQUE ID_FACTURA
alter table facturas_detalles
add constraint UNIQUE_facturas_detalles_id_factura
unique(id_factura);

-- FK ID_FACTURA
alter table facturas_detalles 
add constraint FK_facturas_detalles_id_factura
foreign key(id_factura)
references facturas(id) on delete cascade;


-- CHECK COSTO_ASOCIADO
alter table facturas_detalles
add constraint CHECK_facturas_detalles_costo_asoc
check( costo_asoc > 0);

-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------
-- ===================================
-- ======= TABLA PRODUCTOS ===========
-- ===================================

create table productos(
	
id int primary key,
id_proveedor int not null, 
codigo varchar(100) not null,
imagen varchar(600) ,
nombre varchar(100) not null,
marca varchar(60) not null,
tipo varchar(60) not null,-- bebidas, almacen, carnes y pescados, frutas y verduras, etc 
grupo varchar(60) not null, -- Vinos, Gaseosas, etc
peso decimal(8,3) not null,
precio_unidad decimal(8,3) not null,
stock smallint not null

);



-- ======= Restricciones Tabla productos ===========

-- UNIQUE ID
alter table productos 
add constraint UNIQUE_productos_id
unique(id);

--UNIQUE CODIGO_NOMBRE
alter table productos
add constraint UNIQUE_productos_codigo_nombre
unique(codigo, nombre);


-- FK ID_PROVEEDOR
alter table productos  
add constraint FK_productos_id_proveedor
foreign key(id_proveedor)
references proveedores(id) on delete cascade;

-- UNIQUE CÓDIGO
alter table productos 
add constraint UNIQUE_productos_codigo
unique(codigo);

-- CHECK PESO
alter table productos 
add constraint CHECK_productos_peso
check(peso > 0);

-- CHECK PRECIO_UNIDAD
alter table productos 
add constraint CHECK_productos_precio_unidad
check(precio_unidad > 0);

-- CHECK STOCK
alter table productos 
add constraint CHECK_productos_stock
check(stock > 0);


-- CHECK NOMBRE | MARCA | TIPO | GRUPO 
alter table productos 
add constraint CHECK_nombre_marca_tipo_grupo
check((nombre <> '') and (marca <> '') and (tipo <> '') and (grupo <> ''));

-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------



-- ================================
-- ======= TABLA VENTAS ===========
-- ================================

create table ventas(
	
id int primary key,
id_empleado int not null,
id_factura int not null

);

-- ======= Restricciones Tabla ventas ===========

-- UNIQUE ID
alter table ventas
add constraint UNIQUE_ventas_id
unique(id);

-- FK ID_EMPLEADO
alter table ventas 
add constraint FK_ventas_id_empleado
foreign key(id_empleado)
references empleados(id) on delete cascade;

-- FK ID_FACTURA
alter table ventas 
add constraint FK_ventas_id_factura
foreign key(id_factura)
references facturas(id) on delete cascade;


-- UNIQUE ID_FACTURA
alter table ventas 
add constraint UNIQUE_ventas_id_factura
unique(id_factura);

-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------


-- ===================================
-- ======= TABLA VENTAS_PRODUCTOS ===========
-- ===================================

create table ventas_productos(
	
id int primary key,
id_venta int not null,
id_producto int not null,
cantidad int not null


);

-- ======= Restricciones Tabla ventas_productos ===========

-- UNIQUE ID
alter table ventas_productos
add constraint UNIQUE_ventas_productos_id
unique(id);

-- FK ID_VENTA
alter table ventas_productos
add constraint FK_ventas_productos_id_venta
foreign key(id_venta)
references ventas(id) on delete cascade;


-- FK ID_PRODUCTO
alter table ventas_productos 
add constraint FK_ventas_productos_id_producto
foreign key(id_producto)
references productos(id) on delete cascade;



--CHECK CANTIDAD	
alter table ventas_productos 
add constraint CHECK_ventas_productos_cantidad
check(cantidad > 0); 

-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------



-- ===================================
-- ======= TABLA COMPRAS_CLIENTES ===========
-- ===================================

create table compras_clientes(
	
id int primary key,
id_venta int not null,
id_cliente int not null
);

-- ======= Restricciones Tabla compras_clientes ===========

-- UNIQUE ID
alter table compras_clientes
add constraint UNIQUE_compras_clientes_id
unique(id);

-- FK ID_VENTA
alter table compras_clientes
add constraint FK_compras_clientes_id_venta
foreign key(id_venta)
references ventas(id) on delete cascade;


-- FK ID_CLIENTE
alter table compras_clientes
add constraint FK_compras_clientes_id_cliente
foreign key(id_cliente)
references clientes(id) on delete cascade;





-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------






-- ======== TODOS LOS ID´S PK DE LAS TABLAS COMO AUTO_INCREMENT =======


create sequence id_sec_provee ;
create sequence id_sec_produc;
create sequence id_sec_empl;
create sequence id_sec_vent ;
create sequence id_sec_cli ;
create sequence id_sec_compr_cli ;
create sequence id_sec_vent_prod;
create sequence id_sec_fact ;
create sequence id_sec_fact_det ;



alter table proveedores alter id set default nextval('id_sec_provee');
alter table productos alter id set default nextval('id_sec_produc');
alter table empleados alter id set default nextval('id_sec_empl');
alter table ventas alter id set default nextval('id_sec_vent');
alter table clientes alter id set default nextval('id_sec_cli');
alter table compras_clientes alter id set default nextval('id_sec_compr_cli');
alter table ventas_productos alter id set default nextval('id_sec_vent_prod');
alter table facturas alter id set default nextval('id_sec_fact');
alter table facturas_detalles alter id set default nextval('id_sec_fact_det');

/* ----------------------------
 * ------ SUPERMERCADO ---------
 * ----------------------------
 * 
 * 
 * ========= DML INSERTS =============
 */

-- TABLAS
delete  from compras_clientes cascade;
delete  from ventas_productos cascade;
delete  from ventas cascade;
delete  from productos cascade;
delete  from proveedores cascade;
delete  from facturas_detalles cascade;
delete  from facturas cascade;
delete  from empleados cascade;
delete  from clientes cascade;


-- Alteramos la secuencia auto incrementable id 
alter sequence id_sec_provee restart with 1;
alter sequence id_sec_produc restart with 1;
alter sequence id_sec_empl restart with 1;
alter sequence id_sec_vent restart with 1;
alter sequence id_sec_cli restart with 1;
alter sequence id_sec_compr_cli restart with 1;
alter sequence id_sec_vent_prod restart with 1;
alter sequence id_sec_fact restart with 1;
alter sequence id_sec_fact_det restart with 1;

-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ==================================
-- ======= TABLA PROVEEDORES ========
-- ==================================


select column_name, data_type, is_nullable from 
information_schema.columns where table_name = 'proveedores';

insert into proveedores(empresa, tipo_producto, direccion, nro_tel_princ, nro_tel_sec, email)values
('Nestlé', 'Bebidas, Lácteos y Productos Frescos', 'Vicente López 223', '0800-999-8100', '0800-999-8102', 'nestle.consultas@gmail.com' ),
('Huella Natural' , 'Frutas y Verduras' , 'Av. San Viroler 222' , '237635333', '-', 'huellas.consultas@gmail.com'),
('Sancor' , 'Lacteos y Productos Frecos' , 'Av. Alvarez Jonte 3544' , '011 4072-5887', '011 4072-5885', 'sancor.consultas@gmail.com'),
('Cuesta del Madero' , 'Bebidas' , 'Las Caremorias 222' , '011 4567-3744', '-', 'cuestaDelMadero.consultas@gmail.com'),
('Cunnington' , 'Bebidas' , '-' , '-', '-', '-'),
('Coca-Cola' , 'Bebidas' , 'Av. Entre Ríos 221' , '4567-0989', '4635-2843', 'coca.cola.company@gmail.com'),
('Larclas' , 'Lacteos y Productos Frecos' , 'San Rafael 345' , '011 4577-5567', '011 4577-5567', 'larclas.consultas@gmail.com'),
('Sin Especificar' , 'Sin Especificar' , 'Sin Especificar' , 'Sin Especificar', 'Sin Especificar', 'Sin Especificar');

select * from proveedores;

-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ==================================
-- ======= TABLA PRODUCTOS ===========
-- ==================================


select column_name, data_type, is_nullable from 
information_schema.columns where table_name = 'productos';

-- BEBIDAS
insert into productos(id_proveedor,codigo, imagen, nombre, marca, tipo, grupo, peso, precio_unidad, stock) values
(1,'AET78U9', 'https://http2.mlstatic.com/D_NQ_NP_792586-MLA47682120282_092021-O.webp' ,  'Agua de Mesa sin Gas Nestlé Bidón 6.3L', 'Nestlé' ,'Bebidas', 'Agua' , 6.3 , 195.60 , 500 ),
(4,'UI7R8O9', 'https://http2.mlstatic.com/D_NQ_NP_916232-MLA43940685535_102020-V.webp', 'Vino blanco Cuesta Del Madero 750 cc.', 'Cuesta del Madero' ,'Bebidas', 'Vinos' , 0.750 , 187.75 , 200 ),
(5,'YUT2563','https://ardiaprod.vteximg.com.br/arquivos/ids/189380-1000-1000/Gaseosa-Cola-Cunnington-225-Lts-_1.jpg?v=637443308163370000' , 'Gaseosa cola Cunnington 2.25L', 'Cunnington' ,'Bebidas', 'Gaseosas' , 2.25 , 90.00 , 300 ),
(6,'YUT2564', 'https://http2.mlstatic.com/D_NQ_NP_864108-MLA45225461317_032021-O.webp' , 'Gaseosa Coca Cola sabor original 1.25L', 'Coca cola' ,'Bebidas', 'Gaseosas' , 1.25 , 108.70 , 300 );


-- CARNES Y PESCADOS
insert into productos(id_proveedor,codigo, imagen , nombre, marca, tipo, grupo, peso, precio_unidad, stock) values 
(8,'COPR8O6', 'https://d3ugyf2ht6aenh.cloudfront.net/stores/861/458/products/tapa-de-asado1-5eb3e89c1d76286a6815702030218736-480-0.jpg' ,'Tapa de Asado de Novillo x kg', 'Genérico' ,'Carnes y Pescados', 'Carne Vacuna' , 1.00 , 649.00 , 100 ),
(8,'HJ8R2O6', 'https://t2.rg.ltmcdn.com/es/images/8/7/0/img_medallones_de_pollo_33078_orig.jpg' , 'Medallón de pollo rebozado crocante 400 g. x 4 uni', 'Genérico' ,'Carnes y Pescados', 'Pollo y Granja' , 0.400 , 369.00 , 100 ),
(8,'KJ8R2O3', 'https://calisa.com.ar/wp-content/uploads/2020/03/pollo_con_menudos.png' ,'Pollo entero congelado x kg.', 'Genérico' ,'Carnes y Pescados', 'Pollo y Granja' , 1.00 , 174.00 , 300 ),
(8,'JJ5R333', 'https://www.terravilena.es/wp-content/uploads/2019/11/cordero.jpg' ,'Cordero entero x kg.', 'Genérico' ,'Carnes y Pescados', 'Pollo y Granja' , 1.00 , 829.90 , 100 );


-- CONGELADOS
insert into productos(id_proveedor,codigo, imagen,  nombre, marca, tipo, grupo, peso, precio_unidad, stock) values
(8,'KLIO837', 'https://ardiaprod.vteximg.com.br/arquivos/ids/186555-1000-1000/Bocaditos-de-Pollo--Swift-380-Gr-_1.jpg?v=637427588306630000' ,'Bocaditos de Pollo Swift 380g', 'Swift' ,'Congelados', 'Nuggets y Rebozados' , 0.380 , 224.71 , 250 ),
(8,'KLK1832', 'https://jumboargentina.vtexassets.com/arquivos/ids/339785-1200-auto?v=636439393168030000&width=1200&height=auto&aspect=true' ,'Medallón de carne Swift receta especial reducido en grasas 4 u.', 'Swift' ,'Congelados', 'Hamburguesas' , 0.320 , 419.10 , 200 ),
(8,'DJK7365', 'https://walmartar.vteximg.com.br/arquivos/ids/909547-292-292/Helado-Frigor-Dulce-De-Leche-Frutilla-Chocolate-1-Kg-1-484640.jpg?v=637715616644530000' ,'Helado Frigor dulce de leche vainilla chocolate balde 1 kg.', 'Frigor' ,'Congelados', 'Helados' , 1.00 , 850.00 , 100 ),
(8,'DJK7366', 'https://alohamaxikiosco.com.ar/wp-content/uploads/2020/08/postre-bon-o-bon-2.jpg','Postre helado Bon O Bon dulce de leche, americana y chocolate 637 g.', 'Bon o Bon' ,'Congelados', 'Helados' , 0.637 , 529.50 , 100 );



--LACTEOS Y PRODUCTOS FRESCOS
insert into productos(id_proveedor,codigo, imagen, nombre, marca, tipo, grupo, peso, precio_unidad, stock) values
(8,'LL8JI9D', 'https://jumboargentina.vtexassets.com/arquivos/ids/641230-1200-auto?v=637557810525130000&width=1200&height=auto&aspect=true' ,'Leche Entera Larga Vida Apóstoles 1L', 'Apóstoles' ,'Lácteos y Productos Frescos', 'Leches' , 1.00 , 67.15 , 500 ),
(7,'LL8JI10', 'https://carrefourar.vtexassets.com/arquivos/ids/204565/7794710010406_02.jpg?v=637592985140930000' ,'Leche Entera uat Larclas tetra 1L', 'Larclas' ,'Lácteos y Productos Frescos', 'Leches' , 1.00 , 70.85 , 500 ),
(3,'HJA2234', 'https://arikiosco.tiendalite.com/images/products/500/86749394-1266.png' ,'Yogur bebible entero Sancor yogs mult. vainilla 1 l.', 'Sancor' ,'Lácteos y Productos Frescos', 'Yogures' , 1.00 , 226.80 , 300 ),
(3,'HJA2235', 'https://tunovo.com.ar/wp-content/uploads/7790080064223_01.jpg' ,'Yogur bebible entero Sancor yogs mult. frutilla 1 l.', 'Sancor' ,'Lácteos y Productos Frescos', 'Yogures' , 1.00 , 230.80 , 300 );



--FRUTAS Y VERDURAS
insert into productos(id_proveedor,codigo, imagen, nombre, marca, tipo, grupo, peso, precio_unidad, stock) values
(2,'GHT7729', 'https://http2.mlstatic.com/D_NQ_NP_999322-MLA46496226700_062021-O.webp' ,'Mandarina Nova Huella Natural', 'Huella Natural' ,'Frutas y Verduras', 'Frutas' , 1.00 , 70.85 , 300 ),
(8,'GHJ7711', 'https://http2.mlstatic.com/D_NQ_NP_914650-MLA31037009580_062019-O.webp' ,'Cebolla x kg', 'Genérico' ,'Frutas y Verduras', 'Verduras' , 1.00 , 48.00 , 300 ),
(2,'LLL7465', 'https://http2.mlstatic.com/D_NQ_NP_678730-MLA47346843510_092021-O.webp' ,'Melon amarillo Huella Natural x kg.', 'Huella Natural' ,'Frutas y Verduras', 'Frutas' , 1.00 , 140.00 , 200 ),
(8,'EEE8277', 'https://elegifruta.com.ar/onepage/wp-content/uploads/2017/07/manzana_roja.jpg' ,'Manzana roja x kg.', 'Genérico' ,'Frutas y Verduras', 'Frutas' , 1.00 , 159.00 , 100 );



select * from productos;

-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ==================================
-- ======= TABLA EMPLEADOS ===========
-- ==================================


select column_name, data_type, is_nullable from 
information_schema.columns where table_name = 'empleados';

select * from empleados;

-- Cajeros/as 
insert into empleados (nombre, apellido, edad, fecha_nac, tipo_doc, nro_doc, cuil, direccion
, nro_tel_princ, nro_tel_sec, email, cargo, antiguedad, fecha_ingreso, salario_anual) values
('Macarena', 'Gutierrez', 32, '1989/04/06', 'DNI', '334565243', '12-334565243-7', 'Av. Gaona 352', '1164575222', '1164575222'
, 'maca.gutieerez756@hotmail.com', 'Cajera', '2 años' , '2019/03/01', 45000),
('Damian', 'gutierrez', 39, '1978/09/14', 'DNI', '33869556', '20-33869556-3', 'Av Alberdi 05', '+5491176844456', '+5491157684445'
, 'damian_gut.756@gmail.com', 'Cajero', '3 años y 6 meses', '2018/3/4', 65000);


-- Repositores/as
insert into empleados (nombre, apellido, edad, fecha_nac, tipo_doc, nro_doc, cuil, direccion
, nro_tel_princ, nro_tel_sec, email, cargo, antiguedad, fecha_ingreso, salario_anual) values
('Marcos', 'Castro', 45, '1971/05/01', 'DNI', '48967156','33489671564', 'Figueroa Alcorta 22', '1178654356', '+5491178654356'
, 'marcosCastro2002_lop@hotmail.com', 'Repositor', '4 añs', '2017/09/6', 70000),
('Marcelo', 'Perez', 28, '1988/03/17', 'DNI', '39345679', '12-39345679-9', 'Carabobo 06', '+5491138765433', '-'
, 'MarceloPerez@gmail.com', 'Repositor', '9 meses', '2019/04/14', 56000);


-- Gerentes/as
insert into empleados (nombre, apellido, edad, fecha_nac, tipo_doc, nro_doc, cuil, direccion
, nro_tel_princ, nro_tel_sec, email, cargo, antiguedad, fecha_ingreso, salario_anual) values
('Marcelo', 'Castro', 28, '1989/04/06', 'DNI', '39886386', '14-39886386-5', 'Los Patos 123', '+549118567453', '+549118567453'
, 'marcelocastro.746_jj@gmail.com', 'Gerente', '2 años y 5 meses', '2019/02/11', 120000);

-- Stack Tecnico
insert into empleados (nombre, apellido, edad, fecha_nac, tipo_doc, nro_doc, cuil, direccion
, nro_tel_princ, nro_tel_sec, email, cargo, antiguedad, fecha_ingreso, salario_anual) values
('José', 'bastituta', 34, '1988/09/07', 'DNI', '409876546', '12409876546-0', 'San Acrosio 15781', '1157670000', '+5491157670000'
, 'joseBastituta_88@gmail.com', 'Vendedor(Marketing)', '10 meses', '2020/07/12', 65000),
('Juan', 'Contreras', 28, '1992/9/9', 'DNI', '37998637', '30-37998637-9', 'Av. Las Heras 7567', '1145367655', '-' 
, 'juanContreras.iptre@gmail.com', 'Programador Web', '4 meses' , '2018/4/2', 87000),
('Carlos', 'Gustamante', 31, '1982/04/03', 'DNI', '290076726', '11-290076726-2', 'Av. Figueroa Alcorta 22', '1145639987', '-'
, 'c.gustamante@gmail.com', 'Admin Bases de Datos', '1 año y medio', '2019/12/02', 100000);

-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ==================================
-- ======= TABLA CLIENTES ===========
-- ==================================


select column_name, data_type, is_nullable from 
information_schema.columns where table_name = 'clientes';

select * from clientes;

insert into clientes (nombre, apellido, tipo_doc, nro_doc, nro_tel_princ
, nro_tel_sec, email) values
('Martin','Gutierrez','DNI','4598676890','+549116574839','-','martin.gutierrez@gmail.com'),
('Sofia','Aguilar','DNI','3494758583','+549116475834','-','sofi-aguilar-cordoba@hotmail.com'),
('Ramiro','Martinez','DNI','37849567333','-','-','ramiroMartinez3564@gmail.com');

-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ==================================
-- ======= TABLA FACTURAS ===========
-- ==================================


select column_name, data_type, is_nullable from 
information_schema.columns where table_name = 'facturas';

select * from facturas;

insert into facturas(numero, codigo, fecha, hora, importe_total) values
( '000056','000067352',current_date,current_time, 3000),
( '000057','000067673',current_date,current_time, 1200),
( '000058','000067645',current_date,current_time, 3400);


-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ===========================================
-- ======= TABLA FACTURAS_DETALLES ===========
-- ===========================================


select column_name, data_type, is_nullable from 
information_schema.columns where table_name = 'facturas_detalles';

select * from facturas_detalles;

insert into facturas_detalles(id_factura , tipo , descr_factura , costo_asoc , iva , medio_de_pago ,descr_pago) values
(1, 'B' , 'Consumidor Final' , 86 , 8, 'EFECTIVO', 'Un Solo Pago'),
(2, 'B' , 'Consumidor Final' , 86 , 8 , 'TARJETA CREDITO','Un solo Pago'),
(3, 'B' , 'Consumidor Final' , 86 , 8 , 'TARJETA DEBITO','Un solo Pago');





-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ==================================
-- ======= TABLA VENTAS ===========
-- ==================================


select column_name, data_type, is_nullable from 
information_schema.columns where table_name = 'ventas';

select * from ventas;

insert into ventas(id_empleado, id_factura ) values 
(1,1),
(1,2),
(2,3);



-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ==========================================
-- ======= TABLA VENTAS_PRODUCTOS ===========
-- ==========================================


select column_name, data_type, is_nullable from 
information_schema.columns where table_name = 'ventas_productos';

select * from ventas_productos;

insert into ventas_productos(id_venta, id_producto, cantidad) values 
(1,1,4),
(1,2,5),
(1,3,5),
(2,2,2),
(2,3,4),
(2,5,5);


-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ==========================================
-- ======= TABLA COMPRAS_CLIENTES ===========
-- ==========================================


select column_name, data_type, is_nullable from 
information_schema.columns where table_name = 'compras_clientes';

select * from compras_clientes;

insert into compras_clientes(id_venta,  id_cliente) values 
(1,1),
(2,2);

/* ----------------------------
 * ------ SUPERMERCADO ---------
 * ----------------------------
 * 
 * 
 * ========= DML UPDATES =============
 */



-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ==================================
-- ======= TABLA PROVEEDORES ========
-- ==================================

select * from proveedores;

-- Actualizamos un registro completo
update proveedores set 
direccion='Geneal San Vicente 397'
, nro_tel_princ ='6374-648'
,email='consultas.cunnington.2022@gmail.com'
where id = 5;


-- Depuramos (TIPOGRAFIA) todos los registros del campo empresa
update proveedores set empresa = initcap(empresa);
	
-- Depuramos (TIPOGRAFIA) todos los registros del campo tipo_producto 
update proveedores set tipo_producto  = initcap(tipo_producto);
	
-- Depuramos (QUITAMOS COMAS) todos los registros del campo tipo_producto 
update proveedores set tipo_producto  = replace(tipo_producto, ',' , '-');

-- Depuramos (QUITAMOS las Y) todos los registros del campo tipo_producto 
update proveedores set tipo_producto  = replace(tipo_producto, 'Y' , '-');
	
select * from proveedores;

-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ==================================
-- ======= TABLA PRODUCTOS ========
-- ==================================

select * from productos;



-- Actualizamos los precios de las frutas segun el id del Proveedor
update productos set precio_unidad = (precio_unidad + 20) 
where ((id_proveedor = 8) and (grupo='Frutas'));  


-- Actualizacion de precios en base a su codigo
update productos set precio_unidad = 240
where codigo = 'AET78U9';


--Depuramos los nombres
update productos set nombre  = initcap(nombre);

-- Depuramos (AGREGAMOS nro kilogramo) en todos los registros necesarios 
update productos set nombre  = replace(nombre, 'Kg' , '1Kg');

-- Depuramos (CAMBIAMOS X de kg) en todos los registros necesarios 
update productos set nombre  = replace(nombre, 'X' , 'x');
 

-- Depuramos (CAMBIAMOS  l de Litros) en todos los registros necesarios 
update productos set nombre  = replace(nombre, '1l' , '1L');
 

--Cambiamos el Stock segun marca y gruopo
update productos set stock = 120 
where ((marca='Cuesta del Madero') and (grupo='Vinos'));


select * from productos;





-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ==================================
-- ======= TABLA EMPLEADOS ========
-- ==================================

select * from empleados;

--Depuramos los nombres
update empleados set nombre  = initcap(nombre);

--Depuramos los apellidos
update empleados set apellido  = initcap(apellido);


--Actualizamos antiguedad y sueldo de un empleado
update empleados set antiguedad='4 años y 6 meses', salario_anual = 67000
where ((nombre = 'Marcos') and (apellido='Castro') and (edad='45'));


--Actualizamos correo de un empleado
update empleados set email = 'c.gh.gustamante@gmail.com'
where ((nombre = 'Carlos') and (cargo like '%Bases de Datos%'));


select * from empleados;

-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ==================================
-- ======= TABLA CLIENTES ========
-- ==================================

select * from clientes;

-- Actualizamos nro tel principal
update clientes set nro_tel_princ = '+5498272643'
where ((nombre='Ramiro')and(nro_doc='37849567333'));


--Actualizamos un apellido
update clientes set apellido = 'Aguleña'
where ((nombre='Sofia')and(nro_doc='3494758583'));




select * from clientes;


-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ==================================
-- ======= TABLA FACTURAS ========
-- ==================================

select * from facturas;

--Modificamos la fecha y hora segun el codigo
update facturas set fecha = current_date, hora = current_time 
where numero = '000056';
 

-- Modificamos el importe segun el codigo de factura, agregamos iva
update facturas set importe_total = (importe_total + ((importe_total*8)/100));

select * from facturas;





-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ========================================
-- ======= TABLA FACTURAS_DETALLES ========
-- ========================================

select * from facturas_detalles;

--Modificamos la descripcion del pago segun el Id de la factura
update facturas_detalles set descr_pago = 'Un solo pago en efectivo'
where id_factura = 1;


-- Aumentamos un 0.45% el costo asociado
update facturas_detalles set costo_asoc = costo_asoc + ((costo_asoc*0.45)/100);



select * from facturas_detalles;

/* ----------------------------
 * ------ SUPERMERCADO ---------
 * ----------------------------
 * 
 * 
 * ========= DML DELETES =============
 */





-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ==================================
-- ======= TABLA PROVEEDORES ========
-- ==================================

select * from proveedores;

delete from proveedores where id = 5;


insert into proveedores(empresa, tipo_producto, direccion, nro_tel_princ, nro_tel_sec, email)values
('Cunnington' , 'Bebidas' , '-' , '-', '-', '-');

update proveedores set 
direccion='Geneal San Vicente 397'
, nro_tel_princ ='6374-648'
,email='consultas.cunnington.2022@gmail.com'
where id = 9;

select * from proveedores;





-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ==================================
-- ======= TABLA PRODUCTOS ========
-- ==================================

select * from productos;

--Eliminamos el Producto cuya marca sea Apóstoles y cuyo grupo sea Leches
delete from productos where ((marca ='Apóstoles')and (grupo = 'Leches'));



--LACTEOS Y PRODUCTOS FRESCOS
insert into productos(id_proveedor,codigo, imagen, nombre, marca, tipo, grupo, peso, precio_unidad, stock) values
(8,'LL8JI9D', 'https://jumboargentina.vtexassets.com/arquivos/ids/641230-1200-auto?v=637557810525130000&width=1200&height=auto&aspect=true' ,'Leche Entera Larga Vida Apóstoles 1L', 'Apóstoles' ,'Lácteos y Productos Frescos', 'Leches' , 1.00 , 67.15 , 500 );


select * from productos;




-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ==================================
-- ======= TABLA EMPLEADOS ========
-- ==================================

select * from empleados;


--Eliminamos el empleado cuyo nro_doc sea 39345679
delete from empleados where nro_doc = '39345679';



insert into empleados (nombre, apellido, edad, fecha_nac, tipo_doc, nro_doc, cuil, direccion
, nro_tel_princ, nro_tel_sec, email, cargo, antiguedad, fecha_ingreso, salario_anual) values
('Marcelo', 'Perez', 28, '1988/03/17', 'DNI', '39345679', '12-39345679-9', 'Carabobo 06', '+5491138765433', '-'
, 'MarceloPerez@gmail.com', 'Repositor', '9 meses', '2019/04/14', 56000);


select * from empleados;



-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------

-- ==================================
-- ======= TABLA CLIENTES ========
-- ==================================

select * from clientes;


--Eliminamos un empleado por su nombre y nro de doc
delete from clientes where (nombre='Sofia' and nro_doc='3494758583');




insert into clientes (nombre, apellido, tipo_doc, nro_doc, nro_tel_princ
, nro_tel_sec, email) values
('Sofia','Aguilar','DNI','3494758583','+549116475834','-','sofi-aguilar-cordoba@hotmail.com');





-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ===============================
-- ======= TABLA FACTURAS ========
-- ===============================

select * from facturas;



--Eliminamos una factura por su numero
delete from facturas where (numero='000056');


insert into facturas(numero, codigo, fecha, hora, importe_total) values
('000058','000068695',current_date,current_time, 8900);



-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------

-- ========================================
-- ======= TABLA FACTURAS_DETALLES ========
-- ========================================

select * from facturas_detalles;

--Eliminamos el detalle de factura por su id de factura
delete from facturas_detalles where (id_factura=2);

select * from facturas;

insert into facturas_detalles(id_factura , tipo , descr_factura , costo_asoc , iva , medio_de_pago ,descr_pago) values
(2, 'B' , 'Consumidor Final' , 86 , 8 , 'TARJETA CREDITO','Un solo Pago');


select * from facturas_detalles;

/* ----------------------------
 * ------ SUPERMERCADO ---------
 * ----------------------------
 * 
 * 
 * ========= QUERIES =============
 */
 
 -- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ==================================
-- ======= TABLA PROVEEDORES ========
-- ==================================

select * from proveedores;

-- Proveedores ordenados por Empresa 
select * from proveedores order by empresa;

-- Proveedores cuyos Productos sean Bebidas
select * from proveedores where 
tipo_producto like '%Bebidas%' or 
tipo_producto like '%bebidas%';

-- Productos que sean Verduras o Frutas
select * from proveedores where 
tipo_producto like '%Verduras%' or
tipo_producto like '%Frutas%';

-- Productos que sean Lacteos
select * from proveedores where 
tipo_producto like '%Lacteos%';

-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ================================
-- ======= TABLA PRODUCTOS ========
-- ================================

select * from productos;
select * from proveedores;



--Todos los Productos cuyo peso sea 1 kilo o menos
select * from productos where peso <= 1;

--Todos los Productos cuyo peso sea mayor a 1 kilo
select * from productos where peso > 1;



--Productos Ordenados por Id del Proveedor
select * from productos order by id_proveedor;


--Productos cuyo Proveedor sea Nestle
select * from productos join proveedores 
on productos.id_proveedor = proveedores.id 
where proveedores.empresa = 'Nestlé';


--Productos cuyo Proveedor sea Huella Natural
select * from productos join proveedores 
on productos.id_proveedor = proveedores.id 
where proveedores.empresa = 'Huella Natural';


--Productos cuyo Proveedor sea Huella Natural con stock menor de 100
select * from productos join proveedores 
on productos.id_proveedor = proveedores.id 
where ((proveedores.empresa = 'Huella Natural') and 
(productos.stock <= 100));


--Productos cuyo Proveedor sea Huella Natural con stock mayor de 100
select * from productos join proveedores 
on productos.id_proveedor = proveedores.id 
where ((proveedores.empresa = 'Huella Natural') and 
(productos.stock >= 100));


--Productos cuyo Proveedor no tenga especificacion con stock mayor a 200
select * from productos join proveedores 
on productos.id_proveedor = proveedores.id 
where ((proveedores.empresa = 'Sin Especificar') and 
(productos.stock >= 200));

-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ================================
-- ======= TABLA EMPLEADOS ========
-- ================================

select * from empleados;


--Empleados ordenados de forma creciente segun su Antiguedad, solo nombre,
-- apellido y antiguedad
select nombre, apellido, antiguedad from empleados 
order by antiguedad like '%años%';



--Empleados ordenados de forma decreciente segun su Antiguedad , solo nombre,
-- apellido y antiguedad
select nombre, apellido, antiguedad from empleados 
order by antiguedad like '%años y %' desc ;

--Empleados ordenados de forma decreciente segun su Antiguedad , solo nombre,
-- apellido y antiguedad
select nombre, apellido, cargo, antiguedad, salario_anual  from empleados 
order by antiguedad like '%años y %' desc ;


--Empleados Ordenados segun el salario, solo manejo de campos necesarios
select nombre, apellido, cargo, antiguedad, salario_anual
from empleados order by salario_anual;


-- Empleados ordenados por fecha de nacimiento
select nombre, apellido, edad, fecha_nac, cargo, antiguedad, salario_anual
from empleados order by fecha_nac ;


select * from empleados;

-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ================================
-- ======= TABLA CLIENTES ========
-- ================================

select * from clientes;


--Clientes ordenados por nro de doc
select * from clientes order by nro_doc;


--Clientes que manejen hotmail
select * from clientes  where email like '%hotmail%' order by nombre;

-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ================================
-- ======= TABLA FACTURAS ========
-- ================================

select * from facturas;


--Facturas ordenadas segun numero
select * from facturas order by numero;

--Facturas ordenadas segun numero donde el importe sea menor a $2000
select * from facturas where importe_total <= 2000 order by numero;


--Facturas ordenadas segun numero donde el importe sea mayor a $1000
select * from facturas where importe_total > 1000 order by numero;



--Facturas Ordenadas por fecha y hora
select * from facturas order by fecha, hora;



--Facturas Ordenadas por fecha y hora ultimas
select * from facturas order by fecha, hora desc;








-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ========================================
-- ======= TABLA FACTURAS_DETALLES ========
-- ========================================


select * from facturas_detalles;


--Facturas Detalles Ordenadas por tipo
select * from facturas_detalles order by tipo;


--Facturas Detalles Ordenadas por id de factura
select * from facturas_detalles order by id_factura;

