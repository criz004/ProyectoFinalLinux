#!/bin/bash

# Este script muestra la hora y la fecha con ayuda del archivo rtc. Despues se examina el valor con grep y las expresiones regulares

echo "Hora: "$(cat /proc/driver/rtc | grep -o -E -m 1 '[0-9]{2}:[0-9]{2}:[0-9]{2}')
echo "Fecha: "$(cat /proc/driver/rtc | grep -o -E -m 1 '[0-9]{4}-[0-9]{2}-[0-9]{2}')


