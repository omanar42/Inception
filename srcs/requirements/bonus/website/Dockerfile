FROM debian:bullseye

RUN apt-get update && apt-get install -y nodejs npm

COPY ./tools /app

WORKDIR /app

RUN npm init -y && npm install express -y

CMD ["node", "server.js"]
