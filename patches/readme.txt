This directory contains separate patches for each added feature in asm6f.

They should be patched to the source code of ASM6 v1.6 (the latest version
available of this writing), available at http://3dscapture.com/NES/

Patch Listing and Quick Explanation:

asm6-undoc.diff (freem)
  Adds support for some of the 6502 undocumented opcodes.
  - Names/information taken from http://www.oxyron.de/html/opcodes02.html
  - Unstable instructions (ahx, shy, shx, tas) are behind a compile-time flag (UNSTABLE_INSTR).
  - Highly unstable instructions (xaa) are behind another compile-time flag (HIGHLY_UNSTABLE_INSTR)
  - You can define both UNSTABLE_INSTR and HIGHLY_UNSTABLE_INSTR at the same time.

asm6-fceuxnl.diff (originally by sonder, with additions by freem) - NOT YET COMPLETE, SORRY!
  Outputs FCEUX-compatible *.nl symbol files.
  Originally by sonder for ASM6 v1.51.
  Source: http://forums.nesdev.com/viewtopic.php?f=2&t=9276&start=15#p117056
  Additions by freem include:
  - The -n command line flag, which will generate the *.nl files.
  - "ignorenl" and "endinl" directives, which denotes a section that should not
    appear in the *.nl files.
