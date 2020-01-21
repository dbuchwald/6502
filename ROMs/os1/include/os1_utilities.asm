; ---------------------------------------------------------------------------------
; Include file for OS/1 Utility routines
; Author: Dawid Buchwald
; Date: 21/01/2020
; ---------------------------------------------------------------------------------

  include "os1_memmap.asm"

; Prevent issue with double include
  ifndef OS1_UTILITIES_DEFINED
OS1_UTILITIES_DEFINED   equ 1

; Simple delay loop, hardcoded for 1MHz clock
; Written by Dirk Grappendoff (https://github.com/grappendorf/homecomputer-6502/blob/master/firmware/utils.s65)
os1_function_delay:
  sta OS1_TEMP_BYTE1
  txa
  pha
  tya
  pha
  ldx OS1_TEMP_BYTE1

  ldy #190
os1_function_delay_loop1:
  dey
  bne os1_function_delay_loop1

os1_function_delay_loop2:
  dex
  beq os1_function_delay_return

  nop
  ldy #198
os1_function_delay_loop3:
  dey
  bne os1_function_delay_loop3

  jmp os1_function_delay_loop2

os1_function_delay_return:
  pla
  tay
  pla
  tax
  lda OS1_TEMP_BYTE1
  rts

  endif ; OS1_UTILITIES_DEFINED