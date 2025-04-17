# !/bin/bash
# Proyecto de bash
# Desarrollado por:
# - 
# - Velasco Avila Cristopher

clear
command="null"
cd ~

while true;
do
    read -p "${USERNAME}@${HOSTNAME} $(pwd) -> " command
    
    case $command in

    exit)
        break
        ;;

    PATTERN_2)
        echo STATEMENTS_2
        ;;

    PATTERN_N)
        echo STATEMENTS_N
        ;;

    *)
        $command
        ;;
    esac


done

echo "Final lol"
