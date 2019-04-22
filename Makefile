# cobbled together really fast
CC = gcc

# Make an exe if on windows
ifeq ($(OS),Windows_NT)
	DOTEXE=.exe
	RM = del
endif

.PHONY: all clean

all: safe

safe:
	$(CC) -Wall asm6f.c -o asm6f

clean:
	$(RM) asm6f$(DOTEXE)
