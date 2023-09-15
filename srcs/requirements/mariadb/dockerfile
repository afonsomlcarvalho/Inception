FROM debian:buster

RUN apt update

RUN apt install -y mariadb-server

COPY ./conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/mariadb_script.sh /var/local/

COPY ./conf/wordpress.sql /usr/local/bin/

WORKDIR /var/local/

RUN chmod +x mariadb_script.sh

EXPOSE 3306

ENTRYPOINT [ "./mariadb_script.sh", "mysqld", "--bind-address=0.0.0.0" ]