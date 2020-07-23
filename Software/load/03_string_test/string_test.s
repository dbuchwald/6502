        .include "string.inc"
        .include "serial.inc"
        .include "utils.inc"
        .include "macros.inc"
        .include "sys_const.inc"

        .segment "VECTORS"

        .word   $0000
        .word   init
        .word   $0000

TOKENIZE_BUFFER_SIZE = 64
CHANNEL              = CHANNEL0

        .code
init:
        serial_write_string #CHANNEL, #message

        serial_write_string #CHANNEL, #msg1
        strlength #message
        jsr convert_to_hex
        txa
        sta result_val
        tya
        sta result_val+1
        serial_write_string #CHANNEL, #result_msg

        serial_write_string #CHANNEL, #msg2
        strcompare #strc1, #strc2
        jsr convert_to_hex
        txa
        sta result_val
        tya
        sta result_val+1
        serial_write_string #CHANNEL, #result_msg

        serial_write_string #CHANNEL, #msg3
        strcompare #strc2, #strc3
        jsr convert_to_hex
        txa
        sta result_val
        tya
        sta result_val+1
        serial_write_string #CHANNEL, #result_msg

        serial_write_string #CHANNEL, #msg4
        strcompare #strc3, #strc4
        jsr convert_to_hex
        txa
        sta result_val
        tya
        sta result_val+1
        serial_write_string #CHANNEL, #result_msg

        serial_write_string #CHANNEL, #to_upper_message
        strtoupper #to_upper_message
        serial_write_string #CHANNEL, #to_upper_message

        serial_write_string #CHANNEL, #to_lower_message
        strtolower #to_lower_message
        serial_write_string #CHANNEL, #to_lower_message

        serial_write_string #CHANNEL, #token1

        strtokenize #token1, #tokenize_buffer, TOKENIZE_BUFFER_SIZE

        tax 
        ; ldy #$00
        copy_ptr #tokenize_buffer, ptr4

@token1_loop:
        serial_write_string #CHANNEL, #token_found
        serial_write_string #CHANNEL, ptr4
        serial_write_string #CHANNEL, #token_newline
        dec tmp2
        beq @done_listing_token1
@next_token1_loop:
        lda (ptr4)
        beq @end_of_token1
        inc_ptr ptr4
        bra @next_token1_loop
@end_of_token1:
        inc_ptr ptr4
        bra @token1_loop
@done_listing_token1:

        serial_write_string #CHANNEL, #token2

        strtokenize #token2, #tokenize_buffer, TOKENIZE_BUFFER_SIZE

        tax 
        copy_ptr #tokenize_buffer, ptr4
@token2_loop:
        serial_write_string #CHANNEL, #token_found
        serial_write_string #CHANNEL, ptr4
        serial_write_string #CHANNEL, #token_newline
        dec tmp2
        beq @done_listing_token2
@next_token2_loop:
        lda (ptr4)
        beq @end_of_token2
        inc_ptr ptr4
        bra @next_token2_loop
@end_of_token2:
        inc_ptr ptr4
        bra @token2_loop
@done_listing_token2:

        serial_write_string #CHANNEL, #token3

        strtokenize #token3, #tokenize_buffer, TOKENIZE_BUFFER_SIZE

        tax 
        copy_ptr #tokenize_buffer, ptr4
@token3_loop:
        serial_write_string #CHANNEL, #token_found
        serial_write_string #CHANNEL, ptr4
        serial_write_string #CHANNEL, #token_newline
        dec tmp2
        beq @done_listing_token3
@next_token3_loop:
        lda (ptr4)
        beq @end_of_token3
        inc_ptr ptr4
        bra @next_token3_loop
@end_of_token3:
        inc_ptr ptr4
        bra @token3_loop
@done_listing_token3:

        rts
      
        .segment "BSS"
tokenize_buffer:
        .res TOKENIZE_BUFFER_SIZE

        .segment "RODATA"
message: .byte "Welcome to string testing module", CR, LF, $00
msg1:    .byte "_strlength on message - ", $00
msg2:    .byte "strcompare on strc1,strc2 - ", $0000
msg3:    .byte "strcompare on strc2,strc3 - ", $0000
msg4:    .byte "strcompare on strc3,strc4 - ", $0000

to_upper_message: 
         .byte "Testing 12938, ToUppEr AND tOlOWEr _# operatiOn?abcxyz@[]", CR, LF, $00
to_lower_message:
         .byte "Testing 12938, ToUppEr AND tOlOWEr _# operatiOn?abcxyz@[]", CR, LF, $00

token1:  .byte "  blink ON ", CR, LF, $00
token2:  .byte " EXAMINE a001", CR, LF, $00
token3:  .byte "ex 0100:    01ff     ", CR, LF, $00  

result_msg: 
         .byte "Function returns 0x"
result_val: 
         .byte "00"
         .byte CR, LF, $00

strc1:   .byte "abcd", $00
strc2:   .byte "abcd", $00
strc3:   .byte "abc", $00
strc4:   .byte "bcdedfg", $00


token_found:
         .byte "Token found: <", $00
token_newline:
         .byte ">", CR, LF, $00