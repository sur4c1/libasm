/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.strdup.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bguyot <bguyot@student.42mulhouse.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/19 18:43:00 by bguyot            #+#    #+#             */
/*   Updated: 2023/11/19 19:38:11 by bguyot           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "libasm.h"

int main(int argc, char **argv)
{
	char *str;

	if (argc == 1)
		return (0);
	str	= strdup(argv[1]);
	printf("strdup(%s) = %s\n", argv[1], str);
	free(str);
	str	= ft_strdup(argv[1]);
	printf("ft_strdup(%s) = %s\n", argv[1], str);
	free(str);
}
