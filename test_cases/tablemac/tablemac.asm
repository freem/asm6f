; code originally from http://pastebin.com/6WdqfxrD

; context (#nesdev on efnet):
; <drnick> I discovered some weird asm6 behaviour
; <drnick> http://pastebin.com/6WdqfxrD
; <drnick> the code above, if assembled, will produce a file containing the following bytes: "02 03 04 05 06 07 08 09"
; <drnick> rather than "00 01 02 03 04 05 06 07" as expected
; <drnick> furthermore, by changing the ORG to other values, it seems the first byte will always be equal to ORG+2
; <drnick> changing the REPT 8 to REPT 1 will produce similar results: the single byte of the file will be equal to the value ORG is set to
; <drnick> removing the REPT makes it work, so REPT inside a MACRO is the source of error

ORG 0
;i=0 ; [new, from freem] uncommenting this line fixes it, somehow.
MACRO makeTbl
    i=0
    REPT 8
        DB i
        i=i+1
    ENDR
ENDM
makeTbl

