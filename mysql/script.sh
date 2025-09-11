#!/bin/bash
set -e

mysqld_safe &

sleep 10

DBUSER=$(cat /run/secrets/db_user)
DBPASS=$(cat /run/secrets/db_pass)

mysql -u root -e "CREATE DATABASE IF NOT EXISTS wordpress;"
mysql -u root -e "CREATE USER IF NOT EXISTS '$DBUSER'@'%' IDENTIFIED BY '$DBPASS';"
mysql -u root -e "GRANT ALL PRIVILEGES ON wordpress.* TO '$DBUSER'@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"

mysqladmin -u root shutdown

exec mysqld_safe