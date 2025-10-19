; Create
; Compile with: nasm -f elf create.asm
; Link with (64 bit systems require elf_i386 option): ld -m elf_i386 create.o -o create
; Run with: ./create
 
%include    'function16.asm'
 
SECTION .data
filename db 'readme.txt', 0    ; the filename to create
 
SECTION .text
global  _start
 
_start:
 
    mov     rsi, 0777o          ; set all permissions to read, write, execute
    mov     rdi, filename       ; filename we will create
    mov     rax, 85              ; invoke SYS_CREAT (kernel opcode 8)
    syscall               ; call the kernel
 
    call    theEnd                ; call our quit function
