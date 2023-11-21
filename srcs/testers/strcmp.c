/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   strcmp.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bguyot <bguyot@student.42mulhouse.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/18 17:02:46 by bguyot            #+#    #+#             */
/*   Updated: 2023/11/21 11:32:13 by bguyot           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../libasm.h"
#include <string.h>
#include <errno.h>
#include <stdio.h>

#ifdef	FT
#define	test(a,b) ft_strcmp(a,b)
#else
#define test(a,b) strcmp(a,b)
#endif

int	main(int argc, char **argv)
{
	if (argc == 1)
		return (0);
	if (!test(argv[1], "NULL"))
		argv[1] = NULL;
	if (!test(argv[2], "NULL"))
		argv[2] = NULL;
	printf("ret: %d\nerrno:%d\n", test(argv[1], argv[2]), errno);
	return (0);
}
