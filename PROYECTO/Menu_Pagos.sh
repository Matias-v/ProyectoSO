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
		fecha=$(date +%D)
		read -p "Numero de Apartamento: " numApartamento
		read -p "Cantidad a pagar:" Pago
		saldo=$(tail -1 Apartamento$numApartamento .txt | cut -d: -f4)
		let total=$pago + $saldo
		if ( $total<2100 )
		then
			let deuda=$(2100-$pago)
			echo "$fecha:$deuda:$pago:-$deuda">>Apartamento$numApartamento .txt
		else
			if ($total=2100)
			then
				echo "$fecha:-:$pago:0">>Apartamento$numApartamento .txt
			else
				if ( $total>2100 )
				then	
					let favor=$pago-2100
					echo "$fecha:-:$pago:$favor">>Apartamento$numApartamento .txt
				fi
			fi
		fi
		;;
	2)
		echo " PAGO ELECTRONICO "
		fecha=$(date +%D)
		read -p "Numero de apartamento: " numApartamento
		read -p "Cantidad a pagar: " Pago		
		echo "$fecha:$idBoleta:-:$Pago">>Apartamento$numApartamento .txt
		saldo=$(tail -l Apartamento$numApartamento .txt | cut -d: -f4)
		let total=$pago + $saldo
		if ( $total<2100 )
		then
			let deuda=$(2100-$pago)
			echo "$fecha:$deuda:$pago:-$deuda">>Apartamento$numApartamento .txt
		else
			if ($total=2100)
			then
				echo "$fecha:-:$pago:0">>Apartamento$numApartamento .txt
			else
			fi
				if ($toal>2100)
				then
					let favor=$pago-2100
					echo "$fecha:-:$pago:$favor">>Apartamento$numApartamento .txt
				fi
		fi
		;;
	0) ;;
	*) echo " Ingrese una opcion valida " ;;
	esac
done
