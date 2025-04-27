#!/bin/bash

# Leemos hora y fecha desde el archivo /proc/driver/rtc
hora=$(grep -o -E -m 1 '[0-9]{2}:[0-9]{2}:[0-9]{2}' /proc/driver/rtc)
fecha=$(grep -o -E -m 1 '[0-9]{4}-[0-9]{2}-[0-9]{2}' /proc/driver/rtc)

# Separamos la hora en sus tres componentes
horas=${hora:0:2}
minutos=${hora:3:2}
segundos=${hora:6:2}

# Separamos la fecha en tres componentes
anio=${fecha:0:4}
meses=${fecha:5:2}
dias=${fecha:8:2}

# Zona horaria nueva
offset=-6

hora_nueva=$((10#$horas + offset))

# Ajustar fecha si es necesario

if [ "$hora_nueva" -lt 0 ]; then
    hora_nueva=$((hora_nueva + 24))
    dias=$((10#$dias - 1))
fi

if [ "$hora_nueva" -ge 24 ]; then
    hora_nueva=$((hora_nueva - 24))
    dias=$((10#$dias + 1))
fi

echo "Hora: ${hora_nueva}:${minutos}:${segundos}"
echo "Fecha: ${anio}-${meses}-${dias}"
