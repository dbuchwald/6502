        .include "string.inc"
        .include "acia.inc"
        .include "utils.inc"

        .segment "VECTORS"

        .word   $0000
        .word   init
        .word   $0000

        .code
init:
        write_acia message

        write_acia msg1
        strlen message
        jsr _convert_to_hex
        txa
        sta result_val
        tya
        sta result_val+1
        write_acia result_msg

        write_acia msg2
        strcmp strc1, strc2
        jsr _convert_to_hex
        txa
        sta result_val
        tya
        sta result_val+1
        write_acia result_msg

        write_acia msg3
        strcmp strc2, strc3
        jsr _convert_to_hex
        txa
        sta result_val
        tya
        sta result_val+1
        write_acia result_msg

        write_acia msg4
        strcmp strc3, strc4
        jsr _convert_to_hex
        txa
        sta result_val
        tya
        sta result_val+1
        write_acia result_msg

        write_acia to_upper_message
        strtoupper to_upper_message
        write_acia to_upper_message

        write_acia to_lower_message
        strtolower to_lower_message
        write_acia to_lower_message

        rts

        .segment "RODATA"
message: .byte "Welcome to string testing module", CR, LF, $00
msg1:    .byte "_strlen on message - ", $00
msg2:    .byte "_strcmp on strc1,strc2 - ", $0000
msg3:    .byte "_strcmp on strc2,strc3 - ", $0000
msg4:    .byte "_strcmp on strc3,strc4 - ", $0000

to_upper_message: 
         .byte "Testing 12938, ToUppEr AND tOlOWEr _# operatiOn?abcxyz@[]", CR, LF, $00
to_lower_message:
         .byte "Testing 12938, ToUppEr AND tOlOWEr _# operatiOn?abcxyz@[]", CR, LF, $00

result_msg: 
         .byte "Function returns 0x"
result_val: 
         .byte "00"
         .byte CR, LF, $00

strc1:   .byte "abcd", $00
strc2:   .byte "abcd", $00
strc3:   .byte "abc", $00
strc4:   .byte "bcdedfg", $00
