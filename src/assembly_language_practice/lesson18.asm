; Fizzbuzz
; Compile with: nasm -f elf64 fizzbuzz.asm
; Link with: ld fizzbuzz.o -o fizzbuzz
; Run with: ./fizzbuzz

%include        'function16.asm'   ; Assuming this library includes displaySomething and intDis

SECTION .data
fizz        db      'Fizz', 0h     ; a message string
buzz        db      'Buzz', 0h     ; a message string
newline     db      0Ah, 0h        ; Explicit newline for reliable printing

SECTION .text
global  _start

_start:
    mov     rcx, 0           ; initialise our counter variable (64-bit RCX)

nextNumber:
    inc     rcx              ; increment our counter variable
    push    rcx              ; <--- PRESERVE THE COUNTER REGISTER!

.checkFizz:
    mov     rdx, 0           ; clear RDX for 64-bit division
    mov     rax, [rsp]       ; Load RCX value from the stack (the saved counter) into RAX for division
    mov     rbx, 3           ; divisor is 3
    div     rbx              ; RAX / RBX -> RDX (remainder)
    mov     rdi, rdx         ; move remainder into RDI (fizz flag)
    cmp     rdi, 0           ; compare if the remainder is zero
    jne     .checkBuzz
    mov     rax, fizz
    call    displaySomething

.checkBuzz:
    mov     rdx, 0           ; clear RDX for 64-bit division
    mov     rax, [rsp]       ; Load RCX value from the stack (the saved counter) into RAX for division
    mov     rbx, 5           ; divisor is 5
    div     rbx              ; RAX / RBX -> RDX (remainder)
    mov     rsi, rdx         ; move remainder into RSI (buzz flag)
    cmp     rsi, 0           ; compare if the remainder is zero
    jne     .checkInt
    mov     rax, buzz
    call    displaySomething

.checkInt:
    cmp     rdi, 0           ; Skip if Fizz was printed (RDI=0)
    je      .continue
    cmp     rsi, 0           ; Skip if Buzz was printed (RSI=0)
    je      .continue
    
    ; Print the number
    mov     rax, [rsp]       ; Load the actual counter value from the stack into RAX
    call    intDis           ; call integer printing function

.continue:
    ; Print Newline
    mov     rax, newline
    call    displaySomething

    pop     rcx              ; <--- RESTORE THE COUNTER REGISTER! (Increments in next loop)

    ; Loop Termination
    cmp     rcx, 150
    jne     nextNumber

    call    theEnd
