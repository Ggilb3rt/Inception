FROM debian:buster

# Updates and install #
RUN apt-get update && apt-get install -y \
	mariadb-client \
	mariadb-server \
    && mkdir -p /var/run/mysqld \
    && mkdir -p /etc/mysql \
    && mkdir -p /tmp \
    && chown -R mysql:mysql /var/run/mysqld \
    && chown -R mysql:mysql /etc/mysql \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Adding the sources #
COPY tool/config_mariadb.sh /config_mariadb.sh
COPY ./conf /etc/mysql

USER mysql

ENTRYPOINT ["/bin/bash", "/config_mariadb.sh"]
