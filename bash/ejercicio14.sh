#!/bin/bash

# Ejecuta tres comandos diferentes en segundo plano
command1() {
    sleep 5
}
command2() {
    sleep 10
}
command3() {
    sleep 8
}

# Comando sleep - Se utiliza cuando hacemos un script y queremos que se detenga durante un tiempo, en este caso 5-10-8 segundos

command1 &
pid1=$!

command2 &
pid2=$!

command3 &
pid3=$!

# $! Muestra el ID del último trabajo en segundo plano

echo "Procesos en segundo plano en ejecución:"
echo "PID     Comando"
echo "$pid1   command1"
echo "$pid2   command2"
echo "$pid3   command3"

# Espera a que los procesos finalicen
wait $pid1
wait $pid2
wait $pid3

# El comando wait espera la finalización de cualquier proceso en ejecución. Se utiliza con un proceso o ID de trabajo determinado. Si no se proporciona ningún ID o trabajo con el comando, espera a que se completen todos los procesos actuales y devuelve el estado de salida

# Utiliza el comando ps para listar los procesos en ejecución y extraer información relevante
echo "Procesos en ejecución después de la ejecución en segundo plano:"
ps aux | grep -E 'command1|command2|command3'

# ps aux y grep es una combinación de comandos que te permite obtener información detallada sobre los procesos en ejecución y, al mismo tiempo, filtrar esos procesos según un patrón específico

# Utiliza el comando kill para terminar todos los procesos ejecutados en segundo plano
kill $pid1 $pid2 $pid3

echo "Procesos terminados."
