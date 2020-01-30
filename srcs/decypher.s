; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    decypher.s                                         :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: agrumbac <agrumbac@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2019/02/14 15:50:09 by agrumbac          #+#    #+#              ;
;    Updated: 2020/01/04 19:33:46 by ichkamo          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

;void decypher(char *data, size_t size);

section .text
	global wrap_decypher
	global decypher
	global decypher_end

;stack calling convention wrapper
wrap_decypher:
	mov rsi, [rsp + 8]
	mov rdi, [rsp + 16]

decypher:
	db "               _   _               "
	db "            __/o'V'o\__            "
	db "         __/o \  :  / o\__         "
	db "        /o `.  \ : /  .' o\        "
	db "       _\    '. _Y_ .'    /_       "
	db "      /o `-._  '\v/'  _.-` o\      "
	db "      \_     `-./ \.-`     _/      "
	db "     /o ``---._/   \_.---'' o\     "
	db "     \_________\   /_________/     "
	db "               '\_/'               "
	db "               _|_|_               "
	db "          2AC9C3WAR558BEC          "
decypher_end:
