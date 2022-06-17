.PHONY: all create_vol up ps down build images


all: create_vol build up

create_vol:
	mkdir -p $(HOME)/data/html
	mkdir -p $(HOME)/data/mysql
	sudo chown -R $(USER) $(HOME)/data
	sudo chmod -R 777 $(HOME)/data

build:
	sudo docker compose -f ./srcs/docker-compose.yml build 

up:
	sudo docker compose -f ./srcs/docker-compose.yml up -d

down:
	sudo docker compose -f ./srcs/docker-compose.yml down

ps:
	sudo docker ps -a

images:
	sudo docker images -a

# remove:

go_nginx:
	sudo docker exec -ti MyNginx bash

logs:
	cd srcs && sudo docker compose logs mariadb wordpress nginx
logs_wordpress:
	cd srcs && sudo docker compose logs wordpress