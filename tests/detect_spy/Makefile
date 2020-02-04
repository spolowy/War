# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jfortin <jfortin@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/06/13 22:28:19 by jfortin           #+#    #+#              #
#    Updated: 2019/06/13 23:16:42 by jfortin          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = daemon
SRC  = daemon.c
OBJ  = $(SRC:.c=.o)

all: $(NAME)
	echo $(NAME) > .gitignore

$(NAME): $(OBJ)
	$(CC) $< -o $@

clean:
	rm -rf $(OBJ)

fclean: clean
	rm -rf $(NAME)

re:
	$(MAKE) fclean
	$(MAKE) all