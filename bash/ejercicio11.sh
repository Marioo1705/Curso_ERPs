#!/bin/bash

# Nombre del programa a instalar y desinstalar
programa="tree"

# Comando para instalar el programa
echo "Instalando el programa '$programa'..."
sudo apt-get update
sudo apt-get install "$programa"

# Esperar la entrada del usuario para continuar
echo "Como esta es una prueba, presiona Enter para desinstalar '$programa'."
read -r # Espera a que el usuario presione Enter

# Comando para desinstalar el programa
echo "Desinstalando el programa '$programa'..."
sudo apt-get remove "$programa"
