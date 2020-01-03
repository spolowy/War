/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   accessors.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: agrumbac <agrumbac@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/06/05 06:32:25 by agrumbac          #+#    #+#             */
/*   Updated: 2019/12/27 00:44:00 by anselme          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <sys/mman.h>
#include <sys/stat.h>

#include "accessors.h"
#include "syscall.h"
#include "errors.h"
#include "compiler_utils.h"

/*
** safe()
** returns a safe pointer
** returns NULL if requested memory is out of range
*/

#define VIRUS_SIZE	((uint64_t)start - (uint64_t)loader_entry)

__warn_unused_result
void			*safe(struct safe_ptr ref, size_t offset, size_t size)
{
	if (offset + size > ref.size || offset + size < offset)
		return (NULL);
	return (ref.ptr + offset);
}

bool			free_accessor(struct safe_ptr *ref)
{
	if (ref->ptr)
	{
		if (sys_munmap(ref->ptr, ref->size) != 0)
			return errors(ERR_SYS, _ERR_MUNMAP_FAILED);
	}
	return true;
}

__warn_unused_result
bool			init_original_safe(struct safe_ptr *accessor, const char *filename)
{
	void		*ptr;
	struct stat	buf;
	int		fd = sys_open(filename, O_RDONLY);

	if (fd < 0)
		return errors(ERR_SYS, _ERR_OPEN_FAILED);
	if (sys_fstat(fd, &buf) < 0)
		{sys_close(fd); return errors(ERR_SYS, _ERR_FSTAT_FAILED);}
	if (buf.st_mode & S_IFDIR)
		{sys_close(fd); return errors(ERR_USAGE, _ERR_NOT_A_FILE);}
	if ((ssize_t)(ptr = sys_mmap(0, buf.st_size, PROT_READ, MAP_PRIVATE, fd, 0)) < 0)
		{sys_close(fd); errors(ERR_SYS, _ERR_MMAP_FAILED);}
	if (sys_close(fd))
		return errors(ERR_SYS, _ERR_CLOSE_FAILED);

	accessor->ptr  = ptr;
	accessor->size = buf.st_size;
	return true;
}

__warn_unused_result
bool			init_clone_safe(struct safe_ptr *accessor, const size_t original_filesize)
{
	// TODO check if enough!
	// accessor->size = original_filesize + VIRUS_SIZE + PAGE_ALIGNMENT;
	// magic number was: 131072??????
	accessor->size = original_filesize + 131072; // TODO WTF?!?!?!?
	accessor->ptr  = sys_mmap(0, accessor->size, \
		PROT_READ | PROT_WRITE, MAP_ANON | MAP_PRIVATE, -1, 0);

	if ((ssize_t)accessor->ptr < 0)
		return errors(ERR_SYS, _ERR_MMAP_FAILED);

	return true;
}

__warn_unused_result
bool			write_file(const struct safe_ptr accessor, \
				const char *filename)
{
	int	fd = sys_open(filename, O_CREAT | O_WRONLY | O_TRUNC, S_IRWXU);

	if (fd < 0) return errors(ERR_SYS, _ERR_OPEN_FAILED);

	if (sys_write(fd, accessor.ptr, accessor.size) < 0)
	{
		sys_close(fd);
		return errors(ERR_SYS, _ERR_CLOSE_FAILED);
	}

	sys_close(fd);
	return true;
}
