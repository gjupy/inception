FROM debian:bullseye

EXPOSE 9000

RUN apt update \
		&& apt install -y \
		wget \
		php7.4 \
		php7.4-fpm \
		php7.4-mysql \
		mariadb-client

RUN cd /usr/local/bin/ \
	&& wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	# rename wp-cli.phar to wp so that we can run wp commands by typing wp
	&& mv wp-cli.phar wp \
	&& mkdir -p /run/php

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

COPY ./conf/config.sh /config.sh
RUN chmod +x /config.sh

ENTRYPOINT [ "bash", "/config.sh" ]

# run php-fpm7.4 listening for CGI requests on port 9000 in the foreground -F
CMD ["php-fpm7.4", "-F"]