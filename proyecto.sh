# !/bin/bash
# Proyecto de bash
# Desarrollado por:
# - Hernandez Rodriguez Frida
# - Velasco Avila Cristopher

trap '' SIGINT
trap '' SIGTSTP

tput clear
command="null"
guia=$(pwd)
cd ~

export PROYECTO_PID=$$

echo "Proyecto Bash en Linux"
echo "Version 1.0.0"
echo "Para ayuda de comandos, escriba "ayuda""
echo
sleep 2

while true;
do
    read -p "${USERNAME}@${HOSTNAME} $(pwd) -> " command
    
    case $command in

    ayuda)
        echo
        $guia/comandos/ayudaa.sh
        echo
        ;;

    creditos)
        $guia/comandos/creditos.sh
        ;;

    buscar)
        $guia/encuentra.sh
        ;;
    
    infosis)
        $guia/infosis.sh
        ;;
    
    hora)
        $guia/hora.sh
        ;;
    
    juego)
        $guia/gato.sh
        ;;

    musica)
        echo "Aqui va el reproductor.sh"
        ;;

    salir)
        $guia/comandos/salir.sh
        ;;

    exit)
        echo "Comando deshabilitado. Usa el comando -salir- para cerrar la terminal"
        ;;

    *)
        $command
        ;;
    esac
done

echo "Final lol"
