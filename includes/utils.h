/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   utils.h                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: agrumbac <agrumbac@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/06/06 03:51:06 by agrumbac          #+#    #+#             */
/*   Updated: 2019/12/17 00:03:06 by nhaquet          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stddef.h>
#ifndef UTILS_H
# define UTILS_H

size_t		ft_getrandom(void *buf, size_t buflen);
void		ft_bzero(void *ptr, size_t size);
void		*ft_memcpy(void *dst, void *src, size_t n);
int		ft_memcmp(const void *s1, const void *s2, size_t n);
char		*ft_strcat(char *s1, char *s2);
char		*ft_strcpy(char *dst, const char *src);
size_t		ft_strlen(const char *s);
int		dprintf(int fd, char *fmt, ...);
char		*ft_strstr(const char *s1, const char *s2);
void		ft_putnbr(int n);
void            *ft_memset(void *b, int c, unsigned long len);

#endif
