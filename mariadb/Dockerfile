FROM debian:buster

RUN apt update

RUN apt install -y mariadb-server

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/mariadb_script.sh /var/local/

WORKDIR /var/local/

RUN chmod +x mariadb_script.sh

ENTRYPOINT [ "./mariadb_script.sh" ]