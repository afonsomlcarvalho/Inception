wget -qO wordpress.tar.gz https://wordpress.org/latest.tar.gz

tar -xzf wordpress.tar.gz

mv wordpress/* .

rm -rf wordpress.tar.gz/* wordpress/*

cp wp-config-sample.php wp-config.php

sed -i "s/database_name_here/wordpress/" wp-config.php
