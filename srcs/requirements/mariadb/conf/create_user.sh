#!/bin/bash

mysql_install_db

service mysql start

sleep 5

mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME; GRANT ALL ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD'; FLUSH PRIVILEGES;"
mysqladmin --no-defaults --user=root password "$DB_ROOT_PASSWORD"

service mysql stop

exec $@
