FROM debian:buster
MAINTAINER Gilbert Guillaume (contact@guillaumegilbert.fr)

# Updates and install #
RUN apt-get update \
    && apt-get install -y \
	mariadb-server mariadb-client
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \

# Adding the sources #
COPY tool/config_mariadb.sh /config_mariadb.sh

EXPOSE 3306

ENTRYPOINT ["/bin/bash", "/config_mariadb.sh"]
