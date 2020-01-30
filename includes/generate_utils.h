#ifndef GENERATE_UTILS_H
# define GENERATE_UTILS_H

# include <stdint.h>

enum	e_reg
{
	RAX,
	RCX,
	RDX,
	RBX,
	RSP,
	RBP,
	RSI,
	RDI,
	R8,
	R9,
	R10,
	R11,
	R12,
	R13,
	R14,
	R15,
	NB_REG
};

size_t	generate_set_register(char *buffer, uint64_t seed, size_t size, enum e_reg target, uint64_t value);

#endif
