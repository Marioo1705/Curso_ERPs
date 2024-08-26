# Ejercicios de scripting en bash

Este directorio contiene una colección de ejercicios de scripting en bash. Cada ejercicio está diseñado para practicar diferentes aspectos del scripting de bash.

## Lista de ejercicios

### Ejercicio 1:

Dados dos enteros almacenados en variables, crea un script en bash que permita mostrar en la terminal el mayor.

**Archivo:** [ejercicio1.sh](./ejercicio1.sh)

---

### Ejercicio 2:

Pasando un nombre de directorio por parámetro al script en bash, permite que se cree un directorio con dicho nombre en /home

**Archivo:** [ejercicio2.sh](./ejercicio2.sh)

---

### Ejercicio 3:

Pasando un nombre de usuario y una contraseña por parámetros a un script (primero user y segundo pass), validar a un usuario (el user correcto y el pass correcto estarán en una variable)

**Archivo:** [ejercicio3.sh](./ejercicio3.sh)

---

### Ejercicio 4:

Crea un script que funcione del siguiente modo:

1. Si el usuario pone como primer parámetro 1 y una ruta, nos muestra el ls de dicha ruta (tratándose de un directorio)

2. Si el usuario pone 2 y un nombre de fichero, nos muestra el cat del fichero

**Archivo:** [ejercicio4.sh](./ejercicio4.sh)

---

### Ejercicio 5:

Usando bucles y un script en bash, que recibe como parámetro un número entre 1 y 5 (sólo son válidos el 1, 2, 3, 4 y 5), crea tantos ficheros como número indique el usuario usando como nombre el propio número.

Ejemplo:

```
# Un ejemplo
./ficheros.sh 2

Salida:
Se han creado los ficheros 1.txt y 2.txt (y debes comprobar que así es usando ls)
# Otro ejemplo
./ficheros.sh 7
Salida:
Numero incorrecto
```

**Archivo:** [ejercicio5.sh](./ejercicio5.sh)

---

### Ejercicio 6:

Usando bucles y un script en bash, que recibe como parámetros dos números, muestra los números que hay dentro del intervalo indicado por el usuario, teniendo en cuenta el orden en el que los indica e incluyendo los extremos.

Ejemplo:

```
# Un ejemplo:
./intervalo.sh 2 7

Salida:
2
3
4
5
6
7

# Otro ejemplo:
./intervalo.sh 7 2

Salida:
7
6
5
4
3
2
```

**Archivo:** [ejercicio6.sh](./ejercicio6.sh)

---

### Ejercicio 7:

Indica qué hace este script:

```
#!/bin/bash

directorio="/ruta/al/directorio"

cadena_a_buscar="texto_a_buscar"

archivos_txt=$(find "$directorio" -type f -name "*.txt")

for archivo in $archivos_txt; do
    if grep -q "$cadena_a_buscar" "$archivo"; then
        echo "Cadena encontrada en el archivo: $archivo"
        grep "$cadena_a_buscar" "$archivo"
        echo "----------------------------------------"
    fi
done
```

**Archivo:** [ejercicio7.txt](./ejercicio7.txt)

---

### Ejercicio 8:

Modifica el script del ejercicio 7 de manera que permitas que el usuario pase por parámetros tanto el directorio como el texto que quirere buscar con grep.

**Archivo:** [ejercicio8.sh](./ejercicio8.sh)

---

### Ejercicio 9:

Diseña un script que realice lo siguiente:

1. Crea un directorio llamado "mis_archivos".
2. Dentro de "mis_archivos", crea dos archivos llamados "archivo1.txt" y "archivo2.txt".
3. Cambia los permisos de "archivo1.txt" para que sea de solo lectura.
4. Cambia los permisos de "archivo2.txt" para que sea de lectura y escritura.
5. Muestra los permisos actualizados de ambos archivos.

**Archivo:** [ejercicio9.sh](./ejercicio9.sh)

---

### Ejercicio 10:

Diseña un script que realice lo siguiente:

1. Busca todos los archivos con extensión ".txt" en el directorio actual utilizando el comando find (crea algunos, si no dispones de ellos).
2. Muestra una lista de los nombres de estos archivos.
3. Utiliza el comando wc (usa man para ver su manual) para contar la cantidad de líneas en cada archivo y mostrar el número total de líneas en todos los archivos.

**Archivo:** [ejercicio10.sh](./ejercicio10.sh)

---

### Ejercicio 11:

Diseña un script que realice lo siguiente:

1. Utilza el comando sudo para instalar un programa de tu elección utilizando apt-get. Por ejemplo, puedes instalar "tree" con sudo apt-get install tree.
2. Luego, espera la entrada del usuario para continuar, indícale que ya se ha instalado y que como es una pruba debe pulsar enter para desinstalar.
3. Una vez que el usuario presiona Enter, utiliza sudo apt-get remove para desinstalar el programa.

**Archivo:** [ejercicio11.sh](./ejercicio11.sh)

---

