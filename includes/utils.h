
#ifndef UTILS_H
# define UTILS_H

# include <stdint.h>
# include <sys/types.h>

ssize_t		ft_getrandom(void *buf, size_t buflen);
void		ft_bzero(void *ptr, size_t size);
void		*ft_memcpy(void *dst, void *src, size_t n);
int		ft_memcmp(const void *s1, const void *s2, size_t n);
char		*ft_strcat(char *s1, char *s2);
char		*ft_strcpy(char *dst, const char *src);
size_t		ft_strlen(const char *s);
char		*ft_strstr(const char *s1, const char *s2);
int		ft_putstr(const char *str);
void   		ft_putu64(uint64_t n);
void		ft_putnbr(int n);
int             ft_putchar(char c);
void            *ft_memset(void *b, int c, unsigned long len);

uint64_t	random(uint64_t *seed);
uint64_t	random_inrange(uint64_t *seed, int64_t lower, int64_t upper);
uint64_t	random_exrange(uint64_t *seed, int64_t lower, int64_t upper);

#endif
