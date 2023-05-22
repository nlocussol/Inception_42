IMAGES = nginx wordpress alpine:3.16 mariadb redis

CONTAINER = nginx wordpress mariadb redis

all : build

build:
	mkdir -p /home/nlocusso/data/mariadb
	mkdir -p /home/nlocusso/data/wordpress
	docker-compose -f srcs/docker-compose.yml up --build --detach
	docker ps

stop:
	docker-compose -f srcs/docker-compose.yml stop

clean:
	docker stop $(CONTAINER)
	docker rm -f $(CONTAINER)
	docker rmi -f $(IMAGES)
	docker volume rm -f `docker volume ls`
	docker-compose -f srcs/docker-compose.yml down

volume:
	sudo rm -rf /home/nlocusso/data/wordpress/*
	sudo rm -rf /home/nlocusso/data/mariadb/*

re: volume clean all

.PHONY: all build clean clean re
