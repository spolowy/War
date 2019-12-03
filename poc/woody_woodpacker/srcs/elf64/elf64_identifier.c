/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   elf64_identifier.c                                 :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: agrumbac <agrumbac@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/03/11 15:42:01 by agrumbac          #+#    #+#             */
/*   Updated: 2019/06/03 21:26:55 by agrumbac         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "elf64_private.h"

bool				elf64_identifier(void)
{
	const Elf64_Ehdr	*hdr = original_safe(0, sizeof(*hdr));

	if (hdr == NULL                                // no header at all!
	|| memcmp(hdr->e_ident, ELFMAG, SELFMAG) != 0  // wrong Magic
	|| hdr->e_ident[EI_CLASS] != ELFCLASS64        // not 64bit
	|| hdr->e_entry == 0                           // no entry point
	|| hdr->e_phoff == 0                           // no program hdr table
	|| hdr->e_shoff == 0)                          // no section hdr table
		return (false);

	// set endian for the future
	endian_big_mode(hdr->e_ident[EI_DATA] == ELFDATA2MSB);

	return (true);
}
