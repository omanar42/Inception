FROM debian:bullseye


RUN  apt-get update && \
	 apt-get install -y nginx openssl

COPY ./nginx.conf /etc/nginx/nginx.conf

COPY ./omanar.42.fr.crt /etc/ssl/

COPY ./omanar.42.fr.key /etc/ssl/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
