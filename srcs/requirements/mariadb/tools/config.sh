#!/bin/bash

service mariadb start

sleep 5

mariadb -u root -e "ALTER USER 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mariadb -u root -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
mariadb -u root -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mariadb -u root -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mariadb -u root -e "FLUSH PRIVILEGES;"
mariadb -u root -e "USE ${MYSQL_DATABASE};"	

service mariadb stop
