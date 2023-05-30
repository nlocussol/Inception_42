#!/bin/sh

cd /volumes/wordpress/

wp config create --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASSWD} --dbhost=mariadb

wp core install --url="${DOMAIN_NAME}" --title="Inception" --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASSWD} --admin_email=${WP_ADMIN_MAIL} --skip-email

wp user create ${WP_USER} ${WP_USER_MAIL} --role=subscriber --user_pass=${WP_USER_PASSWD}

wp plugin install redis-cache --activate
wp config set WP_REDIS_HOST "redis"
wp redis enable

wp plugin install pexlechris-adminer --activate

wp theme install iotix.zip --activate

exec php-fpm8 -F
