/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   clone_safe.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: agrumbac <agrumbac@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/05/12 03:15:48 by agrumbac          #+#    #+#             */
/*   Updated: 2019/06/03 21:36:42 by agrumbac         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "woody_woodpacker.h"

static struct
{
	void	*ptr;
	size_t	filesize;
}		safe_pointer = {NULL, 0};

/*
** clone_safe()
** returns a safe pointer in the clone
** returns NULL if requested memory is out of range
*/

__warn_unused_result
void		*clone_safe(const size_t offset, const size_t size)
{
	if (offset + size > safe_pointer.filesize || offset + size < offset)
		return (NULL);
	return (safe_pointer.ptr + offset);
}

__warn_unused_result
bool		alloc_clone(const size_t original_filesize)
{
	safe_pointer.filesize = original_filesize;
	safe_pointer.ptr = malloc(safe_pointer.filesize);

	if (safe_pointer.ptr == NULL)
		return (errors(ERR_SYS, "while allocating clone"));

	return (true);
}

__warn_unused_result
bool		resize_clone(const size_t added_size)
{
	safe_pointer.filesize += added_size;
	safe_pointer.ptr = realloc(safe_pointer.ptr, safe_pointer.filesize);

	if (safe_pointer.ptr == NULL)
		return (errors(ERR_SYS, "while reallocating clone"));

	return (true);
}

void		free_clone(void)
{
	free(safe_pointer.ptr);
}

__warn_unused_result
bool		write_clone_file(void)
{
	int	fd = open(OUTPUT_FILENAME, O_CREAT | O_WRONLY | O_TRUNC, S_IRWXU);

	if (fd == -1)
		return errors(ERR_SYS, "failed creating file " OUTPUT_FILENAME);

	if (write(fd, safe_pointer.ptr, safe_pointer.filesize) == -1)
	{
		close(fd);
		return errors(ERR_SYS, "failed writing to " OUTPUT_FILENAME);
	}

	close(fd);
	return (true);
}
