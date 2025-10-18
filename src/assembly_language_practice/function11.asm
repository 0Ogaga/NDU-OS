; FUNCTIONS

; A function for printing of integers.
intDis:
    ; Save all current values of each register in a stack
    push    rax
    push    rsi
    push    rdx
    push    rdi     

    mov     rsi, 0          ; Set to 0 for counting how many byte we need to print.
divideLoop:
    inc     rsi             ; Increase rsi, that's start counting.
    mov     rdx, 0          ; Empty rdx since we are going to make use of it to save to save the remainder of the integer devision (idiv).
    mov     rdi, 10         ; Put 10 in rdi since we are going to use it to divide our numbers.
    idiv    rdi             ; Whatever that is in rax is what is divided automatically. And the reminder goes to rdx.
    add     rdx, 48         ; We add 48 to the remainder which is actually the number. This converts it to the corresponding ASCII character.
    push    rdx             ; Save the converted integer in its ASCII form in the stack
    cmp     rax, 0          ; Since rax holds the answer part (whole number part) we check, if it is 0, then we repeat the loop. It means the number is not up to 10.
    jnz     divideLoop      ; Repeat the loop if it is not zero.
printLoop:
    dec     rsi             ; Count down each byte that we put on the stack. Since we are taking from the stack. We take in reverse. So decrementing rsi.
    mov     rax, rsp        ; Move stack pointer into rax for printing
    call    displaySomething
    pop     rax             ; Remove the last character from the stack. So we work with the next character in the next iteration.
    cmp     rsi, 0          ; Is this checking if we have printed all bytes. That means there is nothing left to decrease to, which we placed in the stack.
    jnz     printLoop

    ; Restore previous contents of the registers.
    pop     rdi
    pop     rdx
    pop     rsi
    pop     rax
    ret

; A function that prints integers with new line character
intDisNewLine:
    call    intDis
    push    rax
    mov     rax, 0xa
    push    rax
    mov     rax, rsp
    call    displaySomething
    pop     rax
    pop     rax
    ret


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

    mov     rax, 0xa
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