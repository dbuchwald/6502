        .import _system_init
        .import _interrupt_handler
        .import _register_system_break

        .macro register_system_break address
        .if (.match (.left (1, {address}), #))
            ; immediate mode
            lda #<(.right (.tcount ({address})-1, {address}))
            ldx #>(.right (.tcount ({address})-1, {address}))
        .else
            ; assume absolute or zero page
            lda address
            ldx 1+(address)
        .endif
        jsr _register_system_break
        .endmacro
        