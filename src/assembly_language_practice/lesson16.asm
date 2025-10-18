; This program takes numbers from the command line, adds them up, and prints the total.

%include    'function16.asm' ; Include our library of functions (like atoi, intDisNewLine, theEnd).

SECTION .text           ; This is where the actual executable code lives.
global  _start          ; Make _start visible to the linker (the entry point of the program).

_start:
    ; --- STACK SETUP: READING COMMAND-LINE ARGUMENTS ---
    ; When the program starts, the stack contains the argument count (argc).

    pop     rcx         ; Get the first value from the stack: the argument COUNT (argc). RCX is our counter.
    pop     rdi         ; Get the second value.i
    
    sub     rcx, 1      ; Subtract 1 from the count. This ignores the program name, leaving only the user's numbers.
    mov     rsi, 0      ; Initialize our running total (SUM) to zero in RSI. 

nextArg:
    ; --- LOOP START: PROCESS NEXT ARGUMENT ---
    cmp     rcx, 0      ; Check if the argument count (RCX) is zero.
    jz      noMoreArgs  ; If it is zero, jump to the end section.

    pop     rdi         ; Pop the next item off the stack. This is the **address** of the argument string. 
                        ; FIX: The pointer goes into RDI because it's the standard place for the 1st argument to 'atoi'.
    call    atoi        ; Call the atoi function. It takes the string in RDI, converts it to a number, and puts the result in RAX.

    add     rsi, rax    ; Add the number we just converted (in RAX) to our running sum (in RSI).
    
    dec     rcx         ; Decrement the counter, showing we have processed one argument.
    jmp     nextArg     ; Jump back to the top of the loop to check the next argument.

noMoreArgs:
    ; --- PROGRAM END: PRINT RESULT AND EXIT ---
    mov     rax, rsi    ; Move the final sum from RSI into RAX. RAX is where our print function expects the number.
    call    intDisNewLine ; Call our function to print the number in RAX followed by a newline.
    
    call    theEnd      ; Call our function to cleanly exit the program.