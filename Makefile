##
## Makefile for  in /home/broggi_t/projet/MinilibC-asm
## 
## Made by broggi_t
## Login   <broggi_t@epitech.eu>
## 
## Started on  Sun Mar 22 01:31:16 2015 broggi_t
## Last update Sun Mar 22 01:31:16 2015 broggi_t
##

NAME		=	libasm.so

DIR		=	src

SRCS		=	$(DIR)/memset.S		\
			$(DIR)/strchr.S		\
			$(DIR)/strlen.S

ASMFLAGS	=	-f elf64

LDFLAGS		=	-shared

ASM		=	nasm

LD		=	gcc

RM		=	rm -f

OBJS		=	$(SRCS:.S=.o)

%.o: %.S
		@printf "[\033[0;32mcompiled\033[0m] % 29s\n" $< | tr ' ' '.'
		@$(ASM) -o $@ $< $(ASMFLAGS)

all:		$(NAME)

$(NAME):	$(OBJS)
		@$(LD) $(LDFLAGS) -o $(NAME) $(OBJS)
		@printf "[\033[0;36mbuilt\033[0m] % 32s\n" $(NAME) | tr ' ' '.'

clean:
		@$(RM) $(OBJS)
		@printf "[\033[0;31mdeleted\033[0m] % 30s\n" $(OBJS) | tr ' ' '.'

fclean:		clean
		@$(RM) $(NAME)
		@printf "[\033[0;31mdeleted\033[0m] % 30s\n" $(NAME) | tr ' ' '.'

re:		fclean all

.PHONY:		all clean fclean re
