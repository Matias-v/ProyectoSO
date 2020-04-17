#!/bin/bash
set dia=$(date +%d)
set mes=$(date +%m)
set anio=$(date +%Y)
set limite=10
set gc=2100
set dto=0.05

if [ $dia -lt $limite ]
then 
	export pago=2100
	sh Menu_Pagos.sh
else	
 	let z = $(gc*dto)
	let pagoConDescuento = $(gc-z)
	export pago=(2100-$z)
	sh Menu_Pagos.sh
fi
