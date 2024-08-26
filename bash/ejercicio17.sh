#!/bin/bash

# Función para validar si una cadena contiene solo letras y espacios
function es_cadena_valida() {
  cadena="$1"
  if [[ "$cadena" =~ ^[a-zA-ZñÑáéíóúÁÉÍÓÚüÜ\s]+$ ]]; then
    return 0  # La cadena contiene solo letras y espacios
  else
    return 1  # La cadena contiene caracteres no válidos
  fi
}

# Función para validar si una dirección de correo electrónico tiene un formato válido
function es_email_valido() {
  email="$1"
  if [[ "$email" =~ ^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$ ]]; then
    return 0  # El correo electrónico tiene un formato válido
  else
    return 1  # El correo electrónico no tiene un formato válido
  fi
}

# Solicitar al usuario nombre
read -r -p "Ingrese su nombre: " nombre

# Validar el nombre
if es_cadena_valida "$nombre"; then
  echo "Nombre válido: $nombre"
else
  echo "Nombre no válido. Debe contener solo letras y espacios."
  exit 1
fi

# Solicitar al usuario primer apellido
read -r -p "Ingrese su primer apellido: " apellido1

# Validar el primer apellido
if es_cadena_valida "$apellido1"; then
  echo "Primer apellido válido: $apellido1"
else
  echo "Primer apellido no válido. Debe contener solo letras y espacios."
  exit 1
fi

# Solicitar al usuario segundo apellido
read -r -p "Ingrese su segundo apellido: " apellido2

# Validar el segundo apellido
if es_cadena_valida "$apellido2"; then
  echo "Segundo apellido válido: $apellido2"
else
  echo "Segundo apellido no válido. Debe contener solo letras y espacios."
  exit 1
fi

# Solicitar al usuario correo electrónico
read -r -p "Ingrese su dirección de correo electrónico: " email

# Validar el correo electrónico
if es_email_valido "$email"; then
  echo "Correo electrónico válido: $email"
else
  echo "Correo electrónico no válido. Debe tener un formato válido."
  exit 1
fi
