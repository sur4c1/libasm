/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   strdup.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bguyot <bguyot@student.42mulhouse.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/19 18:43:00 by bguyot            #+#    #+#             */
/*   Updated: 2023/12/06 17:24:57 by bguyot           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "../../libasm.h"

#ifdef	FT
#define	test(a) ft_strdup(a)
#else
#define test(a) strdup(a)
#endif

int main(int argc, char **argv)
{
	char	*str;

	if (argc != 2)
		return (0);
	if (strcmp(argv[1], "NULL") == 0)
		argv[1] = NULL;
	str = test(argv[1]);
	printf("strdup: %s\n", str);
	free(str);
}
