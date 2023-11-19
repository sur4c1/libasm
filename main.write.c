/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.write.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bguyot <bguyot@student.42mulhouse.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/18 17:50:52 by bguyot            #+#    #+#             */
/*   Updated: 2023/11/19 20:24:40 by bguyot           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <unistd.h>
#include <stdio.h>
#include "libasm.h"
#include <string.h>
#include <errno.h>

int main(int argc, char **argv)
{
	if (argc == 1)
		return (0);

	int fd = -1;
	int	len = ft_strlen(argv[1]);
	len = 1;

	ssize_t	ft = ft_write(fd, argv[1], len);
	ft_write(1, "\n", 1);
	printf("ft_write(%s) = %zd {%d}\n", argv[1], ft, errno);

	ssize_t	og = write(fd, argv[1], len);
	write(1, "\n", 1);
	printf("write(%s) = %zd {%d}\n", argv[1], og, errno);


	ft_write(-1, NULL, 478);
}
