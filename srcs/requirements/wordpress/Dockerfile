FROM debian:buster

EXPOSE 9000

RUN apt update \
	&& apt install -y \
	wget \
	php7.3 \
	php-fpm \
	php-mysql \
	mariadb-client

RUN cd /usr/local/bin/ \
	&& wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	# rename wp-cli.phar to wp so that we can run wp commands by typing wp
	&& mv wp-cli.phar wp \
	&& mkdir -p /run/php

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

COPY ./conf/config.sh /config.sh

ENTRYPOINT [ "bash", "/config.sh" ]

# run php-fpm7.3 listening for CGI requests on port 9000 in the foreground -F
CMD ["php-fpm7.3", "-F"]