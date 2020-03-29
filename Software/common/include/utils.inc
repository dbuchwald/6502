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