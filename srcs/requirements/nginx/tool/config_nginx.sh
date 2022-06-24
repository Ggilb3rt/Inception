#!/bin/sh

# Create default file
printf "server {
		listen 443 ssl;
		listen [::]:443 ssl;

		ssl_certificate ${CERTS_SELF};
		ssl_certificate_key ${CERTS_KEY};

		server_name ${DOMAINE_NAME};
		root ${WP_PATH};
		index index.php index.html index.htm;
 
		location / {
			try_files \$uri \$uri/ /index.php?\$args;
		}
		
		location ~ \.php$ {	
			try_files \$uri =404;
            fastcgi_split_path_info ^(.+\.php)(/.+)$;
            fastcgi_pass ${PHP_HOST}:${PHP_PORT};
            fastcgi_index index.php;
            include fastcgi_params;
            fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
            fastcgi_param PATH_INFO \$fastcgi_path_info;
		}
}
" > /etc/nginx/sites-available/default

sed -i 's|ssl_protocols TLSv1 TLSv1.1 TLSv1.2;|ssl_protocols TLSv1.2 TLSv1.3;|g' /etc/nginx/nginx.conf

mkdir -p $WP_PATH
chown -R www-data $WP_PATH

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
ORGAUNIT=${MYSQL_USER}
COMMON_NAME=${WP_TITLE}
EMAIL=${WP_EMAIL}

#-x509 makes a self-signed certificate; -nodes skip secure width passphrase; -newkey generete certificate and key
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ${CERTS_KEY} -out ${CERTS_SELF} \
	-subj "/C=$COUNTRY/ST=$STATE/L=$LOCALITY/O='$ORGA'/OU='$ORGAUNIT'/CN='$COMMON_NAME'/emailAddress='$EMAIL'"

#service nginx start
nginx -g "daemon off;"

