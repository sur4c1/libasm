/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   read.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bguyot <bguyot@student.42mulhouse.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/19 16:51:28 by bguyot            #+#    #+#             */
/*   Updated: 2023/11/22 11:12:10 by bguyot           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../libasm.h"
#include <string.h>
#include <errno.h>
#include <stdio.h>
#define _GNU_SOURCE
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>

#ifdef	FT
#define	test(a,b,c) ft_read(a,b,c)
#else
#define test(a,b,c) read(a,b,c)
#endif

int main(int argc, char **argv)
{
	int		fd;
	int		p[2];
	int		ret;
	int		must_close;
	char	*buf;

	if (argc < 4)
		return (0);

	must_close = 1;
	if (!strcmp(argv[1], "ALPHABET"))
		fd = open("srcs/testers/in_files/alphabet.txt", O_RDONLY);
	else if (!strcmp(argv[1], "EMPTY"))
		fd = open("srcs/testers/in_files/empty.txt", O_RDONLY);
	else if (!strcmp(argv[1], "WRONLY"))
		fd = open("srcs/testers/in_files/alphabet.txt", O_WRONLY);
	else if (!strcmp(argv[1], "BROKEN"))
	{
		pipe(p);
		close(p[0]);
		fd = p[1];
	}
	else
	{
		fd = atoi(argv[1]);
		must_close = 0;
	}

	if (!strcmp(argv[2], "NULL"))
		buf = NULL;
	else
	{
		buf = calloc(atoi(argv[2]) + 1, 1);
	}

	ret = test(fd, buf, atoi(argv[3]));
	if (ret > 0)
		printf("buf: %s\nret: %d\nerrno: %d\n", buf, ret, errno);
	else
		printf("ret: %d\nerrno: %d\n", ret, errno);
	if (must_close)
		close(fd);
}
