FROM debian:buster

# Adding the sources #
COPY tool/config_mariadb.sh /config_mariadb.sh
COPY conf/init.sql /tmp/init.sql
COPY conf/my.cnf /etc/mysql

# Updates and install #
RUN apt-get update && apt-get install -y \
	mariadb-client \
	mariadb-server \
    && mkdir -p /var/run/mysqld \
    && chown -R mysql:mysql /var/run/mysqld \
    && chown -R mysql:mysql /etc/mysql \
	&& chown mysql:mysql /tmp/ \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


#make image lighter but probably don't works because of USER !root
#RUN chown -R mysql:mysql /etc/mysql \
#	&& chown mysql:mysql /tmp/


# EXPOSE 3306
USER mysql

ENTRYPOINT ["/bin/bash", "/config_mariadb.sh"]
