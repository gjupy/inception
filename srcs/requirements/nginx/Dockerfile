FROM debian:bullseye

RUN apt update && apt install -y \
	nginx \
	openssl

RUN mkdir -p /etc/ssl \
	&&	openssl req -x509 -days 365 -nodes -newkey rsa:2048 \
		-keyout /etc/ssl/nginx.key \
		-out /etc/ssl/nginx.crt -sha256 -subj "/CN=gjupy.42.fr"

COPY ./conf/nginx.conf /etc/nginx/sites-available/default

CMD ["nginx", "-g", "daemon off;"]