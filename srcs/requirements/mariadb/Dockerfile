FROM debian:bullseye

RUN	apt-get update && \
	apt-get install -y mariadb-server

RUN sed -i 's/bind-address            = 127.0.0.1/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/config.sh ./config.sh

RUN chmod +x ./config.sh

RUN ./config.sh

EXPOSE 3306

CMD ["mariadbd"]
