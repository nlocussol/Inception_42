FROM alpine:3.16

RUN     apk update && apk upgrade \
	&& apk add fcgi nginx openssl && mkdir /volumes \
	&& cd /etc/nginx && mkdir certs \
	&& cd certs && \
	touch /etc/nginx/certs/default.crt /etc/nginx/certs/default.key && \
	openssl req -x509 -nodes -days 365 \
    	-subj  "/C=FR/ST=PARIS/O=42/CN=nlocusso.42.fr" \
     	-newkey rsa:2048 -keyout /etc/nginx/certs/default.key \
     	-out /etc/nginx/certs/default.crt 2>/dev/null

COPY conf /etc/nginx/http.d/default.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
