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
* Code from sonder's fork of ASM6 to allow output of FCEUX-compatible .nl files.

--------------------------------------------------------------
Command line
--------------------------------------------------------------

Usage:

        asm6 [-options] sourcefile [outputfile] [listfile]

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
To-Do List
--------------------------------------------------------------
* add .undef?
* Find a way to allow disabling of certain defines when using -n
 * possibly via directives called "IGNORENL" and "ENDINL"
* Allow -d option to set the symbols to whatever value instead of 1
* add ca65 debug format for NintendulatorDX

--------------------------------------------------------------
<EOF>