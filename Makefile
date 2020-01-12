# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: agrumbac <agrumbac@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/04/10 17:19:11 by agrumbac          #+#    #+#              #
#    Updated: 2020/01/12 15:18:48 by ichkamo          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

############################## BIN #############################################

NAME = war

# SRC File order matters!
# [LOADER]    loader_entry -> virus
# [VIRUS]     virus        -> _start
# [LAUNCHER]  _start       -> EOF

SRC =	loader.s                       \
	decypher.s                     \
	detect_spy.s                   \
	mprotect.s                     \
	virus/virus.c                  \
	virus/accessors.c              \
	virus/adjust_references.c      \
	virus/copy_to_clone.c          \
	virus/cypher.s                 \
	virus/disasm_length.c          \
	virus/disasm.c                 \
	virus/elf64_iterators.c        \
	virus/file_iterator.c          \
	virus/find_entry.c             \
	virus/generate_cypher.c        \
	virus/infect.c                 \
	virus/infection_engine.c       \
	virus/log.c                    \
	virus/metamorph_self.c         \
	virus/permutate_instructions.c \
	virus/permutate_registers.c    \
	virus/polymorphic_seed.c       \
	virus/random.c                 \
	virus/setup_payload.c          \
	virus/syscall.c                \
	virus/utils.c                  \
	start.c

CC = clang

AS = nasm

SRCDIR = srcs

OBJDIR = objs

OBJC = $(addprefix ${OBJDIR}/, $(SRC:.c=.o))
OBJ = $(OBJC:.s=.o)

DEP = $(addprefix ${OBJDIR}/, $(SRC:.c=.d))

override CFLAGS += -Wall -Wextra -MMD\
	-fno-stack-protector \
	-nodefaultlibs \
	-fno-builtin -nostdlib -fpic
	# -fsanitize=address,undefined

override ASFLAGS += -f elf64

LDFLAGS = -Iincludes/ -nostdlib -fpic
	# -fsanitize=address,undefined

############################## COLORS ##########################################

BY = "\033[33;1m"
BR = "\033[31;1m"
BG = "\033[32;1m"
BB = "\033[34;1m"
BM = "\033[35;1m"
BC = "\033[36;1m"
BW = "\033[37;1m"
Y = "\033[33m"
R = "\033[31m"
G = "\033[32m"
B = "\033[34m"
M = "\033[35m"
C = "\033[36m"
W = "\033[0m""\033[32;1m"
WR = "\033[0m""\033[31;5m"
WY = "\033[0m""\033[33;5m"
X = "\033[0m"
UP = "\033[A"
CUT = "\033[K"

############################## RULES ###########################################

all: art ${NAME}

${NAME}: ${OBJ}
	@echo ${B}Compiling [${NAME}]...${X}
	@${CC} ${LDFLAGS} -o $@ ${OBJ}
	@echo ${G}Success"   "[${NAME}]${X}
	mkdir -p /tmp/test /tmp/test2
	cp /bin/ls /tmp/test/

${OBJDIR}/%.o: ${SRCDIR}/%.s
	@echo ${Y}Compiling [$@]...${X}
	@/bin/mkdir -p ${OBJDIR} ${OBJDIR}/virus
	@${AS} ${ASFLAGS} -o $@ $<
	@printf ${UP}${CUT}

${OBJDIR}/%.o: ${SRCDIR}/%.c
	@echo ${Y}Compiling [$@]...${X}
	@/bin/mkdir -p ${OBJDIR} ${OBJDIR}/virus
	@${CC} ${CFLAGS} ${LDFLAGS} -c -o $@ $<
	@printf ${UP}${CUT}

############################### DEBUG ##########################################

debug: fclean
	${MAKE} all CFLAGS:="-DDEBUG -g" ASFLAGS:="-dDEBUG -g"

############################## GENERAL #########################################

clean:
	@echo ${R}Cleaning"  "[objs]...${X}
	@/bin/rm -Rf ${OBJDIR}

fclean: clean
	@echo ${R}Cleaning"  "[${NAME}]...${X}
	@/bin/rm -f ${NAME}
	@/bin/rm -Rf ${NAME}.dSYM

re: fclean all

############################## DECORATION ######################################

art:
	@echo ${BB}
	@echo "                 _   _"
	@echo "              __/"${BM}"o"${BB}"'V'"${BG}"o"${BB}"\\__"
	@echo "           __/"${BC}"o"${BB}" \\  :  / "${BY}"o"${BB}"\\__"
	@echo "          /"${BM}"o"${BB}" \`.  \\ : /  .' "${BR}"o"${BB}"\\"
	@echo "         _\\    '. "${WR}"_"${X}${BB}"\""${WR}"_"${X}${BB}" .'    /_"
	@echo "        /"${BY}"o"${BB}" \`-._  '\\\v/'  _.-\` "${BC}"o"${BB}"\\"
	@echo "        \\_     \`-./ \\.-\`     _/"
	@echo "       /"${BR}"o"${BB}" \`\`---._/   \\_.---'' "${BG}"o"${BB}"\\"
	@echo "       \\_________\\   /_________/"
	@echo "                 '\\_/'"
	@echo "                 _|_|_"
	@echo "            2AC9C3"${BR}"WAR"${BB}"558BEC"
	@echo ${X}

.PHONY: all clean fclean re art

-include ${DEP}
