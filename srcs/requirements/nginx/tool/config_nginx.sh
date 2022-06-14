#!/bin/sh
# Configuration file for ftserver


#--------------------#
# Initialise Nginx   #
#--------------------#
ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

#--------------------#
# Initialise Openssl #
#--------------------#
COUNTRY="FR"
STATE="france"
LOCALITY="Paris"
ORGA="My corp"
ORGAUNIT="Le France unit"
COMMON_NAME=WP_TITLE
EMAIL=WP_EMAIL

#-x509 makes a self-signed certificate; -nodes skip secure width passphrase; -newkey generete certificate and key
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt \
	-subj "/C=$COUNTRY/ST=$STATE/L=$LOCALITY/O='$ORGA'/OU='$ORGAUNIT'/CN='$COMMON_NAME'/emailAddress='$EMAIL'"


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


service nginx start


