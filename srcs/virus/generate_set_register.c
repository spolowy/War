#include <stdint.h>
#include <stddef.h>
#include "position_independent.h"
#include "utils.h"
#include "generate_utils.h"

enum	e_ins
{
	MOV_R64_IMM64,
	ADD_R64_IMM32,
	SUB_R64_IMM32,
	XOR_R64_IMM32,
	XOR_R64_R64,
	SUB_R64_R64,
	SHL_R64_IMM7,
	SHR_R64_IMM7,
	NOT_R64,
	NB_INS
};

struct	s_ins
{
	uint8_t		code[3];
	uint8_t		sizes;
}__attribute__((packed));


size_t	generate_instruction(char *buffer, enum e_ins instruction, enum e_reg target, uint64_t value)
{
	uint8_t		sizes;
	size_t		opcode_size;
	size_t		operand_size;

	PD_ARRAY(uint32_t, ins_arr,
	0x2800b848, 0x2800b948, 0x2800ba48, 0x2800bb48, 0x2800bc48, 0x2800bd48, 0x2800be48, 0x2800bf48, // MOV_R64_IMM64
	0x2800b849, 0x2800b949, 0x2800ba49, 0x2800bb49, 0x2800bc49, 0x2800bd49, 0x2800be49, 0x2800bf49,
	0x24000548, 0x34c18148, 0x34c28148, 0x34c38148, 0x34c48148, 0x34c58148, 0x34c68148, 0x34c78148, // ADD_R64_IMM32
	0x34c08149, 0x34c18149, 0x34c28149, 0x34c38149, 0x34c48149, 0x34c58149, 0x34c68149, 0x34c78149,
	0x24002d48, 0x34e98148, 0x34ea8148, 0x34eb8148, 0x34ec8148, 0x34ed8148, 0x34ee8148, 0x34ef8148, // SUB_R64_IMM32
	0x34e88149, 0x34e98149, 0x34ea8149, 0x34eb8149, 0x34ec8149, 0x34ed8149, 0x34ee8149, 0x34ef8149,
	0x24003548, 0x34f18148, 0x34f28148, 0x34f38148, 0x34f48148, 0x34f58148, 0x34f68148, 0x34f78148, // XOR_R64_IMM32
	0x24f08149, 0x24f18149, 0x24f28149, 0x24f38149, 0x24f48149, 0x24f58149, 0x24f68149, 0x24f78149,
	0x30c03148, 0x30c93148, 0x30d23148, 0x30db3148, 0x30e43148, 0x30ed3148, 0x30f63148, 0x30ff3148, // XOR_R64_R64
	0x30c0314d, 0x30c9314d, 0x30d2314d, 0x30db314d, 0x30e4314d, 0x30ed314d, 0x30f6314d, 0x30ff314d,
	0x30c02948, 0x30c92948, 0x30d22948, 0x30db2948, 0x30e42948, 0x30ed2948, 0x30f62948, 0x30ff2948, // SUB_R64_R64
	0x30c0294d, 0x30c9294d, 0x30d2294d, 0x30db294d, 0x30e4294d, 0x30ed294d, 0x30f6294d, 0x30ff294d,
	0x31e0c148, 0x31e1c148, 0x31e2c148, 0x31e3c148, 0x31e4c148, 0x31e5c148, 0x31e6c148, 0x31e7c148, // SHL_R64_IMM7
	0x31e0c149, 0x31e1c149, 0x31e2c149, 0x31e3c149, 0x31e4c149, 0x31e5c149, 0x31e6c149, 0x31e7c149,
	0x31e8c148, 0x31e9c148, 0x31eac148, 0x31ebc148, 0x31ecc148, 0x31edc148, 0x31eec148, 0x31efc148, // SHR_R64_IMM7
	0x31e8c149, 0x31e9c149, 0x31eac149, 0x31ebc149, 0x31ecc149, 0x31edc149, 0x31eec149, 0x31efc149,
	0x30d0f748, 0x30d1f748, 0x30d2f748, 0x30d3f748, 0x30d4f748, 0x30d5f748, 0x30d6f748, 0x30d7f748, // NOT_R64
	0x30d0f749, 0x30d1f749, 0x30d2f749, 0x30d3f749, 0x30d4f749, 0x30d5f749, 0x30d6f749, 0x30d7f749
	);
	struct s_ins	(*ins_arr_2d)[NB_REG][1];

	ins_arr_2d = (void *)ins_arr;
	sizes = (*ins_arr_2d[instruction][target]).sizes;
	operand_size = sizes & 0x0f;
	opcode_size  = sizes >> 4;
	memcpy(buffer, &(*ins_arr_2d[instruction][target]).code, opcode_size);
	revmemcpy(buffer + opcode_size, &value, operand_size);
	return opcode_size + operand_size;
}

