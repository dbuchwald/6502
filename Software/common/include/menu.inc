        .import _run_menu

        .macro menuitem id, cmd, argc, desc, function
        .local start_item
        .local cmd_pos
        .local desc_pos
        .local function_pos
        .local next_item
start_item:
        .byte cmd_pos - start_item
        .byte argc
        .byte desc_pos - start_item
        .byte function_pos - start_item
        .byte next_item - start_item
cmd_pos:
        .asciiz cmd
desc_pos:
        .asciiz desc
function_pos:
        .word function
next_item:
        .endmacro

        .macro endmenu
        .byte $00, $ff
        .endmacro

        .macro run_menu menu_pointer, prompt_pointer
        pha
        lda ptr1
        pha
        lda ptr1+1
        pha
        lda ptr2
        pha
        lda ptr2+1
        pha
        lda #<menu_pointer
        sta ptr1
        lda #>menu_pointer
        sta ptr1+1
        lda #<prompt_pointer
        sta ptr2
        lda #>prompt_pointer
        sta ptr2+1
        jsr _run_menu
        pla
        sta ptr2+1
        pla
        sta ptr2
        pla
        sta ptr1+1
        pla
        sta ptr1
        pla
        .endmacro        


