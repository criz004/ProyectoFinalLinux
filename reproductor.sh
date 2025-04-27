#!/bin/bash
#Pregunta nombre de carpeta
read -p "Ingresa el nombre del directorio de musica (debe estar ubicado en /home/${USERNAME}!): " carpeta

#Guarda la carpeta en MUSIC_DIR
MUSIC_DIR="/home/${USERNAME}/${carpeta}"
clear

if [ ! -d "$MUSIC_DIR" ]; then
    echo "Error! no existe tal directorio!"
    exit 1
fi

# Guardamos MP3 a un arreglo
CANCIONES=("$MUSIC_DIR"/*.mp3)
NO_CANCIONES=${#CANCIONES[@]}

# Mostramos la lista de canciones encontradas
echo "=== REPRODUCTOR MP3 ==="
echo "CANCIONES ENCONTRADAS :D"
for i in "${!CANCIONES[@]}"; do #Buscamos por indices, no por el nombre
    echo " [$i] $(basename "${CANCIONES[$i]}")"
done

echo
read -p "Ingresa el indice de la cancion: " INDICE_INI

#Verificamos si el indice esta dentro del intervalo valido
if [[ "$INDICE_INI" -lt 0 || "$INDICE_INI" -ge "$NO_CANCIONES" ]]; then
    echo "Invalid indice."
    exit 1
fi

#Imprimimos controles
echo "Controles: [K] - Anterior, [L] - Siguiente, [Q] - Salir"


indice=$INDICE_INI

while [ $indice -ge 0 ] && [ $indice -lt $NO_CANCIONES ]; do
    CANCION_ACTUAL=$(basename "${CANCIONES[$indice]}")
    echo -e "\nPlaying: $CANCION_ACTUAL"
    
    #Reproducir cancion
    mpg123 -q "${CANCIONES[$indice]}" &
    PID=$!
    actual=""

    #Verificamos si el usuario escribe algo en teclado
    while kill -0 $PID 2>/dev/null; do
        read -rsn1 -t 0.1 key
        if [[ $key == "l" ]]; then
            actual="siguiente"
            break
        elif [[ $key == "k" ]]; then
            actual="anterior"
            break
        elif [[ $key == "q" ]]; then
            kill $PID
            wait $PID 2>/dev/null
            echo "Saliendo. Adios!"
            exit 0
        fi
    done

    #Se realiza accion segun la entrada de usuario
    if [[ $actual == "siguiente" ]]; then
        kill $PID
        wait $PID 2>/dev/null
        indice=$((indice + 1))
        
    elif [[ $actual == "anterior" ]]; then
        kill $PID
        wait $PID 2>/dev/null
        if [ $indice -gt 0 ]; then
            indice=$((indice - 1))
        else
            echo "Te encuentras en la primer cancion!"
            indice=0
        fi
    else
        wait $PID
        indice=$((indice + 1))
    fi
done

echo "Playlist finalizada. Hasta luego!"