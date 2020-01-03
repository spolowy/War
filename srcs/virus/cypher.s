; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    cypher.s                                           :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: agrumbac <agrumbac@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2019/02/14 15:50:09 by agrumbac          #+#    #+#              ;
;    Updated: 2019/12/11 20:57:35 by anselme          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

;void cypher(char *data, size_t size);

section .text
	global cypher
	global cypher_end

cypher:
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
cypher_end:
