        .setcpu "65C02"
        .include "tty.inc"
        .include "string.inc"
        .include "utils.inc"
        .include "macros.inc"

CMD_OFFSET      = $00
ARGC_OFFSET     = $02
DESC_OFFSET     = $03
FUNCTION_OFFSET = $05
NEXT_OFFSET     = $07

        .macro is_last_menu_item pointer
        .local @not_last
        .local @return
        pha
        lda ptr1
        pha
        lda ptr1+1
        pha
        lda pointer
        sta ptr1
        lda pointer+1
        sta ptr1+1
        lda (ptr1)
        bne @not_last
        inc_ptr ptr1
        lda (ptr1)
        bne @not_last
        sec
        bra @return
@not_last:
        clc
@return:        
        pla
        sta ptr1+1
        pla
        sta ptr1
        pla
        .endmacro

        .macro get_next_menu_item pointer
        pha
        phy
        lda ptr1
        pha
        lda ptr1+1
        pha
        lda pointer
        sta ptr1
        lda pointer+1
        sta ptr1+1
        ldy #(NEXT_OFFSET)
        lda (ptr1),y
        clc
        adc ptr1
        sta pointer
        lda ptr1+1
        adc #$00
        sta pointer+1
        pla
        sta ptr1+1
        pla
        sta ptr1
        ply
        pla
        .endmacro

        .macro get_menu_item pointer, cmd_pointer, argc, desc_pointer, function_pointer
        pha
        phy
        lda ptr1
        pha
        lda ptr1+1
        pha
        lda pointer
        sta ptr1
        lda pointer+1
        sta ptr1+1
        ldy #(CMD_OFFSET)
        lda (ptr1),y
        sta cmd_pointer
        iny 
        lda (ptr1),y
        sta cmd_pointer+1
        ldy #(ARGC_OFFSET)
        lda (ptr1),y
        sta argc
        ldy #(DESC_OFFSET)
        lda (ptr1),y
        sta desc_pointer
        iny
        lda (ptr1),y
        sta desc_pointer+1
        ldy #(FUNCTION_OFFSET)
        lda (ptr1),y
        sta function_pointer
        iny
        lda (ptr1),y
        sta function_pointer+1
        pla
        sta ptr1+1
        pla
        sta ptr1
        ply
        pla
        .endmacro

        .export _run_menu
        .export run_menu
        .export _setup_menuitem

LINE_BUFFER_SIZE = 32
TOKENIZE_BUFFER_SIZE = 64

        .code

; C function to populate data structure
; 
_setup_menuitem:
        ; read params from registers and stack
        sta menu_item_function
        stx menu_item_function+1
        ldy #$06
        lda (sp),y
        sta ptr1+1
        dey
        lda (sp),y
        sta ptr1
        dey
        lda (sp),y
        sta menu_item_cmd+1
        dey
        lda (sp),y
        sta menu_item_cmd
        dey
        lda (sp),y
        sta menu_item_argc
        dey
        lda (sp),y
        sta menu_item_desc+1
        dey
        lda (sp),y
        sta menu_item_desc

        ; save params to resulting structure
        ldy #(CMD_OFFSET)
        lda menu_item_cmd
        sta (ptr1),y
        iny
        lda menu_item_cmd+1
        sta (ptr1),y

        ldy #(ARGC_OFFSET)
        lda menu_item_argc
        sta (ptr1),y

        ldy #(DESC_OFFSET)
        lda menu_item_desc
        sta (ptr1),y
        iny
        lda menu_item_desc+1
        sta (ptr1),y

        ldy #(FUNCTION_OFFSET)
        lda menu_item_function
        sta (ptr1),y
        iny
        lda menu_item_function+1
        sta (ptr1),y

        ldy #(NEXT_OFFSET)
        lda #(NEXT_OFFSET+1)
        sta (ptr1),y

        inc_ptr sp, #$07
        rts

; C wrapper for run_menu instruction
; prompt pointer in A/X
; menu definition on stack
_run_menu:
        sta ptr2
        stx ptr2+1
        ldy #$01
        lda (sp),y
        sta ptr1+1
        dey
        lda (sp),y
        sta ptr1
        jsr run_menu
        inc_ptr sp, #$02
        rts

; NEGATIVE C COMPLIANT - using ptr1, ptr2 input
run_menu:
        copy_ptr ptr1, menu_root
        copy_ptr ptr2, menu_prompt

main_loop:
        ; Display prompt
        write_tty menu_prompt

        ; Read one line
        tty_read_line #line_buffer, LINE_BUFFER_SIZE

        ; Trim trailing and leading whitespace
        strtriml #line_buffer
        strtrimr #line_buffer

        ; If empty - repeat
        strlength #line_buffer
        cmp #$00
        beq main_loop

        ; Tokenize input
        strtokenize #line_buffer, #tokenize_buffer, TOKENIZE_BUFFER_SIZE
        sta tokens_count

        ; Convert first token to uppercase for comparison
        strtoupper #tokenize_buffer

        ; Start from the beginning
        copy_ptr menu_root, menu_item
