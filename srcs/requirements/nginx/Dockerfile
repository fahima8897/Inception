FROM	debian:buster

RUN	apt update && \
	apt install -y nginx \
			vim \
			curl \
			openssl 
RUN 	mkdir -p /etc/nginx/ssl
RUN	openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/0=42/OU=42/CN=fboumell.42.fr/UID=fboumell"
RUN	mkdir -p /var/run/nginx

COPY	conf/nginx.conf /etc/nginx/nginx.conf

