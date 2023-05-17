#!/bin/bash

mkdir -p /var/run/mysqld
touch /var/run/mysqld/mysqld.sock

mkdir -p /var/www/html/wordpress && cd /var/www/html/wordpress

wp core download --allow-root

wp core config --dbname=$WP_DB_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$DB_HOSTNAME --allow-root

wp core install --url=$WP_URL/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_MAIL --skip-email --allow-root

wp plugin install redis-cache --activate --allow-root
wp redis enable --allow-root

/usr/sbin/php-fpm7.3 -F
