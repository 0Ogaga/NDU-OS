; SIMPLE DISPLAY

; This is where we store data we are going to make use of in the program.
SECTION .data
    msg db 'Why always hello world!', 0xa

; This is where we write the instructions to be executed by the CPU.
SECTION .text

global _start ; The 'global' makes our start label visible to the linker.
_start:         ; This label is where the program starts executing.
    mov     rax, 1          ; The syscall number for sys_write is 1
    mov     rdi, 1          ; File descriptor 1 is stdout
    mov     rsi, msg        ; Address of string to output
    mov     rdx, 24         ; Number of bytes to write.
    syscall                 ; Call the kernel so the CPU executes in kernel mode.
    
    ; Exit section
    mov     rax, 60         ; Ask the CPU to exit the kernel mode.
    mov     rdi, 0          ; Returns 0 if there is no fault.
    syscall                 ; Call the kernel to exit the program.


    
    ; HINTS
    ; A label is a named location in the code