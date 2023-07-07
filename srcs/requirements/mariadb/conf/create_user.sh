#!/bin/bash

mysql_install_db

if [ -d "/var/lib/mysql/$DB_NAME" ]
then
	echo "WARNING: Database already exists. Skipping initialization steps.";
else
	service mysql start
	sleep 5
	echo "Initializing database..."
	mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME; GRANT ALL ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD'; FLUSH PRIVILEGES;"
	mysqladmin -u root password "$DB_ROOT_PASSWORD"
	service mysql stop
fi

exec $@