menu_commands_loop:
        is_last_menu_item menu_item
        bcc compare_item
        jmp special_commands
compare_item:
        get_menu_item menu_item, menu_item_cmd, menu_item_argc, menu_item_desc, menu_item_function
        strcompare #tokenize_buffer, menu_item_cmd
        cmp #$00
        bne next_menu_item
        ; check number of parameters
        lda menu_item_argc
        cmp tokens_count
        bne next_menu_item
        ; preserve critical local variables in case callee
        ; invokes his own menu
        lda menu_root
        pha
        lda menu_root+1
        pha
        lda menu_prompt
        pha
        lda menu_prompt+1
        pha
        ; execute function
        jsr execute_menu_function
        ; restore critical variables
        pla
        sta menu_prompt+1
        pla
        sta menu_prompt
        pla
        sta menu_root+1
        pla
        sta menu_root
        ; return to menu
        jmp main_loop
next_menu_item:
        get_next_menu_item menu_item
        jmp menu_commands_loop
special_commands:
        strcompare #tokenize_buffer, #cmd_help
        cmp #$00
        bne not_help
        lda tokens_count
        cmp #$03
        bpl invalid_command
        cmp #$02
        beq filtered_help
        jsr display_help_message
        jmp main_loop
filtered_help:
        jsr display_filtered_help
        jmp main_loop
not_help:
        lda tokens_count
        cmp #$01
        bne invalid_command
        strcompare #tokenize_buffer, #cmd_exit
        cmp #$00
        bne invalid_command
        writeln_tty #byemsg
        rts
invalid_command:
        writeln_tty #errormsg1
        writeln_tty #errormsg2
        jmp main_loop

execute_menu_function:
        ; provide access to parameters
        ; copy_ptr #tokenize_buffer, ptr1
        lda #<tokenize_buffer
        ldx #>tokenize_buffer
        jmp (menu_item_function)

display_help_message:
        writeln_tty #helpmsg1
        writeln_tty #helpmsg2
        writeln_tty #helpmsg3
        copy_ptr menu_root, menu_item
help_loop:
        is_last_menu_item menu_item
        bcc @display_item
        jmp @done_listing
@display_item:
        get_menu_item menu_item, menu_item_cmd, menu_item_argc, menu_item_desc, menu_item_function

        write_tty #helpind
        writeln_tty menu_item_desc

        get_next_menu_item menu_item
        jmp help_loop
@done_listing:
        writeln_tty #helpmsg4
        rts

display_filtered_help:
        strgettoken #tokenize_buffer, 1
        copy_ptr ptr1, help_filter_pointer
        strtoupper help_filter_pointer
        ; Check default candidates
        strcompare #cmd_help, help_filter_pointer
        cmp #$00
        bne @not_help
        writeln_tty #helpmsg2
        writeln_tty #helpmsg3
        rts
@not_help:
        strcompare #cmd_exit, help_filter_pointer
        cmp #$00
        bne @not_exit
        writeln_tty #helpmsg4
        rts
@not_exit:
        ; Keep track of found matches
        stz tmp1
        copy_ptr menu_root, menu_item
help_filter_loop:
        is_last_menu_item menu_item
        bcc @display_item
        jmp @done_listing
@display_item:
        get_menu_item menu_item, menu_item_cmd, menu_item_argc, menu_item_desc, menu_item_function

        strcompare menu_item_cmd, help_filter_pointer
        cmp #$00
        bne @next_item

        inc tmp1
        write_tty #helpind
        writeln_tty menu_item_desc

@next_item:
        get_next_menu_item menu_item
        jmp help_filter_loop
@done_listing:
        lda tmp1
        bne @just_exit
        writeln_tty #notfoundcmd
@just_exit:
        rts


        .segment "BSS"
line_buffer:
        .res LINE_BUFFER_SIZE
tokenize_buffer:
        .res TOKENIZE_BUFFER_SIZE
help_filter_pointer:
        .res 2
tokens_count:
        .res 1
menu_root:
        .res 2
menu_prompt:
        .res 2
menu_item:
        .res 2
menu_item_cmd:
        .res 2
menu_item_argc:
        .res 1
menu_item_desc:
        .res 2
menu_item_function:
        .res 2

        .segment "RODATA"
cmd_help:
        .asciiz "HELP"
cmd_exit:
        .asciiz "EXIT"
errormsg1:
        .asciiz "Command not recognized - either wrong keyword or incorrect number of parameters"
errormsg2:
        .asciiz "Enter HELP command to list available commands"
byemsg:
        .asciiz "Exiting..."
helpmsg1:
        .asciiz "The following commands are available:"
helpmsg2:
        .asciiz "  HELP - display this information"
helpmsg3:
        .asciiz "  HELP <command> - display help for <command>"
helpmsg4:
        .asciiz "  EXIT - exit the menu"
helpind:
        .asciiz "  "
notfoundcmd:
        .asciiz "Command not recognized, no help available"