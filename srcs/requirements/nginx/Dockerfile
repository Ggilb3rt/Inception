FROM debian:buster
MAINTAINER Gilbert Guillaume (contact@guillaumegilbert.fr)

# Updates and install #
RUN apt-get update \
    && apt-get install -y \
	# mariadb-server mariadb-client \
	nginx \
	# php php7.3-fpm php-cli php-mysql php7.3-mbstring php7.3-cgi php7.3-common php7.3-gd\
	openssl curl\
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && echo "daemon off;" >> /etc/nginx/nginx.conf

# Adding the sources #
COPY tool/config_nginx.sh /config_nginx.sh
COPY conf/default /etc/nginx/sites-available/default
# COPY srcs/index.html /var/www
# ADD srcs/wordpress-5.3.1-fr_FR.tar.gz var/www
# COPY srcs/wp-config.php /var/www/wordpress
# ADD srcs/phpMyAdmin-5.0.1-all-languages.tar.gz /var/www

# Config phpMyAdmin
# RUN mv var/www/phpMyAdmin-5.0.1-all-languages var/www/phpmyadmin \ 
# 	&& chown -Rfv www-data:www-data /var/www/phpmyadmin \
# 	&& chown -Rfv www-data:www-data /var/www/wordpress


# EXPOSE 80
EXPOSE 443
ENTRYPOINT ["/bin/bash", "/config_nginx.sh"]
