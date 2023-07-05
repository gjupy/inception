FROM debian:buster

EXPOSE 9000

RUN apt update \
		&& apt install -y \
		wget \
		php7.3 \
		php7.3-fpm \
		php7.3-mysql \
		mariadb-client

RUN cd /usr/local/bin/ \
		&& wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
		&& chmod +x wp-cli.phar \
		&& mv wp-cli.phar wp \
		&& mkdir -p /run/php

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

COPY ./conf/config.sh /config.sh
RUN chmod +x /config.sh

CMD ["bash", "/config.sh"]