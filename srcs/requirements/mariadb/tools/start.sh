#!/bin/sh

#mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=root > /dev/null
#echo "CREATE DATABASE IF NOT EXISTS ${DB_NAME};
#GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO 'user_here'@'%' IDENTIFIED BY 'pass_here';
#FLUSH PRIVILEGES;" > /init.sql
echo "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$DB_PASSWD');
CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER IF NOT EXISTS '$DB_USER'@'localhost';
CREATE USER IF NOT EXISTS '$DB_USER'@'%';
SET PASSWORD FOR '$DB_USER'@'localhost' = PASSWORD('$DB_PASSWD');
SET PASSWORD FOR '$DB_USER'@'%' = PASSWORD('$DB_PASSWD');
GRANT ALL PRIVILEGES ON wordpress.* TO '$DB_USER'@'localhost';
GRANT ALL PRIVILEGES ON wordpress.* TO '$DB_USER'@'%';
FLUSH PRIVILEGES;" > /init.sql

sed -i "s/\$DB_PASSWD/$DB_PASSWD/" /init.sql
sed -i "s/\$DB_USER/$DB_USER/" /init.sql
sed -i "s/\$DB_PASSWD/$DB_PASSWD/" /init.sql

exec /usr/bin/mariadbd --no-defaults --user=root --datadir=/var/lib/mysql --init-file=/init.sql

#rm /init.sql

#sed -i "s|skip-networking|# skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
#sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf

#exec /usr/bin/mysqld --datadir=/var/lib/mysql --user=root --console 
