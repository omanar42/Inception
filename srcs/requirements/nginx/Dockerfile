FROM debian:bullseye

RUN  apt-get update && \
	 apt-get install -y nginx openssl

COPY ./tools/nginx.conf /etc/nginx/nginx.conf

COPY ./tools/omanar.42.fr.crt /etc/ssl/

COPY ./tools/omanar.42.fr.key /etc/ssl/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
