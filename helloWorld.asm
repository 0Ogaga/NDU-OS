; 1st and 2nd EXAMPLE FROM PRACTICE FROM asmtutor. 
; Simple display program.

; This is where we declare variables.
SECTION .data
    m db 0xa, 'It is working now', 0xa, 0xa, 0xa, 0xa  ; m is just the variable name.
                                ; db tells the CPU 'define byte'. That is, our data is in bytes.
                                ; 0xa give a new line.

; This is the area where execution of takes place.
SECTION .text
global _start   ; This allows the kernel to recognize the start label.
_start:
    mov rdi, 1  ; The type of file is the standard output file (that is 1).
    mov rsi, m  ; This is the what we want to display.
    mov rax, 1  ; This tells the system call the it is a write operation. So we write to screen.
    mov rdx, 13 ; The number of characters to be displayed.
    syscall     ; We call the kernel to take action.
























    
    ; ; Exit section.
    ; mov rax, 60 ; This is the code for exiting the kernel (that's 60 which is moved to the regiser where the kernel gets the instruction of what to do.
    ; mov rdi, 0  ; Just to indicate a successful exit.
    ; syscall     ; This is just the kernel taking action. 