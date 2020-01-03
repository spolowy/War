/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   compiler_utils.h                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: agrumbac <agrumbac@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/03/11 17:20:06 by agrumbac          #+#    #+#             */
/*   Updated: 2019/12/22 23:20:22 by anselme          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef COMPILER_UTILS_H
# define COMPILER_UTILS_H

# define __unused			__attribute__((unused))
# define __noreturn			__attribute__((noreturn))
# define __warn_unused_result		__attribute__((warn_unused_result))
# define __nonull			__attribute__((nonnull))

# define ARRAY_SIZE(x)			(sizeof(x) / sizeof(*x))

# define PAGE_ALIGNMENT			4096
# define ALIGN(x, n)			(((x) + (n)) & ~((n) - 1))


#endif
