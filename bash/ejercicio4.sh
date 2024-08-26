#!/bin/bash

# Verificar el número de argumentos
if [ $# -ne 2 ]; then
	echo "Uso: $0 <opción> <argumento>"
	exit 1
fi

# Comprobar si la opción es 1 para mostrar el ls de una ruta (si es un directorio)
if [ $1 -eq 1 ]; then
	if [ -d "$2" ]; then
    		ls -l "$2"
	else
        	echo "El argumento no es un directorio válido."
        	exit 1
	fi

# Comprobar si la opción es 2 para mostrar el cat de un archivo
elif [ $1 -eq 2 ]; then
	if [ -f "$2" ]; then
        	cat "$2"
	else
        	echo "El argumento no es un archivo válido."
        	exit 1
	fi

# Opción no válida
else
	echo "Opción no válida. Las opciones válidas son 1 para mostrar ls de un directorio y 2 para mostrar cat de un archivo."
	exit 1
fi
