        .setcpu "65C02"
        .include "zeropage.inc"
        .include "tokens.inc"
        .include "macros.inc"
        .include "utils.inc"
        .include "sys_const.inc"
        .include "tty.inc"

        .export run_command
        .import list_program
        .import new_program
        .import get_first_line
        .import get_line
        .import get_mem_stats
        .import register_exit

        .zeropage
command_ptr:
        .res 2
line_ptr:
        .res 2

        .code

run_command:
        sta command_ptr
        stx command_ptr+1
run_command_internal:
        stz current_command_failed

        ldy #$00
        lda (command_ptr)
        sta current_command

        copy_ptr command_ptr, current_variable_section_ptr
        inc_ptr current_variable_section_ptr, #$02

        switch current_command
        case #(TOKEN_LIST),  @run_list
        case #(TOKEN_RUN),   @run_run
        case #(TOKEN_PRINT), @run_print
        case #(TOKEN_GOTO),  @run_goto
        case #(TOKEN_EXIT),  @run_exit
        case #(TOKEN_NEW),   @run_new
        case #(TOKEN_MEM),   @run_mem
        jmp @exit
@run_list:
        lda #$00
        ldx #$00
        jsr list_program
        jmp @exit
@run_run:
        jsr run_program
        jmp @exit
@run_print:
        writeln_tty current_variable_section_ptr
        jmp @exit
@run_goto:
        copy_ptr current_variable_section_ptr, ptr1
        ldy #$01
        lda (ptr1),y
        tax
        lda (ptr1)
        jsr get_line
        sta next_line_ptr
        stx next_line_ptr+1
        lda next_line_ptr
        bne @exit
        lda next_line_ptr+1
        bne @exit
        ; goto target not found
        lda #$ff
        sta current_command_failed
        writeln_tty #goto_find_failed
        jmp @exit
@run_exit:
        jsr register_exit
        jmp @exit
@run_new:
        jsr new_program
        jmp @exit
@run_mem:
        jsr get_mem_stats
        jmp @exit
@exit:
        rts

run_program:
        jsr get_first_line
        sta line_ptr
        stx line_ptr+1
@line_loop:
        lda line_ptr
        bne @keep_going
        lda line_ptr+1
        bne @keep_going
        sec
        bra @exit
@keep_going:
        ldy #$02
        lda (line_ptr),y
        sta next_line_ptr
        iny
        lda (line_ptr),y
        sta next_line_ptr+1

        copy_ptr line_ptr, command_ptr
        inc_ptr command_ptr, #$06
        jsr run_command_internal
        bit current_command_failed
        beq @next_line
        ; list failed line after indent
        write_tty #indent
        ldy #$05
        lda (line_ptr),y
        tax
        dey
        lda (line_ptr),y
        jsr list_program
        clc
        bra @exit
@next_line:
        copy_ptr next_line_ptr, line_ptr
        bra @line_loop
@exit:
        rts

        .segment "BSS"
current_command:
        .res 1
current_command_failed:
        .res 1
next_line_ptr:
        .res 2
current_variable_section_size:
        .res 1
current_variable_section_ptr:
        .res 2

        .segment "RODATA"
goto_find_failed:
        .asciiz "GOTO command failed to locate target line:"
indent:
        .asciiz "  "