### Ejercicio 12:

Realiza un script en bash, que permita crear un fichero y asignar los permisos que queramos, la ejecución va a ser así:

```
./fichero_permisos.sh nombre.txt rwx rw r

Esto indicará que el fichero se va a llamar nombre.txt y va a tener permisos de lectura, escritura y ejecución para el propietario, de lectura y escritura para el grupo y de lectura para el resto.
```

**Archivo:** [ejercicio12.sh](./ejercicio12.sh)

---

### Ejercicio 13:

**Apartado 1: Creación de de Directorios**

1. Crea un directorio llamado "PracticaUbuntu".
2. Dentro de "PracticaUbuntu", crea tantos subdirectorios como el usuario quiera usando un script que reciba como parátro 1 el número de subdirectorios y luego los nombres de cada uno
3. Crea un fichero dentro de cada uno que contenga el resultado de un comando.

Ejemplo:

```
./apartado1.sh 2 Documentos Informes

PracticaUbuntu/Documentos: tendrá dentro documentos.txt con el resultado de hacer un ls
PracticaUbuntu/Informes: tendrá dentro informes.txt con el resultado de hacer un pwd

LOS COMANDOS CUYA SALIDA GUARDAMOS EN LOS txt SON DE NUESTRA ELECCIÓN
```

**Archivo:** [ejercicio13_apartado1_solucion1.sh](./ejercicio13_apartado1_solucion1.sh)

**Archivo:** [ejercicio13_apartado1_solucion2.sh](./ejercicio13_apartado1_solucion2.sh)

**Archivo:** [ejercicio13_apartado1_solucion3.sh](./ejercicio13_apartado1_solucion3.sh)

**Archivo:** [ejercicio13_apartado1_solucion4.sh](./ejercicio13_apartado1_solucion4.sh)

**Apartado 2: Creación de Archivos y Registro de Historial**

1. Crea un archivo de texto llamado "notas.txt" utilizando el comando touch.
2. Escribe una nota en "notas.txt" utilizando nano.
3. Ejecuta el comando history para ver tu historial de comandos.
4. Redirige el historial de comandos a un archivo llamado "historial.txt".

**Archivo:** [ejercicio13_apartado2.sh](./ejercicio13_apartado2.sh)

**Apartado 3: Automatización de Copias de Seguridad**

1. Crea un script Bash llamado "backup.sh" que realice copias de seguridad de los archivos de una carpeta elegida por el usuario a un directorio "Backup".
2. Programa la ejecución diaria del script utilizando cron
3. Verifica que el script funcione correctamente programando su ejecución.

**Archivo:** [ejercicio13_apartado3.sh](./ejercicio13_apartado3.sh)

---

### Ejercicio 14:

Script para ejecutar procesos en segundo plano y mostrar información de los procesos en ejecución

Crea un script Bash llamado background_processes.sh que realice lo siguiente:

Ejecuta tres comandos diferentes en segundo plano utilizando &. Muestra el ID de proceso (PID) y el nombre de cada proceso que se está ejecutando en segundo plano. Espera a que los procesos finalicen. Utiliza el comando ps para listar los procesos en ejecución y extraer información relevante. Utiliza el comando kill para terminar todos los procesos ejecutados en segundo plano.

**Archivo:** [ejercicio14.sh](./ejercicio14.sh)

---

### Ejercicio 15:

Script para ejecutar y controlar procesos en segundo plano

Crea un script Bash llamado control_background_processes.sh que realice lo siguiente:

1. Ejecuta un proceso en segundo plano utilizando &.
2. Muestra el PID del proceso en ejecución.
3. Espera a que el usuario presione una tecla.
4. Utiliza el comando kill para detener el proceso en segundo plano con el PID proporcionado.

**Archivo:** [ejercicio15.sh](./ejercicio15.sh)

---

### Ejercicio 16:

Script para ejecutar procesos concurrentes en segundo plano

Crea un script Bash llamado concurrent_background_processes.sh que realice lo siguiente:

1. Ejecuta cinco comandos diferentes en segundo plano utilizando &.
2. Muestra el PID de cada proceso en ejecución.
3. Espera a que todos los procesos finalicen.
4. Utiliza el comando ps para listar y mostrar los procesos en ejecución.
5. Utiliza el comando kill para detener un proceso específico en segundo plano con el PID proporcionado por el usuario.

**Archivo:** [ejercicio16.sh](./ejercicio16.sh)

---

### Ejercicio 17:

Pide al usuario los siguientes datos: Nombre, apellido 1, apellido 2 y email y valida que el nombre y apellidos sólo tengan letras y el email un formato correcto usando expresiones regulares.

**Archivo:** [ejercicio17.sh](./ejercicio17.sh)

---

## Instrucciones de uso

1. Clona este repositorio en tu máquina local.
2. Navega a la carpeta de cada ejercicio.
3. Ejecuta los scripts en un entorno de bash utilizando el siguiente comando:

   ```bash
   ./nombre_del_script.sh