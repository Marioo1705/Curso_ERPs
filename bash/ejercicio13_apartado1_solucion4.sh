#!/bin/bash

# Verifica si se proporciona el número correcto de argumentos
if [ "$#" -lt 2 ]; then
	echo "Uso: $0 <número_de_subdirectorios> <nombre_subdirectorio1> <nombre_subdirectorio2> ..."
	echo "*** TIENES QUE INTRODUCIR EL NOMBRE DE LOS DIRECTORIOS QUE QUIERES QUE CREEMOS ***"
	exit 1
fi
if [ "$#" -le "$1" ]; then
	echo "Uso: $0 <número_de_subdirectorios> <nombre_subdirectorio1> <nombre_subdirectorio2> ..."
	echo "*** NO HAS INTRODUCIDO EL NÚMERO DE SUBDIRECTORIOS CORRECTO ***"
	exit 1
fi

# Crea el directorio "PracticaUbuntu4"
mkdir -p PracticaUbuntu4

# Número de subdirectorios
num_subdirectorios=$1

# Crea un listado de comandos ejecutables
comandos=("ls -l" "find /home/mario -type f" "find /home/mario -type d" "history" "tree")

# Crea un contador para los parámetros introducidos inicializado en 0
contador=0

# Crea otro contador para los valores introducidos en comandos
i=0

# Itera sobre los nombres de los subdirectorios y los crea
for subdirectorio in "$@"; do
	((contador++))
	# Comprobamos contador de parámetros
	if [ $contador -gt 1 ]; then
		mkdir -p "PracticaUbuntu4/$subdirectorio"

		# Crea un archivo dentro de cada subdirectorio con el resultado de un comando
		resultado_comando=$(eval "${comandos[i]}")
		echo "$resultado_comando" > "PracticaUbuntu4/$subdirectorio/$subdirectorio.txt"
		((i++))
	fi
done
