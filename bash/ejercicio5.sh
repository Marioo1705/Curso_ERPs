#!/bin/bash

# Verificamos si se proporcionó un argumento
if [ $# -eq 0 ]; then
    echo "Debe proporcionar un número entre 1 y 5 como argumento."
    exit 1
fi

# Verificamos si el argumento es un número válido
if ! [[ "$1" =~ ^[1-5]$ ]]; then
    echo "El número proporcionado debe estar entre 1 y 5."
    exit 1
fi

# Iteramos para crear los archivos
echo -n "Se han creado los archivos: "
for ((i = 1; i <= $1; i++ )); do
	touch "${i}.txt"
	echo -n "${i}.txt, "
done
echo "(y debes comprobar que así es usando ls)"
