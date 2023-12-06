/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   atoi_base.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bguyot <bguyot@student.42mulhouse.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/12/04 16:40:24 by bguyot            #+#    #+#             */
/*   Updated: 2023/12/06 17:58:09 by bguyot           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../libasm.h"
#include <stdio.h>

int	main(int argc, char **argv)
{
	int	ret;

	if (argc != 3)
		return (0);
	if (!strcmp(argv[1], "NULL"))
		argv[1] = NULL;
	if (!strcmp(argv[2], "NULL"))
		argv[2] = NULL;
	ret = ft_atoi_base(argv[1], argv[2]);
	printf("\"%s\" en base \"%s\" est egal à %d en base 10.\n", argv[1], argv[2], ret);
	return 0;
}
