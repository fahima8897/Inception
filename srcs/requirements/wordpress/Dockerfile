FROM	debian:buster

# UPDATE & UPGRADE
RUN	apt-get update && apt-get upgrade -y

# INSTALL
RUN	apt-get -y install wget

# INSTALL PHP 7.3 AND DEPENDENCIES
RUN	apt-get install -y php7.3 \
	php-fpm \
	php-mysql\
	mariadb-client

# DOWNLOAD WORDPRESS 6.0 INTO /VAR/WWW AND EXTRACT IT
RUN	wget https://fr.wordpress.org/wordpress-6.0.tar.gz -P /var/www
RUN	cd /var/www && tar -xzf wordpress-6.0.tar.gz && rm wordpress-6.0.tar.gz

# COPY PHP CONF
COPY	
