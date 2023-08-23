# Assume Linux/UNIX by default, detect native Windows vs. Cygwin/MSYS2.
# For Clang: CC=clang make

BINARY=asm6f
RM=rm -f

ifeq ($(OS),Windows_NT)
  BINARY=asm6f.exe
  RM=del /Q /F
  ifeq ($(OSTYPE),cygwin)
    RM=rm -f
  else ifdef MSYSTEM
    RM=rm -f
  endif
endif

CFLAGS=-O2 -Wall -Werror -Wextra -Wformat=2 -Wno-unused-parameter -Wbad-function-cast -Wcast-align -Wdeclaration-after-statement -Wdisabled-optimization -Wfloat-equal -Winline -Wmissing-declarations -Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wpacked -Wpointer-arith -Wredundant-decls -Wstrict-prototypes -Wunreachable-code -Wwrite-strings

.PHONY: all safe clean

all: safe

safe: asm6f.c
	$(CC) $(CFLAGS) -o $(BINARY) $^

clean:
	$(RM) $(BINARY)
