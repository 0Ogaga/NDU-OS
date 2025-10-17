; LESSON 5

; Call the required function

%include       'functions5.asm'

SECTION .data
    info    db '1st Message. This is a very simple message o!', 0xa
    info2   db '2nd message. Just a message', 0xa

SECTION .text
global _start
_start:
    mov     rax, info
    call    displaySomething

    mov     rax, info2
    call    displaySomething

    call    theEnd