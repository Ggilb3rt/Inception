FROM debian:buster

# Updates and install #
RUN apt-get update && apt-get install -y \
	curl \
	mariadb-client \
	php \ 
	php-cli \ 
	php-mysql \
	php7.3-cgi \ 
	php7.3-common \ 
	php7.3-fpm \
	php7.3-gd \
	php7.3-mbstring \ 
	&& rm -rf /etc/php/7.3/fpm/pool.d/www.conf \
	&& mkdir -p run/php \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Adding the sources #
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY tool/config_wp.sh /config_wp.sh

ENTRYPOINT ["/bin/bash", "/config_wp.sh"]
