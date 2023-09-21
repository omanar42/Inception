FROM debian:bullseye

RUN apt-get update && apt-get install -y redis-server php-redis

COPY ./tools/redis.sh ./redis.sh

RUN chmod +x ./redis.sh && ./redis.sh

EXPOSE 6379

CMD ["redis-server", "--protected-mode no"]
