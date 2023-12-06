/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   atoi_base.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bguyot <bguyot@student.42mulhouse.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/12/04 16:40:24 by bguyot            #+#    #+#             */
/*   Updated: 2023/12/06 12:08:05 by bguyot           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../libasm.h"
#include <stdio.h>

int	main(int argc, char **argv)
{
	int	ret;

	if (argc != 3)
		return (0);
	ret = ft_atoi_base(argv[1], argv[2]);
	printf("\"%s\" en base \"%s\" est egal à %d en base 10.\n", argv[1], argv[2], ret);
	return 0;
}
