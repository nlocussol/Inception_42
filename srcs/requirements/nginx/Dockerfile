FROM alpine:3.16

RUN     apk update && apk upgrade \
	&& apk add nginx openssl \
	&& cd /var/www && mkdir html && cd \
	&& cd /etc/nginx && mkdir certs \
	&& cd certs

RUN touch /etc/nginx/certs/default.crt /etc/nginx/certs/default.key && \
    chmod 644 /etc/nginx/certs/default.crt /etc/nginx/certs/default.key

RUN openssl req -x509 -nodes -days 365 \
    -subj  "/C=CA/ST=QC/O=Company Inc/CN=nlocusso.42.fr" \
     -newkey rsa:2048 -keyout /etc/nginx/certs/default.key \
     -out /etc/nginx/certs/default.crt 2>/dev/null;

COPY conf /etc/nginx/nginx.conf
COPY index.html /var/www/html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
