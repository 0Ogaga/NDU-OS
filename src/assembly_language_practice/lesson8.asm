; LESSON 8

%include    'function7.asm' ; Import file containing required
                            ; functions (subroutines).

SECTION .text       ; No data section since we will get data
                    ; from command line.
global _start
_start:
    pop rsi         ; It is the register that holds the number of arguments in a program.
checkArg:
    cmp     rsi, 0  ; Compare rcx with 0.
    jz      endam   ; That is if there are no more arguments.
    pop     rax     ; The next argument is brought fought (i.e, rax).
    call    displayWithNewLine 
    dec     rsi     ; Decrease rsi by 1. So we have 1 argument less than what we used to have.
    jmp     checkArg
endam:
    call theEnd