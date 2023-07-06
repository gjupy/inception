# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gjupy <gjupy@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/16 16:04:41 by gjupy             #+#    #+#              #
#    Updated: 2023/07/06 15:19:41 by gjupy            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all: run

run:
	@grep -qxF "127.0.0.1 gjupy.42.fr" /etc/hosts || echo "127.0.0.1 gjupy.42.fr" | sudo tee -a /etc/hosts
	@sudo mkdir -p /home/gjupy/data/mariadb
	@sudo mkdir -p /home/gjupy/data/wordpress
	@sudo chmod 755 /home/gjupy/data/mariadb
	@sudo chmod 755 /home/gjupy/data/wordpress
	@sudo docker compose -f ./srcs/docker-compose.yml up --build

fclean:
	@sudo docker compose -f ./srcs/docker-compose.yml down
	@if [ -d "/home/gjupy/data/wordpress" ]; then \
		sudo rm -rf /home/gjupy/data/wordpress/*; \
	fi;
	@if [ -d "/home/gjupy/data/mariadb" ]; then \
		sudo rm -rf /home/gjupy/data/mariadb/*; \
	fi;
	@sudo docker image rm -f srcs_nginx
	@sudo docker image rm -f srcs_wordpress
	@sudo docker image rm -f srcs_mariadb

bigclean: fclean
	@sudo docker system prune -a

wpbash:
	@sudo docker exec -it wordpress bash

dbbash:
	@sudo docker exec -it mariadb bash

nginxbash:
	@sudo docker exec -it nginx bash

re: fclean all

ls:
	@sudo docker image ls
	@sudo docker ps

.PHONY: all, run, fclean, re, ls
