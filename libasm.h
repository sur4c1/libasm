/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bguyot <bguyot@student.42mulhouse.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/18 16:13:57 by bguyot            #+#    #+#             */
/*   Updated: 2023/12/04 16:49:17 by bguyot           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#pragma once
#include <stddef.h>
#include <sys/types.h>

/**
 *	@brief	Calculate the size of a string
 *	@param	str	The string to measure
 *	@returns	The size of the string
 */
size_t	ft_strlen(const char *str);

/**
 *	@brief	Copy a string into another
 *	@param	dest	The destination to copy to
 *	@param	src		The source to copy from
 *	@returns	The return value
 */
char	*ft_strcpy(char *dest, const char *src);

/**
 *	@brief	Compare two strings
 *	@param	s1	The left string
 *	@param	s2	The right string
 *	@returns	The difference s1 - s2
 */
int		ft_strcmp(char *s1, const char *s2)
	__attribute__ ((nonnull));

ssize_t	ft_write(int fd, const void *buf, size_t count);
ssize_t	ft_read(int fd, const void *buf, size_t count);
char	*ft_strdup(const char *s);
int	ft_atoi_base(char *str, char *base);
