FROM debian:bullseye

EXPOSE 3306

RUN  apt update && apt upgrade

RUN  apt install mariadb-server -y

CMD ["mysqld", "--user=root", "--console"]
