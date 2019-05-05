# cobbled together really fast
CC = gcc

# Make an exe if on windows
ifeq ($(OS),Windows_NT)
	ampersand = &
	WIN_EXIT = $(ampersand) exit 
  DOTEXE=.exe
	RM = cmd //c del
endif

.PHONY: all clean

all: safe

safe:
	$(CC) -Wall asm6f.c -o asm6f

clean:
	$(RM) asm6f$(DOTEXE) $(WIN_EXIT)
