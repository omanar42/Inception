FROM debian:bullseye

EXPOSE 3306

RUN  apt-get update && apt-get upgrade

RUN  apt-get install mariadb-server -y

COPY ./script.sh ./script.sh

ARG  MYSQL_USER MYSQL_PASSWORD MYSQL_DB MYSQL_HOST DB_ROOT_PASSWORD

RUN chmod +x script.sh

# RUN ./script.sh

CMD ["mysqld"]
