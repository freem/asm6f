--------------------------------------------------------------
ASM6f (v1.6)
A 6502 assembler by loopy (loopy at mm.st)
With modifications by freem
--------------------------------------------------------------

Yes, it's another fork of ASM6.

--------------------------------------------------------------
Features compared to stock ASM6
--------------------------------------------------------------
* Support for some illegal/undocumented opcodes.
  (Note: Support for unstable opcodes requires compile flags.)
* Code from sonder's fork of ASM6 to allow output of FCEUX-compatible .nl files.
* New directives "IGNORENL" and "ENDINL".
  These two are used for ignoring certain defines when using the -n option.

--------------------------------------------------------------
Command line
--------------------------------------------------------------

Usage:

		asm6f [-options] sourcefile [outputfile] [listfile]

Options:

		-?         Show some help
		-l         Create listing
		-L         Create verbose listing (expand REPT, MACRO)
		-d<name>:  Define a symbol and make it equal to 1
		-q         Quiet mode (suppress all output unless there's an error)
		-n         export FCEUX-compatible .nl files
		Default output is <sourcefile>.bin
		Default listing is <sourcefile>.lst

Right now, everything else is the same as the original ASM6, so check out
readme-original.txt for more information.

--------------------------------------------------------------
Additional assembler directives
--------------------------------------------------------------

IGNORENL/ENDINL

        Suppresses output of any labels when exporting FCEUX .nl files.
        Useful for defining labels that may conflict with zero page addresses.

                ; don't show these button masks in the .nl file
                IGNORENL
                PAD_A      = %10000000
                PAD_B      = %01000000
                PAD_SELECT = %00100000
                PAD_START  = %00010000
                PAD_UP     = %00001000
                PAD_DOWN   = %00000100
                PAD_LEFT   = %00000010
                PAD_RIGHT  = %00000001
                ENDINL

--------------------------------------------------------------
freem's To-Do List
--------------------------------------------------------------
* add .undef? (could react badly on other passes)
* Allow -d option to set the symbols to whatever value instead of 1
* add absolute addressing via "a:" (ca65 syntax), if loopy doesn't do it first
* add ca65 debug format for NintendulatorDX

--------------------------------------------------------------
<EOF>