FROM	alpine:3.16

RUN     apk update && apk upgrade && \
	apk add php php-phar php-fpm php-mysqli php-iconv mysql-client php-session \
	php-json php-curl php-dom php-exif php-fileinfo php-mbstring php-openssl php-xml php-zip \
	php-tokenizer && mkdir /volumes/ && \
	cd /volumes/ && \
	wget https://wordpress.org/wordpress-6.2.2.tar.gz -O latest.tar.gz && \
	tar xzf latest.tar.gz && rm latest.tar.gz && cd wordpress && \
	wget https://public-api.wordpress.com/rest/v1/themes/download/iotix.zip && \
	cd && \
	wget -O wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

COPY	tools/start.sh /start.sh

COPY	tools/php-fpm /etc/php8/php-fpm.d/www.conf

CMD	["sh", "/start.sh"]
