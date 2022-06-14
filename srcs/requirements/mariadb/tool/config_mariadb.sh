#!/bin/sh

#--------------------#
# Initialise MariaDb #
#--------------------#
service mysql start

MARIA_DB_NAME="mybdd"
MARIA_DB_ROOT_PASS="qwerty"
BDD_USER_NAME="ggilbert"
BDD_USER_PASS="123"

# Secure
#mysql -e "SET PASSWORD FOR root@localhost = PASSWORD('$MARIA_DB_ROOT_PASS');"
#mysql -e "DELETE FROM mysql.user WHERE User='';"
#mysql -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1')"

# Create bdd and user
mysql -e "CREATE DATABASE $MARIA_DB_NAME;"
mysql -e "GRANT ALL ON *.* TO '$BDD_USER_NAME'@'localhost' IDENTIFIED BY '123';FLUSH PRIVILEGES;"
