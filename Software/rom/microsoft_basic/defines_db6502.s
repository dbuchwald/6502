.import __USERRAM_START__

; configuration
CONFIG_2C := 1

CONFIG_DATAFLG := 1
CONFIG_NULL := 1
CONFIG_PRINT_CR := 0 ; print CR when line end reached
CONFIG_SCRTCH_ORDER := 3
CONFIG_SMALL := 1

; zero page
ZP_START1 = $00
ZP_START2 = $0D
ZP_START3 = $5B
ZP_START4 = $65

;extra ZP variables
USR             := $000A

; inputbuffer
INPUTBUFFER     := $0900

; constants
STACK_TOP		:= $FC
SPACE_FOR_GOSUB := $33
NULL_MAX		:= $0A
WIDTH			:= 72
WIDTH2			:= 56

; memory layout
RAMSTART2		:= __USERRAM_START__
