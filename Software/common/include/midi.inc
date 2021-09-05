    .import load_midi_tick_count
    .import dec_midi_tick_count
    .import midi_update
    .import midi_first_event
    .import midi_data_end
    .import y_test

        ; .macro midi_init first_event
        ; pha
        ; .if (.match (.left (1, {string}), #))
        ;     ; immediate mode
        ;     lda #<(.right (.tcount ({string})-1, {string}))
        ;     sta midi_first_event

        ;     lda #>(.right (.tcount ({string})-1, {string}))
        ;     sta midi_first_event+1
        ; .else
        ;     phx
        ;     ldx #0
        ;     lda (first_event,x)
        ;     sta midi_first_event
        ;     idx
        ;     lda (first_event,x)
        ;     sta midi_first_event+1
        ;     ldx 1+(string)
        ;     plx
        ; .endif
        
        ; pla
        ; .endmacro