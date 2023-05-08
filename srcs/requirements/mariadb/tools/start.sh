#!/bin/sh

mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=root --rpm > /dev/null
echo "CREATE DATABASE IF NOT EXISTS ${DB_NAME};
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO 'user_here'@'%' IDENTIFIED BY 'pass_here';
FLUSH PRIVILEGES;" > /database

sed -i "s|user_here|${DB_USER}|g" /database
sed -i "s|pass_here|${DB_PASSWD}|g" /database

/usr/bin/mysqld --user=root --init-file=/database

rm /database

sed -i "s|skip-networking|# skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf

exec /usr/bin/mysqld --user=root --console 
