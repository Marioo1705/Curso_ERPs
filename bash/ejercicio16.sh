#!/bin/bash

# Ejecutar cinco comandos diferentes en segundo plano
comando1() {
	sleep 10
}
comando2() {
	sleep 20
}
comando3() {
	sleep 30
}
comando4() {
	sleep 40
}
comando5() {
	sleep 50
}

echo "Ejecutando procesos en segundo plano..."
comando1 &
PID1=$!
comando2 &
PID2=$!
comando3 &
PID3=$!
comando4 &
PID4=$!
comando5 &
PID5=$!

# Mostrar el PID de cada proceso en ejecución
echo "Comando 1 ejecutándose con PID: $PID1"
echo "Comando 2 ejecutándose con PID: $PID2"
echo "Comando 3 ejecutándose con PID: $PID3"
echo "Comando 4 ejecutándose con PID: $PID4"
echo "Comando 5 ejecutándose con PID: $PID5"

# Esperar a que todos los procesos finalicen
echo "Esperando a que todos los procesos finalicen..."
wait $PID1
wait $PID2
wait $PID3
wait $PID4
wait $PID5
echo "Todos los procesos han finalizado."

# Utlizar el comando ps para listar y mostrar los procesos en ejecución
echo "Procesos en ejecución después de la ejecución en segundo plano:"
ps aux | grep -E "$PID1|$PID2|$PID3|$PID4|$PID5"

# Pedir al usuario que ingrese un PID para detener un proceso
read -p "Ingresa el PID del proceso que deseas detener: " user_pid

# Utilizar el comando kill para detener el proceso
kill $user_pid
echo "El proceso con PID $user_pid ha sido detenido."
