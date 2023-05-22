#!/bin/sh

echo "CREATE DATABASE IF NOT EXISTS ${DB_NAME};
CREATE USER IF NOT EXISTS '${DB_USER}'@'%';
SET PASSWORD FOR '${DB_USER}'@'%' = PASSWORD('${DB_PASSWD}');
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';
FLUSH PRIVILEGES;" > /init.sql

sed -i "s/\${DB_PASSWD}/${DB_PASSWD}/" /init.sql
sed -i "s/\${DB_USER}/${DB_USER}/" /init.sql

exec /usr/bin/mariadbd --no-defaults --user=root --datadir=/var/lib/mysql --init-file=/init.sql
