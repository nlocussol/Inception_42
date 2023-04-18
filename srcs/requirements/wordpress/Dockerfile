FROM alpine:3.16

RUN     apk update && apk upgrade && \
        apk add --no-cache php php-fpm php-mysqli lighttpd wget openrc \
	&& rc-update add lighttpd default \
	&& mkdir /volumes && cd /volumes && \
        wget http://wordpress.org/latest.tar.gz 2>/dev/null && \
        tar -xzvf latest.tar.gz 1>/dev/null && \
        rm latest.tar.gz && \
        chown -R lighttpd /volumes/wordpress && \
        ln -s /volumes/wordpress /var/www/localhost/htdocs/wordpress

COPY tools/php-fpm /etc/php8/php-fpm.d/www.conf
#COPY tools/wp-config /volumes/wordpress/wp-config.php
 
EXPOSE 3306:3306
EXPOSE 9000:9000

CMD ["php-fpm8", "-FR"]
