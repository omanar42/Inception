FROM debian:bullseye

EXPOSE 443

RUN  apt-get update && apt-get upgrade -y

RUN  apt-get install nginx -y

COPY nginx.conf /etc/nginx/nginx.conf

COPY ./omanar.42.fr.crt /etc/nginx/ssl/omanar.42.fr.crt

COPY ./omanar.42.fr.key /etc/nginx/ssl/omanar.42.fr.key

CMD ["nginx", "-g", "daemon off;"]
