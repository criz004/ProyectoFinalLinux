#!/bin/bash

echo "Bienvenido a Gato"

tablero=("#" "#" "#" "#" "#" "#" "#" "#" "#")

function imprimir_tablero() {
    echo "Tablero actual:"
    echo "${tablero[0]} | ${tablero[1]} | ${tablero[2]}"
    echo "---------"
    echo "${tablero[3]} | ${tablero[4]} | ${tablero[5]}"
    echo "---------"
    echo "${tablero[6]} | ${tablero[7]} | ${tablero[8]}"
}

ganador=0
turnoActual=X
numeroTurno=1

while [ $ganador=0 ] 
do

    if [[ ${turnoActual} == "X" && ${error} == 0 ]]; then
        turnoActual="O"
    else if [[ ${turnoActual} == "O" && ${error} == 0 ]]; then
        turnoActual="X"
    fi fi

    echo "-----------------------------------"
    echo "Turno numero $numeroTurno! toca a ${turnoActual}"
    imprimir_tablero
    
    error=0

    read -p "Elige posicion (1-9): " posicion

    if [ ${tablero[$posicion-1]} == "#" ]; then
        tablero[$posicion-1]="$turnoActual"
    else if [[ posicion -gt 9 || posicion -lt 1 ]]; then
        echo "Posicion no valida, elige otra!"
        error=1
    else if [ ! ${tablero[$posicion-1]} == "#" ]; then
        echo "Posicion ocupada, elige otra!"
        error=1
    fi fi fi

    if [  $error == 0 ]; then
        numeroTurno=$(( numeroTurno + 1 ))
    fi

done