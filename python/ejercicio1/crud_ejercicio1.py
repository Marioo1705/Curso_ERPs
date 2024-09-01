import psycopg2

def conectar():
    conexion = 0
    try:
        conexion = psycopg2.connect(user="postgres",
								    password="root",
								    host="127.0.0.1",
								    port="5432",
								    database="ejer1_python_crud")
    except (Exception, psycopg2.Error) as error:
        print("Error: ", error)
    
    return conexion

def opciones1():
    print('\n1. Insertar en una tabla')
    print('2. Borrar en una tabla')
    print('3. Actualizar datos en una tabla')
    print('4. Consultar en una tabla')
    print('5. Salir')
    return int(input("Elige una opción: "))
    
def opciones2():
    print('\n1. Clientes')
    print('2. Productos')
    print('3. Proveedores')
    print('4. Compras')
    print('5. Salir')
    return int(input("Elige una tabla: "))
    
def opciones3():
    print('\n1. Consultar datos de clientes')
    print('2. Consultar datos de productos')
    print('3. Consultar datos de proveedores')
    print('4. Consultar datos de compras')
    print('5. Consultar datos de clientes, productos comprados y precio de los mismos')
    print('6. Consultar datos de proveedores y productos que suministran')
    print('7. Consultar datos de clientes y el importe total de las compras realizadas')
    print('8. Salir')
    return int(input("Elige una consulta: "))
    
def insertar_datos(tabla, datos):
    conexion = conectar()
    cursor = conexion.cursor()

    if tabla == 1:  # Clientes
        postgres_insert_query = """INSERT INTO Clientes (nombre, apellidos, dni, direccion, fecha_nacimiento) VALUES (%s, %s, %s, %s, %s)"""
    if tabla == 2:  # Productos
        postgres_insert_query = """INSERT INTO Productos (nombre, codigo, precio_unitario, fk_id_proveedor) VALUES (%s, %s, %s, %s)"""
    if tabla == 3:  # Proveedores
        postgres_insert_query = """INSERT INTO Proveedores (nombre, direccion, nif) VALUES (%s, %s, %s)"""
    if tabla == 4:  # ClientesProductos
        postgres_insert_query = """INSERT INTO ClientesProductos (fk_id_cliente, fk_id_producto) VALUES (%s, %s)"""

    cursor.execute(postgres_insert_query, datos)
    conexion.commit()

    print("Datos insertados correctamente en la tabla.")

def obtener_datos_insertar(tabla):
    if tabla == 1:  # Clientes
        return [input("Introduce el nombre del cliente: "), 
                input("Introduce los apellidos del cliente: "), 
                input("Introduce el dni del cliente: "), 
                input("Introduce la dirección del cliente: "), 
                input("Introduce la fecha de nacimiento del cliente en el formato aaaa-mm-dd: ")]
    if tabla == 2:  # Productos
        return [input("Introduce el nombre del producto: "), 
                input("Introduce el código del producto: "), 
                float(input("Introduce el precio unitario del producto: ")), 
                int(input("Introduce el id del proveedor del producto: "))]
    if tabla == 3:  # Proveedores
        return [input("Introduce el nombre del proveedor: "), 
                input("Introduce la dirección del proveedor: "), 
                input("Introduce el nif del proveedor: ")]
    if tabla == 4:  # ClientesProductos
        return [int(input("Introduce el id del cliente: ")), 
                int(input("Introduce el id del producto: "))]

def borrar_datos(tabla, id_tabla):
    conexion = conectar()
    cursor = conexion.cursor()

    if tabla == 1:  # Clientes
        postgres_delete_query = """DELETE FROM Clientes WHERE id = %s"""
    if tabla == 2:  # Productos
        postgres_delete_query = """DELETE FROM Productos WHERE id = %s"""
    if tabla == 3:  # Proveedores
        postgres_delete_query = """DELETE FROM Proveedores WHERE id = %s"""
    if tabla == 4:  # ClientesProductos
        postgres_delete_query = """DELETE FROM ClientesProductos WHERE id = %s"""

    cursor.execute(postgres_delete_query, (id_tabla,))
    conexion.commit()

    print("Registro borrado correctamente de la tabla.")

def obtener_datos_borrar(tabla):
    return int(input("Introduce el id del registro que quieres borrar: "))

def actualizar_registro():
    return int(input("\nIntroduce el id del registro a actualizar: "))
    
def opciones_actualizar(tabla):
    if tabla == 1: # Clientes
        print('\n1. Nombre')
        print('2. Apellidos')
        print('3. DNI')
        print('4. Dirección')
        print('5. Fecha de nacimiento') 
    if tabla == 2: # Productos
        print('\n1. Nombre')
        print('2. Código')
        print('3. Precio unitario')
        print('4. Proveedor')
    if tabla ==  3: # Proveedores
        print('\n1. Nombre')
        print('2. NIF')
        print('3. Dirección')
    if tabla == 4: # ClientesProductos
        print('\n1. Cliente que hace la compra')
        print('2. Producto comprado')

    return int(input("Elige la opción que quieres actualizar: "))

def actualizar_datos(tabla, campo, newDatos, id_registro):
    conexion = conectar()
    cursor = conexion.cursor()

    if tabla == 1: # Actualizar clientes
        if campo == 1:
            postgres_update_query = """UPDATE Clientes SET nombre = %s WHERE id = %s"""
        if campo == 2:
            postgres_update_query = """UPDATE Clientes SET apellidos = %s WHERE id = %s"""
        if campo == 3:
            postgres_update_query = """UPDATE Clientes SET dni = %s WHERE id = %s"""
        if campo == 4:
            postgres_update_query = """UPDATE Clientes SET direccion = %s WHERE id = %s"""
        if campo == 5:
            postgres_update_query = """UPDATE Clientes SET fecha_nacimiento = %s WHERE id = %s"""

    if tabla == 2: # Actualizar productos
        if campo == 1:
            postgres_update_query = """UPDATE Productos SET nombre = %s WHERE id = %s"""
        if campo == 2:
            postgres_update_query = """UPDATE Productos SET codigo = %s WHERE id = %s"""
        if campo == 3:
            postgres_update_query = """UPDATE Productos SET precio_unitario = %s WHERE id = %s"""
        if campo == 4:
            postgres_update_query = """UPDATE Productos SET fk_id_proveedor = %s WHERE id = %s"""

    if tabla == 3: # Actualizar proveedores
        if campo == 1:
            postgres_update_query = """UPDATE Proveedores SET nombre = %s WHERE id = %s"""
        if campo == 2:
            postgres_update_query = """UPDATE Proveedores SET nif = %s WHERE id = %s"""
        if campo == 3:
            postgres_update_query = """UPDATE Proveedores SET direccion = %s WHERE id = %s"""

    if tabla == 4: # Actualizar compras
        if campo == 1:
            postgres_update_query = """UPDATE ClientesProductos SET fk_id_cliente = %s WHERE id = %s"""
        if campo == 2:
            postgres_update_query = """UPDATE ClientesProductos SET fk_id_producto = %s WHERE id = %s"""
    
    cursor.execute(postgres_update_query, (newDatos, id_registro))
    conexion.commit()

    print("Datos actualizados correctamente en la tabla.")

def obtener_datos_actualizar():
    return input("\nIntroduce el nuevo valor del registro a actualizar: ")

def consulta(opcion3):
    conexion = conectar()
    cursor = conexion.cursor()

    if opcion3 == 1:
        print('\nConsulta de datos de clientes') 
        postgres_select_Query = "SELECT * FROM Clientes"
        cursor.execute(postgres_select_Query)
        print("Selecccionando filas de la tabla Clientes usando cursor.fetchall")
        clientes_records = cursor.fetchall()
        print("Imprimiendo cada fila y los valores de las columnas:")
        for row in clientes_records:
            print("\nid =", row[0])
            print("Nombre =", row[1], )
            print("Apellidos =", row[2])
            print("DNI =", row[3])
            print("Dirección =", row[4])
            print("Fecha de nacimiento =", row[5])

    if opcion3 == 2:
        print('Consulta de datos de productos') 
        postgres_select_Query = "SELECT * FROM Productos"
        cursor.execute(postgres_select_Query)
        print("Selecccionando filas de la tabla Productos usando cursor.fetchall")
        productos_records = cursor.fetchall()
        print("Imprimiendo cada fila y los valores de las columnas:")
        for row in productos_records:
            print("\nid =", row[0])
            print("Proveedor =", row[1])
            print("Nombre =", row[2])
            print("Código =", row[3])
            print("Precio unitario =", row[3], "€")
    
    if opcion3 == 3:
        print('Consulta de datos de proveedores') 
        postgres_select_Query = "SELECT * FROM Proveedores"
        cursor.execute(postgres_select_Query)
        print("Selecccionando filas de la tabla Proveedores usando cursor.fetchall")
        proveedores_records = cursor.fetchall()
        print("Imprimiendo cada fila y los valores de las columnas:")
        for row in proveedores_records:
            print("\nid =", row[0])
            print("Nombre =", row[1])
            print("NIF =", row[2])
            print("Dirección =", row[3])
    
    if opcion3 == 4:
        print('Consulta de datos de compras')    
        postgres_select_Query = "SELECT * FROM ClientesProductos"
        cursor.execute(postgres_select_Query)
        print("Selecccionando filas de la tabla Compras usando cursor.fetchall")
        compras_records = cursor.fetchall()
        print("Imprimiendo cada fila y los valores de las columnas:")
        for row in compras_records:
            print("\nid =", row[0])
            print("id cliente =", row[1])
            print("id producto =", row[2])
    
    if opcion3 == 5:
        print('\nConsulta de datos de clientes, productos comprados y precio de los mismos')
        postgres_select_query = """SELECT c.nombre AS nombre_cliente, c.apellidos AS apellidos_cliente, 
                                p.nombre AS nombre_producto_comprado, p.precio_unitario 
                                FROM Clientes c 
                                JOIN ClientesProductos cp ON c.id = cp.fk_id_cliente 
                                JOIN Productos p ON cp.fk_id_producto = p.id"""
        cursor.execute(postgres_select_Query)
        print("Selecccionando filas de la tabla Clientes JOIN ClientesProductos JOIN Productos usando cursor.fetchall")
        consulta1_records = cursor.fetchall()
        print("Imprimiendo cada fila y los valores de las columnas:")
        for row in consulta1_records:
            print("\nNombre del cliente =", row[0])
            print("Apellidos del cliente =", row[1])
            print("Nombre del producto comprado =", row[2])
            print("Precio unitario del producto =", row[3], "€")
    
    if opcion3 == 6:
        print('\nConsulta de datos de proveedores y productos que suministran')
        postgres_select_Query = """SELECT pr.nombre AS nombre_proveedor, pr.nif, pr.direccion, 
                                p.nombre AS nombre_producto, p.codigo
                                FROM Proveedores pr
                                JOIN Productos p ON pr.id = p.fk_id_proveedor"""
        cursor.execute(postgres_select_Query)
        print("Selecccionando filas de la tabla Proveedores JOIN Productos usando cursor.fetchall")
        consulta2_records = cursor.fetchall()
        print("Imprimiendo cada fila y los valores de las columnas:")
        for row in consulta2_records:
            print("\nNombre del proveedor =", row[0])
            print("NIF del proveedor =", row[1])
            print("Dirección del proveedor =", row[2])
            print("Nombre del producto suministrado =", row[3])
            print("Código del producto =", row[4]) 
    
    if opcion3 == 7:
        print('\nConsulta de datos de clientes y el importe total de las compras realizadas')
        postgres_select_Query = """SELECT c.nombre AS nombre_cliente, c.apellidos AS apellidos_cliente, 
                                SUM(p.precio_unitario) AS importe_total_compras
                                FROM Clientes c
                                JOIN ClientesProductos cp ON c.id = cp.fk_id_cliente
                                JOIN Productos p ON cp.fk_id_producto = p.id
                                GROUP BY c.nombre, c.apellidos"""
        cursor.execute(postgres_select_Query)
        print("Selecccionando filas de la tabla Clientes JOIN ClientesProductos JOIN Productos usando cursor.fetchall")
        consulta3_records = cursor.fetchall()
        print("Imprimiendo cada fila y los valores de las columnas:")
        for row in consulta3_records:
            print("\nNombre del cliente =", row[0])
            print("Apellidos del cliente =", row[1])
            print("Importe total compras =", row[2], "€")

def menu():
    opcion1 = 0
    while opcion1 != 5:
        opcion1 = opciones1()
        if opcion1 == 1: # Insertar datos
            opcion2 = opciones2()
            if opcion2 > 5 or opcion2 < 1:
                print("\nError: El número que tienes que introducir debe estar entre 1 y 5")
            if opcion2 > 0 and opcion2 < 5:
                datos = obtener_datos_insertar(opcion2)
                insertar_datos(opcion2, datos)

        if opcion1 == 2:  # Borrar datos
            opcion2 = opciones2()
            if opcion2 > 5 or opcion2 < 1:
                print("\nError: El número que tienes que introducir debe estar entre 1 y 5")
            if opcion2 > 0 and opcion2 < 5:
                id_tabla = obtener_datos_borrar(opcion2)
                borrar_datos(opcion2, id_tabla)      
        
        if opcion1 == 3: # Actualización de datos
            opcion2 = opciones2()
            if opcion2 > 5 or opcion2 < 1:
                print("\nError: El número que tienes que introducir debe estar entre 1 y 5") 
            if opcion2 > 0 and opcion2 < 5:
                id_registro = actualizar_registro()
                campo = opciones_actualizar(opcion2)
                newDatos = obtener_datos_actualizar()
                actualizar_datos(opcion2, campo, newDatos, id_registro)

        if opcion1 == 4: # Consulta de datos
            opcion3 = opciones3() 
            if opcion3 > 8 or opcion3 < 1:
                print("\nError: El número que tienes que introducir debe estar entre 1 y 8") 
            if opcion3 > 0 and opcion3 < 8:
                consulta(opcion3)
            
        if opcion1 > 5 or opcion1 < 1:
            print("\nError: El número que tienes que introducir debe estar entre 1 y 5")

menu()