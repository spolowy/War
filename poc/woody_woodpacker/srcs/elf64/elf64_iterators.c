/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   elf64_iterators.c                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: agrumbac <agrumbac@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/05/10 08:11:33 by agrumbac          #+#    #+#             */
/*   Updated: 2019/06/03 21:40:51 by agrumbac         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "elf64_private.h"

bool	foreach_phdr(f_safe_accessor safe, f_iter_callback callback)
{
	const Elf64_Ehdr	*elf64_hdr = safe(0, sizeof(Elf64_Ehdr));

	if (elf64_hdr == NULL) return (errors(ERR_CORRUPT, "no elf64 hdr"));

	const Elf64_Off		phoff     = endian_8(elf64_hdr->e_phoff);
	const Elf64_Half	phentsize = endian_2(elf64_hdr->e_phentsize);
	Elf64_Half		phnum     = endian_2(elf64_hdr->e_phnum);
	char			(*segments)[phnum][phentsize] = NULL;
	const size_t		array_size = phentsize * phnum;

	if (phentsize < sizeof(Elf64_Phdr)
	|| (array_size / phentsize != phnum)
	|| (!(segments = safe(phoff, array_size))))
		return (errors(ERR_CORRUPT, "invalid segments table"));

	while (phnum--)
	{
		size_t	elf64_seg_hdr = (size_t)(*segments)[phnum];
		size_t	offset        = (elf64_seg_hdr - (size_t)elf64_hdr);

		if (!callback(safe, offset))
			return (errors(ERR_THROW, "foreach_phdr"));
	}
	return (true);
}

bool	foreach_shdr(f_safe_accessor safe, f_iter_callback callback)
{
	const Elf64_Ehdr	*elf64_hdr = safe(0, sizeof(Elf64_Ehdr));

	if (elf64_hdr == NULL) return (errors(ERR_CORRUPT, "no elf64 hdr"));

	const Elf64_Off		shoff     = endian_8(elf64_hdr->e_shoff);
	const Elf64_Half	shentsize = endian_2(elf64_hdr->e_shentsize);
	Elf64_Half		shnum     = endian_2(elf64_hdr->e_shnum);
	char			(*sections)[shnum][shentsize] = NULL;
	const size_t		array_size = shentsize * shnum;

	if (shentsize < sizeof(Elf64_Shdr)
	|| (array_size / shentsize != shnum)
	|| (!(sections = safe(shoff, array_size))))
		return (errors(ERR_CORRUPT, "invalid sections table"));

	while (shnum--)
	{
		size_t	elf64_section_hdr = (size_t)(*sections)[shnum];
		size_t	offset = (elf64_section_hdr - (size_t)elf64_hdr);

		if (!callback(safe, offset))
			return (errors(ERR_THROW, "foreach_shdr"));
	}
	return (true);
}
