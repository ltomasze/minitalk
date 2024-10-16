# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ltomasze <ltomasze@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/16 13:37:47 by ltomasze          #+#    #+#              #
#    Updated: 2024/10/16 14:09:34 by ltomasze         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SERVER = server
CLIENT = client
SOURCES = server.c client.c
OBJECTS = $(SOURCES:.c=.o)
CC = cc
CFLAGS = -Wall -Wextra -Werror -g
FT_PRINTF = ft_printf/libftprintf.a

all: $(SERVER) $(CLIENT)

$(SERVER): $(OBJECTS) $(FT_PRINTF)
	$(CC) $(CFLAGS) -o $(SERVER) $(OBJECTS) $(FT_PRINTF)
	
$(CLIENT): $(OBJECTS) $(FT_PRINTF)
	$(CC) $(CFLAGS) -o $(CLIENT) $(OBJECTS) $(FT_PRINTF)

$(FT_PRINTF):
	$(MAKE) -C ft_printf

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJECTS)
	$(MAKE) -C ft_printf clean

fclean: clean
	rm -f $(SERVER) $(CLIENT)
	$(MAKE) -C ft_printf fclean

re: fclean all

.PHONY: all clean fclean re