
; A PROGRAM THAT PRINTS INTEGERS

; Include the external file
%include        'function11.asm'

; Where we enter the instructions to be executed.
SECTION .text
global _start
_start:
    mov     rsi, 0

countNumber:
    inc     rsi
    mov     rax, rsi
    call    intDisNewLine
    cmp     rsi, 15
    jne     countNumber

    call    theEnd
