        .include "zeropage.inc"

        .import _strcopy
        .import strcopy
        .import _strlength
        .import _strcompare
        .import strcompare
        .import _strtoupper
        .import _strtolower
        .import _strtriml
        .import _strtrimr
        .import _strtokenize
        .import strtokenize
        .import _strgettoken

LF      = $0a   ; Line Feed
CR      = $0d   ; Carriage Return
SPACE   = $20   ; Space character

        .macro strcopy str1, str2
        pha
        .if (.match (.left (1, {str1}), #))
            ; immediate mode
            lda #<(.right (.tcount ({str1})-1, {str1}))
            sta ptr1
            lda #>(.right (.tcount ({str1})-1, {str1}))
            sta ptr1+1
        .else
            ; assume absolute or zero page
            lda str1
            sta ptr1
            lda 1+(str1)
            sta ptr1+1
        .endif
        .if (.match (.left (1, {str2}), #))
            ; immediate mode
            lda #<(.right (.tcount ({str2})-1, {str2}))
            sta ptr2
            lda #>(.right (.tcount ({str2})-1, {str2}))
            sta ptr2+1
        .else
            ; assume absolute or zero page
            lda str2
            sta ptr2
            lda 1+(str2)
            sta ptr2+1
        .endif
        pla
        jsr strcopy
        .endmacro

        .macro strcompare str1, str2
        pha
        .if (.match (.left (1, {str1}), #))
            ; immediate mode
            lda #<(.right (.tcount ({str1})-1, {str1}))
            sta ptr1
            lda #>(.right (.tcount ({str1})-1, {str1}))
            sta ptr1+1
        .else
            ; assume absolute or zero page
            lda str1
            sta ptr1
            lda 1+(str1)
            sta ptr1+1
        .endif
        .if (.match (.left (1, {str2}), #))
            ; immediate mode
            lda #<(.right (.tcount ({str2})-1, {str2}))
            sta ptr2
            lda #>(.right (.tcount ({str2})-1, {str2}))
            sta ptr2+1
        .else
            ; assume absolute or zero page
            lda str2
            sta ptr2
            lda 1+(str2)
            sta ptr2+1
        .endif
        pla
        jsr strcompare
        .endmacro

        .macro strlength str1
        phx
        .if (.match (.left (1, {str1}), #))
            ; immediate mode
            lda #<(.right (.tcount ({str1})-1, {str1}))
            ldx #>(.right (.tcount ({str1})-1, {str1}))
        .else
            ; assume absolute or zero page
            lda str1
            ldx 1+(str1)
        .endif
        jsr _strlength
        plx
        .endmacro

        .macro strtoupper str1
        pha
        phx
        .if (.match (.left (1, {str1}), #))
            ; immediate mode
            lda #<(.right (.tcount ({str1})-1, {str1}))
            ldx #>(.right (.tcount ({str1})-1, {str1}))
        .else
            ; assume absolute or zero page
            lda str1
            ldx 1+(str1)
        .endif
        jsr _strtoupper
        plx
        pla
        .endmacro

        .macro strtolower str1
        pha
        phx
        .if (.match (.left (1, {str1}), #))
            ; immediate mode
            lda #<(.right (.tcount ({str1})-1, {str1}))
            ldx #>(.right (.tcount ({str1})-1, {str1}))
        .else
            ; assume absolute or zero page
            lda str1
            ldx 1+(str1)
        .endif
        jsr _strtolower
        plx
        pla
        .endmacro

        .macro strtriml str1
        pha
        phx
        .if (.match (.left (1, {str1}), #))
            ; immediate mode
            lda #<(.right (.tcount ({str1})-1, {str1}))
            ldx #>(.right (.tcount ({str1})-1, {str1}))
        .else
            ; assume absolute or zero page
            lda str1
            ldx 1+(str1)
        .endif
        jsr _strtriml
        plx
        pla
        .endmacro

        .macro strtrimr str1
        pha
        phx
        .if (.match (.left (1, {str1}), #))
            ; immediate mode
            lda #<(.right (.tcount ({str1})-1, {str1}))
            ldx #>(.right (.tcount ({str1})-1, {str1}))
        .else
            ; assume absolute or zero page
            lda str1
            ldx 1+(str1)
        .endif
        jsr _strtrimr
        plx
        pla
        .endmacro

        .macro strtokenize string, buffer, buffer_size
        .if (.match (.left (1, {string}), #))
            ; immediate mode
            lda #<(.right (.tcount ({string})-1, {string}))
            sta ptr1
            lda #>(.right (.tcount ({string})-1, {string}))
            sta ptr1+1
        .else
            ; assume absolute or zero page
            lda string
            sta ptr1
            lda 1+(string)
            sta ptr1+1
        .endif
        .if (.match (.left (1, {buffer}), #))
            ; immediate mode
            lda #<(.right (.tcount ({buffer})-1, {buffer}))
            sta ptr2
            lda #>(.right (.tcount ({buffer})-1, {buffer}))
            sta ptr2+1
        .else
            ; assume absolute or zero page
            lda buffer
            sta ptr2
            lda 1+(buffer)
            sta ptr2+1
        .endif
        lda #(buffer_size)
        sta tmp1
        jsr strtokenize
        .endmacro  

        .macro strgettoken token_buffer, number
        .local @token_loop
        .local @char_loop
        .local @exit
        pha
        lda #(number)
        sta tmp1
        copy_ptr token_buffer, ptr1
@token_loop:
        lda tmp1
        beq @exit
@char_loop:
        inc_ptr ptr1
        lda (ptr1)
        bne @char_loop
        inc_ptr ptr1
        dec tmp1
        bra @token_loop
@exit:
        pla
        .endmacro
