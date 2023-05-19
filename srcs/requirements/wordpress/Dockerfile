FROM	alpine:3.16

RUN     apk update && apk upgrade && \
        apk add --no-cache curl php8 php8-phar php8-fpm php8-mysqli php8-iconv php8-redis mysql-client

COPY	tools/start.sh /start.sh

COPY	tools/php-fpm /etc/php8/php-fpm.d/www.conf

RUN	chmod 777 /start.sh

CMD	["sh", "/start.sh"]