size_t	generate_set_register(char *buffer, uint64_t seed, size_t size, enum e_reg target, uint64_t value)
{
	size_t		offset = 0;

	if (value == 0)
	{                                   //  0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20  21
		PD_ARRAY(uint8_t, size_ins_set, 0, 0, 0, 2, 4, 4, 4, 4, 6, 6, 7, 7, 7, 8, 8, 8, 8, 8, 8, 8, 8, 10);
		uint8_t	choice;

		if (size >= 3 && size <= 21)
			choice = random_inrange(&seed, 1, size_ins_set[size]);
		else
			choice = size > 21 ? 10 : 0;
		choice = 10;
		if (choice == 1)
		// xor target, target
			offset = generate_instruction(buffer, XOR_R64_R64, target, 0); // 3bytes
		else if (choice == 2)
		// sub target, target
			offset = generate_instruction(buffer, SUB_R64_R64, target, 0); // 3bytes
		else if (choice == 3)
		// shl target, 64
			offset = generate_instruction(buffer, SHL_R64_IMM7, target, 64); // 4bytes
		else if (choice == 4)
		// shr target, 64
			offset = generate_instruction(buffer, SHR_R64_IMM7, target, 64); // 4bytes
		else if (choice == 5)
		{
		// shl target, x
		// shl target, 64 - x
			uint8_t	rand = random_inrange(&seed, 0, 64);
			offset = generate_instruction(buffer, SHL_R64_IMM7, target, rand); // 8bytes
			offset += generate_instruction(buffer + offset, SHL_R64_IMM7, target, 64 - rand);
		}
		else if (choice == 6)
		{
		// shr target, x
		// shr target, 64 - x
			uint8_t	rand = random_inrange(&seed, 0, 64);
			offset = generate_instruction(buffer, SHR_R64_IMM7, target, rand); // 8bytes
			offset += generate_instruction(buffer + offset, SHR_R64_IMM7, target, 64 - rand);
		}
		else if (choice == 7)
		// mov target, 0
			offset = generate_instruction(buffer, MOV_R64_IMM64, target, 0); // 10bytes
		else if (choice == 8)
		{
		// mov target, 0xffffffffffffffff
		// not target
			offset = generate_instruction(buffer, MOV_R64_IMM64, target, 0xffffffffffffffff); // 13bytes
			offset += generate_instruction(buffer + offset, NOT_R64, target, 0);
		}
		else if (choice == 9)
		{
		// mov target, 0xffffffffffffffff
		// shl target, x
		// not target
		// shr target, 64 - x
			uint8_t	rand = random_inrange(&seed, 0, 64);
			offset = generate_instruction(buffer, MOV_R64_IMM64, target, 0xffffffffffffffff); // 21bytes
			offset += generate_instruction(buffer + offset, SHL_R64_IMM7, target, rand);
			offset += generate_instruction(buffer + offset, NOT_R64, target, 0);
			offset += generate_instruction(buffer + offset, SHR_R64_IMM7, target, 64 - rand);
		}
		else if (choice == 10)
		{
		// mov target, 0xffffffffffffffff
		// shr target, x
		// not target
		// shl target, 64 - x
			uint8_t	rand = random_inrange(&seed, 0, 64);
			offset = generate_instruction(buffer, MOV_R64_IMM64, target, 0xffffffffffffffff); // 21bytes
			offset += generate_instruction(buffer + offset, SHR_R64_IMM7, target, rand);
			offset += generate_instruction(buffer + offset, NOT_R64, target, 0);
			offset += generate_instruction(buffer + offset, SHL_R64_IMM7, target, 64 - rand);
		}
		else
			return 0;
	}
	else
	{                                   //  0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32
		PD_ARRAY(uint8_t, size_ins_set, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 5);
		uint8_t	choice;

		if (size >= 10 && size <= 32)
			choice = random_inrange(&seed, 1, size_ins_set[size]);
		else
			choice = size > 32 ? 5 : 0;
		if (choice == 1)
		// mov target, value
			offset = generate_instruction(buffer, MOV_R64_IMM64, target, value); // 10bytes
		else if (choice == 2)
		{
		// mov target, value & 0xffffffff00000000
		// add target, value & 0xffffffff
			offset = generate_instruction(buffer, MOV_R64_IMM64, target, value & 0xffffffff00000000); // 16 or 17bytes
			offset += generate_instruction(buffer + offset, ADD_R64_IMM32, target, value & 0xffffffff);
		}
		else if (choice == 3)
		{
		// set target 0 (see above)
		// xor target, value >> 32
		// shl target, 32
		// xor target, value & 0xffffffff
			offset = generate_set_register(buffer, seed, size, target, 0); // 21 to 39bytes
			offset += generate_instruction(buffer + offset, XOR_R64_IMM32, target, value >> 32);
			offset += generate_instruction(buffer + offset, SHL_R64_IMM7, target, 32);
			offset += generate_instruction(buffer + offset, XOR_R64_IMM32, target, value & 0xffffffff);
		}
		else if (choice == 4)
		{
		// mov target, rand >> 32
		// add target, (value >> 32) - (rand >> 32)
		// shl target, 32
		// add target, rand & 0xffffffff
		// add target, (value & 0xffffffff) - (rand & 0xffffffff)
			uint64_t	rand = random(&seed);
			offset = generate_instruction(buffer, MOV_R64_IMM64, target, rand >> 32); // 32bytes
			offset += generate_instruction(buffer + offset, ADD_R64_IMM32, target, (value >> 32) - (rand >> 32));
			offset += generate_instruction(buffer + offset, SHL_R64_IMM7, target, 32);
			offset += generate_instruction(buffer + offset, ADD_R64_IMM32, target, rand & 0xffffffff);
			offset += generate_instruction(buffer + offset, ADD_R64_IMM32, target, (value & 0xffffffff) - (rand & 0xffffffff));
		}
		else if (choice == 5)
		{
		// mov target, rand >> 32
		// subs target, (rand >> 32) - (value >> 32)
		// shl target, 32
		// add target, rand & 0xffffffff
		// add target, (rand & 0xffffffff) - (value & 0xffffffff)
			uint64_t	rand = random(&seed);
			offset = generate_instruction(buffer, MOV_R64_IMM64, target, rand >> 32); // 32bytes
			offset += generate_instruction(buffer + offset, SUB_R64_IMM32, target, (rand >> 32) - (value >> 32));
			offset += generate_instruction(buffer + offset, SHL_R64_IMM7, target, 32);
			offset += generate_instruction(buffer + offset, ADD_R64_IMM32, target, rand & 0xffffffff);
			offset += generate_instruction(buffer + offset, ADD_R64_IMM32, target, (rand & 0xffffffff) - (value & 0xffffffff));
		}
		else
			return 0;
	}
	memset(buffer + offset, 0x90, size - offset);
	return offset;
}
