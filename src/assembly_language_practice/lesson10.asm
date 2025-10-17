; A PROGRAM THAT COUNTS FROM 1 TO 10

; Include the external file
%include    'function7.asm'

; Text section
SECTION .text
global _start
_start:
    ; We are using rsi as our counting register (why?)
    mov     rsi, 0      ; Initialize to 0

countNumbers:
    inc     rsi         ; Increase rsi to the first value which is 1 (and 2 the next time and so on).
    mov     rax, rsi    ; Moving the address of our number to rax allows us convert the number to its ASCII value (in rax) without touching its value in rsi so we can continue to increament it in order.
    add     rax, 48     ; Here we convert the number to its ASCII value
    push    rax         ; This saves the content of rax (whihc is the converted number in our case) into stack whose address is by default, held in rsp.
    mov     rax, rsp    ; Move the content of rsp (our number) in to rax from printing.
    call    displayWithNewLine    ; To display the number.

    pop     rax         ; This is just to remove the number we have already used from the stack so we dont have unneeded bytes taking up space.
    cmp     rsi, 10     ; Compare the content of rsi if we have gotten to 10.
    jne     countNumbers; If not, return to our label.

    call    theEnd      ; If yes, end the program.
