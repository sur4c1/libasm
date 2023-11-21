/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   write.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bguyot <bguyot@student.42mulhouse.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/18 17:50:52 by bguyot            #+#    #+#             */
/*   Updated: 2023/11/21 12:09:39 by bguyot           ###   ########.fr       */
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
#define	test(a,b,c) ft_write(a,b,c)
#else
#define test(a,b,c) write(a,b,c)
#endif

int main(int argc, char **argv)
{
	int	fd;
	int	p[2];
	int	ret;

	if (argc < 4)
		return (0);
	if (!strcmp(argv[1], "BROKEN"))
	{
		pipe(p);
		close(p[1]);
		fd	= p[0];
	}
	else
		fd = atoi(argv[1]);
	if (!strcmp(argv[2], "NULL"))
		argv[2] = NULL;
	ret = test(fd, argv[2], atoi(argv[3]));
	printf("\nret: %d\nerrno: %d\n", ret, errno);
	if (fd > 2)
		close(fd);
}
