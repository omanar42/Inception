FROM debian:bullseye

RUN  apt-get update && \
	 apt-get install -y php php-fpm php-mysql mariadb-server mariadb-client curl

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/script.sh ./script.sh

RUN chmod +x ./script.sh

CMD ["./script.sh"]
