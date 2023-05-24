FROM alpine:3.16.5

RUN     apk update && apk upgrade && \
        apk add --no-cache mariadb mariadb-client && \
	mariadb-install-db --datadir=/var/lib/mysql --user=root --skip-test-db && \
        mkdir -p /run/mysqld

COPY tools/start.sh /start.sh

ENTRYPOINT ["sh", "/start.sh"]
