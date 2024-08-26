#!/bin/bash

# Verificamos si se proporcionaron dos argumentos
if [ $# -ne 2 ]; then
	echo "Debe proporcionar exactamente dos números como argumentos."
	exit 1
fi

# Verificamos si los argumentos son números enteros
if ! [[ "$1" =~ ^[0-9]+$ ]] || ! [[ "$2" =~ ^[0-9]+$ ]]; then
	echo "Ambos argumentos deben ser números enteros."
	exit 1
fi

# Verificamos los números en el intervalo y los imprimimos desde el valor de $1 hasta el de $2
if [ $1 -lt $2 ]; then
	for ((i = $1; i <= $2; i++)); do
		echo $i
	done
else
	for ((i = $1; i >= $2; i--)); do
		echo $i
	done
fi
