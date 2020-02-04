#include <stdbool.h>
# include <stddef.h>

#include "utils.h"
#include "generate_utils.h"
#include "loader.h"

bool		generate_detect_spy(void *buffer, uint64_t seed, size_t size)
{
	size_t	size_lab;
	void	*buffer_lab;
	size_t	offset;
	size_t	ret;

	if (size < (size_t)detect_spy_end - (size_t)detect_spy)
		return false;
	size_lab = (size_t)lab_ptrace_end - (size_t)lab_ptrace_begin;
	buffer_lab = buffer + (size_t)lab_ptrace_begin - (size_t)detect_spy;
	offset = 0;
	if (!(ret = generate_set_register(buffer_lab + offset, &seed, size_lab - offset, RDI, 0))   || !(offset += ret)
	||  !(ret = generate_set_register(buffer_lab + offset, &seed, size_lab - offset, RSI, 0))   || !(offset += ret)
	||  !(ret = generate_set_register(buffer_lab + offset, &seed, size_lab - offset, RDX, 0))   || !(offset += ret)
	||  !(ret = generate_set_register(buffer_lab + offset, &seed, size_lab - offset, R10, 0))   || !(offset += ret)
	||  !(ret = generate_set_register(buffer_lab + offset, &seed, size_lab - offset, RAX, 101)))
		return false;

	size_lab = (size_t)lab_proc_end - (size_t)lab_proc_begin;
	buffer_lab = buffer + (size_t)lab_proc_begin - (size_t)detect_spy;
	offset = 0;
	if (!(ret = generate_set_register(buffer_lab + offset, &seed, size_lab, R10, 0x00002f636f72702f)))
		return false;

	size_lab = (size_t)lab_open_dir_end - (size_t)lab_open_dir_begin;
	buffer_lab = buffer + (size_t)lab_open_dir_begin - (size_t)detect_spy;
	offset = 0;
	if (!(ret = generate_set_register(buffer_lab + offset, &seed, size_lab - offset, RSI, 0)) || !(offset += ret)
	||  !(ret = generate_set_register(buffer_lab + offset, &seed, size_lab - offset, RAX, 2)))
		return false;

	size_lab = (size_t)lab_getdent64_end - (size_t)lab_getdent64_begin;
	buffer_lab = buffer + (size_t)lab_getdent64_begin - (size_t)detect_spy;
	offset = 0;
	if (!(ret = generate_set_register(buffer_lab + offset, &seed, size_lab - offset, RDX, 1024)) || !(offset += ret)
	||  !(ret = generate_set_register(buffer_lab + offset, &seed, size_lab - offset, RAX, 217 )))
		return false;

	size_lab = (size_t)lab_open_stat_end - (size_t)lab_open_stat_begin;
	buffer_lab = buffer + (size_t)lab_open_stat_begin - (size_t)detect_spy;
	offset = 0;
	if (!(ret = generate_set_register(buffer_lab + offset, &seed, size_lab - offset, RSI, 0)) || !(offset += ret)
	||  !(ret = generate_set_register(buffer_lab + offset, &seed, size_lab - offset, RAX, 2 )))
		return false;

	size_lab = (size_t)lab_read_stat_end - (size_t)lab_read_stat_begin;
	buffer_lab = buffer + (size_t)lab_read_stat_begin - (size_t)detect_spy;
	offset = 0;
	if (!(ret = generate_set_register(buffer_lab + offset, &seed, size_lab - offset, RDX, 32)) || !(offset += ret)
	||  !(ret = generate_set_register(buffer_lab + offset, &seed, size_lab - offset, RAX, 0 )))
		return false;

	size_lab = (size_t)lab_strstr_end - (size_t)lab_strstr_begin;
	buffer_lab = buffer + (size_t)lab_strstr_begin - (size_t)detect_spy;
	offset = 0;
	if (!(ret = generate_set_register(buffer_lab + offset, &seed, size_lab - offset, RAX, 40)) || !(offset += ret)
	||  !(ret = generate_set_register(buffer_lab + offset, &seed, size_lab - offset, RCX, 32 )))
		return false;

	size_lab = (size_t)lab_close_stat_end - (size_t)lab_close_stat_begin;
	buffer_lab = buffer + (size_t)lab_close_stat_begin - (size_t)detect_spy;
	offset = 0;
	if (!(ret = generate_set_register(buffer_lab + offset, &seed, size_lab - offset, RAX, 3)))
		return false;

	size_lab = (size_t)lab_close_dir_end - (size_t)lab_close_dir_begin;
	buffer_lab = buffer + (size_t)lab_close_dir_begin - (size_t)detect_spy;
	offset = 0;
	if (!(ret = generate_set_register(buffer_lab + offset, &seed, size_lab - offset, RAX, 3)))
		return false;

	size_lab = (size_t)lab_close_stat_spy_detected_end - (size_t)lab_close_stat_spy_detected_begin;
	buffer_lab = buffer + (size_t)lab_close_stat_spy_detected_begin - (size_t)detect_spy;
	offset = 0;
	if (!(ret = generate_set_register(buffer_lab + offset, &seed, size_lab - offset, RAX, 3)))
		return false;

	size_lab = (size_t)lab_close_proc_spy_detected_end - (size_t)lab_close_proc_spy_detected_begin;
	buffer_lab = buffer + (size_t)lab_close_proc_spy_detected_begin - (size_t)detect_spy;
	offset = 0;
	if (!(ret = generate_set_register(buffer_lab + offset, &seed, size_lab - offset, RAX, 3)))
		return false;
	return true;
}