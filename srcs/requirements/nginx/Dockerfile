FROM debian:bullseye

RUN  apt-get update && \
	 apt-get install -y nginx openssl

COPY ./conf/omanar.42.fr.conf /etc/nginx/conf.d/

COPY ./conf/omanar.42.fr.crt /etc/ssl/

COPY ./conf/omanar.42.fr.key /etc/ssl/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
