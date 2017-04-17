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
Supported Undocumented Opcodes
--------------------------------------------------------------
asm6f supports the use of a number of undocumented/"illegal" opcodes.
Unstable opcodes will require usage of the directives UNSTABLE and HUNSTABLE (see below).

Information about these opcodes was sourced from Graham's 6502 Opcode document:
http://www.oxyron.de/html/opcodes02.html

[Normal]
These opcodes appear to be "safe" to use.
The alternate $EB opcode for sbc #{immediate} is not supported.

slo (Shift Left, Or)

        slo {addrmode} = asl {addrmode} + ora {addrmode}
        Known as "aso" in other undocumented opcode sources.

rla (Rol Left, And)

        rla {addrmode} = rol {addrmode} + and {addrmode}

sre (Shift Right, Exclusive or)

        sre {addrmode} = lsr {addrmode} + eor {addrmode}
        Known as "lse" in other undocumented opcode sources.

rra (Ror Right, Add with carry)

        rra {addrmode} = ror {addrmode} + adc {addrmode}

sax (Store A&X)

        sax {addrmode} = store A&X into {addrmode}
        "The A&X operation is a result of A and X put onto the bus
        at the same time."

lax (Load A&X)

        lax {addrmode} = lda {addrmode} + ldx {addrmode}

dcp (Decrement, ComPare)

        dcp {addrmode} = dec {addrmode} + cmp {addrmode}

isc (Increment, Subtract with Carry)

        isc {addrmode} = inc {addrmode} + sbc {addrmode}
        Known as "isb" in other undocumented opcode sources.

anc

        anc #{immediate} = and #{immediate} + (asl)
        "this command performs an AND operation only, but bit 7 is put into
        the carry, as if the ASL/ROL would have been executed."


alr (And Left Rotate)

        alr #{immediate} = and #{immediate} + (rol)
        Known as "asr" in other undocumented opcode sources.

arr

        arr #{immediate} = and #{immediate} + lsr
        "Part of this command are some ADC mechanisms. Following effects appear
        after AND but before ROR: the V-Flag is set according to (A and #{imm})+#{imm},
        bit 0 does NOT go into carry, but bit 7 is exchanged with the carry."

axs (A&X, Subtract immediate)

        axs #{immediate} = A&X minus #{immediate} into X
        Known as "sbx" in other undocumented opcode sources. (Groepaz's doc)
        "Performs CMP and DEX at the same time, so that the MINUS sets the flag
        like CMP, not SBC."

las

        las {addrmode} = Stores {addrmode}&S into A,X,S.
        Known as "lar" in other undocumented opcode sources.
        One source (which?) calls las "probably unreliable".

[Unstable]
"unstable in certain matters"; requires UNSTABLE_INSTR flag at compile time.

ahx (A&H&X)

        ahx {addrmode} = stores A&X&H into {addrmode}
        "Sometimes the &H drops off. Page boundary crossing will not work as
        expected; the bank where the value is stored may not be equal to the
        value stored."

shy (Store H&Y)

        shy {addrmode} = stores Y&H into {addrmode}
        "Sometimes the &H drops off. Page boundary crossing will not work as
        expected; the bank where the value is stored may not be equal to the
        value stored."

shx (Store H&X)

        shx {addrmode} = stores X&H into {addrmode}
        "Sometimes the &H drops off. Page boundary crossing will not work as
        expected; the bank where the value is stored may not be equal to the
        value stored."

tas

        tas {addrmode} = Stores A&X into S, A&X&H into {addrmode}

[Highly Unstable]
"DO NOT USE!!!", "results are not predictable on some machines".
YOU HAVE BEEN WARNED.

requires HIGHLY_UNSTABLE_INSTR flag at compile time.

xaa (X And A) HIGHLY UNSTABLE!!!

        xaa #{immediate} = X&#{immediate}
        Known as "ane" in other undocumented opcode sources. (Groepaz's doc)

lax is currently not supported.

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

UNSTABLE
        Enables use of somewhat unstable 6502 opcodes.

HUNSTABLE
        Enables use of highly unstable 6502 opcodes.

--------------------------------------------------------------
loopy's original To-Do List
--------------------------------------------------------------
//todo - do NOT open source files in update mode, since we do not want to modify them in any way
//todo - don't open text files in binary mode
//todo - thoroughly verify operation on big-endian machine
//todo - avoid putting special values into pointers, like (char*)1
//todo - don't depend on platform supporting unaligned objects
//todo - make everything static
//todo - redundant parsing code is all over the place, try clean it up / consolidate

--------------------------------------------------------------
freem's To-Do List
--------------------------------------------------------------
* add .undef? (could react badly on other passes)
* Allow -d option to set the symbols to whatever value instead of 1?
* Ignore defines from command line when using -n
* add absolute addressing via "a:" (ca65 syntax), if loopy doesn't do it first
 * This could get awkward (e.g. if you have a short label named "a"), so possibly
 support a different syntax, despite incompatibility?
* add ca65 debug format for NintendulatorDX

--------------------------------------------------------------
<EOF>