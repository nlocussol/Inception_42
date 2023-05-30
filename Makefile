IMAGES = nginx wordpress alpine:3.16 mariadb redis vsftpd adminer static_page cadvisor

CONTAINER = nginx wordpress mariadb redis vsftpd adminer static_page cadvisor

all : build

build:
	mkdir -p /home/nlocusso/data/mariadb
	mkdir -p /home/nlocusso/data/wordpress
	mkdir -p /home/nlocusso/data/static
	docker-compose -f srcs/docker-compose.yml up --build --detach
	docker ps

stop:
	docker-compose -f srcs/docker-compose.yml stop

clean:
	-docker stop $(CONTAINER)
	-docker rm -f $(CONTAINER)
	-docker rmi -f $(IMAGES)
	-docker volume rm -f `docker volume ls`
	-docker-compose -f srcs/docker-compose.yml down

volume:
	sudo rm -rf /home/nlocusso/data/wordpress/
	sudo rm -rf /home/nlocusso/data/mariadb/
	sudo rm -rf /home/nlocusso/data/static/

re: volume clean all

.PHONY: all build clean clean re
