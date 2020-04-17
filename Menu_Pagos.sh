#!/bin/bash
clear
op=99
while [ $op -ne 0 ];
do
	echo " INGRESAR PAGOS "
	echo "1 Contado "
	echo "2 Electronico "
	echo "0.Volver"
	read -p "Opcion: " op
	case $op in
	1)
		echo "PAGO AL CONTADO "
		read -p "Cedula de la persona: " ci
		read -p "Ingrese el mes pagado: " mes
		read -p "Numero de Apartamento: " numApartamento
		let TotalPago=2100
		echo "Cantidad a pagar: $TotalPago"
		echo "Ci:Mes:Total pagado">>Apartamento$numApartamento.txt
		echo "$ci:$mes:$TotalPago" >>Apartamento$numApartamento.txt
		;;
	2)
		echo " PAGO ELECTRONICO "
		read -p "Ingrese el mes : " mes
		read -p "Cedula de la persona: " ci
		read -p "Numero de apartamento: " numApartamento
		echo "Cantidad a pagar: $pago "	
		read -p "Numero de boleta: " idBoleta	
		let TotalPago=2100
		echo "Ci:id Boleta:Mes:Total pagado">>Apartamento$numApartamento.txt
		echo "$ci:$idBoleta:$mes:$TotalPago" >>Apartamento$numApartamento.txt
		;;
	0) ;;
	*) echo " Ingrese una opcion valida " ;;
	esac
done
