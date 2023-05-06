FROM alpine:3.16

RUN     apk update && apk upgrade && \
        apk add --no-cache mysql mysql-client && \
        mkdir -p /run/mysqld

COPY tools/start.sh /start.sh

RUN chmod 777 /start.sh

EXPOSE 3306

ENTRYPOINT ["sh", "./start.sh"]

