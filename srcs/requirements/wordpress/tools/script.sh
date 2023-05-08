#!/bin/sh

sed -i "s|database_name_here|${DB_NAME}|g"  /volumes/wordpress/wp-config.php
sed -i "s|username_here|${DB_USER}|g"  /volumes/wordpress/wp-config.php
sed -i "s|password_here|${DB_PASSWORD}|g"  /volumes/wordpress/wp-config.php
sed -i "s|localhost|mariadb|g"  /volumes/wordpress/wp-config.php 

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

#wp core install --path=/volumes/wordpress --url=$DOMAIN_NAME --title=Wordpress --admin_user=$DB_ADMIN_USER --admin_password=$DB_ADMIN_PASSWD --admin_email=$DB_MAIL --allow-root
#wp user create $WP_USER $WP_MAIL --path=/volumes/wordpress --role=subscriber --user_pass=$WP_PWD --allow-root

exec php-fpm8 -FR
