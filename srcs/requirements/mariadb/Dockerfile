FROM debian:buster

ARG WP_DB_NAME=${WP_DB_NAME}
ARG MYSQL_USER=${MYSQL_USER}
ARG MYSQL_PASSWORD=${MYSQL_PASSWORD}
ARG MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}

EXPOSE 3306

RUN apt-get update -y
RUN apt full-upgrade -y

RUN apt install mariadb-server mariadb-client -y

COPY ./tools/script.sh /home/script.sh
RUN chmod +x /home/script.sh

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/my.cnf

RUN mkdir -p /var/run/mysqld
RUN chmod 777 /var/run/mysqld
RUN touch /var/run/mysqld/mysqld.sock

ENTRYPOINT [ "sh", "/home/script.sh" ]

CMD ["mysqld"]
