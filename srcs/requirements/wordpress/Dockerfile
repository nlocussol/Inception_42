FROM	alpine:3.16

RUN     apk update && apk upgrade && \
	apk add php php-phar php-fpm php-mysqli php-iconv mysql-client \
	php-json php-curl php-dom php-exif php-fileinfo php-mbstring php-openssl php-xml php-zip \
	php-tokenizer curl

COPY	tools/start.sh /start.sh

COPY	tools/php-fpm /etc/php8/php-fpm.d/www.conf

RUN	chmod 777 /start.sh

CMD	["sh", "/start.sh"]
