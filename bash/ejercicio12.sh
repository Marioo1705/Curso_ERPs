#!/bin/bash

# Comprobación de argumentos
if [ "$#" -ne 4 ]; then
    echo "Uso: $0 nombre_archivo permisos_propietario permisos_grupo permisos_otros"
    echo "Ejemplo: $0 nombre.txt rwx rw r"
    exit 1
fi

# Asignar argumentos a variables
nombre_archivo="$1"
permisos_propietario="$2"
permisos_grupo="$3"
permisos_otros="$4"

# Convertir permisos de propietario a octal
octal_propietario=0
if [[ "$permisos_propietario" == *"r"* ]]; then
    octal_propietario=$((octal_propietario + 4))
fi
if [[ "$permisos_propietario" == *"w"* ]]; then
    octal_propietario=$((octal_propietario + 2))
fi
if [[ "$permisos_propietario" == *"x"* ]]; then
    octal_propietario=$((octal_propietario + 1))
fi

# Convertir permisos de grupo a octal
octal_grupo=0
if [[ "$permisos_grupo" == *"r"* ]]; then
    octal_grupo=$((octal_grupo + 4))
fi
if [[ "$permisos_grupo" == *"w"* ]]; then
    octal_grupo=$((octal_grupo + 2))
fi
if [[ "$permisos_grupo" == *"x"* ]]; then
    octal_grupo=$((octal_grupo + 1))
fi

# Convertir permisos de otros a octal
octal_otros=0
if [[ "$permisos_otros" == *"r"* ]]; then
    octal_otros=$((octal_otros + 4))
fi
if [[ "$permisos_otros" == *"w"* ]]; then
    octal_otros=$((octal_otros + 2))
fi
if [[ "$permisos_otros" == *"x"* ]]; then
    octal_otros=$((octal_otros + 1))
fi

# Crear el archivo
touch "$nombre_archivo"

# Aplicar los permisos al archivo
chmod "$octal_propietario$octal_grupo$octal_otros" "$nombre_archivo"

# Mostrar los permisos actuales del archivo
echo "Se ha creado el archivo '$nombre_archivo' con permisos:"
ls -las "$nombre_archivo"
