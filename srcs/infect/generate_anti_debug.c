#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
#include "utils.h"

bool	generate_anti_debug(char *buffer, uint64_t seed, size_t size)
{
	uint8_t	content[42];
	content[0] = 0x55;
	content[1] = 0x48;
	content[2] = 0x89;
	content[3] = 0xe5;
	content[4] = 0xbf;
	content[5] = 0x00;
	content[6] = 0x00;
	content[7] = 0x00;
	content[8] = 0x00;
	content[9] = 0xbe;
	content[10] = 0x00;
	content[11] = 0x00;
	content[12] = 0x00;
	content[13] = 0x00;
	content[14] = 0xba;
	content[15] = 0x00;
	
	content[16] = 0x00;
	content[17] = 0x00;
	content[18] = 0x00;
	content[19] = 0xb9;
	content[20] = 0x00;
	content[21] = 0x00;
	content[22] = 0x00;
	content[23] = 0x00;
	content[24] = 0x49;
	content[25] = 0x89;
	content[26] = 0xca;
	content[27] = 0xb8;
	content[28] = 0x65;
	content[29] = 0x00;
	content[30] = 0x00;
	content[31] = 0x00;

	content[32] = 0x0f;
	content[33] = 0x05;
	content[34] = 0x48;
	content[35] = 0x85;
	content[36] = 0xc0;
	content[37] = 0x0f;
	content[38] = 0x95;
	content[39] = 0xc0;
	content[40] = 0xc9;
	content[41] = 0xc3;
	ft_memcpy(buffer, content, sizeof(content));
	return true;
}