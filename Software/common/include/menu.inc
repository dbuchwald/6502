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

        .macro run_menu menu, prompt
        .if (.match (.left (1, {menu}), #))
            ; immediate mode
            lda #<(.right (.tcount ({menu})-1, {menu}))
            sta ptr1
            lda #>(.right (.tcount ({menu})-1, {menu}))
            sta ptr1+1
        .else
            ; assume absolute or zero page
            lda menu
            sta ptr1
            lda 1+(menu)
            sta menu+1
        .endif
        .if (.match (.left (1, {prompt}), #))
            ; immediate mode
            lda #<(.right (.tcount ({prompt})-1, {prompt}))
            sta ptr2
            lda #>(.right (.tcount ({prompt})-1, {prompt}))
            sta ptr2+1
        .else
            ; assume absolute or zero page
            lda prompt
            sta ptr2
            lda 1+(prompt)
            sta ptr2+1
        .endif
        jsr _run_menu
        .endmacro        


