.PHONY: all re clean remove rm_volumes create_vol up ps down build images remove logs logs_wordpress logs_mariadb logs_nginx


all: create_vol build up

re: clean all

# Create
hosts:
	sed -i 's|localhost|'$(DOMAINE_NAME)'|g'

create_vol:
	mkdir -p $(HOME)/data/html
	mkdir -p $(HOME)/data/mysql
	sudo chown -R $(USER) $(HOME)/data
	sudo chmod -R 777 $(HOME)/data

build:
	docker compose -f ./srcs/docker-compose.yml build 

# Use
up:
	docker compose -f ./srcs/docker-compose.yml up -d

down:
	docker compose -f ./srcs/docker-compose.yml down

ps:
	docker ps -a

images:
	docker images -a

# Remove
rm_volumes:
	sudo chown -R $(USER) $(HOME)/data
	sudo chmod -R 777 $(HOME)/data
	rm -rf $(HOME)/data
	docker volume rm srcs_wordpress
	docker volume rm srcs_mariadb
	docker volume prune -f

remove: down
	docker images prune -f
	docker container prune -f
	docker system prune -f 

clean: remove rm_volumes

# Debug
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

outside_ip:
	docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' MyNginx
