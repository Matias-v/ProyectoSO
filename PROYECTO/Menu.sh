#!/bin/bash
op=99
while [ $op -ne 0 ]
do
	clear
	echo " MENU "
	echo "--------------------"
	echo "1.Inquilinos"
	echo "2.Pagos"
	echo "3.Estado de cuenta"
	echo "4.Apartamentos "
	echo "5.Salir"
	echo "Opcion : "
	read op
	case $op in
		1)
		sh Menu_Inquilinos.sh;;
		2)
		sh Descuento.sh;;
		3)
		sh Menu_Estados_Cuenta.sh;;
		4)
		sh Menu_Apartamentos.sh ;;
		0)	
		clear
		echo "Hasta luego!, Gracias por utilizar nuestro programa"
		;;

		*)
		echo "Ingrese una opcion valida";;
	esac
done
