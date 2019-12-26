/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   utils.h                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: agrumbac <agrumbac@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/06/06 03:51:06 by agrumbac          #+#    #+#             */
/*   Updated: 2019/12/22 22:34:23 by anselme          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef UTILS_H
# define UTILS_H

# include <stdint.h>
# include <sys/types.h>

void		bzero(void *ptr, size_t size);
void		*memcpy(void *dst, void *src, size_t n);
int		memcmp(const void *s1, const void *s2, size_t n);
char		*strcat(char *s1, char *s2);
char		*strcpy(char *dst, const char *src);
size_t		strlen(const char *s);
char		*strstr(const char *s1, const char *s2);
int		putstr(const char *str);
void   		putu64(uint64_t n);
int             putchar(char c);
void            *memset(void *b, int c, unsigned long len);
uint64_t	checksum(const char *buff, size_t buffsize);
uint64_t	hash(const char *buff, size_t buffsize);

uint64_t	random(uint64_t *seed);
uint64_t	random_inrange(uint64_t *seed, int64_t lower, int64_t upper);
uint64_t	random_exrange(uint64_t *seed, int64_t lower, int64_t upper);

#endif
