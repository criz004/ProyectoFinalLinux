# Proyecto Final Linux
PROTECSA. Curso de capacitación: Generación 1
Proyecto final del curso de GNU/Linux. Linea de comandos ejecutada directamente desde Bash.
Desarrollado por:
- Hernandez Rodriguez Frida
- Velasco Avila Cristopher

## Objetivo
- Implementación de una simulación de terminal sencilla en bash que aplique la mayoria de conocimientos adquiridos durante el curso de capacitación.

## Instalación

#### Instalación desde Bash
La instalación es muy sencilla, desde la linea de comandos se debe de clonar el repositorio y ejecutarlo con los siguientes comandos:
```bash
git clone https://github.com/criz004/ProyectoFinalLinux.git
cd ProyectoFinalLinux
./proyecto.sh
```

#### Instalación desde la interfaz de github
Para instalar el programa desde github, es posible descargar el proyecto por medio el boton **Download ZIP** que se encuentra en la parte superior del repositorio en el botón **<> Code**

## Estructura del proyecto
A continuación se muestran los archivos incluidos y la función de cada uno:
```
ProyectoFinalLinux
├── comandos         # Carpeta con scripts adicionales
|   ├── ayuda.sh     # Script para imprimir la ayuda
|   ├── creditos.sh  # Muestra los creditos del proyecto
|   └── salir.sh     # Script para manejar la salida del programa
├── encuentra.sh     # Script para encontrar archivos 
├── gato.sh          # Juego de gato!
├── hora.sh          # Script para mostrar la hora
├── infosis.sh       # Script para mostrar información del sistema
├── proyecto.sh      # Script principal! Ejecutar para iniciar el programa
├── reproductor.sh   # Script reproductor de mp3
└── README.md        # Carpeta que contiene los registros de las ejecuciones
```

## Consideración importante
En el repositorio se incluyen ademas algunas muestras de canciones para probar el reproductor. Si se desea usar estas canciones, debes de copiar o cortar la carpeta y colocarla en la dirección
```/home/user/```
Al momento de ejecutar el reproductor, se solicitará el nombre de la carpeta a usar para la musica. Si se usa las canciones del reproductor, escribir _songs_
