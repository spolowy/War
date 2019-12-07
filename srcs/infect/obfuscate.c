/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   obfuscate.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: nhaquet <nhaquet@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/12/07 16:49:53 by nhaquet           #+#    #+#             */
/*   Updated: 2019/12/07 18:49:48 by nhaquet          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "famine.h"
#include "infect.h"
#include "utils.h"

bool obfuscate (struct entry *clone_entry, const struct famine *food)
{
	//maybe need to separate opcode in an array.
	const int	call         = 0xe8;
	const int	call1        = 0xff15;
	const int	call2        = 0x67e8;

	void		*iter        = food->clone_safe.ptr + clone_entry->safe_shdr->sh_offset;
	const void	*section_end = iter + clone_entry->safe_shdr->sh_size;

	while (iter < section_end)
	{
		if((int)iter == call || (int)iter == call1 || (int)iter == call2)
		{
			dprintf(1, "found\n", 6);
		}
		iter++;
	}
	return (true);
}
