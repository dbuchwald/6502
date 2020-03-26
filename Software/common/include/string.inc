        .include "zeropage.inc"

        .import _strlen
        .import _strcmp
        .import _strtoupper
        .import _strtolower

LF      = $0a   ; Line Feed
CR      = $0d   ; Carriage Return

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

        .macro strtolower str1
        pha
        lda #<str1
        sta ptr1
        lda #>str1
        sta ptr1+1
        pla
        jsr _strtolower
        .endmacro
