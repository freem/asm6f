; General INCBIN/BIN string parser test
; Author: Jeremy Chadwick <jdc@koitsu.org>

; Quoted filename

incbin "filename.bin"             ; entire file (512)     size: 512
incbin "filename.bin",$100        ; bytes 256-512 (256)   size: 768
incbin "filename.bin",$100,16     ; bytes 256-272 (16)    size: 784
incbin "filename.bin",$100, 16    ; bytes 256-272 (16)    size: 800
incbin "filename.bin", $100       ; bytes 256-512 (256)   size: 1056
incbin "filename.bin", $100,16    ; bytes 256-272 (16)    size: 1072
incbin "filename.bin", $100, 16   ; bytes 256-272 (16)    size: 1088

; Unquoted filename

incbin filename.bin               ; entire file (512)     size: 1600
incbin filename.bin,$100          ; bytes 256-512 (256)   size: 1856
incbin filename.bin,$100,16       ; bytes 256-272 (16)    size: 1872
incbin filename.bin,$100, 16      ; bytes 256-272 (16)    size: 1888
incbin filename.bin, $100         ; bytes 256-512 (256)   size: 2144
incbin filename.bin, $100,16      ; bytes 256-272 (16)    size: 2160
incbin filename.bin, $100, 16     ; bytes 256-272 (16)    size: 2176

; Equates and math expressions used as params or args

DATAFILE EQU "filename.bin"
FOO = (256+184+40)-4+4/2*2        ; FOO = 480
incbin DATAFILE, FOO              ; bytes 480-512 (32)    size: 2208
incbin filename.bin, FOO+1, $10   ; bytes 481-497 (16)    size: 2224

; Filenames with spaces (must be quoted)

incbin "filename with spaces.bin"           ; entire file (512)     size: 2736
incbin "filename with spaces.bin",$100,16   ; bytes 256-272 (16)    size: 2752
incbin "filename with spaces.bin", $100, 16 ; bytes 256-272 (16)    size: 2768

; Resulting file MD5: 47ecec73da1168b0c0f243d0773b1c76
