      .import _delay_ms
      .import _delay_sec
      .import _convert_to_hex

      .macro push_ptr address
      lda address+1
      pha
      lda address
      pha
      .endmacro

      .macro pull_ptr address
      pla
      sta address
      pla
      sta address+1
      .endmacro

      .macro copy_ptr source, target
      pha
      lda source
      sta target
      lda source+1
      sta target+1
      pla
      .endmacro

      .macro inc_ptr pointer
      .local skip
      inc pointer
      bne skip
      inc pointer+1
skip:
      .endmacro

      .macro dec_ptr pointer
      .local skip
      pha
      lda pointer
      bne skip
      dec pointer+1
skip:
      dec pointer
      pla
      .endmacro