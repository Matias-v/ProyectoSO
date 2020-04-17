#!/bin/bash
op = 99
while [ $opEst -ne 0 ]
do
    	echo " ESTADOS DE CUENTA"
    	echo "1.Emitir estado de cuenta"
	echo "2.Consultar situacion de un propietario"
	echo "3.Consultar deudores"
	echo "0.Volver"
	echo "Opcion: "
	read opEst
	case $opEst in
	1)	echo "Ingrese el numero de apartamento:"
		read apto
		cat Apartamento$apto .txt
		;;
	2)
		echo "Ingrese el numero de apartamento: "
		read apto
		tail -1 Apartamento$apto .txt|| cut -d: -f4	
		;;

	3)	
		for ((cont=0;cont<ls Deudores;cont++))
		do
			saldo=$(tail -1 Apartamento$cont .txt || cut -d: -f4)
			if ($saldo<0)
			then
				echo "El apartamento $cont debe: $saldo"
			fi
		done	
		;;
	0);;
	*)echo "Ingrese una opcion valida";;
	esac
done
