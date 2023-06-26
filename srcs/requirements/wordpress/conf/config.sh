# cd /var/www/html/wordpress

# wp core download --allow-root

# mv /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php

# sed -i -r "s/database/$DB_NAME/1"   wp-config.php
# sed -i -r "s/database_user/$DB_USER/1"  wp-config.php
# sed -i -r "s/passwod/$DB_PASSWORD/1"    wp-config.php
# sed -i -r "s/localhost/mariadb/1"    wp-config.php

# wp core install --url=localhost --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_MAIL --allow-root

# wp user create $WP_USER $WP_USER_MAIL --role=author --user_pass=$WP_USER_PASSWORD --allow-root

# exec $@

#!/bin/bash
sleep 30

mkdir -p /var/www/html/wordpress
cd /var/www/html/wordpress

if [ -f "/var/www/html/wordpress/wp-config.php" ]
then
	echo "WARNING: wordpress already configured";
else
	wp --allow-root core download
	wp --allow-root config create --dbhost=mariadb --dbname=$DB_NAME --dbuser=$DB_USER --locale=en_DB 
	wp --allow-root core install --url=localhost --title=NOT_A_WEBSITE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --file=/var/www/html/wordpress/wp-config.php
	wp --allow-root user create test test@test.com --user_pass=secret --porcelain
fi

exec $@