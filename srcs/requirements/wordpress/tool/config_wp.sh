#!/bin/sh

#----------------------#
# Initialise Wordpress #
#----------------------#

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
wp core download --path=$WP_PATH --allow-root
wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb --path=$WP_PATH --skip-check --allow-root
wp core install --url=$DOMANIE_NAME --title=$WP_TITLE --admin_user=$WP_USER --admin_password=$WP_PASS --admin_email=$WP_EMAIL --path=$WP_PATH --skip-email --allow-root
wp user create simon simonjeremy@email.fr --uesr_path=jeremy --role=author --path=$WP_PATH --allow-root



service php7.3-fpm start


