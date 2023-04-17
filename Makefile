NAME    = inception

all: ${NAME}

IMAGES = nginx wordpress alpine:3.16 mariadb

CONTAINER = nginx_container wordpress_container mariadb_container

SHELL := /bin/bash

${NAME} : build

build:
	docker build srcs/requirements/wordpress -t wordpress
	docker build srcs/requirements/mariadb -t mariadb
	docker build srcs/requirements/nginx -t nginx
	set -a
	source srcs/.env
	docker-compose -f srcs/docker-compose.yml up --detach

clean:
	docker stop $(CONTAINER)
	docker rm -f $(CONTAINER)
	docker rmi -f $(IMAGES)
	docker-compose -f srcs/docker-compose.yml down

fclean: clean
	docker rm -f $(docker ps -aq)
	docker rmi -f $(docker images -aq)

re: fclean all

.PHONY: all build clean fclean re
