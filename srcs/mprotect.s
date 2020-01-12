; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    mprotect.s                                         :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ichkamo <ichkamo@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/01/04 18:51:34 by ichkamo           #+#    #+#              ;
;    Updated: 2020/01/05 15:45:15 by ichkamo          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

%define SYSCALL_MPROTECT	0x0a

;void wrap_mprotect(void *addr, size_t len, int prot);

section .text
	global wrap_mprotect
	global wrap_mprotect_end

;stack calling convention wrapper
wrap_mprotect:
	mov rdx, [rsp + 8]
	mov rsi, [rsp + 16]
	mov rdi, [rsp + 24]

	mov rax, SYSCALL_MPROTECT
	syscall
	ret
wrap_mprotect_end:
