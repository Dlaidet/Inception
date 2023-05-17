echo "CREATE DATABASE IF NOT EXISTS $WP_DB_NAME ;" > db.sql
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;" >> db.sql
echo "GRANT ALL PRIVILEGES ON $WP_DB_NAME.* TO '$MYSQL_USER'@'%' ;" >> db.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' ;" >> db.sql
echo "FLUSH PRIVILEGES ;" >> db.sql

mysqld
