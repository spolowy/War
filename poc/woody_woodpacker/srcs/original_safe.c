/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   original_safe.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: agrumbac <agrumbac@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/04/22 16:40:47 by agrumbac          #+#    #+#             */
/*   Updated: 2019/06/03 21:32:52 by agrumbac         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "woody_woodpacker.h"

static struct
{
	void		*ptr;
	size_t		filesize;
}			safe_pointer = {NULL, 0};

/*
** original_safe()
** returns a safe read-only pointer to the original file
** returns NULL if requested memory is out of range
*/

__warn_unused_result
void			*original_safe(const size_t offset, const size_t size)
{
	if (offset + size > safe_pointer.filesize || offset + size < offset)
		return (NULL);
	return (safe_pointer.ptr + offset);
}

__warn_unused_result
size_t			read_file(const char *filename)
{
	void		*ptr;
	struct stat	buf;
	int		fd = open(filename, O_RDONLY);

	if (fd < 0)
		return (errors(ERR_SYS, "open failed"));
	if (fstat(fd, &buf) < 0)
		return (errors(ERR_SYS, "fstat failed"));
	if (buf.st_mode & S_IFDIR)
		return (errors(ERR_USAGE, "can't parse directories"));
	if ((ptr = mmap(0, buf.st_size, PROT_READ, MAP_PRIVATE, fd, 0)) == MAP_FAILED)
		return (errors(ERR_SYS, "mmap failed"));
	if (close(fd))
		return (errors(ERR_SYS, "close failed"));

	safe_pointer.ptr = ptr;
	safe_pointer.filesize = buf.st_size;
	return (safe_pointer.filesize);
}

bool			free_file(void)
{
	if (safe_pointer.ptr)
	{
		if (munmap(safe_pointer.ptr, safe_pointer.filesize))
			return errors(ERR_SYS, "munmap failed");
	}
	return (true);
}
