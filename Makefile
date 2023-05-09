IMAGES = nginx wordpress alpine:3.16 mariadb

CONTAINER = nginx_container wordpress_container mariadb_container

all : build

build:
	docker-compose -f srcs/docker-compose.yml up --detach
	docker ps

stop:
	docker-compose -f srcs/docker-compose.yml stop

fclean:
	docker stop $(CONTAINER)
	docker rm -f `docker ps -aq`
	docker rmi -f `docker images -aq`
	docker volume rm -f `docker volume ls`
	docker-compose -f srcs/docker-compose.yml down

volume:
	sudo rm -rf /home/nlocusso/data/wordpress/*
	sudo rm -rf /home/nlocusso/data/mariadb/*

re: clean all

.PHONY: all build clean fclean re
