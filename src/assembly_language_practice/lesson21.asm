%include        'function16.asm'
 
SECTION .data
msg        db      'Seconds since Jan 01 1970: ', 0     ; a message string
 
SECTION .text
global  _start
 
_start:
 
    mov     rax, msg              ; move our message string into eax for printing
    call    displaySomething      ; call our string printing function
 
    mov     rax, 201              ; invoke SYS_TIME (kernel opcode 13)
    syscall                       ; call the kernel
 
    call    intDisNewLine         ; call our integer printing function with linefeed
    call    theEnd                ; call our quit function
