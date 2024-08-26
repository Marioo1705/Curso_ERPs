#!/bin/bash

directorio="mis_archivos"

archivo1="$directorio/archivo1.txt"
archivo2="$directorio/archivo2.txt"

# Creamos el directorio mis_archivos si no existe
if [ ! -d "$directorio" ]; then
	mkdir "$directorio"
	echo "Directorio '$directorio' creado."
else
	echo "El directorio '$directorio' ya existe."

# Crear archivo1.txt y archivo2.txt	
touch "$archivo1"
echo "Archivo '$archivo1' creado."
touch "$archivo2"
echo "Archivo '$archivo2' creado."

# Cambiar permisos de archivo1.txt a solo lectura
chmod 444 "$archivo1"
echo "Permisos de '$archivo1' cambiados a solo lectura."

# Cambiar permisos de archivo2.txt a lectura y escritura
chmod 666 "$archivo2"
echo "Permisos de '$archivo2' cambiados a lectura y escritura."

# Mostrar los permisos actualizados de archivo1.txt y archivo2.txt
ls -las "$archivo1" "$archivo2"
