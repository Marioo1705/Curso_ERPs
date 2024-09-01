# Ejercicios de python

Este directorio contiene una colección de ejercicios de python.

## Lista de ejercicios

### Ejercicio 1:

## CRUD Python

Realiza un CRUD en Python de la siguiente BD:

“Una empresa vende productos a varios clientes. Se necesita conocer los datos personales de los clientes (nombre, apellidos, dni, dirección y fecha de nacimiento). Cada producto tiene un nombre y un código, así como un precio unitario. Un cliente puede comprar varios productos a la empresa, y un mismo producto puede ser comprado por varios clientes.

Los productos son suministrados por diferentes proveedores. Se debe tener en cuenta que un producto sólo puede ser suministrado por un proveedor, y que un proveedor puede suministrar diferentes productos. De cada proveedor se desea conocer el NIF, nombre y dirección”.

La creación de las tablas y todos los datos de las operaciones de inserción, actualización, borrado y búsqueda, se deben pedir al usuario.

**Directorio:** [ejercicio1](./ejercicio1/)

---

### Ejercicio 2:

## CRUD API REST

# Primera parte: Base de Datos

Crea una Base de Datos en PostgreSQL llamada Empresa, que tenga una tabla llamada empleados, en la que se puedan insertar empleados con el formato de los ejemplos con los que hemos trabajado.

Formato:

```
    {
        'id': 0,
        'nombre': 'Davinia',
        'apellidos': 'de la Rosa',
        'trabaja_desde': '5'
    }
```

El campo trabaja_desde es un entero que representa la antigüedad del empleado en la empresa en años.

# Segunda parte: Back-end

Realiza en Python una API REST que tenga las siguientes características (Endpoint/method/comportamiento):

1. /all (GET): Devuelve todos los empleados.
2. /all/id (GET): Devuelve un empleado por id
3. /insert (POST): Inserta un empleado
4. /delete (DELETE): Borra un empleado
5. /update/id/nombre (PUT): Actualiza el nombre de un empleado localizado por id

Recuerda que todas las peticiones que se hagan, deben devolver un JSON

# Tercera parte: Front-end

Realiza en HTML, CSS y JS una web que se comporte del siguiente modo (usando al Back-end):

1. En el home muestre en una tabla o lista la información de todos los empleados.
2. Por medio de un formulario, permita escribir un id y buscar a un empleado por id.
3. Por medio de un formulario, permita solicitar todos los datos de un empleado nuevo e insertarlo.
4. Por medio de un formulario, permita escribir un id y borrar al empleado con dicho id.
5. Por medio de un formulario, permita escribir un id y un nombre y actualice el nombre del empleado con dicho id.

**Directorio:** [ejercicio2](./ejercicio2/)
