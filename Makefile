COMPOSE	= cd srcs && docker compose

all:
			sudo mkdir -p /home/fboumell/data/mysql 
			sudo mkdir -p /home/fboumell/data/html
			$(MAKE) build-no-cache
			$(MAKE) up
build:
	$(COMPOSE) build 
build-no-cache:
	$(COMPOSE) build --no-cache
up :
	$(COMPOSE) up
down :
	$(COMPOSE) down
up-v :
	$(COMPOSE) --verbose up
up-b :
	$(COMPOSE) up --build
up-d :
	$(COMPOSE) up -d
config :
	$(COMPOSE) config
re : fclean all

clean :
			$(COMPOSE) down -v --rmi all --remove-orphans

fclean :	clean
			sudo rm -rf	/home/chajax/data/mysql \
						/home/chajax/data/html
			docker system prune --volumes --all --force
			docker network prune --force
			echo docker volume rm $(docker volume ls -q)
			docker image prune --force

.PHONY : all build up up-b up-v up-d config down clean fclean re

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
