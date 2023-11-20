/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bguyot <bguyot@student.42mulhouse.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/18 16:01:23 by bguyot            #+#    #+#             */
/*   Updated: 2023/11/18 16:51:18 by bguyot           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <string.h>
#include <stdio.h>
#include "libasm.h"

int main(int argc, char **argv)
{
	if (argc == 1)
		return 0;

	{
		char	dest[100];
		printf("ft_strcpy(%s) = %s\n", argv[1], ft_strcpy(dest, argv[1]));
	}
	{
		char	dest[100];
		printf("strcpy(%s) = %s\n", argv[1], strcpy(dest, argv[1]));
	}
}
