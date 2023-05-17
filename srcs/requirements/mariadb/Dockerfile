FROM debian:buster

ARG WP_DB_NAME=${WP_DB_NAME}
ARG MYSQL_USER=${MYSQL_USER}
ARG MYSQL_PASSWORD=${MYSQL_PASSWORD}
ARG MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}

EXPOSE 3306

RUN apt-get update -y
RUN apt full-upgrade -y

RUN apt install mariadb-server mariadb-client -y

#COPY ./tools/init.sh /home/script.sh
COPY ./tools/script.sh /home/script.sh
RUN chmod +x /home/script.sh

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/my.cnf

RUN mkdir -p /var/run/mysqld
RUN chmod 777 /var/run/mysqld
RUN touch /var/run/mysqld/mysqld.sock

#RUN bash ./script.sh

ENTRYPOINT [ "sh", "/home/script.sh" ]
#CMD exec mysqld_safe
#CMD ["mysqld", "--bind-address=0.0.0.0"]

#RUN apt-get install -y dumb-init

#RUN apt-get install -y mariadb-server

#RUN apt-get clean -y

#RUN mkdir -p /var/run/mysqld
#RUN chown -R mysql:mysql /var/run/mysqld

#RUN service mysql start && \
#mysql -u root -e \
#"CREATE DATABASE IF NOT EXISTS $DB_DATABASE; \
#ALTER USER root'@'localhost IDENTIFIED BY $DB_ROOT_PASSWORD; \
#GRANT ALL PRIVILEGES ON $DB_DATABASE.* TO '$DB_USER_NAME'@'%' IDENTIFIED BY $DB_USER_PASSWORD; \
#FLUSH PRIVILEGES;"

#COPY ./conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf

#EXPOSE 3306

#ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]
#CMD ["mysqld", "--bind-address=0.0.0.0" ]

#RUN	apt update && apt install -y mariadb-server mariadb-client && rm -rf /var/lib/apt/lists/*

	# config as remote service on port 3306:
#RUN sed -i -e '/includedir/ {N;s/\(.*\)\n\(.*\)/[mariadbd]\nskip-host-cache\nskip-name-resolve\n\n\2\n\1/}' /etc/mysql/mariadb.cnf; \
#	sed -i 's/bind-address            = 127.0.0.1/skip-bind-address/g' /etc/mysql/mariadb.conf.d/50-server.cnf; \
#	sed -i 's/#port                   = 3306/port                   = 3306/g' /etc/mysql/mariadb.conf.d/50-server.cnf;

#EXPOSE 3306


#COPY ./tools/init.sh /usr/local/bin/
#RUN	chmod 777 /usr/local/bin/init.sh

#ENTRYPOINT ["/usr/local/bin/init.sh"]

# Purge and re-create /var/lib/mysql with appropriate ownership
# ensure that /var/run/mysqld (used for socket and lock files) is writable regardless of the UID our mysqld instance ends up having at runtime
#RUN mkdir -p /var/run/mysqld && \
 #   chown -R mysql:mysql /var/run/mysqld && \
#	chmod 777 /var/run/mysqld

#COPY ./conf/mydatabase.sql /docker-entrypoint-initdb.d/
#COPY ./conf/init.sql /usr/local/bin
#RUN chmod 777 /usr/local/bin/init.sql

#COPY ./tools/newdb.sh /usr/local/bin
#RUN chmod 777 /usr/local/bin/newdb.sh

# allow remote connections
#RUN sed -i "s|skip-networking|# skip-networking|g" /etc/mysql/mariadb.conf.d/50-server.cnf
#RUN sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/mysql/mariadb.conf.d/50-server.cnf

#RUN service mysql start && mysql < /usr/local/bin/mydatabase.sql
#ENTRYPOINT [ "/usr/local/bin/newdb.sh" ]

#COPY ./conf/init.sql /docker-entrypoint-initdb.d/

#CMD ["mysqld_safe"]
#CMD ["mysqld", "--bind-address=0.0.0.0"]
