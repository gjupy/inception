FROM debian:bullseye

EXPOSE 3306

RUN apt update && apt install -y \
	mariadb-server

RUN mkdir -p /run/mysqld \
	&& chown -R mysql:mysql /run/mysqld

RUN chown -R mysql:mysql /var/lib/mysql

RUN chmod -R 700 /var/lib/mysql

COPY ./conf/create_user.sh /create_user.sh

ENTRYPOINT ["bash", "/create_user.sh"]

CMD ["mysqld", "--bind-address=0.0.0.0"]
