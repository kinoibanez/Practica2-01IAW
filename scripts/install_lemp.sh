#!/bin/bash

#Script para la instalación de la pila LEMP
 
#Esto muestra todos los comandos que se van ejecutando

set -x 

#Actualizamos los repositorios

apt update

#Actualizamos los paquetes de la máquina 

#apt upgrade -y


#Instalamos mysql

apt install mysql-server -y
#Instalamos el servidor web (NGINX):

apt install nginx -y 

#Instalamos las librerias que nos pide la práctica que son php-fmp y php-mysql 

apt install php-fpm php-mysql -y

#<-----------------------------------Archivo de configuración-------------------------------------------------------->

#Copiamos el archivo de configuración llamado (Default).

cp ../conf/default /etc/nginx/sites-available/default

#<-----------------------------------Fin de Archivo de configuración-------------------------------------------------------->


#Reiniciamos el servicio de Ngix (Como apache2 pero diferente comando).

systemctl restart nginx

#<-----------------------------------Archivo de configuración de PHP-------------------------------------------------------->

cp ../php/info.php /var/www/html

#<-----------------------------------Fin de Archivo de configuración de PHP-------------------------------------------------------->

#Modificamos los permisos del propietario para el usuario de (NGIX) parecido a Apache2.

chown -R www-data:www-data /var/www/html