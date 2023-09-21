FROM debian:bullseye

RUN apt-get update && apt-get install -y wget php php-fpm php-mysql

RUN wget https://www.adminer.org/latest.php -O adminer.php

EXPOSE 9000

CMD ["php", "-S", "0.0.0.0:8080", "adminer.php"]
