        .include "zeropage.inc"

        .import _strlen
        .import _strcmp
        .import _strtoupper
        .import _strtolower
        .import _strtriml
        .import _strtrimr
        .import _strtokenize

LF      = $0a   ; Line Feed
CR      = $0d   ; Carriage Return
SPACE   = $20   ; Space character

        .macro strcmp str1, str2
        pha
        lda #<str1
        sta ptr1
        lda #>str1
        sta ptr1+1
        lda #<str2
        sta ptr2
        lda #>str2
        sta ptr2+1
        pla
        jsr _strcmp
        .endmacro

        .macro strcmpp pstr1, pstr2
        pha
        lda pstr1
        sta ptr1
        lda pstr1+1
        sta ptr1+1
        lda pstr2
        sta ptr2
        lda pstr2+1
        sta ptr2+1
        pla
        jsr _strcmp
        .endmacro

        .macro strlen str1
        pha
        lda #<str1
        sta ptr1
        lda #>str1
        sta ptr1+1
        pla
        jsr _strlen
        .endmacro

        .macro strtoupper str1
        pha
        lda #<str1
        sta ptr1
        lda #>str1
        sta ptr1+1
        pla
        jsr _strtoupper
        .endmacro

        .macro strtoupperp pstr1
        pha
        lda pstr1
        sta ptr1
        lda pstr1+1
        sta ptr1+1
        pla
        jsr _strtoupper
        .endmacro

        .macro strtolower str1
        pha
        lda #<str1
        sta ptr1
        lda #>str1
        sta ptr1+1
        pla
        jsr _strtolower
        .endmacro

        .macro strtriml str1
        pha
        lda #<str1
        sta ptr1
        lda #>str1
        sta ptr1+1
        pla
        jsr _strtriml
        .endmacro

        .macro strtrimr str1
        pha
        lda #<str1
        sta ptr1
        lda #>str1
        sta ptr1+1
        pla
        jsr _strtrimr
        .endmacro

        .macro strtokenize string, buffer, buffer_size
        lda #<string
        sta ptr1
        lda #>string
        sta ptr1+1
        lda #<buffer
        sta ptr2
        lda #>buffer
        sta ptr2+1
        lda #(buffer_size)
        sta tmp1
        jsr _strtokenize
        .endmacro  
