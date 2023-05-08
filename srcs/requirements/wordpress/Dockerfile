FROM	alpine:3.16

RUN     apk update && apk upgrade && \
        apk add --no-cache curl php php-phar php-fpm php-mysqli wget fcgi \
	&& mkdir /volumes && cd /volumes && \
        wget http://wordpress.org/latest.tar.gz 2>/dev/null && \
        tar -xzvf latest.tar.gz 1>/dev/null && \
        rm latest.tar.gz

COPY	tools/wp-config.php /volumes/wordpress/wp-config.php
COPY	tools/script.sh /script.sh
COPY	tools/php-fpm /etc/php8/php-fpm.d/www.conf

RUN	chmod 777 /script.sh

EXPOSE	9000:9000

CMD	["sh", "/script.sh"]
