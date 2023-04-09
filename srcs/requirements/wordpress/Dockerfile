FROM alpine:3.16

RUN     apk update && apk upgrade && \
        apk add php php-fpm lighttpd wget openrc && \
	rc-update add lighttpd default 
RUN	mkdir -p /usr/share/webapps/ && cd /usr/share/webapps/ \
	&& wget http://wordpress.org/latest.tar.gz 2>/dev/null && tar -xzvf latest.tar.gz 1>/dev/null \ 
	&& rm latest.tar.gz && chown -R lighttpd /usr/share/webapps/ \
	&& ln -s /usr/share/webapps/wordpress/ /var/www/localhost/htdocs/wordpress

EXPOSE 3306:3306
EXPOSE 9000:9000
