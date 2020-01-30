
#include "disasm_utils.h"

/*
** Flags used to specify operand or status.
** Although GP registers can have a 8-bit, 16-bit or 32-bit size we consider
** for this disassembler that the whole 64-bit register is affected.
*/
# define NONE		(0)       /* nothing                            */
# define RAX		(1 << 0)  /* al   || ax   || eax  || rax        */
# define RCX		(1 << 1)  /* cl   || cx   || ecx  || rcx        */
# define RDX		(1 << 2)  /* dl   || dx   || edx  || rdx        */
# define RBX		(1 << 3)  /* bl   || bx   || ebx  || rbx        */
# define RSP		(1 << 4)  /* ah   || spl  || sp   || esp || rsp */
# define RBP		(1 << 5)  /* ch   || bpl  || bp   || ebp || rbp */
# define RSI		(1 << 6)  /* dh   || sil  || si   || esi || rsi */
# define RDI		(1 << 7)  /* bh   || dil  || di   || edi || rdi */
# define R8		(1 << 8)  /* r8l  || r8w  || r8d  || r8         */
# define R9		(1 << 9)  /* r9l  || r9w  || r9d  || r9         */
# define R10		(1 << 10) /* r10l || r10w || r10d || r10        */
# define R11		(1 << 11) /* r11l || r11w || r11d || r11        */
# define R12		(1 << 12) /* r12l || r12w || r12d || r12        */
# define R13		(1 << 13) /* r13l || r13w || r13d || r13        */
# define R14		(1 << 14) /* r14l || r14w || r14d || r14        */
# define R15		(1 << 15) /* r15l || r15w || r15d || r15        */

# define RIP		(1 << 16) /* eip  || rip                        */

# define FLAGS		(1 << 30) /* uses or modifies flags             */
# define MEMORY		(1 << 31) /* references a memory location       */
# define UNKNOWN	(~0)      /* unknown modification(s)            */

/*
** Flags used to specify how the intruction should be interpreted
*/
# define MODRM		(1 << 0) /* MODRM byte with register usage       */
# define EXT		(1 << 1) /* MODRM byte with opcode extension     */
# define KEEP_SRC	(1 << 2) /* source operand is also a destination */
# define KEEP_DST	(1 << 3) /* destination operand is also a source */
# define IMPLICIT_SRC	(1 << 4) /* source register is implicit          */
# define IMPLICIT_DST	(1 << 5) /* destination register is implicit     */
# define NO_SRC		(1 << 6) /* no source register                   */
# define NO_DST		(1 << 7) /* no destination register              */

