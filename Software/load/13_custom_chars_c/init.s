        .include "zeropage.inc"
        .import _main
        .import copydata
        .import zerobss
        .import   __USERRAM_START__, __USERRAM_SIZE__       ; Linker generated
        .export   __STARTUP__ : absolute = 1
        .segment "STARTUP"
init:
        lda #<(__USERRAM_START__ + __USERRAM_SIZE__)
        sta sp
        lda #>(__USERRAM_START__ + __USERRAM_SIZE__)
        sta sp+1
        jsr zerobss
        jsr copydata
        jsr _main
        rts


        