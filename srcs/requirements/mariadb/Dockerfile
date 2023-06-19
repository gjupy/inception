FROM debian:buster

EXPOSE 3306

RUN apt update && apt install -y \
	mariadb-server

RUN mkdir /var/run/mysqld \
	&& chown mysql:mysql /var/run/mysqld

COPY ./conf/create_user.sh /create_user.sh

ENTRYPOINT ["bash", "/create_user.sh"]

CMD ["mysqld", "--bind-address=0.0.0.0"]


