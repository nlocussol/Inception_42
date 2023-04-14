NAME    = inception

all: ${NAME}

IMAGES: nginx wordpress alpine:3.16

CONTAINER: nginx_container wordpress_container

${NAME} : build

build:
	docker build srcs/requirements/nginx -t nginx
	docker build srcs/requirements/wordpress -t wordpress
	docker-compose -f srcs/docker-compose.yml up --detach

clean:
	docker stop $(CONTAINER)
	docker rm -f $(CONTAINER)
	docker rmi -f $(IMAGES)
	docker-compose -f srcs/docker-compose.yml down

re: clean all

.PHONY: all build clean re
