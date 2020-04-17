        .import _run_menu
        .import run_menu
        .import _setup_menuitem

        .macro menuitem cmd, argc, desc, function
        .local start_item
        .local next_item
start_item:
        .word cmd
        .byte argc
        .word desc
        .word function
        .byte next_item - start_item
next_item:
        .endmacro

        .macro endmenu
        .byte $00, $00, $ff
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
        jsr run_menu
        .endmacro        
