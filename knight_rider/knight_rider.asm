  .org $8000
init:
  lda #$ff
  sta $6002
  lda #$01
  sta $6000
loop_l:
  rol A
  bcs loop_r
  sta $6000
  jmp loop_l
loop_r:
  ror A
  bcs loop_l
  sta $6000
  jmp loop_r
  .org $fffc
  word init
  word $0000

