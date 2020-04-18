        .include "string.inc"
        .include "utils.inc"
        .include "zeropage.inc"
        .include "tty.inc"

        .segment "VECTORS"

        .word   $0000
        .word   init
        .word   $0000

        .macro hex_to_buffer
        jsr convert_to_hex
        txa
        ldx tmp1
        sta dump_line,x
        inx
        tya
        sta dump_line,x
        inx
        stx tmp1
        .endmacro

        .code
init:
        lda #$00
        sta ptr3

        lda #$10
        sta ptr3+1

@line_loop:
        lda #04
        sta tmp1
        lda ptr3+1
        hex_to_buffer
        lda ptr3
        hex_to_buffer
        inc tmp1
        inc tmp1
@byte_loop:
        lda (ptr3)
        hex_to_buffer
        inc tmp1
        inc ptr3
        bne @next_item
        inc ptr3+1
        lda ptr3+1
        cmp #$20
        beq @exit
@next_item:
        lda ptr3
        and #%00000111
        bne @byte_loop
        inc tmp1
        lda ptr3
        and #%00001111
        bne @byte_loop
        writeln_tty #dump_line
        bra @line_loop
@exit:
        rts

        .segment "RODATA"
dump_line:
        .byte "0000xxxx  xx xx xx xx xx xx xx xx  xx xx xx xx xx xx xx xx", $00