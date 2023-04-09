NAME    = inception

all: ${NAME}

${NAME} : build

build:
	docker build srcs/requirements/nginx -t nginx
	docker build srcs/requirements/wordpress -t wordpress
	docker-compose -f srcs/docker-compose.yml up --detach

clean:
	docker stop nginx_container
	docker rm -f nginx_container
	docker rmi -f nginx
	docker-compose -f srcs/docker-compose.yml down

re: clean all

.PHONY: all build clean re
