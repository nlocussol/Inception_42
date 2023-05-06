FROM debian:buster

RUN apt update -y && apt-get update -y && apt-get upgrade -y && \
    apt-get install -y mariadb-client mariadb-server 

COPY tools/start.sh /start.sh
COPY conf /etc/mysql/my.conf


EXPOSE 3306

ENTRYPOINT ["/start.sh"]
