# Detect Cygwin vs. native Windows, fall back to Linux
ifeq ($(OS),Windows_NT)
  ifeq ($(OSTYPE),cygwin)
    BINARY=asm6f
    RM=rm -f
  else
    BINARY=asm6f.exe
    RM=del /Q /F
  endif
else
  BINARY=asm6f
  RM=rm -f
endif

.PHONY: all safe clean

all: safe

safe:
	$(CC) -o $(BINARY) asm6f.c

clean:
	$(RM) $(BINARY)
