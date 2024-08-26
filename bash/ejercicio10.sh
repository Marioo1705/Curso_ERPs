#!/bin/bash

# Buscar todos los archivos .txt en el directorio actual
archivos_txt=$(find . -maxdepth 1 -type f -name "*.txt")

# Verificar si se encontraron archivos
if [ -z "$archivos_txt" ]; then
	echo "No se encontraron archivos .txt en el directorio actual. Debes crear alguno."
	exit 1
fi

# Mostrar la lista de archivos encontrados
echo "Listado de archivos con extensión .txt encontrados:"
for archivo in $archivos_txt; do
	echo "$archivo"
done

# Inicializar un contador de líneas totales
total_lineas=0

# Contar el número de líneas de cada archivo
echo "----------------------------------------"
echo "Listado de líneas de cada archivo con extensión .txt:"
for archivo in $archivos_txt; do
	# Obtenemos el número de líneas de cada archivo y lo mostramos
	lineas=$(wc -l < "$archivo")
	echo "$archivo: $lineas líneas"
	# Sumamos las líneas al total
	total_lineas=$((total_lineas + lineas))
done

# Mostramos el total de líneas
echo "----------------------------------------"
echo "Número total de líneas en todos los archivos: $total_lineas"
