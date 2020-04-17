#!/bin/bash
opInq=99
while [ $opInq -ne 0 ];
do
	echo "INQUILINOS"
	echo "1.Ingresar "
	echo "2.Modificar datos "
	echo "3.Eliminar "
	echo "4.Buscar "
	echo "0.Volver "
	echo " Opcion : "
	read opInq

	case $opInq in

	1)
		echo " INGRESO DE INQUILINOS "
		echo "Nombre: "
		read nombre
		echo "Apellido: "
		read apellido
		echo "Cedula de identidad: "
		read ci
		echo "Numero de apartamento: "
		read numApartamento
		apto=$(grep $numApartamento EstadoAptos.txt | cut -d: -f2)
		if ($apto="libre")	
		then
			echo "$ci-$nombre-$apellido-$numApartamento" >>Inquilinos.txt
		else
			echo "Apartamento no disponible"
		fi
		;;
	2)
		echo " MODIFICAR DATOS "
		echo " Ingrese la cedula de identidad del inquilino "
		read ci
		echo "Que datos desea modificar?"
		echo "1.Nombre"
		echo "2.Apellido"
		echo "3.Numero de apartamento"
		echo "opcion:"
		read opModif
		ci=$(grep "$ci" | cut -d: -f1)
		nombre=$(grep "$ci" | cut -d: -f2)
		apellido=$(grep "$ci" | cut -d -f3)
		numApartamento=$(grep "$ci" | cut -d: -f4)
		grep -v "$ci" Inquilinos.txt >InquilinosTemp.txt
		case opModif in
		1)
			echo "Ingrese el nuevo nombre: "
			read nombre
			echo "$ci:$nombre:$apellido:$numApartamento" >>InquilinosTemp.txt
			;;
		2)
			echo "Ingrese el nuevo apellido: "
			read apellido
			echo "$ci-$nombre-$apellido-$numApartamento" >>InquilinosTemp.txt
			;;
		3)
			echo "Ingrese el nuevo numero de apartamento: "
			read numApartamento
			echo "$ci-$nombre-$apellido-$numApartamento" >>InquilinosTemp.txt
			;;
		*)
			echo "ingrese una opcion correcta"
			;;
		esac
		rm Inquilinos.txt
		mv InquilinosTemp.txt Inquilinos.txt
		;;
	3)
		echo "ELIMINAR"
		echo "Ingrese la cedula de identidad del inquilino a eliminar: "
		read ci
		grep -v "$ci.txt" Inquilinos.txt >InquilinosTemp.txt
		rm Inquilinos.txt
		mv InquilinosTemp.txt Inquilinos.txt
		;;
	4)
		echo "BUSCAR "
		echo "Ingrese la cedula de identidad del inquilino: "
		read ci
		grep $ci Inquilinos.txt
		;;
	0) ;;
	*)
		echo "Ingrese una opcion valida "
		;;
	esac
done
