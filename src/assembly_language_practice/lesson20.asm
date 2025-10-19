; Fork (Process Duplication) in 64-bit Assembly
; This program uses SYS_FORK to create a child process and prints a different message
; in each process based on the return value.

%include        'function16.asm'    ; Include your functions library

SECTION .data
childMsg        db      'This is the child process', 0h      ; Child's message
parentMsg       db      'This is the parent process', 0h     ; Parent's message

SECTION .text
global  _start

_start:
    ; 1. Invoke the 64-bit SYS_FORK syscall
    mov     rax, 57             ; RAX = 57 (The 64-bit kernel opcode for SYS_FORK)
    syscall                     ; Execute the syscall. The return value (PID) is in RAX.

    ; 2. Check the return value in RAX to distinguish processes
    cmp     rax, 0              ; Compare the return value (PID) to zero.
    jz      child               ; Jump if the result is Zero (Child Process).

parent:
    ; --- PARENT PROCESS LOGIC ---
    ; The parent continues here if RAX was non-zero (the child's PID).
    push    rax     ; I had to save the content of rax since we are going to use it for printing here.
    mov     rax, parentMsg      ; Use RSI to pass the string address (your function convention)
    call    displayWithNewLine  ; Print the parent's message.

    call    theEnd              ; The parent process exits cleanly.
    pop     rax     ; I restored the content here.

child:
    ; --- CHILD PROCESS LOGIC ---
    ; The child starts here because RAX was zero.
    push    rax
    mov     rax, childMsg       ; Use RSI to pass the string address
    call    displayWithNewLine  ; Print the child's message.
    pop     rax
    call    theEnd              ; The child process exits cleanly.