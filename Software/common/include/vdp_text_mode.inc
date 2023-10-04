    .import vdp_text_init
    .import vdp_graphics1_init
    .import vdp_scroll_line
    .import vdp_out_char
    .import vdp_write_char
    .import vdp_write_string
    .import vdp_advance_char_position
    .import vdp_newline
    .import vdp_clear_line
    .import vdp_backspace
    .import vdp_set_prompt
    .import vdp_clear_text_screen

    .forceimport vdp_line
    .forceimport vdp_char_pos


        .macro write_vdp string
        pha
        phx
        .if (.match (.left (1, {string}), #))
            ; immediate mode
            lda #<(.right (.tcount ({string})-1, {string}))
            ldx #>(.right (.tcount ({string})-1, {string}))
        .else
            ; assume absolute or zero page
            lda string
            ldx 1+(string)
        .endif
        jsr vdp_write_string
        plx
        pla
        .endmacro
