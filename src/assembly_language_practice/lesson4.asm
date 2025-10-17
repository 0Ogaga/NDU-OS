; Subroutines are functions.
; Stack is a special type of memory.

; USING FUNCTIONS

; Section for data to be used in the program.
Section .data
    m db 'Just something simple to dispdddddddddddddddddddddddddddddddddlay.', 0xa
    
; Section where we write the instructions to be executed.
Section .text
    global _start
_start:
        mov     rax, m                          ; Place the address of our message in rax so our functin can find it. 
        call    myFunctionForLengthOfString     ; Call the function.

        ; This part is the same as lesson 1, 2 and 3 but the number of bytes is represented by rax now.
        mov     rsi, m
        mov     rdx, rax
        mov     rax, 1
        mov     rdi, 1
        syscall
        mov     rax, 60
        mov     rdi, 0
        syscall

; The function for lenght of string.
myFunctionForLengthOfString:
        push    rdi             ; Save the content of rdi in stack so we can make use of rdi.
        mov     rdi, rax        ; Put rax in rdi because we are going to use rax as the register for our message.
    
    ; This part is the same as lesson 3.
    nextthing:
        cmp     byte[rax], 0
        jz      naTheEndBeThis
        inc     rax
        jmp     nextthing
    
naTheEndBeThis:
    sub     rax, rdi
    pop     rdi
    ret