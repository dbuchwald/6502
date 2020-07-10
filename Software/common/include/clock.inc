; Translate clock mode flag to compilation parameters
.if clock_mode_flag=0 ; slow
  fastclock=0
  clock_mhz=0
  clock_divider=0
.else
  fastclock=1
  .if clock_mode_flag=1 ; 250k
    clock_mhz=0
    clock_divider=1
  .else
    clock_divider=0 
    .if clock_mode_flag=2 ; 1m
      clock_mhz=1
    .elseif clock_mode_flag=3 ; 2m
      clock_mhz=2
    .elseif clock_mode_flag=4 ; 4m
      clock_mhz=4
    .elseif clock_mode_flag=5 ; 8m
      clock_mhz=8
    .endif
  .endif
.endif
