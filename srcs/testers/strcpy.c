/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   strcpy.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bguyot <bguyot@student.42mulhouse.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/18 16:01:23 by bguyot            #+#    #+#             */
/*   Updated: 2023/11/21 11:33:01 by bguyot           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../libasm.h"
#include <string.h>
#include <errno.h>
#include <stdio.h>

#ifdef	FT
#define	test(a,b) ft_strcpy(a,b)
#else
#define test(a,b) strcpy(a,b)
#endif

int	main(int argc, char **argv)
{
	if (argc == 1)
		return (0);
	if (!strcmp(argv[1], "NULL"))
		argv[1] = NULL;
	if (!strcmp(argv[2], "NULL"))
		argv[2] = NULL;
	printf("BEFORE:\n\targv[1]:%s\n\targv[2]:%s\n", argv[1], argv[2]);
	char *ret = test(argv[1], argv[2]);
	printf("AFTER:\n\targv[1]:%s\n\targv[2]:%s\n", argv[1], argv[2]);
	printf("ret: %s\nret == argv[1]: %d\nerrno:%d\n", ret, ret == argv[1], errno);
	return (0);
}
