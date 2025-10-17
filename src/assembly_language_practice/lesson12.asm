; CALCULATOR (ADDITION)
; A PROGRAM THAT PRINTS INTEGERS

; Include the external file
%include        'function11.asm'

; Where we need to take action. Are we the ones taking the action or the CPU or the kernel? Taking action how?
SECTION .text
global _start
_start:
    mov     rax, 90
    mov     rdi, 9
    add     rax, rdi
    call    intDisNewLine

    call    theEnd
