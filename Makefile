# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ltomasze <ltomasze@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/16 13:37:47 by ltomasze          #+#    #+#              #
#    Updated: 2024/10/16 14:38:30 by ltomasze         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SERVER = server
CLIENT = client
SOURCES = server.c client.c
OBJECTS = $(SOURCES:.c=.o)
CC = cc
CFLAGS = -Wall -Wextra -Werror -g
FT_PRINTF = ft_printf/libftprintf.a
LIBFT = libft/libft.a

all: $(SERVER) $(CLIENT)

$(SERVER): $(OBJECTS) $(FT_PRINTF) $(LIBFT)
	$(CC) $(CFLAGS) -o $(SERVER) $(OBJECTS) $(FT_PRINTF) $(LIBFT)
	
$(CLIENT): $(OBJECTS) $(FT_PRINTF) $(LIBFT)
	$(CC) $(CFLAGS) -o $(CLIENT) $(OBJECTS) $(FT_PRINTF) $(LIBFT)

$(FT_PRINTF):
	$(MAKE) -C ft_printf

$(LIBFT):
	$(MAKE) -C libft

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJECTS)
	$(MAKE) -C ft_printf clean
	$(MAKE) -C libft clean

fclean: clean
	rm -f $(SERVER) $(CLIENT)
	$(MAKE) -C ft_printf fclean
	$(MAKE) -C libft fclean

re: fclean all

.PHONY: all clean fclean re