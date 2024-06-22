#!/bin/bash

# Parte 1
# Punto seleccionado: 1
# Adivina el numero: Escribe un script que genere un numero aleatorio entre 1 y 100
# y permita al usuario intentar adivinarlo, proporcionando pistas
# si el intento es demasiado alto o bajo.

#Generacion de numero aleatorio
numero_adivinar=$((RANDOM%100+1))

#Instruccion al usuario de lo que debe hacer
echo "Tiene que adivinar el numero entre el 1 y el 100"


#Bucle para repetir hasta adivinar el numero
while true; do

    #Pedido de datos al usuario y guardado
    read -p "Ingrese el numero: " numero

    #Comparacion de numero ingresado y aleatorio para dar pistas o felicitar por encontrar el numero
    if((numero<numero_adivinar)); then
        echo "El numero que ingreso es bajo"
    elif((numero>numero_adivinar)); then
        echo "El numero que ingreso es alto"
    else
        echo "Encontro el numero, felicitaciones"
        break
    fi
done