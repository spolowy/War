/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   disasm.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: anselme <anselme@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/12/14 18:48:28 by anselme           #+#    #+#             */
/*   Updated: 2019/12/26 21:17:21 by anselme          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef DISASM_H
# define DISASM_H

# include <sys/types.h>
# include <stdint.h>
# include <stdbool.h>

/*
** Maximum instruction length in byte x86 can interpret.
** Otherwise an invalid opcode exception is thrown.
*/
# define INSTRUCTION_MAXLEN	15

/*
** structure of a disassembled instruction
*/
struct		s_instruction
{
	void		*addr;		/* instruction address   */
	size_t		length;		/* instruction length    */
	uint32_t	src;		/* source operand        */
	uint32_t	dst;		/* destination operand   */
};

/*
** disassembly functions
*/
size_t		disasm_length(const void *code, size_t codelen);
size_t		disasm(const void *code, size_t codelen,
			struct s_instruction *buf, size_t buflen);

#endif
