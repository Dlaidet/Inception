FROM debian:buster

RUN	apt update && apt install -y php7.3-fpm php7.3-mysql mariadb-client curl
RUN rm -rf /var/lib/apt/list/*

#COPY /tools/index.php /var/www/html/index.php

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

RUN	curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /usr/bin/wp --silent
RUN	chmod +x ./usr/bin/wp

RUN mkdir /run/php

COPY ./tools/script.sh ./script.sh
RUN chmod +x script.sh

EXPOSE 9000

CMD ["bash", "./script.sh"]
