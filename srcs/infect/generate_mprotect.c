
	/*mov r8, [rsp + 32]         ; get ptld addr*/
	/*mov r9, [rsp + 24]         ; get ptld len*/

	/*;mprotect(ptld_addr, ptld_size, PROT_READ | PROT_WRITE | PROT_EXEC);*/

	/*mov rdi, r8*/
	/*mov rsi, r9*/
	/*mov rdx, PROT_RWX*/
	/*mov rax, SYSCALL_MPROTECT*/
	/*syscall*/

  /*f0:	4c 8b 44 24 20       	mov    0x20(%rsp),%r8*/
  /*f5:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9*/
  /*fa:	4c 89 c7             	mov    %r8,%rdi*/
  /*fd:	4c 89 ce             	mov    %r9,%rsi*/
 /*100:	ba 07 00 00 00       	mov    $0x7,%edx*/
 /*105:	b8 0a 00 00 00       	mov    $0xa,%eax*/
 /*10a:	0f 05                	syscall */
#include "utils.h"
#include <stdbool.h>
#include <stdint.h>
#include <stddef.h>

bool	generate_mprotect(char *buffer, uint64_t seed, size_t size)
{
	uint8_t op [28];

	op[0]  = 0x4c; op[1]  = 0x8b; op[2]  = 0x44; op[3]  = 0x24; op[4]  = 0x20;
	op[5]  = 0x4c; op[6]  = 0x8b; op[7]  = 0x4c; op[8]  = 0x24; op[9]  = 0x18;
	op[10] = 0x4c; op[11] = 0x89; op[12] = 0xc7;
	op[13] = 0x4c; op[14] = 0x89; op[15] = 0xce;
	op[16] = 0xba; op[17] = 0x07; op[18] = 0x00; op[19] = 0x00; op[20] = 0x00;
	op[21] = 0xb8; op[22] = 0x0a; op[23] = 0x00; op[24] = 0x00; op[25] = 0x00;
	op[26] = 0x0f; op[27] = 0x05;
	ft_memcpy(buffer, op, sizeof(op));
	return true;
}
