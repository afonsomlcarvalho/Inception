#!/bin/bash

service mariadb start
mysql_upgrade --force

mysql_secure_installation << EOF

Y
Y
$MYSQL_DB_ROOT_PASSWORD
$MYSQL_DB_ROOT_PASSWORD
Y
n
Y
Y
EOF

mariadb -u root << EOF

GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_DB_ROOT_PASSWORD'; FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS $DATABASENAME; GRANT ALL ON $DATABASENAME.* TO '$USERNAME'@'%' IDENTIFIED BY '$PASSWORD'; FLUSH PRIVILEGES;
EOF

# mariadb -u $MYSQL_DB_USER -p$MYSQL_DB_PASSWORD $MYSQL_DB_NAME < /usr/local/bin/wordpress.sql

exec "$@"