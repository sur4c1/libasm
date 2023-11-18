/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.write.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bguyot <bguyot@student.42mulhouse.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/18 17:50:52 by bguyot            #+#    #+#             */
/*   Updated: 2023/11/18 19:13:56 by bguyot           ###   ########.fr       */
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

	int fd = 1;

	int	ft = ft_write(fd, argv[1], ft_strlen(argv[1]));
	ft_write(1, "\n", 1);

	printf("ft_write(%s) = %d {%d}\n", argv[1], ft, errno);
	int	og = write(fd, argv[1], strlen(argv[1]));
	write(1, "\n", 1);
	printf("write(%s) = %d {%d}\n", argv[1], og, errno);
}
