# Inception
Projet docker compose de 42

## Basics cmds
### Docker
```bash
docker run image	            // start container
docker run -it image	        // start container in interactive mode
docker ps		                // print stated containers
docker rm id/name	            // stop container

docker run -p 80:80 img	        // start container and map port 80 from container to port 80 of computer
docker image ls                 // list local images
docker inspect <tag or id>
```
### Docker-compose
```bash
docker compose up -d			// -d == detach mode
docker compose stop				// stop services
docker compose down				// bring everything down --volumes option to remove volumes
docker compose ps
```

## General
[x] use ENV VAR
[X] file .env with all env var inside (in ./srcs/) (optional)
[x] use docker-network to link containers
[x] restart crashed containers

## NGINX
[x] ! only starting point is Nginx on port 443
[ ] use protocole TLSv1.2 or TLSv1.3
[ ] ggilbert.42.fr must return localhost website

## Wordpress + php-fpm
[x] use port 9000 with NGINX
[x] use port 3306 with MariaDB
[x] 2 users, one is admin and don't have "Admin" or "admin" in his name

## MariaDB
[ ] use port 3306 (share with wordpress, not NGINX)

## Volumes
[x] volumes must be in /home/ggilbert/data
### Wordpress BDD
[x] in /home/ggilbert/data/mysql
### Wordpress files
[x] in /home/ggilbert/data/html


## SEARCH
### What are Daemons and how they works ?

### Why PID 1 in docker is important ?