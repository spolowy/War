/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   find_code_caves.c                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: agrumbac <agrumbac@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/06/04 04:47:10 by agrumbac          #+#    #+#             */
/*   Updated: 2019/06/07 04:46:42 by agrumbac         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

void	hexdump_text(const char *text, uint64_t offset, uint64_t size)
{
        uint64_t                        i;
        uint64_t                        j;

        printf("--------------------------------------\n");
        i = 0;
        while (i < size)
        {
                printf("%016llx\t", offset + i);
                j = 0;
                while (j < 0x10 && i + j < size)
                        printf("%02hhx ", text[i + j++]);
                printf("\n");
                i += 0x10;
        }
}
/*
GCC
3        0f 1f 00
4        0f 1f 40 00
5        0f 1f 44 00 00
6        66 0f 1f 44 00 00
7        0f 1f 80 00 00 00 00
8        0f 1f 84 00 00 00 00 00
9        66 0f 1f 84 00 00 00 00 00
10       66 2e 0f 1f 84 00 00 00 00 00
11
12
13
14       0f 1f 40 00 66 2e 0f 1f 84 00 00 00 00 00
15       0f 1f 80 00 00 00 00 f3 c3 66 0f 1f 44 00 00


*/
size_t	find_code_padding_fields(struct field *code_caves, size_t field_len)
{
	return 0;
}

size_t	find_section_padding_fields(struct field *code_caves, size_t field_len)
{
	return 0;
}

size_t	find_code_caves(struct field *code_caves, size_t field_len)
{
	size_t found_fields = 0;

	found_fields += find_section_padding_fields(code_caves, field_len);

	struct field *next_caves = code_caves + found_fields;
	size_t     remaining_len = field_len - found_fields;

	found_fields += find_code_padding_fields(next_caves, remaining_len);

	// tmp printf
	printf("Found %lu code caves\n", found_fields);

	return found_fields;
}
