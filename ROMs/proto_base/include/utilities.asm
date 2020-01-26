; ---------------------------------------------------------------------------------
; Include file for OS/1 Utility routines
; Author: Dawid Buchwald
; Date: 21/01/2020
; ---------------------------------------------------------------------------------

  include "memmap.asm"

; Prevent issue with double include
  ifndef UTILITIES_DEFINED
UTILITIES_DEFINED equ 1

; Simple delay loop, hardcoded for 1MHz clock
; Written by Dirk Grappendoff (https://github.com/grappendorf/homecomputer-6502/blob/master/firmware/utils.s65)
ms_delay:
  sta TEMP_BYTE1
  txa
  pha
  tya
  pha
  ldx TEMP_BYTE1

  ldy #190
ms_delay_loop1:
  dey
  bne ms_delay_loop1

ms_delay_loop2:
  dex
  beq ms_delay_return

  nop
  ldy #198
ms_delay_loop3:
  dey
  bne ms_delay_loop3

  jmp ms_delay_loop2

ms_delay_return:
  pla
  tay
  pla
  tax
  lda TEMP_BYTE1
  rts

sec_delay:
  sta TEMP_BYTE2
  txa
  pha
  tya
  pha
  ldx TEMP_BYTE2

sec_delay_loop1:
  ldy #4
sec_delay_loop2:
  dey 
  beq sec_delay_loop1_end
  lda #250
  jsr ms_delay
  bra sec_delay_loop2
sec_delay_loop1_end:
  dex
  bne sec_delay_loop1
  pla
  tay
  pla
  tax
  lda TEMP_BYTE2
  rts

  endif ; UTILITIES_DEFINED