#!/bin/bash

# Verificar que se hayan proporcionado dos argumentos
if [ "$#" -ne 2 ]; then
	echo "Uso: $0 <ruta al directorio> <texto a buscar>"
	exit 1
fi

#Asignar argumentos a variables
directorio="$1"
cadena_a_buscar="$2"

archivos_txt=$(find "$directorio" -type f -name "*.txt")

for archivo in $archivos_txt; do
    if grep -q "$cadena_a_buscar" "$archivo"; then
        echo "Cadena encontrada en el archivo: $archivo"
        grep "$cadena_a_buscar" "$archivo"
        echo "----------------------------------------"
    fi
done
