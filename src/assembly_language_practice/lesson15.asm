; CALCULATOR (DIVISION)


; Include the external file
%include        'function11.asm'

; Section for data
SECTION .data 
info db ' remainder '
; Where we need to take action. Are we the ones taking the action or the CPU or the kernel? Taking action how?
SECTION .text
global _start
_start:
    mov     rax, 90
    mov     rdi, 9
    div     rdi
    call    intDis              ; Display the number without new line to allow the next thing show in front of it.
    ; Display the message "remainder ".
    mov     rax, info
    call    displaySomething
    ; Note that the remainder part is usually stored in rdx. So we need to display what is in rdx.
    mov     rax, rdx
    call    intDisNewLine
    ; End.
    call    theEnd
