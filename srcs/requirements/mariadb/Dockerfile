FROM	debian:buster

# UPDATE AND INSTALL MARIADB
RUN	apt-get update -y 
RUN	apt-get upgrade -y 
RUN	apt-get install mariadb-server -y

# COPY OUR CONFIG FILE TO REPLACE MARIADB CONFIG FILE
COPY	conf/50-server.cnf /etc/mysql/mariadb.conf/50-server.cnf

RUN	mkdir -p /script

# COPY THE SCRIPT TO CREATE THE DATABASE AND THE USER INTO THE CONTAINER
COPY	tools/script_mariadb.sh script/script_mariadb.sh

RUN	mkdir -p /var/run/mysql && \
	chown -R mysql:mysql /var/run/mysqld && \
	chmod 755 /var/run/mysqld \
			/script/script_mariadb.sh && \
	mysql_install_db

ENTRYPOINT ["bash", "/script/script_mariadb.sh"]

EXPOSE	3306
