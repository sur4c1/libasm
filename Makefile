# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bguyot <bguyot@student.42mulhouse.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/18 16:01:44 by bguyot            #+#    #+#              #
#    Updated: 2023/11/20 11:04:39 by bguyot           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		=	libasm.a

SRC_FILES	=	ft_strlen	\
				ft_strcpy	\
				ft_strcmp	\
				ft_write	\
				ft_read		\
				ft_strdup	\

SRCS		=	$(addprefix srcs/, $(addsuffix .s, $(SRC_FILES)))
OBJS		=	$(SRCS:.s=.o)

NASM		=	nasm
AR			=	ar
CC			=	cc
RM			=	rm -rf

all: $(NAME)

$(NAME):	$(OBJS)
	$(AR) -rc $(NAME) $(OBJS)

%.o: %.s
	$(NASM) -f elf64  $< -o $@

re: fclean all

fclean: clean
	$(RM) $(NAME)

clean:
	$(RM) $(OBJS)

strlen: ft_strlen og_strlen

ft_strlen: $(NAME)
	FT=1 $(CC) -o ft_strlen srcs/testers/strlen.c $(NAME)

.PHONY: all re fclean clean strlen
