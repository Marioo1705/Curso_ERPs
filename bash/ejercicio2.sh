#!/bin/bash

# Verifica previamente si tienes permiso de administrador para crear un directorio en /home

# Verifica si se proporciona un nombre de directorio como parámetro
if [ $# -eq 0 ]; then
	echo "Por favor, proporciona un nombre de directorio como parámetro"
	exit 1
fi

# Pasamos el parámetro obetenido de nombre de directorio a variable
nombre_directorio="$1"

# Pasamos la ruta absoluta hasta el nuevo directorio a variable
ruta_directorio="/home/$nombre_directorio"

# Verifica si el directorio ya existe
if [ -d "$ruta_directorio" ]; then
	echo "El directorio \"$nombre_directorio\" ya existe en /home"
else
	# Crea el directorio en /home
	mkdir "$ruta_directorio"
	echo "Se ha creado el directorio \"$nombre_directorio\" en /home"
	echo "Por favor, ejecuta un ls en /home para comprobarlo"
fi
