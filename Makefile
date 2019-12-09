# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jfortin <jfortin@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/04/10 17:19:11 by agrumbac          #+#    #+#              #
#    Updated: 2019/12/07 19:10:13 by nhaquet          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

############################## BIN #############################################

NAME = famine

SRC =	famine.s                      \
	utils.c                       \
	syscall.c                     \
	detect_spy.c                  \
	decrypt.s                     \
	infect/virus.c                \
	infect/accessors.c            \
	infect/adjust_references.c    \
	infect/copy_to_clone.c        \
	infect/encrypt.s              \
	infect/file_iterator.c        \
	infect/find_entry.c           \
	infect/can_infect.c           \
	infect/infect.c               \
	infect/iterators.c            \
	infect/packer.c               \
	infect/setup_payload.c        \
	infect/obfuscate.c            \
	main.c

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

${OBJDIR}/%.o: ${SRCDIR}/%.s
	@echo ${Y}Compiling [$@]...${X}
	@/bin/mkdir -p ${OBJDIR} ${OBJDIR}/infect
	${AS} ${ASFLAGS} -o $@ $<
	@printf ${UP}${CUT}

${OBJDIR}/%.o: ${SRCDIR}/%.c
	@echo ${Y}Compiling [$@]...${X}
	@/bin/mkdir -p ${OBJDIR} ${OBJDIR}/infect
	${CC} ${CFLAGS} ${LDFLAGS} -c -o $@ $<
	@printf ${UP}${CUT}

############################### DEBUG ##########################################

debug:
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
	@echo "       .-'\`\\-,/^\\ .-."
	@echo "      /    |  \\  ( "${WR}"oo"${X}${BB}"\\   __"
	@echo "     |     |  |__/,--.\`\"\`  \`,"
	@echo "     |    /   .__/    \`\"\"\"\",/"${BG}"__               _"${BB}
	@echo "     |   /    /  |       "${BG}"|  ___|_ _ _ __ ___ (_)_ __   ___ "${BB}
	@echo "    .'.-'    /__/        "${BG}"| |_ / _\` | '_ \` _ \\| | '_ \\ / _ \\ "${BB}
	@echo "   \`\"\`| |';-;_\`          "${BG}"|  _| (_| | | | | | | | | | |  __/"${BB}
	@echo "      |/ /-))))))        "${BG}"|_|  \\__,_|_| |_| |_|_|_| |_|\\___|"${BB}
	@echo ${X}

.PHONY: all clean fclean re art

-include ${DEP}
