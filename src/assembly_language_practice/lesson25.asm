; THE OUTPUT IS JUSJT GIVING OUT NUMBERS

; Open
; Compile with: nasm -f elf open.asm
; Link with (64 bit systems require elf_i386 option): ld -m elf_i386 open.o -o open
; Run with: ./open
 
%include    'function16.asm'
 
SECTION .data
filename db 'readme.txt', 0    ; the filename to create
contents db 'Hello world!', 0  ; the contents to write

SECTION .bss
fileContents    resb 255,       ; Variable to store file contents.
 
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
 
    mov     rsi, 0              ; flag for readonly access mode (O_RDONLY)
    mov     rdi, filename       ; filename we created above
    mov     rax, 2              ; invoke SYS_OPEN (kernel opcode 5)
    syscall                     ; call the kernel

    mov     rdx, 12             ; Number of bytes to be read.
    mov     rsi, fileContents   ; Move the memory address of our file contents variable
    mov     rdi, rax            ; Move file descriptor into rdi (that's the type of file to be executed).
    mov     rax, 0              ; Invoke the system read.
    syscall

    mov     rax, fileContents
    call    displayWithNewLine
 
   call    theEnd              ; call our quit function