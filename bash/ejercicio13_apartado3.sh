#!/bin/bash

# Solicitar al usuario el directorio de origen
echo "Introduce el directorio de origen para hacer un backup (ruta absoluta):"
read directorio_origen

# Verificar que el directorio de origen existe
if [ ! -d "$directorio_origen" ]; then
	echo "El directorio de origen no existe. Por favor, introduce una ruta válida"
	exit 1
fi

# Crear el directorio de destino para el backup
directorio_destino="/home/mario/Backup"
mkdir -p "directorio_destino"

# Realizar la copia de seguridad
cp -r "$directorio_origen"/* "$directorio_destino"
echo "Copia de seguridad completada. Los archivos de $directorio_origen se han copiado en $directorio_destino"

# Para programar la ejecución diaria del script utilizando cron seguiremos los siguientes pasos:
# 1. Instalamos cron si no lo tenemos:
	# sudo apt-get update
	# sudo apt-get install cron
# 2. Vemos el estado del servicio: 
	# sudo service cron status
# 3. Iniciamos si estaba parado el servicio
	# sudo service cron start
# 4. Editamos el fichero de configuración (nos da a elegir el editor). Elegimos por ejemplo la opción 1 (editor nano)
	# crontab -e
# 5. Programamos la tarea:
	# 0 2 * * * /ruta/completa/a/ejercicio13_apartado3.sh
	# (Así programamos la ejecución del script todos los días a las 2:00 a.m.)
# 6. Guardamos y cerramos el archivo crontab
# 7. Ver las tareas:
	# crontab -l

