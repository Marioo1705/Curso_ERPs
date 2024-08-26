#!/bin/bash

# Ejecutar un proceso en segundo plano utilizando &
echo "Ejecutando un proceso en segundo plano..."
sleep 300 &

# Mostrar el PID del proceso en ejecución
PID=$!
echo "El proceso se está ejecutando en segundo plano con el PID: $PID"

# Esperar a que el usuario presione una tecla
read -n 1 -p "Presiona cualquier tecla para detener el proceso..."

# Detener el proceso en segundo plano con el comando kill
echo
echo "Deteniendo el proceso con PID: $PID"
kill $PID
echo "El proceso ha sido detenido."
