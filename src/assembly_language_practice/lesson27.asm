%include    'function16.asm'
 
SECTION .data
filename db 'readme.txt', 0h    ; the filename to create
contents  db '-updated-', 0h     ; the contents to write at the start of the file
 
SECTION .text
global  _start
 
_start:
    ; Create the file
    mov     rdi, filename
    mov     rsi, 1
    mov     rdx, 0
    mov     rax, 2
    syscall
    mov     rbx, rax

    ; Open the file
    mov     rdi, rbx
    mov     rsi, 0
    mov     rdx, 2
    mov     rax, 8
    syscall

    ; Write to the file
    mov     rdi, rbx
    mov     rsi, contents
    mov     rdx, 9
    mov     rax, 1  
    syscall

    ; Close the file
    mov     rdi, rbx
    mov     rax, 3
    syscall

    ; Exit the program
    call    theEnd