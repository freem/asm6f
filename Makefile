# cobbled together really fast
CC = gcc

ifdef COMSPEC
DOTEXE=.exe
else
DOTEXE=
endif

all:
	$(CC) asm6f.c -o asm6f
