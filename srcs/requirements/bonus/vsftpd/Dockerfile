FROM alpine:3.16.5

RUN	apk -U upgrade && apk add --no-cache vsftpd openrc

COPY	conf /etc/vsftpd.conf

COPY    tools/start.sh /start.sh

CMD ["sh", "/start.sh"]

