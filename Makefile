# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bguyot <bguyot@student.42mulhouse.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/18 16:01:44 by bguyot            #+#    #+#              #
#    Updated: 2023/12/04 10:58:01 by bguyot           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		=	libasm.a

SRC_FILES	=	ft_strlen	\
				ft_strcpy	\
				ft_strcmp	\
				ft_write	\
				ft_read		\
				ft_strdup	\
				ft_atoi_base

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

testers: strlen strcpy strcmp write read

strlen: ft_strlen og_strlen

ft_strlen: $(NAME) srcs/testers/strlen.c
	FT=1 $(CC) -o ft_strlen srcs/testers/strlen.c $(NAME)

og_strlen: $(NAME) srcs/testers/strlen.c
	OG=1 $(CC) -o og_strlen srcs/testers/strlen.c $(NAME)

strcpy: ft_strcpy og_strcpy

ft_strcpy: $(NAME) srcs/testers/strcpy.c
	FT=1 $(CC) -o ft_strcpy srcs/testers/strcpy.c $(NAME)

og_strcpy: $(NAME) srcs/testers/strcpy.c
	OG=1 $(CC) -o og_strcpy srcs/testers/strcpy.c $(NAME)

strcmp: ft_strcmp og_strcmp

ft_strcmp: $(NAME) srcs/testers/strcmp.c
	FT=1 $(CC) -o ft_strcmp srcs/testers/strcmp.c $(NAME)

og_strcmp: $(NAME) srcs/testers/strcmp.c
	OG=1 $(CC) -o og_strcmp srcs/testers/strcmp.c $(NAME)

write: ft_write og_write

ft_write: $(NAME) srcs/testers/write.c
	FT=1 $(CC) -o ft_write srcs/testers/write.c $(NAME)

og_write: $(NAME) srcs/testers/write.c
	OG=1 $(CC) -o og_write srcs/testers/write.c $(NAME)

read: ft_read og_read

ft_read: $(NAME) srcs/testers/read.c
	FT=1 $(CC) -o ft_read srcs/testers/read.c $(NAME)

og_read: $(NAME) srcs/testers/read.c
	OG=1 $(CC) -o og_read srcs/testers/read.c $(NAME)

.PHONY: all re fclean clean strlen strcpy strcmp
