#!/bin/sh

#mkdir -p /etc/mysql
#chown -R mysql:mysql /etc/mysql
#mv /tmp/my.cnf /etc/mysql

# Update init file with .env values
sed -i 's|MYSQL_DATABASE|'${MYSQL_DATABASE}'|g' /etc/mysql/init.sql
sed -i 's|MYSQL_USER|'${MYSQL_USER}'|g' /etc/mysql/init.sql
sed -i 's|MYSQL_PASSWORD|'${MYSQL_PASSWORD}'|g' /etc/mysql/init.sql
sed -i 's|MYSQL_ROOT_PASSWORD|'${MYSQL_ROOT_PASSWORD}'|g' /etc/mysql/init.sql
sed -i 's|MYSQL_PORT|'${MYSQL_PORT}'|g' /etc/mysql/my.cnf
sed -i 's|MYSQL_ADDRESS|'${MYSQL_ADDRESS}'|g' /etc/mysql/my.cnf


if [ -d "/var/lib/mysql/${MYSQL_DATABASE}" ]
then
    echo "Database exist"
    mysqld_safe
else
    mysql_install_db
    mysqld --init-file="/etc/mysql/init.sql"
fi

mysqld
# exec "$@"
# service mysql start
# systemctl start mariadb.service
