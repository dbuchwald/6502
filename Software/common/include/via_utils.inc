        .import _via2_get_register
        .import _via2_set_register

        .macro via2_get_register reg
        lda #reg
        jsr _via2_get_register
        .endmacro

        .macro via2_set_register reg, value
        lda #reg
        ldx value
        jsr _via2_set_register
        .endmacro
