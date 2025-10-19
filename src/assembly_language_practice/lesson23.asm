; Write
; Compile with: nasm -f elf write.asm
; Link with (64 bit systems require elf_i386 option): ld -m elf_i386 write.o -o write
; Run with: ./write
 
%include    'function16.asm'
 
SECTION .data
filename db 'readme.txt', 0h    ; the filename to create
contents db 'Next time, small small open this file!', 0h  ; the contents to write
 
SECTION .text
global  _start
 
_start:
 
    mov     rsi, 0777o          ; code continues from lesson 22
    mov     rdi, filename
    mov     rax, 85
    syscall
 
    mov     rdx, 12             ; number of bytes to write - one for each letter of our contents string
    mov     rsi, contents       ; move the memory address of our contents string into ecx
    mov     rdi, rax            ; move the file descriptor of the file we created into ebx
    mov     rax, 1              ; invoke SYS_WRITE (kernel opcode 4)
    syscall                     ; call the kernel
 
    call    theEnd                ; call our quit function