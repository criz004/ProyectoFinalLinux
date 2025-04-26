# !/bin/bash
# Proyecto de bash
# Desarrollado por:
# - Hernandez Rodriguez Frida
# - Velasco Avila Cristopher

trap '' SIGINT
trap '' SIGTSTP

# LOGIN
tput clear
echo "Hola hola, bienvenido a esta terminal"
#Usuario
read -p "Usuario: " usuario

if id "$usuario" &>/dev/null; then
    echo "Usuario encontrado"
else 
    echo "No se encontró el usuario"
    exit 1
fi

#Contraseña
read -s -p Contraseña:
echo

if [ -z "$contraseña" ]; then
    echo "No ingresaste ninguna contraseña. Intenta de nuevo."
    exit 1
fi

echo "$contraseña" | sudo -S -u "$usuario" whoami &>/dev/null

if [ $? -eq 0 ] ; then
   echo "Todo cool, puedes entrar $usuario"
else 
  echo " Ey te equivocaste en la contraseña, no puedes entrar, intenta de nuevo"
  exit 1
fi

sleep 2
clear


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
    read -p "${usuario}@${HOSTNAME} $(pwd) -> " command
    
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
