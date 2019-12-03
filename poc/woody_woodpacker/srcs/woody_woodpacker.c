/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   woody_woodpacker.c                                 :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: agrumbac <agrumbac@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/11/04 18:04:47 by agrumbac          #+#    #+#             */
/*   Updated: 2019/12/03 16:40:17 by agrumbac         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "woody_woodpacker.h"
#include "elf64.h"             /* for [FMT_ELF64] entry */

static const struct format	implemented_formats[FMT_SIZE] =
{
	[FMT_ELF64] = {elf64_identifier, elf64_packer}
	// [FMT_ELF32] = {elf32_identifier, elf32_packer},
	// [FMT_MACHO64] = {macho64_identifier, macho64_packer},
	// [FMT_MACHO32] = {macho32_identifier, macho32_packer},
	// [FMT_PE64] = {pe64_identifier, pe64_packer},
	// [FMT_PE32] = {pe32_identifier, pe32_packer},
};

/*
**
*/

static size_t		detect_format(void)
{
	for (size_t i = 0; i < FMT_SIZE; i++)
	{
		if (implemented_formats[i].format_identifier())
			return (i);
	}
	return (FMT_SIZE);
}

int			main(int ac, char **av)
{
	int		ret = EXIT_SUCCESS;
	size_t		filesize;
	enum e_format	format;

	if (ac != 2)
	{
		errors(ERR_USAGE, "\nusage: %s <executable>\n", av[0]);
		goto exit_failure;
	}

	filesize = read_file(av[1]);
	if (filesize == 0)
		goto exit_failure;

	format = detect_format();
	if (format == FMT_SIZE)
	{
		errors(ERR_USAGE, "%s: %s is not a valid input file\n", \
			av[0], av[1]);
		goto exit_failure;
	}

	if (!alloc_clone(filesize))
		goto exit_failure;

	if (!implemented_formats[format].packer(filesize))
	{
		errors(ERR_CORRUPT, "%s: file corruption detected in %s, " \
			"aborting.\n", av[0], av[1]);
		goto exit_failure;
	}

exit:
	free_clone();
	free_file();
	return (ret);
exit_failure:
	ret = EXIT_FAILURE;
	goto exit;
}
