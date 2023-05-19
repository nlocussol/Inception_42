FROM alpine:3.16

RUN     apk update && apk upgrade && \
        apk add --no-cache mysql mysql-client && \
        mkdir -p /run/mysqld

COPY tools/start.sh /start.sh
COPY conf /etc/my.cnf

RUN chmod 777 /start.sh

ENTRYPOINT ["sh", "/start.sh"]
