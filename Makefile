# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tadey <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/07/14 15:39:05 by tadey             #+#    #+#              #
#    Updated: 2018/07/14 15:39:06 by tadey            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libfts.a
SRC_ASM = \
ft_strlen.s\
ft_bzero.s\
ft_isalpha.s\
ft_isdigit.s\
ft_isalnum.s\
ft_isascii.s\
ft_isprint.s\
ft_toupper.s\
ft_tolower.s\
ft_puts.s\

OBJ_ASM = $(SRC_ASM:.s=.o)
NASM = nasm
ASM_FLAGS = -fmacho64

all : $(NAME)

$(NAME): $(OBJ_ASM)
	ar rc $(NAME) $(OBJ_ASM)
	ranlib $(NAME)

%.o : %.s
	$(NASM) $(ASM_FLAGS) -o $@ $<

fclean : clean
	rm -f libfts.a
	rm -f $(OBJ_ASM)

re : fclean all

.PHONY: clean fclean re
