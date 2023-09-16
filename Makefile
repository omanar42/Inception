NAME = Inception

all: $(NAME)

$(NAME): build start

build:
	sudo docker-compose -f ./srcs/docker-compose.yml build

start:
	sudo docker-compose -f ./srcs/docker-compose.yml up 

stop:
	sudo docker-compose -f ./srcs/docker-compose.yml down

restart:
	sudo docker-compose -f ./srcs/docker-compose.yml restart

clean:
	sudo docker-compose -f ./srcs/docker-compose.yml down -v
	sudo docker system prune -a
	sudo rm -rf /home/omanar/data/mariadb/*
	sudo rm -rf /home/omanar/data/wordpress/*

help:
	@echo "Available targets:"
	@echo "  no target : Build Docker images and start containers"
	@echo "  build     : Build Docker images"
	@echo "  start     : Start Docker containers in the background"
	@echo "  stop      : Stop and remove Docker containers"
	@echo "  restart   : Restart Docker containers"
	@echo "  clean     : Remove Docker containers and volumes"
	@echo "  help      : Display this help message"

re: clean all
