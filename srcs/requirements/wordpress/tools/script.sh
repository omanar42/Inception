mkdir -p /run/php/

mkdir -p /var/www/html/wordpress

cd /var/www/html/wordpress

wp core download --allow-root

wp core config --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=${MYSQL_HOST} --allow-root

wp core install --url=${DOMAIN_NAME} --title=${WORDPRESS_DB_TITLE} --admin_user=${WORDPRESS_ADMIN_USER} --admin_password=${WORDPRESS_ADMIN_PASSWORD} --admin_email=${WORDPRESS_ADMIN_EMAIL} --allow-root

php-fpm7.4 -R -F
