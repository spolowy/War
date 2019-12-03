/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   elf64_viewer.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: agrumbac <agrumbac@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/05/10 22:36:00 by agrumbac          #+#    #+#             */
/*   Updated: 2019/06/03 21:37:31 by agrumbac         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "elf64_private.h"

static bool	print_ehdr(f_safe_accessor safe)
{
	Elf64_Ehdr *ehdr = safe(0, sizeof(*ehdr));

	if (ehdr == NULL) return errors(ERR_CORRUPT, "bad ehdr");

	printf("----------- Elf64 HEADER -----------\n"
	"unsigned char  e_ident[16]     = \"%.16s\"\n"
	"Elf64_Half     e_type          = %#.04hx\n"
	"Elf64_Half     e_machine       = %#.04hx\n"
	"Elf64_Word     e_version       = %#.08x\n"
	"Elf64_Addr     e_entry         = %#.016lx\n"
	"Elf64_Off      e_phoff         = %lu\n"
	"Elf64_Off      e_shoff         = %lu\n"
	"Elf64_Word     e_flags         = %#.08x\n"
	"Elf64_Half     e_ehsize        = %#.04hx\n"
	"Elf64_Half     e_phentsize     = %#.04hx\n"
	"Elf64_Half     e_phnum         = %hu\n"
	"Elf64_Half     e_shentsize     = %hu\n"
	"Elf64_Half     e_shnum         = %hu\n"
	"Elf64_Half     e_shstrndx      = %hu\n",
	ehdr->e_ident,
	endian_2(ehdr->e_type),
	endian_2(ehdr->e_machine),
	endian_4(ehdr->e_version),
	endian_8(ehdr->e_entry),
	endian_8(ehdr->e_phoff),
	endian_8(ehdr->e_shoff),
	endian_4(ehdr->e_flags),
	endian_2(ehdr->e_ehsize),
	endian_2(ehdr->e_phentsize),
	endian_2(ehdr->e_phnum),
	endian_2(ehdr->e_shentsize),
	endian_2(ehdr->e_shnum),
	endian_2(ehdr->e_shstrndx));
	return true;
}

static bool	print_phdr(f_safe_accessor safe, size_t offset)
{
	Elf64_Phdr *phdr = safe(offset, sizeof(*phdr));

	if (phdr == NULL) return errors(ERR_CORRUPT, "bad phdr");

	printf("----------- program HEADER -----------\n"
	"Elf64_Word     p_type         = %#.08x\n"
	"Elf64_Word     p_flags        = %#.08x\n"
	"Elf64_Off      p_offset       = %lu\n"
	"Elf64_Addr     p_vaddr        = %#.016lx\n"
	"Elf64_Addr     p_paddr        = %#.016lx\n"
	"Elf64_Xword    p_filesz       = %lu\n"
	"Elf64_Xword    p_memsz        = %lu\n"
	"Elf64_Xword    p_align        = %lu\n",
	endian_4(phdr->p_type),
	endian_4(phdr->p_flags),
	endian_8(phdr->p_offset),
	endian_8(phdr->p_vaddr),
	endian_8(phdr->p_paddr),
	endian_8(phdr->p_filesz),
	endian_8(phdr->p_memsz),
	endian_8(phdr->p_align));

	return true;
}

static bool	print_shdr(f_safe_accessor safe, size_t offset)
{
	Elf64_Shdr *shdr = safe(offset, sizeof(*shdr));

	if (shdr == NULL) return errors(ERR_CORRUPT, "bad shdr");

	printf("----------- section HEADER -----------\n"
	"Elf64_Word     sh_name        = %#.08x\n"
	"Elf64_Word     sh_type        = %#.08x\n"
	"Elf64_Xword    sh_flags       = %lu\n"
	"Elf64_Addr     sh_addr        = %#.016lx\n"
	"Elf64_Off      sh_offset      = %lu\n"
	"Elf64_Xword    sh_size        = %lu\n"
	"Elf64_Word     sh_link        = %#.08x\n"
	"Elf64_Word     sh_info        = %#.08x\n"
	"Elf64_Xword    sh_addralign   = %lu\n"
	"Elf64_Xword    sh_entsize     = %lu\n",
	endian_4(shdr->sh_name),
	endian_4(shdr->sh_type),
	endian_8(shdr->sh_flags),
	endian_8(shdr->sh_addr),
	endian_8(shdr->sh_offset),
	endian_8(shdr->sh_size),
	endian_4(shdr->sh_link),
	endian_4(shdr->sh_info),
	endian_8(shdr->sh_addralign),
	endian_8(shdr->sh_entsize));

	return true;
}

bool		elf64_viewer(f_safe_accessor safe)
{
	if (!print_ehdr(safe)
	|| !foreach_phdr(safe, print_phdr)
	|| !foreach_shdr(safe, print_shdr))
		return (errors(ERR_THROW, "elf64_viewer"));
	return true;
}
