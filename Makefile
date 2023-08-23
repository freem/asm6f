# Assume Linux/UNIX by default, detect native Windows vs. Cygwin/MSYS2.

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

CFLAGS=-Wall

.PHONY: all safe clean

all: safe

safe:
	$(CC) $(CFLAGS) -o $(BINARY) asm6f.c

clean:
	$(RM) $(BINARY)
