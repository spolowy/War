; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    detect_spy.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: anselme <anselme@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2019/12/20 02:12:19 by anselme           #+#    #+#              ;
;    Updated: 2019/12/26 21:54:14 by anselme          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

;bool detect_spy(void);

%define SYS_PTRACE		0x65

section .text
	global detect_spy
	global detect_spy_end

detect_spy:
	mov rax, 0x0 ; TODO
	ret
	mov rdi, 0x0
	mov rsi, 0x0
	mov rdx, 0x0
	mov r10, 0x0
	mov rax, SYS_PTRACE
	syscall
	test rax, rax
	setnz al
	ret
detect_spy_end:
