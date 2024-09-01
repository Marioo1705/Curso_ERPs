import psycopg2
import flask
from flask import request, jsonify
from flask_cors import CORS, cross_origin

app = flask.Flask(__name__)
cors = CORS(app)
app.config['CORS_HEADERS'] = 'Content-Type'
app.config["DEBUG"] = True

# Conectamos con la Base de Datos a través de la función conectar()
def conectar():
    conexion = 0
    try:
        conexion = psycopg2.connect(
            user="postgres",
            password="root",
            host="127.0.0.1",
            port="5432",
            database="Empresa"
        )
    except (Exception, psycopg2.Error) as error:
        print("Error al conectar a la base de datos: ", error)
    
    return conexion

# 1. /all (GET): Devuelve todos los empleados
@app.route('/all', methods=['GET'])
@cross_origin()

def api_all():
    conexion = conectar()
    cursor = conexion.cursor()
    print("Consulta de datos de empleados") 
    postgres_selectAll_Query = "SELECT * FROM Empleados"
    cursor.execute(postgres_selectAll_Query)
    empleados_records = cursor.fetchall()
    empleados = []
    for datos in empleados_records:
        empleado = {
            "id": datos[0],
            "nombre": datos[1],
            "apellidos": datos[2],
            "trabaja_desde": datos[3]
        }
        empleados.append(empleado)
    
    cursor.close()
    conexion.close()
        
    return jsonify(empleados)
   
# 2. /all/id (GET): Devuelve un empleado por id
@app.route('/all/<int:id>', methods=['GET'])
@cross_origin()

def api_all_id(id):
    conexion = conectar()
    cursor = conexion.cursor()
    print("Consulta de datos de empleados por id") 
    postgres_selectAllId_Query = "SELECT * FROM Empleados WHERE id = %s"
    cursor.execute(postgres_selectAllId_Query, (id,))
    empleadoId_records = cursor.fetchone()
    empleado = {
        "id": empleadoId_records[0],
        "nombre": empleadoId_records[1],
        "apellidos": empleadoId_records[2],
        "trabaja_desde": empleadoId_records[3]
    }

    cursor.close()
    conexion.close()

    return jsonify(empleado)
    
# 3. /insert (POST): Inserta un empleado
@app.route('/insert', methods=['POST'])
@cross_origin()

def api_insert():
    # Obtener los datos en formato json, creando un diccionario
    data = request.json
    nombre = data.get("nombre")
    apellidos = data.get("apellidos")
    trabaja_desde = data.get("trabaja_desde")

    conexion = conectar()
    cursor = conexion.cursor()
    postgres_insert_query = """INSERT INTO Empleados (nombre, apellidos, trabaja_desde) VALUES (%s, %s, %s)"""
    cursor.execute(postgres_insert_query, (nombre, apellidos, trabaja_desde))
    conexion.commit()
    print("Datos insertados correctamente en la tabla Empleados.")

    cursor.close()
    conexion.close()

    return jsonify(data)

# 4. /delete (DELETE): Borra un empleado
@app.route('/delete/<int:id>', methods=['DELETE'])
@cross_origin()

def api_delete(id):
    conexion = conectar()
    cursor = conexion.cursor()
    postgres_delete_query = """DELETE FROM Empleados WHERE id = %s"""
    cursor.execute(postgres_delete_query, (id,))
    conexion.commit()
    print("Empleado borrado correctamente")

    cursor.close()
    conexion.close()

    return jsonify({"Borrado el empleado con id": id})

# 5. /update/id/nombre (PUT): Actualiza el nombre de un empleado localizado por id
@app.route('/update/<int:id>/<string:nombre>', methods=['PUT'])
@cross_origin()

def api_update(id, nombre):
    conexion = conectar()
    cursor = conexion.cursor()
    postgres_update_query = """UPDATE Empleados SET nombre = %s WHERE id = %s"""
    cursor.execute(postgres_update_query, (nombre, id))
    conexion.commit()
    print("Datos actualizados correctamente en la tabla Empleados.")

    cursor.close()
    conexion.close()

    return jsonify({"id": id, "nuevo_nombre": nombre})

app.run()