mysql_install_db

service mysql start

systemctl enable mysql

mysql_secure_installation <<EOF

Y
$MARIADB_ROOT_PASSWRD
$MARIADB_ROOT_PASSWRD
Y
n
Y
Y
EOF

