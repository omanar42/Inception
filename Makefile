NAME = Inception

all: $(NAME)

$(NAME): build start

build:
	docker compose -f ./srcs/docker-compose.yml build

start:
	docker-compose -f ./srcs/docker-compose.yml up -d

stop:
	docker-compose -f ./srcs/docker-compose.yml down

restart:
	docker-compose -f ./srcs/docker-compose.yml restart

clean:
	docker-compose -f ./srcs/docker-compose.yml down -v
	docker system prune -a
	rm -rf /home/omanar/data/mariadb/*
	rm -rf /home/omanar/data/wordpress/*

help:
	@echo "Available targets:"
	@echo "  no target : Build Docker images and start containers"
	@echo "  build     : Build Docker images"
	@echo "  start     : Start Docker containers in the background"
	@echo "  stop      : Stop and remove Docker containers"
	@echo "  restart   : Restart Docker containers"
	@echo "  clean     : Remove Docker containers and volumes"
	@echo "  help      : Display this help message"

re: fclean all
