/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   atoi_base.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bguyot <bguyot@student.42mulhouse.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/12/04 16:40:24 by bguyot            #+#    #+#             */
/*   Updated: 2023/12/08 16:24:54 by bguyot           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../libasm.h"
#include <stdio.h>
#include <string.h>

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
	printf("%12s en base %64s est egal à %+12d en base 0123456789.\n", argv[1], argv[2], ret);
	return 0;
}
