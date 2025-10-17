; A PROGRAM THAT RECEIVES DATA FROM USER

; Include external files.
%include    'function7.asm'
; Section for data to be used.
SECTION .data
info1   db 'Oya, enter your name: ', 0
info2   db  'How you dey, ', 0
info3   db '?', 0

; Section for creating space for data to be received and used.
SECTION .bss    ; Where bss means Block Started by Symbol
takeReading:    resb    255

; This is the section that is implemented.
SECTION .text   
global _start
_start:
    ; Display the first information.
    mov     rax, info1
    call    displaySomething

    ; Part to receive data from user.
    mov     rdx, 255            ; Maximum number of bytes expecded.
    mov     rsi, takeReading    ; Address that stores data from user.
    mov     rdi, 0              ; File descriptor 0 is stdin.
    mov     rax, 0              ; syscall number for sys_read   
    syscall

    ; Display message 2
    mov     rax, info2
    call    displaySomething

    ; Display received message.
    mov     rax, takeReading
    call    displaySomething

    ; Add question mark
    mov     rax, info3
    call    displayWithNewLine      ; How to make this display in front of the name.    DO THIS AFTER COMPLETING THE 36 LESSONS.
    ; Exit
    call theEnd