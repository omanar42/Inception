FROM debian:bullseye

RUN apt-get update && apt-get install -y vsftpd

COPY ./tools/vsftpd.conf /etc/vsftpd.conf

COPY ./tools/script.sh ./script.sh

RUN chmod +x ./script.sh

EXPOSE 21

CMD ["./script.sh"]
