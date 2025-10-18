; Namespace Demonstration in 64-bit Assembly
; This program demonstrates the use of local labels (namespaces) using your 64-bit functions.

%include    'function16.asm' ; Include your functions library (assuming you saved your combined functions as 'functions.asm')

SECTION .data
msg1        db      'Jumping to .finished label.', 0       ; Message 1
msg2        db      'Inside subroutine number: ', 0        ; Message 2 (Partial)
msg3        db      'Inside global finished.', 0           ; Message 3 (Final)

SECTION .text
global _start
_start:
   
subrountineOne:
    mov     rax, msg1
    call    displayWithNewLine
    jmp     .finished
.finished:
    mov     rax, msg2
    call    displaySomething
    mov     rax, 1
    call    intDisNewLine

subrountineTwo:
    mov     rax, msg1
    call    displayWithNewLine
    jmp     .finished
.finished:
    mov     rax, msg2
    call    displaySomething
    mov     rax, 2
    call    intDisNewLine

    mov     rax, msg1
    call    displayWithNewLine
    jmp     finished
finished:
    mov     rax, msg3
    call    displayWithNewLine
    call    theEnd



    ; This program demonstrates how a single label name, like '.finished', can be used
; multiple times without conflict. It shows the concept of a "local label" or "namespace".

%include    'function16.asm' ; This line includes all the functions we wrote in a separate file, so we can use them here.

SECTION .data
; This is where we store our text messages (data). Each line ends with a '0'
; which acts as a special marker to show the end of the string.
msg1        db      'Jumping to .finished label.', 0
msg2        db      'Inside subroutine number: ', 0
msg3        db      'Inside global finished.', 0

SECTION .text
; This is where the computer's instructions are stored.
global _start
; This tells the linker that the program's starting point is the label named "_start".
_start:
; The program starts here and the processor will simply continue to the next line.
; It does not 'call' a function, it just moves to the next instruction in sequence.
    
subrountineOne:
; This is a global label. The labels below it, starting with a '.', belong to its "namespace".
    mov     rax, msg1
; We move the memory address of our first message into the RAX register.
; This is the standard place to put the first argument for a function, but in this case,
; it is just a place to store our string's address.
    call    displayWithNewLine
; We call the function that prints the string currently stored in RAX, followed by a new line.
    jmp     .finished
; We jump to a label named ".finished". Because we are inside "subrountineOne",
; the computer knows we mean the local ".finished" label below it.
    
.finished:
; This is the local label. It is a separate code block that acts as a destination for the JMP instruction above.
    mov     rax, msg2
; We move the address of our second message into RAX.
    call    displaySomething
; We call a function to print this message.
    mov     rax, 1
; We move the number 1 into RAX. This is the argument for the next function.
    call    intDisNewLine
; We call a function to print the number in RAX, followed by a new line.
; The program will continue to the next instruction below this section.

subrountineTwo:
; This is another global label. It creates a brand new namespace.
; The ".finished" label below it is a completely separate destination from the previous one.
    mov     rax, msg1
; We move the address of the first message into RAX.
    call    displayWithNewLine
; We print the message.
    jmp     .finished
; We jump to the local label ".finished" again. But this time, the computer knows to jump to the one under "subrountineTwo".
    
.finished:
; This is the second local label named ".finished". It is a different code block than the one before it.
    mov     rax, msg2
; We move the address of the second message into RAX.
    call    displaySomething
; We print the message.
    mov     rax, 2
; We move the number 2 into RAX. This is the argument for the next function.
    call    intDisNewLine
; We print the number and a new line.
; The program continues to the next set of instructions.

    mov     rax, msg1
; We move the address of the first message into RAX.
    call    displayWithNewLine
; We print the message.
    jmp     finished
; We jump to a label named "finished" with NO dot. This is a GLOBAL label.
; Since there's only one global label with this name, the jump is unambiguous.
    
finished:
; This is the global finished label.
    mov     rax, msg3
; We move the address of the third message into RAX.
    call    displayWithNewLine
; We print the message.
    call    theEnd
; We call the function that stops the program and exits cleanly.