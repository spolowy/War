#include <sys/types.h>
#include <stdint.h>
#include <string.h>

#include "position_independent.h"
#include "syscall.h"

void	ft_bzero(void *ptr, size_t size)
{
	char *tmp = ptr;

	for (size_t i = 0; i < size; i++)
		tmp[i] = 0;
}

int	ft_memcmp(const void *s1, const void *s2, size_t n)
{
	size_t			i;
	const unsigned char	*ch_s1;
	const unsigned char	*ch_s2;

	ch_s1 = (const unsigned char*)s1;
	ch_s2 = (const unsigned char*)s2;
	i = 0;
	while (i < n)
	{
		if (ch_s1[i] != ch_s2[i])
			return (ch_s1[i] - ch_s2[i]);
		i++;
	}
	return (0);
}

size_t	ft_strlen(const char *s)
{
	char	*p;

	p = (char*)s;
	while (*p)
		++p;
	return (p - s);
}

void	*ft_memcpy(void *dst, void *src, size_t n)
{
	unsigned char *dest;
	unsigned char *source;

	dest = (unsigned char*)dst;
	source = (unsigned char*)src;
	while (n--)
	{
		*dest = *source;
		dest++;
		source++;
	}
	return dst;
}

char	*ft_strcpy(char *dst, const char *src)
{
	int i = 0;

	while(src[i])
	{
		dst[i] = src[i];
		i++;
	}
	dst[i] = '\0';
	return dst;
}

char	*ft_strcat(char *dest, char *source)
{
	int len = ft_strlen(dest);

	ft_strcpy(dest + len, source);
	return dest;
}

char	*ft_strstr(const char *s1, const char *s2)
{
	unsigned int	i;
	unsigned int	j;

	i = 0;
	if (!s1[0] && !s2[0])
		return ((char *)s1);
	while (s1[i])
	{
		j = 0;
		while (s1[i + j] == s2[j] && s2[j])
			j++;
		if (s2[j] == '\0')
			return ((char *)s1 + i);
		i++;
	}
	return (NULL);
}

int             ft_putchar(char c)
{
        return (famine_write(1, &c, 1));
}

int             ft_putstr(const char *s)
{
        return (famine_write(1, s, ft_strlen(s)));
}

void   		ft_putu64(uint64_t n)
{
	PD_ARRAY(char, letter, '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F');

	if (n > 15)
	{
		ft_putu64(n / 16);
		ft_putu64(n % 16);
	}
	else
	{
		ft_putchar(letter[n]);
	}
}

void    ft_putnbr(int n)
{
	if (n == -2147483648)
	{
		ft_putstr("-214748364");
		n = 8;
	}
	if (n < 0)
	{
		ft_putchar('-');
		n = n * -1;
	}
	if (n > 9)
	{
		ft_putnbr(n / 10);
		ft_putnbr(n % 10);
	}
	else
	{
		n = n + '0';
		ft_putchar(n);
	}
}

void            *ft_memset(void *b, int c, unsigned long len)
{
	unsigned long   m;
	unsigned char   *r;

	m = len >> 3;
	r = b + (m << 3);
	while (m--)
		((unsigned long*)b)[m] = c;
	len &= 7;
	while (len--)
		r[len] = c;
	return (b);
}
