FROM debian:bullseye

RUN apt-get update && apt-get install -y vsftpd

COPY ./conf/vsftpd.conf /etc/vsftpd.conf
COPY ./conf/vsftpd.pem /etc/ssl/private/vsftpd.pem
COPY ./tools/script.sh ./script.sh
RUN chmod +x ./script.sh

EXPOSE 21

ENTRYPOINT ["./script.sh"]