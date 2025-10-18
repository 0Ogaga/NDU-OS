; FUNCTIONS

; A function that calculates the length of strings.
lenSt:
    push    rdi
    mov     rdi, rax
charaternext:
    cmp     byte[rax], 0
    jz      finitooo
    inc     rax
    jmp     charaternext
finitooo:
    sub     rax, rdi
    pop     rdi
    ret

; A function that displays a message (strng).
displaySomething:
    push    rdx
    push    rsi
    push    rdi
    push    rax

    call lenSt
    mov     rdx, rax

    pop     rax
    mov     rsi, rax
    mov     rax, 1
    mov     rdi, 1

    
    syscall
    pop     rdi
    pop     rsi
    pop     rdx
    
    ret

; A function 
displayWithNewLine:
    call    displaySomething
    push    rax

    mov     rax, 0xa            ; Why not move 0xa into a different register and then move it to rax? How about moving 0xa directly to rax and then call the displaySomething function?
    push    rax
    mov     rax, rsp           
    call    displaySomething

    pop     rax
    pop     rax
    
    ret

; A function that exists a program.
theEnd:
    mov     rax, 60
    mov     rdi, 0
    syscall
    ret