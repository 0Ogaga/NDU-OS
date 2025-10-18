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


; A function for converting ASCII to integer (string to number).
atoi:
    ; THIS PART PREPARES OUR REGISTERS FOR USE.
    ; Save current values in the stack.
    push    rbx                 ; We do not include rax here because it will hold our return value when we finish.
    push    rcx 
    push    rdx 
    push    rsi 
    
    ; CORRECTION: The 64-bit calling convention passes the first argument (the string address) in RDI.
    mov     rsi, rdi            ; Move the pointer from RDI (where the OS put the argument) into RSI.
                                ; Why? RSI is our 'Source Index'—it's conventional to use it to read data.
                                ; We use RSI to read the string without changing RDI.
    mov     rax, 0              ; Initialize RAX to 0.
                                ; Why? RAX will hold our final, calculated integer number (the return value).
    mov     rcx, 0              ; Initialize RCX to 0.
                                ; Why? RCX is our counter—it tracks which character (digit) we are currently reading in the string.

; --- MAIN CONVERSION LOOP ---
_multiplyLoop:
    xor     rbx, rbx            ; Clear RBX. 'XORing' a register with itself is the fastest way to set it to zero.
                                ; How does this reset? Any bit XORed with itself is 0 (e.g., 1^1=0, 0^0=0).
    mov     bl, [rsi+rcx]       ; Read a single character (1 byte) from the string into BL (the lower 8 bits of RBX).
                                ; What is going on with rsi+rcx? This is **array indexing**. RSI is the base address of the string,
                                ; and RCX is the offset (0 for the first character, 1 for the second, etc.).
    
    cmp     bl, 48              ; Check if the character's ASCII value is less than 48 (the ASCII value for '0').
                                ; What is happening here? We are testing if the character is a digit or something before '0' (like a space or a negative sign).
    jl      _finished           ; If it's less than '0', it's not a digit, so we stop and jump to _finished.

    cmp     bl, 57              ; Check if the character's ASCII value is greater than 57 (the ASCII value for '9').
                                ; What is happening here? We are testing if the character is a digit or something after '9'.
    jg      _finished           ; If it's greater than '9', it's not a valid digit, so we stop and jump to _finished.
    
    sub     bl, 48              ; Convert the character to its number value.
                                ; What is happening here? We subtract the ASCII value of '0' (48) from the character's ASCII value.
                                ; E.g., '5' (53) - '0' (48) = 5.
                                
    add     rax, rbx            ; Add the new single-digit number (now in RBX/BL) to our running total in RAX.
                                ; Why? We've just calculated the value of the current digit, so we add it to the number we are building.
    
    mov     rbx, 10             ; Load the number 10 into RBX.
                                ; Why are we doing this? We need to multiply the running total by 10 to shift its place value.
                                ; E.g., if total is 1, we multiply by 10 to make it 10, so we can add the next digit (2) to get 12.
    mul     rbx                 ; Multiply RAX by RBX (10). The result overwrites RAX.
    
    inc     rcx                 ; Increment the counter.
                                ; Why this step? To move to the next character/digit in the string on the next loop iteration.
    jmp     _multiplyLoop       ; Go back to the top of the loop to process the next character.

; --- CLEANUP AND FINAL DIVISION ---
_finished:
    cmp     rcx, 0              ; Check if the counter is 0.
                                ; Why? If RCX is 0, it means no digits were found (e.g., the string was empty or contained non-digits).
    je      _restore            ; If no digits were found, skip the division.

    mov     rbx, 10             ; Load the number 10 into RBX.
                                ; What is happening here and why? The multiplication step in the loop ran one too many times after the last digit was added.
                                ; We need to divide by 10 to shift the final result back to its correct value.
    div     rbx                 ; Divide RAX (our result) by RBX (10).
                                ; Why? This corrects the place value of the final integer.

; --- FUNCTION END: RESTORE ---
_restore:
    ; Restore old contents of registers (in reverse order of the PUSHes).
    pop     rsi                 ; Restore RSI's original value.
    pop     rdx                 ; Restore RDX's original value.
    pop     rcx                 ; Restore RCX's original value.
    pop     rbx                 ; Restore RBX's original value.
    ret
