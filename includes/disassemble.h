/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   disassemble.h                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: anselme <anselme@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/12/14 18:48:28 by anselme           #+#    #+#             */
/*   Updated: 2019/12/14 19:09:01 by anselme          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef DISASSEMBLE_H
# define DISASSEMBLE_H

/*
** Source and Dest
*/

# define		NONE      (0)
# define		RAX       (1 << 0)
# define		RBX       (1 << 1)
# define		RCX       (1 << 2)
# define		RDX       (1 << 3)
# define		RDI       (1 << 4)
# define		RSI       (1 << 5)
# define		R8        (1 << 6)
# define		R9        (1 << 7)
# define		R10       (1 << 8)
# define		R11       (1 << 9)
# define		R12       (1 << 10)
# define		R13       (1 << 11)
# define		R14       (1 << 12)
# define		R15       (1 << 13)
# define		RBP       (1 << 14)
# define		RSP       (1 << 15)

# define		MEMORY    (1 << 31)
# define		UNKNOWN   (~0)

struct	s_instruction
{
	void		*addr;
	size_t		length;
	uint32_t	src;
	uint32_t	dst;
};

//size_t	disasm_length(const void *code, size_t codelen);
//bool	disasm(const void *code, size_t codelen, struct s_instruction *buf, size_t buflen);

#endif
