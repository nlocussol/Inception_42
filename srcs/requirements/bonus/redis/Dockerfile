FROM	alpine:3.16

RUN	apk -U upgrade && \
	apk add redis

CMD	["redis-server", "--protected-mode", "no"]
