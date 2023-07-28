mysql_install_db

service mysql start

systemctl enable mysql

mysql_secure_installation <<EOF

Y
Y
$MARIADB_ROOT_PASSWRD
$MARIADB_ROOT_PASSWRD
Y
n
Y
Y
EOF

GRANT ALL PRIVILEGES ON *.* TO 'root'@'192.168.100.%' 
  IDENTIFIED BY $MARIADB_ROOT_PASSWRD WITH GRANT OPTION;