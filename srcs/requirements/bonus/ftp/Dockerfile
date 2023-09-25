FROM debian:bullseye

RUN apt-get update && apt-get install -y vsftpd

COPY ./conf/vsftpd.conf /etc/vsftpd/

COPY ./tools/script.sh ./script.sh

RUN chmod +x ./script.sh && \
		mkdir -p /var/run/vsftpd/empty

EXPOSE 20 21

CMD ["./script.sh"]
