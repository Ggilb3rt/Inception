# Inception
Projet docker compose de 42

## Basics cmds
```bash
docker run image	// start container
docker run -it image	// start container in interactive mode
docker ps		// print stated containers
docker rm id/name	// stop container

docker run -p 80:80 img	// start container and map port 80 from container to port 80 of computer
```

## General
[] use ENV VAR
[] file .env with all env var inside (in ./srcs/) (optional)

## NGINX
[] only starting point on port 443
[] use protocole TLSv1.2 or TLSv1.3
[] ggilbert.42.fr must return localhost website

## Wordpress + php-fpm
[] use port 9000 with NGINX
[] use port 3306 with MariaDB

## MariaDB
[] use port 3306 (share with wordpress, not NGINX)
[] 2 users, one is admin and don't have "Admin" or "admin" in his name

## Volumes
[] volumes must be in /homme/ggilbert/data
### Wordpress BDD

### Wordpress files
