FROM	debian:buster-slim

RUN	apt-get -y update \
	&& apt install -y apt-utils \
	&& apt-get -y upgrade \
	&& apt install -y redis-server \
	&& sed -i "s|bind 127.0.0.1 ::1|# bind 127.0.0.1 ::1|g" /etc/redis/redis.conf

#CMD	["redis-cli"]
CMD	["redis-server", "--save", "20", "1", "--loglevel", "warning", "--requirepass", "brother"]
