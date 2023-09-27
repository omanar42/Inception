#!/bin/bash

if [ ! -f "/var/www/html/wordpress/index.php.bak" ]; then

mkdir -p /var/www/html/wordpress

mkdir -p /run/php

chmod -R 777 /var/www/html/wordpress
chown -R www-data:www-data /var/www/html/wordpress

cd /var/www/html/wordpress


rm -rf *

wp core download --allow-root

sleep 5

wp config create --dbname=${DATABASE} --dbuser=${DB_USER} --dbpass=${DB_PASS}  --dbhost=${DB_HOST} --dbprefix=wp --allow-root

wp core install --url=${DOMAIN_NAME} --title=${WP_TITLE} --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASS} --admin_email=${WP_ADMIN_EMAIL} --allow-root

wp user create ${NEWUSER_USER} ${NEWUSER_EMAIL} --role=${NEWUSER_ROLE} --first_name=${NEWUSER_FIRSTNAME} --last_name=${NEWUSER_LASTNAME} --user_pass=${NEWUSER_PASS} --allow-root

wp theme install ${WP_THEME} --activate --allow-root

wp plugin install redis-cache --activate --path="/var/www/html/wordpress" --allow-root
wp config set WP_REDIS_HOST redis --path="/var/www/html/wordpress" --allow-root
wp config set WP_REDIS_PORT 6379 --path="/var/www/html/wordpress" --raw --allow-root
wp config set WP_CACHE_KEY_SALT ${DOMAIN_NAME} --path="/var/www/html/wordpress" --allow-root
wp config set WP_REDIS_CLIENT redis --path="/var/www/html/wordpress" --allow-root
wp config set WP_REDIS_DATABASE 0 --path="/var/www/html/wordpress" --allow-root
wp config set WP_CACHE true --path="/var/www/html/wordpress" --allow-root
wp config set WP_REDIS_PATH /var/run/redis/redis.sock --path="/var/www/html/wordpress" --allow-root
wp plugin update --all --allow-root
wp redis enable --path="/var/www/html/wordpress" --force --allow-root

cp index.php index.php.bak

fi

php-fpm7.4 -R -F
