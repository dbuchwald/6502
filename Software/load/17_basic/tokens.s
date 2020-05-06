        .export cmd_new
        .export cmd_list
        .export cmd_print
        .export cmd_goto
        .export cmd_run
        .export cmd_exit
        .export cmd_mem

        .segment "RODATA"

cmd_new:
        .asciiz "NEW"
cmd_list:
        .asciiz "LIST"
cmd_print:
        .asciiz "PRINT"
cmd_goto:
        .asciiz "GOTO"
cmd_run:
        .asciiz "RUN"
cmd_exit:
        .asciiz "EXIT"
cmd_mem:
        .asciiz "MEM"