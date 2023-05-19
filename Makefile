IMAGES = nginx wordpress alpine:3.16 mariadb

CONTAINER = nginx_container wordpress_container mariadb_container

all : build

build:
	docker-compose -f srcs/docker-compose.yml up --build --detach
	docker ps

stop:
	docker-compose -f srcs/docker-compose.yml stop

clean:
	docker stop $(CONTAINER)
	docker rm -f $(CONTAINER)
	#docker rmi -f `docker images -aq`
	docker volume rm -f `docker volume ls`
	docker-compose -f srcs/docker-compose.yml down

volume:
	sudo rm -rf /home/nlocusso/data/wordpress/*
	sudo rm -rf /home/nlocusso/data/mariadb/*
	sudo rm -rf /home/nlocusso/data/redis/*

re: volume clean all

.PHONY: all build clean clean re
