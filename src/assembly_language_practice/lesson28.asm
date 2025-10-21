%include    'function16.asm'
 
SECTION .data
filename db 'readme.txt', 0h    ; the filename to create

SECTION .text
global  _start
 
_start:
    ; Set arguments for system unlink
    mov    rdi, filename
    mov    rax, 87          ; syscall: unlink
    syscall

    ; Exit the program
    call    theEnd
