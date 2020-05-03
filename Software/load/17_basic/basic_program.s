        .setcpu "65C02"
        .include "zeropage.inc"
        .include "tokens.inc"
        .include "macros.inc"
        .include "utils.inc"
        .include "sys_const.inc"
        .include "tty.inc"

        .export new_program
        .export add_new_line
        .export get_first_line
        .export list_program

        .zeropage
free_ptr:
        .res 2
line_iterator_ptr:
        .res 2

        .code

new_program:
        stz first_line_pointer
        stz first_line_pointer+1
        lda #<program_storage
        sta free_ptr
        lda #>program_storage
        sta free_ptr+1
        ; TODO: Remove debug message
        write_tty #new_program_message
        write_tty_address free_ptr
        jsr _tty_send_newline
        rts

get_first_line:
        lda first_line_pointer
        ldx first_line_pointer+1

add_new_line:
        sta ptr1
        stx ptr1+1
        ; skip first byte (immediate command flag)
        inc_ptr ptr1, #$01

        ldy #$00
        lda (ptr1),y
        sta new_line_num
        iny
        lda (ptr1),y
        sta new_line_num+1

        ; is it the first line ever?
        lda first_line_pointer
        bne @not_first_one
        lda first_line_pointer
        bne @not_first_one
        ; first one
        stz prev_pointer
        stz prev_pointer+1
        stz next_pointer
        stz next_pointer+1
        jmp @create_new_node
@not_first_one:
        ; iterate through list of lines and find where we belong
        copy_ptr first_line_pointer, ptr2
@iterate:
        ; get item pointer and store in ptr3
        copy_ptr ptr2, ptr3
        inc_ptr ptr3, #$04
        ; load line number (at the beginning of the record)
        ldy #$00
        lda (ptr3),y
        sta current_line_num
        iny
        lda (ptr3),y
        sta current_line_num+1
        ; now we can compare current against new line number
        cmp_ptr current_line_num, new_line_num
        beq @the_same_number
        bcc @greater_line_number
        jmp @smaller_line_number
@the_same_number:
        ; tricky part - to save memory we should check if we can reuse
        ; current variable storage (if new line is smaller than old one)
        ; we get current variable storage from (ptr3),3
        iny
        iny
        lda (ptr3),y
        sta current_section_size
        ; load new section size from (ptr1),3
        lda (ptr1),y
        cmp current_section_size
        ; it's smaller
        bcc @will_fit_here
        ; or the same
        beq @will_fit_here
        ; create new node (wasting 4 bytes, but what the hell)
        ldy #$00
        lda (ptr2),y
        sta prev_pointer
        iny
        lda (ptr2),y
        sta prev_pointer+1
        iny
        lda (ptr2),y
        sta next_pointer
        iny
        lda (ptr2),y
        sta next_pointer+1
        jmp @create_new_node
@will_fit_here:
        ; store new section size in tmp1
        sta tmp1
        ; copy command
        ldy #$02
        lda (ptr1),y
        sta (ptr3),y
        ; copy new section size
        iny
        lda (ptr1),y
        sta (ptr3),y
        lda tmp1
        cmp #$00
        bne @copy_variable_same_line
        ; there is nothing else to copy
        jmp @exit
@copy_variable_same_line:
        iny
        dec tmp1
@same_line_loop:
        lda (ptr1),y
        sta (ptr3),y
        iny
        dec tmp1
        bpl @same_line_loop
        jmp @exit
@greater_line_number:
        ; copy ptr2 to ptr3 temporarily
        ldy #$02
        lda (ptr2),y
        sta ptr3
        iny
        lda (ptr2),y
        sta ptr3+1
        lda ptr3
        bne @not_last
        lda ptr3+1
        bne @not_last
        jmp @add_to_end
@not_last:
        copy_ptr ptr3, ptr2
        jmp @iterate
@smaller_line_number:
        ; ptr2 points to list entry
        ldy #$00
        lda (ptr2),y
        sta prev_pointer
        iny
        lda (ptr2),y
        sta prev_pointer+1
        ; current entry will be next then
        lda ptr2
        sta next_pointer
        lda ptr2+1
        sta next_pointer+1
        jmp @create_new_node
@add_to_end:
        lda ptr2
        sta prev_pointer
        lda ptr2+1
        sta prev_pointer+1
        stz next_pointer
        stz next_pointer+1
        jmp @create_new_node
@create_new_node:
        ; new node will be created at address pointed by free_ptr
        copy_ptr free_ptr, current_pointer
        ; first, create list entry
        ldy #$00
        lda prev_pointer
        sta (free_ptr),y
        iny
        lda prev_pointer+1
        sta (free_ptr),y
        iny
        lda next_pointer
        sta (free_ptr),y
        iny
        lda next_pointer+1
        sta (free_ptr),y
        ; update free_ptr to beginning of line data section
        inc_ptr free_ptr, #$04
        ldy #$00
        ; copy line number
        lda new_line_num
        sta (free_ptr),y
        iny
        lda new_line_num+1
        sta (free_ptr),y
        iny
        ; copy token code (line data is pointed to by ptr1)
        lda (ptr1),y
        sta (free_ptr),y
        iny
        ; copy variable section size
        lda (ptr1),y
        sta (free_ptr),y
        sta tmp1
        iny
        ; if variable section is empty, skip copy loop
        cmp #$00
        beq @copy_completed
        ; copy variable section (size stored in tmp1)
        ; reduce tmp1 by one
        dec tmp1
