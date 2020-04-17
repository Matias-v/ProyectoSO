echo "Ingrese su usuario"
read usuario
echo "Ingrese password"
read pass

if [ $usuario = "admin" ] && [ $pass = "admin123" ]
then
	echo "Bienvenido $usuario "
	sh Menu.sh
else 
	echo "Acceso denegado "
fi
