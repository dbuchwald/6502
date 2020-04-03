
        .import _menu_process_input

CMD_OFFSET  = $00
ARGC_OFFSET = $01
DESC_OFFSET = $02
NEXT_OFFSET = $03

        .macro menuitem id, cmd, argc, desc, function
        .local start_item
        .local cmd_pos
        .local desc_pos
        .local next_item
start_item:
        .byte cmd_pos - start_item
        .byte argc
        .byte desc_pos - start_item
        .byte next_item - start_item
cmd_pos:
        .asciiz cmd
desc_pos:
        .asciiz desc
next_item:
        .endmacro

        .macro endmenu
        .byte $00, $ff
        .endmacro

        .macro is_last_menu_item pointer
        .local not_last
        .local return
        pha
        phy
        lda ptr1
        pha
        lda ptr1+1
        pha
        lda pointer
        sta ptr1
        lda pointer+1
        sta ptr1+1
        ldy #$00
        lda (ptr1),y
        bne not_last
        sec
        bra return
not_last:
        clc
return:        
        pla
        sta ptr1+1
        pla
        sta ptr1
        ply
        pla
        .endmacro

        .macro get_next_menu_item pointer
        pha
        phy
        lda ptr1
        pha
        lda ptr1+1
        pha
        lda pointer
        sta ptr1
        lda pointer+1
        sta ptr1+1
        ldy #(NEXT_OFFSET)
        lda (ptr1),y
        clc
        adc ptr1
        sta pointer
        lda ptr1+1
        adc #$00
        sta pointer+1
        pla
        sta ptr1+1
        pla
        sta ptr1
        ply
        pla
        .endmacro

        .macro get_menu_item pointer, cmd_pointer, argc, desc_pointer
        pha
        phy
        lda ptr1
        pha
        lda ptr1+1
        pha
        lda pointer
        sta ptr1
        lda pointer+1
        sta ptr1+1
        ldy #(CMD_OFFSET)
        lda (ptr1),y
        clc
        adc ptr1
        sta cmd_pointer
        lda ptr1+1
        adc #$00
        sta cmd_pointer+1
        ldy #(ARGC_OFFSET)
        lda (ptr1),y
        sta argc
        ldy #(DESC_OFFSET)
        lda (ptr1),y
        clc
        adc ptr1
        sta desc_pointer
        lda ptr1+1
        adc #$00
        sta desc_pointer+1
        pla
        sta ptr1+1
        pla
        sta ptr1
        ply
        pla
        .endmacro
