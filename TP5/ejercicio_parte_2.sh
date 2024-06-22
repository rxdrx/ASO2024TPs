#!/bin/bash

# Parte 2
# Punto seleccionado: 7
# Mostrar el genero de un nombre ingresado por el usuario, usando
# la API del sitio "https://api.genderize.io/?name=nombre".

#Se pide al usuario que ingrese un nombre, y la respuesta es guardada
read -p "Ingrese un nombre: " nombre

#Se hace una solicitud a la API de la web para datos del nombre ingresado
response=$(curl -s "https://api.genderize.io/?name=$nombre")

#Se extrae el genero del nombre ingresado desde un JSON
genero=$(echo "$response" | jq -r '.gender')

#Se muestra el nombre y el genero
echo "El genero de '$nombre' es: $genero."