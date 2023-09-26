#!/bin/bash

if [ ! -f "/etc/mariadb.bak" ]; then

service mariadb start

mariadb -u root -e "CREATE DATABASE IF NOT EXISTS ${DATABASE};"
mariadb -u root -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}';"
mariadb -u root -e "GRANT ALL PRIVILEGES ON ${DATABASE}.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}';"
mariadb -u root -e "FLUSH PRIVILEGES;"

service mariadb stop

touch /etc/mariadb.bak

fi

mariadbd
