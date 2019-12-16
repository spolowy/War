BITS 64

%define SYS_PTRACE		101
%define PTRACE_TRACEME	0
%define PID				0
%define ADDR			0
%define DATA			0

;	long	ptrace(enum __ptrace_request request, pid_t pid, void *addr, void *data)
;				   | 			%rdi 			|	%rsi   |	 %rdx  | 	%rcx   | 		%r8 and %r9
;	long	ptrace(|		PTRACE_TRACEME		|	  0	   | 	NULL   |	 0		);

;	bool	anti_debug(void)

section .text
	global anti_debug
	global anti_debug_end

anti_debug:
	; push	rbp
	; mov		rbp, rsp

	; mov rdi, PTRACE_TRACEME
	; mov rsi, PID
	; mov rdx, ADDR
	; mov rcx, DATA

	; mov r10, rcx
	; mov rax, SYS_PTRACE
	; syscall
	; test rax, rax
	; setnz al

	; leave
	; ret

	db "123456789012"
	db "123456789012"
	db "123456789012"
	db "123456789012"
anti_debug_end:
