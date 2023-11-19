/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.read.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bguyot <bguyot@student.42mulhouse.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/19 16:51:28 by bguyot            #+#    #+#             */
/*   Updated: 2023/11/19 18:23:04 by bguyot           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <unistd.h>
#include <stdio.h>
#include "libasm.h"
#include <string.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>


int main(int argc, char **argv)
{
	if (argc == 1)
		return (0);

	printf("Testing read\n");
	{	int		fd = open(argv[1], O_RDONLY);
		char	buf[200];
		if (fd < 0)
			return (1);
		int ret = ft_read(fd, buf, 200);
		printf("ft_read() = %d ; buf = %s {%d}\n", ret, buf, errno);
		close(fd);
	}
	{	int		fd = open(argv[1], O_RDONLY);
		char	buf[200];
		if (fd < 0)
			return (1);
		int ret = read(fd, buf, 200);
		printf("read() = %d ; buf = %s {%d}\n", ret, buf, errno);
		close(fd);
	}
}
