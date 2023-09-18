FROM debian:bullseye

RUN  apt-get update && \
	 apt-get install -y php php-fpm php-mysql mariadb-server mariadb-client curl

RUN sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = wordpress:9000/g' /etc/php/7.4/fpm/pool.d/www.conf

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/script.sh ./script.sh

RUN chmod +x ./script.sh

CMD ["./script.sh"]
