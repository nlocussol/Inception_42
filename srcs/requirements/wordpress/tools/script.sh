#!/bin/sh

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp core download --path='/volumes/wordpress/'

wp config create --path='/volumes/wordpress' --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASSWD} --dbhost=mariadb

wp core install --path='/volumes/wordpress' --url="${DOMAIN_NAME}" --title="Inception" --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASSWD} --admin_email=${WP_ADMIN_MAIL} --skip-email

wp user create --path='/volumes/wordpress' ${WP_USER} ${WP_USER_MAIL} --role=subscriber --user_pass=${WP_USER_PASSWD}

exec php-fpm8 -F
