#!/bin/sh

# Create default file
printf "server {
		listen 443 ssl;
		listen [::]:443 ssl;

		ssl_certificate ${CERT_SELF};
		ssl_certificate_key ${CERT_KEY};

		server_name ${DOMAINE_NAME};
		root ${WP_PATH};
		index index.php index.html index.htm;
 
		location / {
			try_files $uri $uri/ /index.php?$args;
		}
		
		location ~ \.php$ {
			include snippets/fastcgi-php.conf;
			fastcgi_pass unix:/run/php/php7.3-fpm.sock;
			fastcgi_intercept_errors on;
			include fastcgi_params;
		}

		location ~* \.(js|css|png|jpg|jpeg|gif|ico)$ {
			expires max;
			log_not_found off;
		}
}
" > /etc/nginx/sites-available/default

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

service nginx start


