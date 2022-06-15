FROM debian:buster

# Updates and install #
RUN apt-get update && apt-get install -y \
	curl \
	nginx \
	openssl \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
	&& echo "daemon off;" >> /etc/nginx/nginx.conf

# Adding the sources #
# COPY conf/default /etc/nginx/sites-available/default # not used because config_nginx.sh generate it
COPY tool/config_nginx.sh /config_nginx.sh

EXPOSE 443
ENTRYPOINT ["/bin/bash", "/config_nginx.sh"]
