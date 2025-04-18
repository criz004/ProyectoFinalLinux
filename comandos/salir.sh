#!/bin/bash

echo "Cerrando la terminal, bye..."
sleep 2

if [[ -n "PROYECTO_PID" ]]; then
    kill -9 $PROYECTO_PID
else 
    echo "ERROR"
fi 
