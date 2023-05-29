FROM alpine:3.16

RUN apk -U upgrade && apk add php php-mysqli php-session

COPY tools/start.sh /start.sh

CMD ["sh", "/start.sh"]
