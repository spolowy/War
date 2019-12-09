/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   obfuscate.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: nhaquet <nhaquet@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/12/07 16:49:53 by nhaquet           #+#    #+#             */
/*   Updated: 2019/12/09 17:52:11 by nhaquet          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "famine.h"
#include "infect.h"
#include "utils.h"

bool obfuscate(struct entry *clone_entry, const struct famine *food)
{
	//maybe need to separate opcode in an array.
	const unsigned char	call	= 0xe8;
	const unsigned char	call1	= 0xff15;
	const unsigned char	call2	= 0x67e8;

	void		*iter        = food->clone_safe.ptr + clone_entry->safe_shdr->sh_offset;
	const void	*section_end = iter + clone_entry->safe_shdr->sh_size;

	dprintf(1, "lol\n", 4);
	while (iter < section_end)
	{
		if((unsigned char )iter == call )//|| (int)iter == call1 || (int)iter == call2)
		{
			dprintf(1, "found\n", 6);
		}
		iter++;
	}
	return (true);
}
