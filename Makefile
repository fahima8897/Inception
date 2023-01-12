all:	up

up:
	sudo mkdir -p /home/${USER}/data/mariadb
	sudo mkdir -p /home/${USER}/data/wordpress
	sudo docker compose -f srcs/docker-compose.yml up -d --build

down:
	sudo docker compose -f srcs/docker-compose.yml down

ps:
	sudo docker compose -f srcs/docker-compose.yml ps

fclean: down
	sudo docker rmi -f $$(docker images -qa);\
	sudo docker volume rm $$(docker volume ls -q);\
	sudo docker system prune -a --force
	sudo rm -Rf /home/${USER}/data/mariadb
	sudo rm -Rf /home/${USER}/data/wordpress
	sudo mkdir /home/${USER}/data/mariadb
	sudo mkdir /home/${USER}/data/wordpress

re:
	sudo mkdir -p ../data/mariadb
	sudo mkdir -p ../data/wordpress
	sudo docker compose -f srcs/docker-compose.yml build
	sudo docker compose -f srcs/docker-compose.yml up

.PHONY:	all up down ps fclean re

#up: #construit l'image puis cree le conteneur 

#down: #les conteneurs off

#clean: #down(off) les conteneurs et supprime les conteneurs

#fclean: #down les conteneurs, puis les supprime, puis supprime les image puis supprime les volumes
#show: # montre les conteneurs qui sont crees 

#image_show: # montre les images qui sont crees

#config: # montre la configuration de ton docker-compose, et permet de voir les variables d'environnement

#nginx_up:
#wordpress_up:
#mariadb_up:

#nginx: #permet d'entrer directement dans un conteneur qUI TOURNE
#mariadb: #idem
#wordpress: #idem 
