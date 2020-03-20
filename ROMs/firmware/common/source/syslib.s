        .include "syscalls.inc"

        .export _call_blink_init
        .export _call_blink_led
        .export _call_delay_ms

        .code
        
_call_blink_init:
        jmp (_syscall_blink_init)

_call_blink_led:
        jmp (_syscall_blink_led)

_call_delay_ms:
        jmp (_syscall_delay_ms)
