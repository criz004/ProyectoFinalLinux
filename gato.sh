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

function revisar_ganador(){

    # Check de horizontales
    if [[ ${tablero[0]} == ${tablero[1]} && ${tablero[1]} == ${tablero[2]} && ${tablero[0]} != "#" ]]; then
        ganador="${tablero[0]}"
    else if [[ ${tablero[3]} == ${tablero[4]} && ${tablero[4]} == ${tablero[5]} && ${tablero[3]} != "#" ]]; then
        ganador="${tablero[3]}"
    else if [[ ${tablero[6]} == ${tablero[7]} && ${tablero[7]} == ${tablero[8]} && ${tablero[6]} != "#" ]]; then
        ganador="${tablero[6]}"
    # Check de verticales
    else if [[ ${tablero[0]} == ${tablero[3]} && ${tablero[3]} == ${tablero[6]} && ${tablero[0]} != "#" ]]; then
        ganador="${tablero[0]}"
    else if [[ ${tablero[1]} == ${tablero[4]} && ${tablero[4]} == ${tablero[7]} && ${tablero[1]} != "#" ]]; then
        ganador="${tablero[1]}"
    else if [[ ${tablero[2]} == ${tablero[5]} && ${tablero[5]} == ${tablero[8]} && ${tablero[2]} != "#" ]]; then
        ganador="${tablero[2]}"
    # Check de diagonales
    else if [[ ${tablero[0]} == ${tablero[4]} && ${tablero[4]} == ${tablero[8]} && ${tablero[0]} != "#" ]]; then
        ganador="${tablero[0]}"
    else if [[ ${tablero[2]} == ${tablero[4]} && ${tablero[4]} == ${tablero[6]} && ${tablero[2]} != "#" ]]; then
        ganador="${tablero[2]}"
    else if [[ ${numeroTurno} == 10 ]]; then
        ganador="Empate"
    fi fi fi fi fi fi fi fi fi
}

ganador=0
turnoActual=X
numeroTurno=1

while [ $ganador == 0 ] 
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

    if [[ posicion -gt 9 || posicion -lt 1 ]]; then
        echo "Posicion no valida, elige otra!"
        error=1
    else if [ ! ${tablero[$posicion-1]} == "#" ]; then
        echo "Posicion ocupada, elige otra!"
        error=1
    else if [ ${tablero[$posicion-1]} == "#" ]; then
        tablero[$posicion-1]="$turnoActual"
    fi fi fi

    if [  $error == 0 ]; then
        numeroTurno=$(( numeroTurno + 1 ))
    fi

    revisar_ganador



done

echo "-----------------------------------"
imprimir_tablero

if [[ ${ganador} == "Empate" ]]; then
    echo "Empate! Nadie gana"
    echo
else
    echo "El ganador es $ganador!"
    echo
fi
exit