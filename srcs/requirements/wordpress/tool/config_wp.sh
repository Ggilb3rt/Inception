#!/bin/sh


sed -i 's|PHP_PORT|'${PHP_PORT}'|g' /etc/php/7.3/fpm/pool.d/www.conf

#----------------------#
# Initialise Wordpress #
#----------------------#

if [ -e "${WP_PATH}/wp-config.php" ]
then
    echo "Wordpress is already set"
else
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
    wp core download --path=$WP_PATH --allow-root
    wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb --path=$WP_PATH --skip-check --allow-root
    wp core install --url=$DOMAINE_NAME --title=$WP_TITLE --admin_user=$WP_USER --admin_password=$WP_PASS --admin_email=$WP_EMAIL --path=$WP_PATH --skip-email --allow-root
    wp user create simon simonjeremy@email.fr --user_pass=jeremy --role=author --path=$WP_PATH --allow-root
    wp rewrite structure '/%postname%/'
fi


# service php7.3-fpm start
/usr/sbin/php-fpm7.3 -F
