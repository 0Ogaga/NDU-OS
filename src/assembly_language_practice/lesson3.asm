; A PROGRAM THAT CALCULATES LENGHT OF STRING

; The area for data to be used in the program.
SECTION .data
    msg db "Aright. my lovely brave new world!", 0xa

; The area that contains our instructions.
SECTION .text
global _start
    
_start:
    ; This section calculates the length of the string by looping.
    mov     rdi, msg        ; Move address of our data to register rdi.
    mov     rax, rdi        ; Copy the address from rdi to rax to use as count.
    
nextchar:
    cmp     byte[rax], 0    ; Compare the byte pointed to by rax if it equals 0. 
    jz      finished        ; If rax matches 0, jump to the area of the program labeled finish.
    inc     rax             ; Increment the address in rax by one byte if current rax in not equal to 0. This will make rax point to the next byte.
    jmp     nextchar        ; Jump to the section of the code labeled nextchar. That's the begining of this label. So we have a loop.
    
finished:
    sub     rax, rdi        ; Subract the starting address from the final address. Since rdi and rax started as the same, and now rax has been incremented, when we subtract, what is left will be the number of bytes we have in the message to be displayed.

    ; Section of the code that displays the data.
    mov     rdx, rax
    mov     rsi, msg
    mov     rdi, 1
    mov     rax, 1
    syscall
    
    ; Section of the code that ends the program.
    mov     rax, 60         ; Set the syscall number for exit
    mov     rdi, 0          ; Returns 0 if there is no fault.
    syscall                 ; The Kernel exits the program.


; =============================================================================================================================================
; Questions and Observations. Add a '+' in front of the question if answered.
; 1. Which register is meant for what and why?
; 2. Does the order of how the registers appear matters and when does it matter?
; 3. 
; =============================================================================================================================================