#!/bin/sh

echo "create database wordpress;\n
USE mydatabase;\n
CREATE TABLE IF NOT EXISTS mytable (\n
  id INT AUTO_INCREMENT PRIMARY KEY,\n
  name VARCHAR(50) NOT NULL,\n
  age INT NOT NULL\n
); \n" > init.sql


service mysql start
#mysql_install_db
mysqld --defaults-file=/etc/mysql/my.cnf --init-file=init.sql
