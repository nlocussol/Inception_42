FROM	alpine:3.16

RUN 	apk update && apk upgrade \
	&& apk add mariadb mariadb-client \
	&& mkdir /volumes

COPY	conf /etc/mysql/my.conf
COPY	tools/startup.sh /start.sh

CMD	["/start.sh"]
