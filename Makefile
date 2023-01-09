all:	up

up:
	mkdir -p /home/${USER}/data/db
	mkdir -p /home/${USER}/data/wp
	docker-compose -f srcs/docker-compose.yml up -d

down:
	docker-compose -f srcs/docker-compose.yml down

ps:
	docker-compose -f srcs/docker-compose.yml ps

fclean: down
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker system prune -a --force
	sudo rm -Rf /home/${USER}/data/db
	sudo rm -Rf /home/${USER}/data/wp
	mkdir /home/${USER}/data/db
	mkdir /home/${USER}/data/wp

re:
	mkdir -p ../data/wp
	mkdir -p ../data/db
	docker-compose -f srcs/docker-compose.yml build
	docker-compose -f srcs/docker-compose.yml up

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
