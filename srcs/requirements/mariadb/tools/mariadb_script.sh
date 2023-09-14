#!/bin/bash

service mysql start;

if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then
	echo "MariaDB already setup"

else

mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"

mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"

mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

mysql -e "FLUSH PRIVILEGES;"

mysql -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE < /usr/local/bin/wordpress.sql

fi

mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown

exec "$@"