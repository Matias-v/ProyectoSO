#!/bin/bash
clear
opApto=99
while [ $opApto -ne 0 ]; 
do
        tput setaf 6
	echo "APARTAMENTOS"
	echo "1.Ver estado apartamentos"
	echo "0.Salir"
        read -p "Opcion: " opApto
    
        case $opApto in
        1)
                clear
                cat Apartamentos.txt|sort
                ;;
        0)	clear
		tput sgr0
		;;

        *)	
		clear
		tput cup $fila 1
		tput setaf 9
		tput setab 8
		echo "Ingrese una opcion Valida"
		tput sgr0
		tput cup 0 0
                ;;
	esac
done
