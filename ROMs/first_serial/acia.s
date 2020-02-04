        .import __ACIA_START__
        .export ACIA_DATA
        .export ACIA_STATUS
        .export ACIA_COMMAND
        .export ACIA_CONTROL

ACIA_DATA    = __ACIA_START__ + $00
ACIA_STATUS  = __ACIA_START__ + $01
ACIA_COMMAND = __ACIA_START__ + $02
ACIA_CONTROL = __ACIA_START__ + $03
