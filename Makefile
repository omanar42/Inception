NAME = Inception
DOCKER_COMPOSE = ./srcs/docker-compose.yml

all: $(NAME)

$(NAME): build start

build:
	@echo "\n\033[1;36m   | Building Docker images...\033[0m\n"
	@sudo docker-compose -f $(DOCKER_COMPOSE) build -q
	@echo "\033[1;32m   | Docker images built successfully!\033[0m\n"

start:
	@echo "\033[1;36m   | Starting Docker containers...\033[0m\n"
	@sudo docker-compose -f $(DOCKER_COMPOSE) up
	@echo "\n\033[1;32m   | Docker containers started successfully!\033[0m\n"

stop:
	@echo "\033[1;36m   | Stopping Docker containers...\033[0m\n"
	@sudo docker-compose -f $(DOCKER_COMPOSE) down -v
	@echo "\n\033[1;31m   | Docker containers stopped successfully!\033[0m\n"

fclean: stop
	@sudo docker system prune -a -f
	@sudo rm -rf /home/omanar/data/mariadb/*
	@sudo rm -rf /home/omanar/data/wordpress/*
	@echo "\n\033[1;31m</ EVERYTHING HAS BEEN DELETED! >\033[0m\n"

help:
	@echo "\n\033[1;32mAvailable targets:\033[0m"
	@echo "  no target : Build Docker images and start containers"
	@echo "  build     : Build Docker images"
	@echo "  start     : Start Docker containers"
	@echo "  stop      : Stops and removes containers, networks, volumes, and images"
	@echo "  fclean    : Stop and removes volumes data"
	@echo "  help      : Display this help message\n"

re: fclean all

.PHONY: all build start stop fclean help re