static void	disasm_instruction(const void *code, size_t codelen,
			uint32_t *src, uint32_t *dst)
{
	uint8_t		*p     = (uint8_t*)code;
	uint8_t		prefix = 0;              /* opcode prefix */
	uint8_t		rex    = 0;              /* REX byte value */
	uint8_t		opcode;

	*src = UNKNOWN;
	*dst = UNKNOWN;

	/* set <codelen> to INSTRUCTION_MAXLEN if it exceeds it */
	if (codelen > INSTRUCTION_MAXLEN) codelen = INSTRUCTION_MAXLEN;

	/* prefix loop */
	next_opcode:
	if (!codelen--) return ; /* error if instruction is too long */
	opcode = *p++;

	/* unused legacy / REX prefixes for register disassembler */
	if (opcode == 0x26 || opcode == 0x2e
	||  opcode == 0x36 || opcode == 0x3e
	||  opcode == 0x64 || opcode == 0x65 || opcode == 0x66 || opcode == 0x67
	||  opcode == 0xf0) {goto next_opcode;}
	/* mandatory prefix(es) */
	else if (opcode == 0x0f) {prefix |= OP_PREFIX_0F; goto next_opcode;}
	else if (opcode == 0xf2) {prefix |= OP_PREFIX_F2; goto next_opcode;}
	else if (opcode == 0xf3) {prefix |= OP_PREFIX_F3; goto next_opcode;}
	else if (opcode == 0x9b) {prefix |= OP_PREFIX_9B; goto next_opcode;}
	/* REX prefix(es) */
	else if (opcode >= 0x40 && opcode <= 0x4f) {rex = opcode; goto next_opcode;}

	if (prefix) {return ;} /* dirty fix for non supported mappings */

	/* table of supported instructions */
	uint32_t	table_supported_opcode[TABLESIZE];
					   /* 0 1 2 3 4 5 6 7  8 9 a b c d e f */
	table_supported_opcode[0] = BITMASK32(1,1,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,  /* 0 */
					      0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0); /* 1 */
	table_supported_opcode[1] = BITMASK32(0,0,0,0,0,0,0,0, 0,1,0,0,0,0,0,0,  /* 2 */
					      0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0); /* 3 */
	table_supported_opcode[2] = BITMASK32(0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,  /* 4 */
					      1,1,1,1,1,1,1,1, 1,1,1,1,1,1,1,1); /* 5 */
	table_supported_opcode[3] = BITMASK32(0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,  /* 6 */
					      0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0); /* 7 */
	table_supported_opcode[4] = BITMASK32(0,1,0,1,0,1,0,1, 0,1,0,1,0,0,0,0,  /* 8 */
					      0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0); /* 9 */
	table_supported_opcode[5] = BITMASK32(0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,  /* a */
					      0,0,0,0,0,0,0,0, 1,1,1,1,1,1,1,1); /* b */
	table_supported_opcode[6] = BITMASK32(0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,  /* c */
					      0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0); /* d */
	table_supported_opcode[7] = BITMASK32(0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,  /* e */
					      0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0); /* f */

	if (!CHECK_TABLE(table_supported_opcode, opcode)) return ;

	/*
	** Pack the register value to the following format:
	** - reg: register number
	** - xreg: register extension; promote to extended registers (r8-r15)
	*/
	# define REG_PACK(reg, xreg)	(((xreg << 3) | (reg)) & 0b1111)
	/* GP registers.
	** The 3 lower bytes stands for the register number.
	** The higher byte stands for the extended version of the register.
	*/
	uint32_t	gp_registers[16];
	gp_registers[0b0000] = RAX;
	gp_registers[0b0001] = RCX;
	gp_registers[0b0010] = RDX;
	gp_registers[0b0011] = RBX;
	gp_registers[0b0100] = RSP;
	gp_registers[0b0101] = RBP;
	gp_registers[0b0110] = RSI;
	gp_registers[0b0111] = RDI;
	gp_registers[0b1000] = R8;
	gp_registers[0b1001] = R9;
	gp_registers[0b1010] = R10;
	gp_registers[0b1011] = R11;
	gp_registers[0b1100] = R12;
	gp_registers[0b1101] = R13;
	gp_registers[0b1110] = R14;
	gp_registers[0b1111] = R15;

	struct op_pack
	{
		uint32_t	flags; /* additionnal flags to add to result                  */
		uint8_t		reg;   /* register affected; used for implicits modifications */
		uint8_t		ext;   /* opcode extension                                    */
	};
	/* structure describing how the instruction should be disassembled */
	struct x86_set
	{
		uint32_t	status; /* flags about instruction behaviour */
		struct op_pack	src;    /* source operand                    */
		struct op_pack	dst;    /* destination operand               */
	} instructions[255];

	instructions[0x00] = (struct x86_set){MODRM|KEEP_DST                    , {     0,    0,    0}, { FLAGS,    0,    0}}; /* add rm8 reg8                 */
	instructions[0x01] = (struct x86_set){MODRM|KEEP_DST                    , {     0,    0,    0}, { FLAGS,    0,    0}}; /* add rm16/32/64 reg16/32/64   */
	instructions[0x29] = (struct x86_set){MODRM|KEEP_DST                    , {     0,    0,    0}, { FLAGS,    0,    0}}; /* sub rm16/32/64 reg16/32/64   */
	instructions[0x50] = (struct x86_set){IMPLICIT_SRC|IMPLICIT_DST|KEEP_DST, {     0,0b000,    0}, {MEMORY,0b100,    0}}; /* push rAX/r8                  */
	instructions[0x51] = (struct x86_set){IMPLICIT_SRC|IMPLICIT_DST|KEEP_DST, {     0,0b001,    0}, {MEMORY,0b100,    0}}; /* push rCX/r9                  */
	instructions[0x52] = (struct x86_set){IMPLICIT_SRC|IMPLICIT_DST|KEEP_DST, {     0,0b010,    0}, {MEMORY,0b100,    0}}; /* push rDX/r10                 */
	instructions[0x53] = (struct x86_set){IMPLICIT_SRC|IMPLICIT_DST|KEEP_DST, {     0,0b011,    0}, {MEMORY,0b100,    0}}; /* push rBX/r11                 */
	instructions[0x54] = (struct x86_set){IMPLICIT_SRC|IMPLICIT_DST|KEEP_DST, {     0,0b100,    0}, {MEMORY,0b100,    0}}; /* push rSP/r12                 */
	instructions[0x55] = (struct x86_set){IMPLICIT_SRC|IMPLICIT_DST|KEEP_DST, {     0,0b101,    0}, {MEMORY,0b100,    0}}; /* push rBP/r13                 */
	instructions[0x56] = (struct x86_set){IMPLICIT_SRC|IMPLICIT_DST|KEEP_DST, {     0,0b110,    0}, {MEMORY,0b100,    0}}; /* push rSI/r14                 */
	instructions[0x57] = (struct x86_set){IMPLICIT_SRC|IMPLICIT_DST|KEEP_DST, {     0,0b111,    0}, {MEMORY,0b100,    0}}; /* push rDI/r15                 */
	instructions[0x58] = (struct x86_set){IMPLICIT_SRC|IMPLICIT_DST|KEEP_SRC, {MEMORY,0b100,    0}, {     0,0b000,    0}}; /* pop rAX/r8                   */
	instructions[0x59] = (struct x86_set){IMPLICIT_SRC|IMPLICIT_DST|KEEP_SRC, {MEMORY,0b100,    0}, {     0,0b001,    0}}; /* pop rCX/r9                   */
	instructions[0x5a] = (struct x86_set){IMPLICIT_SRC|IMPLICIT_DST|KEEP_SRC, {MEMORY,0b100,    0}, {     0,0b010,    0}}; /* pop rDX/r10                  */
	instructions[0x5b] = (struct x86_set){IMPLICIT_SRC|IMPLICIT_DST|KEEP_SRC, {MEMORY,0b100,    0}, {     0,0b011,    0}}; /* pop rBX/r11                  */
	instructions[0x5c] = (struct x86_set){IMPLICIT_SRC|IMPLICIT_DST|KEEP_SRC, {MEMORY,0b100,    0}, {     0,0b100,    0}}; /* pop rSP/r12                  */
	instructions[0x5d] = (struct x86_set){IMPLICIT_SRC|IMPLICIT_DST|KEEP_SRC, {MEMORY,0b100,    0}, {     0,0b101,    0}}; /* pop rBP/r13                  */
	instructions[0x5e] = (struct x86_set){IMPLICIT_SRC|IMPLICIT_DST|KEEP_SRC, {MEMORY,0b100,    0}, {     0,0b110,    0}}; /* pop rSI/r14                  */
	instructions[0x5f] = (struct x86_set){IMPLICIT_SRC|IMPLICIT_DST|KEEP_SRC, {MEMORY,0b100,    0}, {     0,0b111,    0}}; /* pop rDI/r15                  */
	instructions[0x81] = (struct x86_set){EXT|NO_SRC|KEEP_DST               , {     0,    0,0b101}, { FLAGS,    0,0b101}}; /* add(0b000) && sub(0b101)     */
	instructions[0x83] = (struct x86_set){EXT|NO_SRC|KEEP_DST               , {     0,    0,0b000}, { FLAGS,    0,0b000}}; /* add(0b000)                   */
	instructions[0x85] = (struct x86_set){MODRM|KEEP_SRC                    , {     0,    0,    0}, { FLAGS,    0,    0}}; /* test r/m16/32/64 reg16/32/64 */
	instructions[0x87] = (struct x86_set){MODRM|KEEP_SRC|KEEP_DST           , {     0,    0,    0}, {     0,    0,    0}}; /* xchg reg16/32/64 r/m16/32/64 */
	instructions[0x89] = (struct x86_set){MODRM                             , {     0,    0,    0}, {     0,    0,    0}}; /* mov r/m16/32/64 reg16/32/64  */
	instructions[0x8b] = (struct x86_set){MODRM|KEEP_SRC                    , {     0,    0,    0}, {     0,    0,    0}}; /* mov reg16/32/64 r/m16/32/64  */
	instructions[0xb8] = (struct x86_set){NO_SRC|IMPLICIT_DST               , {     0,    0,    0}, {     0,0b000,    0}}; /* mov reAX imm16/32/64         */
	instructions[0xb9] = (struct x86_set){NO_SRC|IMPLICIT_DST               , {     0,    0,    0}, {     0,0b001,    0}}; /* mov reCX imm16/32/64         */
	instructions[0xba] = (struct x86_set){NO_SRC|IMPLICIT_DST               , {     0,    0,    0}, {     0,0b010,    0}}; /* mov reDX imm16/32/64         */
	instructions[0xbb] = (struct x86_set){NO_SRC|IMPLICIT_DST               , {     0,    0,    0}, {     0,0b011,    0}}; /* mov reBX imm16/32/64         */
	instructions[0xbc] = (struct x86_set){NO_SRC|IMPLICIT_DST               , {     0,    0,    0}, {     0,0b100,    0}}; /* mov reSP imm16/32/64         */
	instructions[0xbd] = (struct x86_set){NO_SRC|IMPLICIT_DST               , {     0,    0,    0}, {     0,0b101,    0}}; /* mov reBP imm16/32/64         */
	instructions[0xbe] = (struct x86_set){NO_SRC|IMPLICIT_DST               , {     0,    0,    0}, {     0,0b110,    0}}; /* mov reSI imm16/32/64         */
	instructions[0xbf] = (struct x86_set){NO_SRC|IMPLICIT_DST               , {     0,    0,    0}, {     0,0b111,    0}}; /* mov reDI imm16/32/64         */

	struct x86_set		i = instructions[opcode];       /* get instruction         */
	uint8_t			rex_rxb  = rex & 0b00000111;    /* retrieve rex modes      */
	uint8_t			reg_mode = !!(rex_rxb & 0b100); /* get reg extension field */
	uint8_t			rm_mode  = !!(rex_rxb & 0b001); /* get r/m extension field */

	*src = 0;
	*dst = 0;

	/* dirty hack to not mix extended registers with not extended one for 1 byte opcode-based instructions */
	if (i.status & IMPLICIT_SRC) {if (i.src.flags & MEMORY) {*src |= gp_registers[REG_PACK(i.src.reg & 0b111, reg_mode)];}
				      else 			{*src |= gp_registers[REG_PACK(i.src.reg & 0b111, rm_mode)];}}
	if (i.status & IMPLICIT_DST) {if (i.dst.flags & MEMORY) {*dst |= gp_registers[REG_PACK(i.dst.reg & 0b111, reg_mode)];}
				      else 			{*dst |= gp_registers[REG_PACK(i.dst.reg & 0b111, rm_mode)];}}
	if (i.status & EXT)
	{
		if (!codelen--) return ; /* error if instruction is too long */
		uint8_t		modrm = *p++;
		uint8_t		rm    =  modrm & 0b00000111;

		*dst |= gp_registers[REG_PACK(rm, rm_mode)];
	}
	/* MODRM byte management */
	if (i.status & MODRM)
	{
		if (!codelen--) return ; /* error if instruction is too long */
		uint8_t		modrm = *p++; /* get MODRM byte                                                         */
		uint8_t		mod   = (modrm & 0b11000000) >> 6;
		uint8_t		reg   = (modrm & 0b00111000) >> 3;
		uint8_t		rm    =  modrm & 0b00000111;

		uint8_t		direction = opcode & 0b10; /* d=1 memory to register (reg dest), d=0 register to memory (reg source) */

		if (mod == 0b11) /* direct register addressing */
		{
			*src |= direction ? gp_registers[REG_PACK(rm, rm_mode)] : gp_registers[REG_PACK(reg, reg_mode)];
			*dst |= direction ? gp_registers[REG_PACK(reg, reg_mode)] : gp_registers[REG_PACK(rm, rm_mode)];
		}
		else if (mod == 0b00) /* indirect register addressing */
		{
			if (rm == 0b100) /* SIB */
			{
				if (!codelen--) return ; /* error if instruction is too long */
				uint8_t		sib   = *p++;
				uint8_t		index = (sib & 0b00111000) >> 3;
				uint8_t		base  =  sib & 0b00000111;
				/* reg is the destination */
				*src |= gp_registers[REG_PACK(index, rm_mode)];
				*src |= gp_registers[REG_PACK(base, rm_mode)];
				*dst |= gp_registers[REG_PACK(reg, reg_mode)];
			}
			else if (rm == 0b101) /* displacement only addressing [rip + disp] */
			{
				/* reg is the destination */
				*src |= RIP;
				*dst |= gp_registers[REG_PACK(reg, reg_mode)];
			}
			else /* indirect register addressing */
			{
				/* r/m is dereferenced */
				*src |= direction ? gp_registers[REG_PACK(rm, rm_mode)] : gp_registers[REG_PACK(reg, reg_mode)];
				*dst |= direction ? gp_registers[REG_PACK(reg, reg_mode)] : gp_registers[REG_PACK(rm, rm_mode)];
			}
			*src |= direction ? MEMORY : 0;
			*dst |= direction ? 0 : MEMORY;
		}
		else if (mod == 0b01 || mod == 0b10) /* indirect register addressing with 1 or 4 byte signed displacement */
		{
			if (rm == 0b100) /* SIB with displacement */
			{
				if (!codelen--) return ; /* error if instruction is too long */
				uint8_t		sib   = *p++;
				uint8_t		index = (sib & 0b00111000) >> 3;
				uint8_t		base  =  sib & 0b00000111;
				/* reg is the destination */
				*src |= gp_registers[REG_PACK(index, rm_mode)];
				*src |= gp_registers[REG_PACK(base, rm_mode)];
				*dst |= gp_registers[REG_PACK(reg, reg_mode)];
			}
			else /* indirect register with displacement */
			{
				/* r/m is dereferenced */
				*src |= direction ? gp_registers[REG_PACK(rm, rm_mode)] : gp_registers[REG_PACK(reg, reg_mode)];
				*dst |= direction ? gp_registers[REG_PACK(reg, reg_mode)] : gp_registers[REG_PACK(rm, rm_mode)];
			}
			*src |= direction ? MEMORY : 0;
			*dst |= direction ? 0 : MEMORY;
		}
	}
	if (i.status & KEEP_DST) {*src |= *dst & 0xffff;} /* get register(s) from dst if have to add to permutation check */
	if (i.status & KEEP_SRC) {*dst |= *src & 0xffff;} /* get register(s) from src if have to add to permutation check */
	*src |= i.src.flags; /* get remaining flags */
	*dst |= i.dst.flags; /* get remaining flags */
}

size_t		disasm(const void *code, size_t codelen,
			struct s_instruction *buf, size_t buflen)
{
	void			*p_code = (void*)code;
	struct s_instruction	*p_buf  = buf;
	size_t			instruction_length = 0;

	while (codelen && buflen)
	{
		instruction_length = disasm_length(p_code, codelen);
		if (instruction_length == 0) break ;

		disasm_instruction(p_code, codelen, &p_buf->src, &p_buf->dst);
		p_buf->addr   = p_code;
		p_buf->length = instruction_length;

		p_code  += instruction_length;
		codelen -= instruction_length;
		p_buf   += 1;
		buflen  -= 1;
	}
	return p_buf - buf; /* number of instructions successfully disassembled */
}
