        .import via2_get_register
        .import _via2_get_register
        .import via2_set_register
        .import _via2_set_register


        .macro via2_get_register reg
        ldx #reg
        jsr via2_get_register
        .endmacro

        .macro via2_set_register reg, value
        ldx #reg
        lda value
        jsr via2_set_register
        .endmacro
