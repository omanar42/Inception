FROM debian:bullseye

EXPOSE 443

RUN  apt-get update && apt-get upgrade -y

RUN  apt-get install nginx -y

# COPY ./default.conf /etc/nginx/sites-available/
COPY ./nginx.conf /etc/nginx/nginx.conf

COPY ./omanar.42.fr.crt /etc/ssl/

COPY ./omanar.42.fr.key /etc/ssl/

CMD ["nginx", "-g", "daemon off;"]
