FROM	alpine:3.16

RUN	apk -U upgrade && wget https://github.com/google/cadvisor/releases/download/v0.47.0/cadvisor-v0.47.0-linux-amd64 -O cadvisor && \
	chmod 700 cadvisor

CMD	["./cadvisor"]
