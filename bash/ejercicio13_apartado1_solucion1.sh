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
			
# Crea el directorio "PracticaUbuntu1"
mkdir -p PracticaUbuntu1

# Número de subdirectorios
num_subdirectorios=$1
shift

# Crea un listado de comandos ejecutables
comandos=("ls -l" "find /home/mario -type f" "find /home/mario -type d" "history" "tree")

# Itera sobre los nombres de los subdirectorios y los crea
for ((i = 0; i < num_subdirectorios; i++)); do
	subdirectorio="$1"
	mkdir -p "PracticaUbuntu1/$subdirectorio"
	
	# Crea un archivo dentro de cada subdirectorio con el resultado del comando
	resultado_comando=$(eval "${comandos[i]}")
	echo "$resultado_comando" > "PracticaUbuntu1/$subdirectorio/$subdirectorio.txt"
	shift	
done
