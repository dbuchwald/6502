        .include "tty.inc"

        .code

init:
        writeln_tty #message
        rts

        .segment "RODATA"

message: .asciiz "Hello World from 6502 (asm)!"
