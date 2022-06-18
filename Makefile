.PHONY: all create_vol up ps down build images remove logs logs_wordpress logs_mariadb logs_nginx


all: create_vol build up

create_vol:
	mkdir -p $(HOME)/data/html
	mkdir -p $(HOME)/data/mysql
	sudo chown -R $(USER) $(HOME)/data
	sudo chmod -R 777 $(HOME)/data

build:
	docker compose -f ./srcs/docker-compose.yml build 

up:
	docker compose -f ./srcs/docker-compose.yml up -d

down:
	docker compose -f ./srcs/docker-compose.yml down

ps:
	docker ps -a

images:
	docker images -a

# remove:

go_nginx:
	docker exec -ti MyNginx bash
go_mariadb:
	docker exec -ti MyMariadb bash
go_wordpress:
	docker exec -ti MyWordpress bash

logs:
	cd srcs && docker compose logs mariadb wordpress nginx
logs_wordpress:
	cd srcs && docker compose logs wordpress
logs_mariadb:
	cd srcs && docker compose logs mariadb
logs_nginx:
	cd srcs && docker compose logs nginx