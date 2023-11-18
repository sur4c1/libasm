/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bguyot <bguyot@student.42mulhouse.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/18 16:13:57 by bguyot            #+#    #+#             */
/*   Updated: 2023/11/18 16:15:41 by bguyot           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#pragma once
#include <stddef.h>

/**
 *	@brief	Calculate the size of a string
 *	@param	str	The string to measure
 *	@returns	The size of the string
 */
size_t	ft_strlen(const char *str);
