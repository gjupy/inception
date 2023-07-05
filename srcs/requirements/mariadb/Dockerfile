FROM debian:buster

EXPOSE 3306

RUN apt update && apt install -y \
	mariadb-server \
	mariadb-client

# RUN mkdir -p /run/mysqld \
# 	&& chown mysql:mysql run/mysqld

# RUN chown -R mysql:mysql /var/lib/mysql

# RUN chmod -R 700 /var/lib/mysql

# RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf
# COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d

COPY ./conf/create_user.sh /create_user.sh

RUN mkdir -p /var/run/mysqld \
	&& chown mysql:mysql /var/run/mysqld

ENTRYPOINT ["bash", "/create_user.sh"]

CMD ["mysqld", "--bind-address=0.0.0.0"]
