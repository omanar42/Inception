FROM debian:bullseye

RUN	apt-get update && \
	apt-get install -y mariadb-server

COPY ./tools/config.sh ./config.sh

RUN chmod +x ./config.sh

RUN ./config.sh

EXPOSE 3306

CMD ["mariadbd"]
