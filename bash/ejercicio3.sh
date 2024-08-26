#!/bin/bash
# Definimos usuario y contraseñas correctos como variables
usuario_correcto="usuario"
contrasena_correcta="contrasena"

# Verifica si se proporcionan dos parámetros (usuario y contraseña)
if [ $# -ne 2 ]; then
	echo "Por favor, proporciona un nombre de usuario y una contraseña como parámetros"
	exit 1
fi

# Pasamos los parámetros introducidos a variables
usuario_ingresado="$1"
contrasena_ingresada="$2"

# Comprobamos si los valores ingresados coinciden con los correctos
if [ "$usuario_correcto" = "$usuario_ingresado" ] && [ "$contraena_correcta" = "$contrasena_ingresada" ]; then
	echo "Acceso concedido. Bienvenido, $usuario_correcto"
else
	echo "Acceso denegado. Usuario o contraseña incorrectos"
fi
