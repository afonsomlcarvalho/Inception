# !/bin/bash

wget -qO wordpress.tar.gz https://wordpress.org/latest.tar.gz

tar -xzf wordpress.tar.gz

mv wordpress/* .

rm -rf wordpress.tar.gz/* wordpress/

cp wp-config-sample.php wp-config.php

sed -i "s/database_name_here/$DATABASENAME/g" wp-config.php
sed -i "s/username_here/$USERNAME/g" wp-config.php
sed -i "s/password_here/$PASSWORD/g" wp-config.php
sed -i "s/localhost/$LOCALHOST/g" wp-config.php