@copy_variable_section_loop:
        lda (ptr1),y
        sta (free_ptr),y
        iny
        dec tmp1
        bpl @copy_variable_section_loop
@copy_completed:
        ; update free_ptr to next available location (size of node is in y)
        sty tmp1
        inc_ptr free_ptr, tmp1
        ; last thing to do - update pointers in next/previous nodes to current one
        copy_ptr prev_pointer, ptr1
        ; if previous entry exists
        lda ptr1
        bne @previous_exists
        lda ptr1+1
        bne @previous_exists
        ; previous doesn't exist, update first line pointer then
        lda current_pointer
        sta first_line_pointer
        lda current_pointer+1
        sta first_line_pointer+1
        bra @update_next_node
@previous_exists:
        ; copy current pointer to previous node (now pointed to by ptr1)
        ; next pointer holder, starting at byte 2
        ldy #$02
        lda current_pointer
        sta (ptr1),y
        iny
        lda current_pointer+1
        sta (ptr1),y
@update_next_node:
        copy_ptr next_pointer, ptr1
        lda ptr1
        bne @next_exists
        lda ptr1+1
        bne @next_exists
        jmp @exit
@next_exists:
        ; copy current pointer to next node (pointed to by ptr1)
        ; previous pointer holder, starting at byte 0
        ldy #$00
        lda current_pointer
        sta (ptr1),y
        iny
        lda current_pointer+1
        sta (ptr1),y
@exit:
        rts

list_program:
        copy_ptr first_line_pointer, line_iterator_ptr
@list_loop:
        lda line_iterator_ptr
        bne @not_done_yet
        lda line_iterator_ptr+1
        bne @not_done_yet
        jmp @exit
@not_done_yet:
        ; get line number (offset 4)
        ldy #$04
        lda (line_iterator_ptr),y
        sta current_line_num
        iny
        lda (line_iterator_ptr),y
        sta current_line_num+1
        iny
        lda (line_iterator_ptr),y
        sta current_command
        iny
        lda (line_iterator_ptr),y
        sta current_section_size
        sta tmp1
        iny
        ; if variable section is empty, skip copy loop
        cmp #$00
        beq @copy_completed
        ; copy variable section (size stored in tmp1)
        ; reduce tmp1 by one
        dec tmp1
        ldx #$00
@copy_variable_section_loop:
        lda (line_iterator_ptr),y
        sta current_variable_section,x
        iny
        inx
        dec tmp1
        bpl @copy_variable_section_loop        
@copy_completed:
        jsr list_single_line
        ; move iterator to next line
        copy_ptr line_iterator_ptr, ptr1
        ldy #$02
        lda (ptr1),y
        sta line_iterator_ptr
        iny
        lda (ptr1),y
        sta line_iterator_ptr+1
        bra @list_loop
@exit:
        rts

list_single_line:
        ; ; print line number (hex so far)
        ; write_tty_address current_line_num
        convert_hex_to_dec current_line_num, #dec_line_buffer
        lda dec_line_buffer+2
        jsr _tty_write_hex
        lda dec_line_buffer+1
        jsr _tty_write_hex
        lda dec_line_buffer
        jsr _tty_write_hex
        lda #(CHAR_SPACE)
        jsr _tty_send_character
        ; act on command received
        switch current_command
        case TOKEN_PRINT, list_print
        case TOKEN_GOTO, list_goto
        jmp list_exit
list_print:
        write_tty #cmd_print
        lda #(CHAR_SPACE)
        jsr _tty_send_character
        lda #(CHAR_DOUBLEQUOTE)
        jsr _tty_send_character
        write_tty #current_variable_section
        lda #(CHAR_DOUBLEQUOTE)
        jsr _tty_send_character
        jmp list_exit
list_goto:
        write_tty #cmd_goto
        lda #(CHAR_SPACE)
        jsr _tty_send_character
        ; write_tty_address current_variable_section
        convert_hex_to_dec current_variable_section, #dec_line_buffer
        lda dec_line_buffer+2
        jsr _tty_write_hex
        lda dec_line_buffer+1
        jsr _tty_write_hex
        lda dec_line_buffer
        jsr _tty_write_hex

        jmp list_exit
list_exit:
        jsr _tty_send_newline
        rts


        .segment "BSS"

first_line_pointer:
        .res 2
prev_pointer:
        .res 2
current_pointer:
        .res 2
data_pointer:
        .res 2
next_pointer:
        .res 2
current_line_num:
        .res 2
new_line_num:
        .res 2
dec_line_buffer:
        .res 3
current_command:
        .res 1
current_section_size:
        .res 1
current_variable_section:
        .res 256
program_storage:
        .res 4096

        .segment "RODATA"

new_program_message:
        .asciiz "New program will be stored at location 0x"