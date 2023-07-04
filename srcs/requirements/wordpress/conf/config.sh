#!/bin/bash

mkdir -p /var/www/html/wordpress
cd /var/www/html/wordpress

rm -rf *

wp --allow-root core download

mv /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php

sed -i -r "s/wordpress_name_here/$DB_NAME/1" wp-config.php
sed -i -r "s/username_here/$DB_USER/1" wp-config.php
sed -i -r "s/password_here/$DB_PASSWORD/1" wp-config.php
sed -i -r "s/localhost/mariadb/1" wp-config.php

# installs WordPress and sets up the basic configuration for the site.
# The --url option specifies the URL of the site, --title sets the site's title, --admin_user and --admin_password set the username and password 
# for the site's administrator account, and --admin_email sets the email address for the administrator.
wp --allow-root core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN_USER--admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_MAIL

# creates a new user account with the specified username, email address, and password.
# The --role option sets the user's role to author, which gives the user the ability to publish and manage their own posts.
wp --allow-root user create $WP_USER $WP_USER_MAIL --role=author --user_pass=$WP_USER_PASSWORD

exec $@