FROM	debian:buster

# UPDATE AND INSTALL MARIADB
RUN	apt-get update -y 
RUN	apt-get upgrade -y 
RUN	apt-get install mariadb-server -y

# COPY OUR CONFIG FILE TO REPLACE MARIADB CONFIG FILE
COPY	conf/50-server.cnf /etc/mysql/mariadb.conf/50-server.cnf

# START AND LAUNCH MYSQL
 
