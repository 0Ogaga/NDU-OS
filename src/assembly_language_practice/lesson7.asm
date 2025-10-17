

; Call the required function

%include       'function7.asm'

SECTION .data
    info db '1st Message. This is a very simple message o!',0
    info2 db '2nd message. Just a message',0

SECTION .text
global _start
_start:
    mov     rax, info
    call    displayWithNewLine

    mov     rax, info2
    call    displayWithNewLine

    call    theEnd