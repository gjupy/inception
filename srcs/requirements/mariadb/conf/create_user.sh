#!/bin/bash

mysql_install_db

service mysql start

mysql -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME}; GRANT ALL ON ${DB_NAME}.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}'; FLUSH PRIVILEGES;""

service mysql stop

exec $@