; LESSON 6

; Call the required function

%include       'functions5.asm'

SECTION .data
    info    db '1st Message. This is a very simple message o!', 0xa, 0
    info2   db '2nd message. Just a message', 0xa, 0

SECTION .text
global _start
_start:
    mov     rax, info
    call    displaySomething

    mov     rax, info2
    call    displaySomething

    call    theEnd