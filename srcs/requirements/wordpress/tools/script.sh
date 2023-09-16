#!/bin/bash

mkdir -p /var/www/html/wordpress

mkdir -p /run/php

cd /var/www/html/wordpress

rm -rf *

sleep 10

sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = wordpress:9000/g' /etc/php/7.4/fpm/pool.d/www.conf

wp core download --allow-root

wp config create --dbname=${DATABASE} --dbuser=${DB_USER} --dbpass=${DB_PASS}  --dbhost=${DB_HOST} --dbprefix=wp --allow-root

wp core install --url=${DOMAIN_NAME} --title=${WP_TITLE} --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASS} --admin_email=${WP_ADMIN_EMAIL} --allow-root

wp user create ${NEWUSER_USER} ${NEWUSER_EMAIL} --role=author --first_name=${NEWUSER_FIRSTNAME} --last_name=${NEWUSER_LASTNAME} --allow-root # add password

wp theme install ${WP_THEME} --activate --allow-root

php-fpm7.4 -R -F
