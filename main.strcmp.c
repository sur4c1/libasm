/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.strcmp.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bguyot <bguyot@student.42mulhouse.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/18 17:02:46 by bguyot            #+#    #+#             */
/*   Updated: 2023/11/19 20:47:28 by bguyot           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <string.h>
#include <stdio.h>
#include "libasm.h"

int	main(int argc, char **argv)
{
	if (argc <= 2)
		return (0);

	printf("strcmp(%s, %s) = %d\n", argv[1], argv[2], strcmp(argv[1], argv[2]));
	printf("ft_strcmp(%s, %s) = %d\n", argv[1], argv[2], ft_strcmp(argv[1], argv[2]));

	ft_strcmp(argv[1], NULL);
	ft_strcmp(NULL, argv[2]);
	ft_strcmp(NULL, NULL);
}
