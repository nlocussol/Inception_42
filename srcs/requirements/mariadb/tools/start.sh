#!/bin/sh
mysql_install_db --user=root > /dev/nullo
exec /usr/bin/mysqld --user=root --console
