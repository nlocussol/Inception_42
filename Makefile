IMAGES = nginx wordpress alpine:3.16 mariadb

CONTAINER = nginx_container wordpress_container mariadb_container

all : build

build:
	docker build srcs/requirements/wordpress -t wordpress
	docker build srcs/requirements/mariadb -t mariadb
	docker build srcs/requirements/nginx -t nginx
	docker-compose -f srcs/docker-compose.yml up --detach
	docker ps

clean:
	docker stop $(CONTAINER)
	docker rm -f $(CONTAINER)
	docker rmi -f $(IMAGES)
	docker-compose -f srcs/docker-compose.yml down

fclean:
	sudo rm -rf /home/nlocusso/data/wordpress/*
	sudo rm -rf /home/nlocusso/data/mariadb/*
	docker rm -f `docker ps -aq`
	docker rmi -f `docker images -aq`
	docker volume rm -f `docker volume ls`

re: clean all

.PHONY: all build clean fclean re
