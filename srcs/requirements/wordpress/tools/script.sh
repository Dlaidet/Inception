#!/bin/bash

mkdir -p /var/run/mysqld
touch /var/run/mysqld/mysqld.sock

mkdir -p /var/www/html && cd /var/www/html

wp core download --allow-root

#mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

wp core config --dbname=WP_DB_NAME --dbuser=WP_USER --dbpass=WP_USER_PASSWORD --dbhost=172.25.0.2 --allow-root

wp core install --url=$WP_URL/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_MAIL --skip-email --allow-root

#wp user create $WP_USER $WP_USER_MAIL --role=author ==user_pass=$WP_USER_PASSWORD --allow-root

#wp core config --dbhost=$DB_HOSTNAME \
#				--dbname=$WP_DB_NAME \
#				--dbuser=$MYSQL_USER \
#				--dbpass=$MYSQL_PASSWORD \
#				--allow-root

#wp core install --title=$WP_TITLE \
#				--admin_user=$WP_ADMIN_USER \
#				--admin_password=$WP_ADMIN_PASSWORD \
#				--admin_email=$WP_ADMIN_MAIL \
#				--url=$WP_URL \
#				--allow-root

#wp user create $WP_USER $WP_USER_MAIL --role=author --user_pass=$WP_USER_PASSWORD --allow-root

#wp config set WP_REDIS_HOST "REDIS" --allow-root
#wp config set WP_REDIS_PORT --raw "6379" --allow-root
#wp config set WP_REDIS_TIMEOUT --raw "1" --allow-root
#wp config set WP_REDIS_READ_TIMEOUT --raw "1" --allow-root
#wp config set WP_REDIS_DATABASE --raw "0" --allow-root
#wp config set WP_CACHE_KEY_SALT "REDIS" --allow-root
#wp config set WP_CACHE --raw "true" --allow-root

wp plugin install redis-cache --activate --allow-root
wp redis enable --allow-root

#wp plugin install redis-cache --allow-root
#wp plugin activate redis-cache --allow-root
#wp redis enable --allow-root

/usr/sbin/php-fpm7.3 --nodaemonize --allow-to-run-as-root
