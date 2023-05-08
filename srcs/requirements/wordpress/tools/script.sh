#!/bin/sh

sed -i "s|database_name_here|${DB_NAME}|g"  /volumes/wordpress/wp-config.php
sed -i "s|username_here|${DB_USER}|g"  /volumes/wordpress/wp-config.php
sed -i "s|password_here|${DB_PASSWD}|g"  /volumes/wordpress/wp-config.php
sed -i "s|localhost|mariadb|g"  /volumes/wordpress/wp-config.php 

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp core install --path='/volumes/wordpress' --url="${DOMAIN_NAME}" --title="Wordpress" --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASSWD} --admin_email=${WP_ADMIN_MAIL} --allow-root

wp user create --path='/volumes/wordpress' ${WP_USER} ${WP_USER_MAIL} --role=subscriber --user_pass=${WP_USER_PASSWD} --allow-root

exec php-fpm8 -FR
