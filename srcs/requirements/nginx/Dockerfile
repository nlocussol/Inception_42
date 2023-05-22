FROM alpine:3.16

RUN     apk update && apk upgrade \
	&& apk add fcgi nginx openssl && mkdir /volumes

COPY tools/start.sh /start.sh

COPY conf /etc/nginx/http.d/default.conf

CMD ["sh", "/start.sh"]
