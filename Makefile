all: up

up: #construit l'image puis cree le conteneur 

down: #les conteneurs off

clean: #down(off) les conteneurs et supprime les conteneurs

fclean: #down les conteneurs, puis les supprime, puis supprime les image puis supprime les volumes
show: # montre les conteneurs qui sont crees 

image_show: # montre les images qui sont crees

config: # montre la configuration de ton docker-compose, et permet de voir les variables d'environnement

#nginx_up:
#wordpress_up:
#mariadb_up:

nginx: #permet d'entrer directement dans un conteneur qUI TOURNE
mariadb: #idem
wordpress: #idem 


