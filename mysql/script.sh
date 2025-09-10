#!/bin/bash
set -e

mysqld_safe &

sleep 10

mysql -u root -e "CREATE DATABASE IF NOT EXISTS wordpress;"
mysql -u root -e "CREATE USER IF NOT EXISTS 'wordpress'@'%' IDENTIFIED BY 'awaismalik';"
mysql -u root -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"

mysqladmin -u root shutdown

exec mysqld_safe