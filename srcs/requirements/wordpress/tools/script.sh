#!/bin/bash

mkdir -p /var/www/html/wordpress

mkdir -p /run/php

cd /var/www/html/wordpress

rm -rf *

wp core download --allow-root

sleep 3

wp config create --dbname=${DATABASE} --dbuser=${DB_USER} --dbpass=${DB_PASS}  --dbhost=${DB_HOST} --dbprefix=wp --allow-root

wp core install --url=${DOMAIN_NAME} --title=${WP_TITLE} --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASS} --admin_email=${WP_ADMIN_EMAIL} --allow-root

wp user create ${NEWUSER_USER} ${NEWUSER_EMAIL} --role=${NEWUSER_ROLE} --first_name=${NEWUSER_FIRSTNAME} --last_name=${NEWUSER_LASTNAME} --user_pass=${NEWUSER_PASS} --allow-root

wp theme install ${WP_THEME} --activate --allow-root

php-fpm7.4 -R -F
