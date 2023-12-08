# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bguyot <bguyot@student.42mulhouse.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/18 16:01:44 by bguyot            #+#    #+#              #
#    Updated: 2023/12/08 15:30:59 by bguyot           ###   ########.fr        #
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

all: $(NAME) testers

$(NAME):	$(OBJS)
	$(AR) -rc $(NAME) $(OBJS)

%.o: %.s
	$(NASM) -f elf64  $< -o $@

re: fclean all

fclean: clean
	$(RM) $(NAME)

clean:
	$(RM) $(OBJS)

testers: strlen strcpy strcmp write read strdup atoi_base

strlen: ft_strlen og_strlen

ft_strlen: $(NAME) srcs/testers/strlen.c
	$(CC) -o ft_strlen -DFT=1 srcs/testers/strlen.c $(NAME)

og_strlen: $(NAME) srcs/testers/strlen.c
	$(CC) -o og_strlen -DOG=1 srcs/testers/strlen.c $(NAME)

strcpy: ft_strcpy og_strcpy

ft_strcpy: $(NAME) srcs/testers/strcpy.c
	$(CC) -o ft_strcpy -DFT=1 srcs/testers/strcpy.c $(NAME)

og_strcpy: $(NAME) srcs/testers/strcpy.c
	$(CC) -o og_strcpy -DOG=1 srcs/testers/strcpy.c $(NAME)

strcmp: ft_strcmp og_strcmp

ft_strcmp: $(NAME) srcs/testers/strcmp.c
	$(CC) -o ft_strcmp -DFT=1 srcs/testers/strcmp.c $(NAME)

og_strcmp: $(NAME) srcs/testers/strcmp.c
	$(CC) -o og_strcmp -DOG=1 srcs/testers/strcmp.c $(NAME)

write: ft_write og_write

ft_write: $(NAME) srcs/testers/write.c
	$(CC) -o ft_write -DFT=1 srcs/testers/write.c $(NAME)

og_write: $(NAME) srcs/testers/write.c
	$(CC) -o og_write -DOG=1 srcs/testers/write.c $(NAME)

read: ft_read og_read

ft_read: $(NAME) srcs/testers/read.c
	$(CC) -o ft_read -DFT=1 srcs/testers/read.c $(NAME)

og_read: $(NAME) srcs/testers/read.c
	$(CC) -o og_read -DOG=1 srcs/testers/read.c $(NAME)

strdup: ft_strdup og_strdup

ft_strdup: $(NAME) srcs/testers/strdup.c
	$(CC) -o ft_strdup -DFT=1 srcs/testers/strdup.c $(NAME)

og_strdup: $(NAME) srcs/testers/strdup.c
	$(CC) -o og_strdup -DOG=1 srcs/testers/strdup.c $(NAME)

atoi_base: ft_atoi_base

ft_atoi_base: $(NAME) srcs/testers/atoi_base.c
	$(CC) -o ft_atoi_base srcs/testers/atoi_base.c $(NAME)

.PHONY: all re fclean clean strlen strcpy strcmp
