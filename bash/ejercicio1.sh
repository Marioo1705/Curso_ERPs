#!/bin/bash
# Definimos dos números enteros como variables
num1=5
num2=3
# Comparamos los enteros y mostramos el mayor
if [ "$num1" -gt "$num2" ]; then
	echo "El número mayor es $num1"
elif [ "$num2" -gt "$num1" ]; then
	echo "El número mayor es $num2"
else
	echo "Los dos números son iguales"
fi
