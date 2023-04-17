FROM	alpine:3.16

RUN 	apk update && apk upgrade \
	&& apk add mariadb mariadb-client

COPY	conf /etc/mysql/my.conf
COPY	tools/start.sh /start.sh

CMD	["/start.sh"]
