/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   woody_woodpacker.h                                 :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: agrumbac <agrumbac@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/11/04 18:05:58 by agrumbac          #+#    #+#             */
/*   Updated: 2019/06/03 21:42:37 by agrumbac         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef WOODY_WOODPACKER_H
# define WOODY_WOODPACKER_H

/*
** ------------------------------- Includes ------------------------------------
*/

# include <stdlib.h>
# include <stdio.h>
# include <stdbool.h>
# include <stdint.h>
# include <string.h>
# include <fcntl.h>
# include <unistd.h>
# include <sys/stat.h>
# include <sys/mman.h>

# include "compiler_utils.h"
# include "errors.h"

/*
** ------------------------------- Constants -----------------------------------
*/

# define OUTPUT_FILENAME	"packed_file"

enum
{
	ERR_SYS,                // syscall failure
	ERR_THROW,              // throw error form above function
	ERR_USAGE,              // bad usage
	ERR_CORRUPT,            // corrupt file
	ERR_SIZE,               // number of ERRs above, always last
};

/*
** managed formats
*/

enum	e_format
{
	FMT_ELF64,
	// FMT_ELF32,
	// FMT_MACHO64,
	// FMT_MACHO32,
	// FMT_PE64,
	// FMT_PE32,
	FMT_SIZE                // alway last
};

/*
** f_identifier
**   returns true if identifies valid file format, sets endian globally
** f_packer
**   encrypts entry section, adds decryption routine before original entry
*/

typedef bool			(*f_identifier)(void);
typedef bool			(*f_packer)(size_t original_file_size);

struct				format
{
	f_identifier		format_identifier;
	f_packer		packer;
};

/*
** ------------------------------- Text Symbols --------------------------------
*/

/*
** encryption
*/

void		encrypt(uint num_rounds, char *data, uint32_t const key[4], size_t size);
void		decrypt(uint num_rounds, char *data, uint32_t const key[4], size_t size);

/*
** safe file accessing
*/

void		*original_safe(const size_t offset, const size_t size);
size_t		read_file(const char *filename);
bool		free_file(void);

void		*clone_safe(const size_t offset, const size_t size);
bool		alloc_clone(const size_t original_filesize);
bool		resize_clone(const size_t added_size);
bool		write_clone_file(void);
void		free_clone(void);

/*
** endian management
*/

void		endian_big_mode(bool is_big_endian);
uint16_t	endian_2(uint16_t n);
uint32_t	endian_4(uint32_t n);
uint64_t	endian_8(uint64_t n);

#endif
