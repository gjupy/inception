FROM debian:buster

RUN apt update && apt install -y \
	nginx \
	openssl

RUN openssl req -x509 -days 365 -nodes -newkey rsa:2048 \
	-keyout /etc/ssl/private/nginx.key \
	-out /etc/ssl/certs/nginx.crt -sha256 -subj "/CN=gjupy.42.fr"

COPY ./conf/nginx.conf /etc/nginx/sites-available/default

CMD ["nginx", "-g", "daemon off;"]
