        .import _system_init
        .import _interrupt_handler
        .import _register_system_break

        .macro register_system_break address
        lda #<address
        ldx #>address
        jsr _register_system_break
        .endmacro
        