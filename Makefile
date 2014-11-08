# cobbled together really fast
CC = gcc

# no matter how hard I try, I can't get make to accept that I'm on windows.
ifneq ($(shell echo),)
  DOTEXE=.exe
endif

UNSTABLE_INSTR=-DUNSTABLE_INSTR
HIGHLY_UNSTABLE_INSTR=-DHIGHLY_UNSTABLE_INSTR

.PHONY: all clean

all: safe unstable highlyunstable

safe:
	$(CC) asm6f.c -o asm6f

unstable:
	$(CC) asm6f.c $(UNSTABLE_INSTR) -o asm6f-unstable

highlyunstable:
	$(CC) asm6f.c $(UNSTABLE_INSTR) $(HIGHLY_UNSTABLE_INSTR) -o asm6f-hunstable

# sorry to linux people for forcing .exe but I can't get this makefile to determine
# that I'm really on windows
clean:
	rm -f asm6f$(DOTEXE) asm6f-unstable$(DOTEXE) asm6f-hunstable$(DOTEXE) *.exe
