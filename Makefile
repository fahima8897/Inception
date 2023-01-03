COMPOSE = docker-compose -f ./src/docker-compose.yml

all:
	make build
	 make up

build : 
		$(COMPOSE) build $(c)

up : 
		$(COMPOSE) up -d $(c)

start : 
		$(COMPOSE) start $(c)

down : 
		$(COMPOSE) down $(c)

stop :
		$(COMPOSE) stop $(c)

restart : stop build up

prune :
		docker volume prune --force

re : build up down prune

.PHONY : all build up start down stop restart prune re


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
