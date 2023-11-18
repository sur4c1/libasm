/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bguyot <bguyot@student.42mulhouse.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/18 16:01:23 by bguyot            #+#    #+#             */
/*   Updated: 2023/11/18 16:25:46 by bguyot           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <string.h>
#include <stdio.h>
#include "libasm.h"

int main(int argc, char **argv)
{
	if (argc == 1)
		return 0;

	printf("ft_strlen(%s) = %ld\n", argv[1], ft_strlen(argv[1]));
	printf("strlen(%s) = %ld\n", argv[1], strlen(argv[1]));
}
