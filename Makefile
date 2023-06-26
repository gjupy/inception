# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gjupy <gjupy@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/16 16:04:41 by gjupy             #+#    #+#              #
#    Updated: 2023/06/16 16:05:03 by gjupy            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all: run

run:
	grep -qxF "127.0.0.1 gjupy.42.fr" /etc/hosts || echo "127.0.0.1 gjupy.42.fr" | sudo tee -a /etc/hosts
	@sudo mkdir -p /home/gjupy/data/mysql
	@sudo mkdir -p /home/gjupy/data/wordpress
	@sudo docker compose -f ./srcs/docker-compose.yml up -d --build

fclean:
	@sudo docker compose -f ./srcs/docker-compose.yml down
	@if [ -d "/home/gjupy/data/wordpress" ]; then \
		sudo rm -rf /home/gjupy/data/wordpress/*; \
	fi;
	@if [ -d "/home/gjupy/data/mariadb" ]; then \
		sudo rm -rf /home/gjupy/data/mariadb/*; \
	fi;
	@sudo docker container prune
	@sudo docker image prune

re: fclean all

ls:
	sudo docker image ls
	sudo docker ps

.PHONY: all, run, fclean, re, ls
