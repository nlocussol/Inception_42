FROM debian:buster-slim

RUN	apt-get update -y && apt-get upgrade -y && apt-get install adminer apache2 -y && \
	wget -O adminer.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql.php
