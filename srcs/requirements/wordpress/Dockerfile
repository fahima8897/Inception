FROM	debian:buster

# UPDATE & UPGRADE
RUN	apt-get update && apt-get upgrade -y

# INSTALL WGET TO DOWNLOAD WORDPRESS
RUN	apt-get -y install wget

# INSTALL PHP 7.3 AND DEPENDENCIES
RUN	apt-get install -y php7.3 \
	php-fpm \
	php-mysql\
	mariadb-client

# DOWNLOAD WORDPRESS 6.0 INTO /VAR/WWW AND EXTRACT IT
RUN mkdir -p /var/www \
&& wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www \
&& cd /var/www && tar xvf wordpress-6.0-fr_FR.tar.gz \
&& rm wordpress-6.0-fr_FR.tar.gz

# COPY PHP CONF
COPY	conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

# ALLOW THE USER TO WRITE INT THE DIRECTORY
RUN	chown -R root:root /var/www/wordpress

# DOWNLOAD WP-CLI PACKAGE (TO MANAGE WORDPRESS INSTALLATION)
RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN	chmod +x wp-cli.phar
RUN	mv wp-cli.phar /usr/local/bin/wp

COPY	conf/auto_config.sh auto_config.sh

ENTRYPOINT	["bash", "auto_config.sh"]



