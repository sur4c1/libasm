# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bguyot <bguyot@student.42mulhouse.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/18 16:01:44 by bguyot            #+#    #+#              #
#    Updated: 2023/11/21 11:11:02 by bguyot           ###   ########.fr        #
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

testers: strlen strcpy

strlen: ft_strlen og_strlen

ft_strlen: $(NAME) srcs/testers/strlen.c
	FT=1 $(CC) -o ft_strlen srcs/testers/strlen.c $(NAME)

og_strlen: $(NAME) srcs/testers/strlen.c
	OG=1 $(CC) -o og_strlen srcs/testers/strlen.c $(NAME)

strcpy: ft_strcpy og_strcpy

ft_strlen: $(NAME) srcs/testers/strcpy.c
	FT=1 $(CC) -o ft_strcpy srcs/testers/strcpy.c $(NAME)

og_strcpy: $(NAME) srcs/testers/strcpy.c
	OG=1 $(CC) -o og_strcpy srcs/testers/strcpy.c $(NAME)

.PHONY: all re fclean clean strlen strcpy
