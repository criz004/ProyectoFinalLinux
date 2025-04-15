#!/bin/bash

#Leemos el directorio
read -p "Ingresa el nombre del directorio: " path

#Ingresa diagonal al final de path si no la tiene
if [[ ! ${path} == */ ]]; then
    path="${path}/"
fi

#Revisamos si el directorio existe
if [[ ! -d ${path} ]]; then
    echo "¡Error! El directorio no existe. Abortando..."
    exit
fi

#Leemos el nombre del archivo
read -p "Ingresa el nombre del archivo: " name

#Revisamos si el archivo existe como tal
if [ -e "${path}${name}" ]; then
    echo "El archivo si existe"
else 
    read -p "El archivo no existe. ¿Deseas crearlo? (s/*): " opcion
    if [[ $opcion == "s" || $opcion == "S" ]]; then
        touch ${path}${name}
    fi
fi 