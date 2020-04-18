        .include "zeropage.inc"
        .import _main
        .import copydata
        .import zerobss
       
        .export   __STARTUP__ : absolute = 1

        .segment "STARTUP"
init:
        jsr zerobss
        jsr copydata
        jsr _main
        rts


        