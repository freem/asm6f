# cobbled together really fast
CC = gcc

# no matter how hard I try, I can't get make to accept that I'm on windows.
ifneq ($(shell echo),)
  DOTEXE=.exe
endif

.PHONY: all clean

all: safe

safe:
	$(CC) -Wall asm6f.c -o asm6f

# sorry to linux people for forcing .exe but I can't get this makefile to determine
# that I'm really on windows
clean:
	$(RM) asm6f$(DOTEXE) *.exe
