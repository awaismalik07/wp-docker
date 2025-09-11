#!/bin/bash
set -e

mysqld_safe &

sleep 10

DBUSER="wordpress"
DBPASS="awaismalik"

mysql -u root -e "CREATE DATABASE IF NOT EXISTS wordpress;"
mysql -u root -e "CREATE USER IF NOT EXISTS '$DBUSER'@'%' IDENTIFIED BY '$DBPASS';"
mysql -u root -e "GRANT ALL PRIVILEGES ON wordpress.* TO '$DBUSER'@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"

mysqladmin -u root shutdown

exec mysqld_safe