        .import _system_init
        .import _interrupt_handler
        .import _register_system_break

        .macro register_system_break address
        .if (.match (.left (1, {address}), #))
            ; immediate mode
            lda #<(.right (.tcount ({address})-1, {address}))
            sta ptr1
            lda #>(.right (.tcount ({address})-1, {address}))
            sta ptr1+1
        .else
            ; assume absolute or zero page
            lda address
            sta ptr1
            lda 1+(address)
            sta ptr1+1
        .endif

        lda #<address
        ldx #>address
        jsr _register_system_break
        .endmacro
        