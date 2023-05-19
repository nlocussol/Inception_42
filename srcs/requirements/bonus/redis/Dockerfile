FROM	debian:buster-slim

RUN	apt-get -y update \
	&& apt-get -y upgrade \
	&& apt install -y redis-server \
	&& sed -i "s|bind 127.0.0.1 ::1|# bind 127.0.0.1 ::1|g" /etc/redis/redis.conf

CMD	["redis-server", "--protected-mode", "no"]
