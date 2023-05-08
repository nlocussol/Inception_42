#!/bin/sh

mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=root --rpm > /dev/null
echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;
GRANT ALL PRIVILEGES ON wordpress.* TO 'nlocusso'@'%' IDENTIFIED BY 'dbpass';
FLUSH PRIVILEGES;" > /database
/usr/bin/mysqld --user=root --init-file=/database

rm /database

sed -i "s|skip-networking|# skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf

exec /usr/bin/mysqld --user=root --console 
