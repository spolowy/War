/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   elf64_packer.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: agrumbac <agrumbac@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/03/11 15:42:04 by agrumbac          #+#    #+#             */
/*   Updated: 2019/12/03 17:02:43 by agrumbac         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "elf64_private.h"

typedef struct		field
{
	size_t		begin_off;
	size_t		end_off;
};

bool		elf64_packer(size_t original_file_size)
{
	struct field	codecaves[1024];
	struct field	text_pt_load;

	elf64_viewer(&original_safe);

	text_pt_load = find_executable_pt_load()

	

	return true;
}
