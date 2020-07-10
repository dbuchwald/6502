        .include "tty.inc"
        .include "clock.inc"
        .import __ROM_START__
        .import __ROM_LAST__
        .import __ROM_SIZE__
        .import __USERRAM_START__
        .import __USERRAM_LAST__
        .import __USERRAM_SIZE__
        .import __SYS_RAM_START__
        .import __SYS_RAM_LAST__
        .import __SYS_RAM_SIZE__
        .import __STARTUP_SIZE__
        .import __CODE_SIZE__
        .import __DATA_SIZE__
        .import __RODATA_SIZE__
        .import __RODATA_PA_SIZE__
        .import __SYSCALLS_SIZE__
        .import __VECTORS_SIZE__
        .import __VIA1_START__
        .import __VIA2_START__
        .import __ACIA_START__


        .code

init:
        writeln_tty #message
        write_tty #clock_msg1
        ldx #$00
        lda #(clock_mhz)
        jsr _tty_write_dec
        writeln_tty #clock_msg2
        jsr _tty_send_newline

        write_tty #rom_msg
        write_tty #mem_msg1
        write_tty_address #__ROM_START__
        write_tty #mem_msg2
        write_tty_dec #(__STARTUP_SIZE__+__CODE_SIZE__+__DATA_SIZE__+__RODATA_SIZE__+__RODATA_PA_SIZE__+__SYSCALLS_SIZE__+__VECTORS_SIZE__)
        write_tty #out_of_msg
        write_tty_dec #(__ROM_SIZE__)
        writeln_tty #bytes_msg

        write_tty #system_ram_msg
        write_tty #mem_msg1
        write_tty_address #__SYS_RAM_START__
        write_tty #mem_msg2
        write_tty_dec #(__SYS_RAM_LAST__-__SYS_RAM_START__)
        write_tty #out_of_msg
        write_tty_dec #__SYS_RAM_SIZE__
        writeln_tty #bytes_msg

        write_tty #user_ram_msg
        write_tty #mem_msg1
        write_tty_address #__USERRAM_START__
        write_tty #mem_msg2
        write_tty_dec #(__USERRAM_LAST__-__USERRAM_START__)
        write_tty #out_of_msg
        write_tty_dec #__USERRAM_SIZE__
        writeln_tty #bytes_msg

        jsr _tty_send_newline

        write_tty #rom_code_msg
        write_tty_dec #(__CODE_SIZE__+__STARTUP_SIZE__)
        writeln_tty #bytes_msg

        write_tty #rom_data_msg
        write_tty_dec #(__DATA_SIZE__+__RODATA_SIZE__+__RODATA_PA_SIZE__)
        writeln_tty #bytes_msg

        write_tty #syscalls_msg
        write_tty_dec #(__SYSCALLS_SIZE__)
        writeln_tty #bytes_msg

        jsr _tty_send_newline

        write_tty #via1_addr_msg
        write_tty_address #__VIA1_START__
        jsr _tty_send_newline
        write_tty #via2_addr_msg
        write_tty_address #__VIA2_START__
        jsr _tty_send_newline
        write_tty #acia_addr_msg
        write_tty_address #__ACIA_START__
        jsr _tty_send_newline

        rts

        .segment "STARTUP"
        .segment "VECTORS"
        .segment "RODATA_PA"

        .segment "BSS"
test_res:
        .res 5

        .segment "RODATA"

message: 
        .asciiz "OS/1 System Information"
clock_msg1:
        .asciiz "System clock running at "
clock_msg2:
        .asciiz "MHz"
rom_msg:
        .asciiz "ROM"
system_ram_msg:
        .asciiz "System RAM"
user_ram_msg:
        .asciiz "User RAM"
mem_msg1:
        .asciiz " at address: 0x"
mem_msg2:
        .asciiz ", used: "
out_of_msg:
        .asciiz " out of "
bytes_msg:
        .asciiz " bytes."

rom_code_msg:
        .asciiz "ROM code uses "
rom_data_msg:
        .asciiz "ROM data uses "
syscalls_msg:
        .asciiz "SYSCALLS table uses "
via1_addr_msg:
        .asciiz "VIA1 address: 0x"
via2_addr_msg:
        .asciiz "VIA2 address: 0x"
acia_addr_msg:
        .asciiz "ACIA address: 0x"
