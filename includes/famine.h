/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   famine.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jfortin <jfortin@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/06/04 03:38:38 by agrumbac          #+#    #+#             */
/*   Updated: 2019/12/16 21:15:03 by jfortin          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef FAMINE_H
# define FAMINE_H

# include <limits.h>
# include <linux/elf.h>
# include <stdbool.h>
# include <stdint.h>
# include <stddef.h>
# include <sys/types.h>

struct client_info
{
	uint64_t	seed[2];
	uint64_t	relative_pt_load_address;
	uint64_t	pt_load_size;
	uint64_t	relative_virus_address;
	uint64_t	relative_entry_address;
	uint64_t	virus_size;
}__attribute__((packed));

/*
** famine
*/

bool		detect_spy(void);

/*
** virus
*/

void		famine_entry(void);
void		virus(uint64_t seed[2]);
void		infect_files_in(const char *path, uint64_t seed[2]);

/*
** encryption
*/

void		cypher(char *data, size_t size);
void		decypher(char *data, size_t size);

void		cypher_end(void);
void		decypher_end(void);

/*
** anti_debug
*/

bool		anti_debug(void);

void		anti_debug_end(void);

#endif
