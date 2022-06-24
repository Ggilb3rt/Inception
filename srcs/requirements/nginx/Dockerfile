FROM debian:buster

# Updates and install #
RUN apt-get update && apt-get install -y \
	curl \
	procps \
	nginx \
	openssl \
    && mkdir -p /etc/nginx/ssl \
    && mkdir -p /run/nginx \
    && chown -R www-data /var/lib/nginx \
    && rm -rf /etc/nginx/sites-available/default \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
	#&& echo "daemon off;" >> /etc/nginx/nginx.conf

# Adding the sources #
COPY tool/config_nginx.sh /config_nginx.sh

EXPOSE 443
ENTRYPOINT ["/bin/bash", "/config_nginx.sh"]
