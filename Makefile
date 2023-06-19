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
	@sudo hostsed add 127.0.0.1 gjupy.42.fr
	@sudo mkdir -p /home/gjupy/data/mysql
	@sudo mkdir -p /home/gjupy/data/wordpress
	@sudo docker compose -f ./srcs/docker-compose.yml up -d

fclean:
	@sudo docker compose -f $(COMPOSE_FILE) down
	@if [ -d "/home/gjupy/data/wordpress" ]; then \
	sudo rm -rf /home/gjupy/data/wordpress/*
	fi;
	@if [ -d "/home/gjupy/data/mariadb" ]; then \
	sudo rm -rf /home/gjupy/data/mariadb/* && \
	fi;
	@sudo docker stop mariadb wordpress nginx
	@sudo docker container prune
	@sudo docker image prune

re: fclean all

ls:
	sudo docker image ls
	sudo docker ps

.PHONY: all, run, fclean, re, ls
