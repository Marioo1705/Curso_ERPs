#!/bin/bash

# Creación de archivo notas.txt
archivo_notas="notas.txt"
touch "$archivo_notas"
echo "Archivo $archivo_notas creado."

# Añadir una nota en notas.txt (se puede hacer también con el editor de texto nano)
echo "Esta es una nota de ejemplo añadida a notas.txt" > "$archivo_notas"
echo "Nota añadida a $archivo_notas."

# Redirigir el historial de comandos a archivo historial.txt
history > historial.txt
echo "Historial de comandos guardado en historial.txt."	
