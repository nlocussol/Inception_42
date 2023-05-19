FROM	alpine:3.16

RUN     apk update && apk upgrade && \
        apk add --no-cache curl php8 php8-phar php8-fpm php8-mysqli php8-iconv mysql-client

COPY	tools/script.sh /script.sh
COPY	tools/php-fpm /etc/php8/php-fpm.d/www.conf

RUN	chmod 777 /script.sh

CMD	["sh", "/script.sh"]
