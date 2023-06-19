cd /var/www/html/wordpress

wp core download --allow-root

mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

sed -i -r "s/database/$DB_NAME/1"   wp-config.php
sed -i -r "s/database_user/$DB_USER/1"  wp-config.php
sed -i -r "s/passwod/$DB_PASSWORD/1"    wp-config.php
sed -i -r "s/localhost/mariadb/1"    wp-config.php

wp core install --url=localhost --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_MAIL --allow-root

wp user create $WP_USER $WP_USER_MAIL --role=author --user_pass=$WP_USER_PASSWORD --allow-root

exec $@