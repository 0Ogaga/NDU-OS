; Execute Command in 64-bit Assembly using SYS_EXECVE
; This program replaces its process with /bin/echo to print a message.

; We do not need to include 'functions.asm' because the program ends
; by being replaced by the new process, so the 'theEnd' function is never reached.

SECTION .data
; The path to the executable file and its arguments.
command         db      '/bin/echo', 0       ; Path to the executable (must be full path)
arg1            db      'Hello World!', 0    ; Argument 1 for /bin/echo

; The argument array (argv) must be an array of 64-bit pointers (dq)
; terminated by a null pointer (0h).
arguments       dq      command              ; Pointer to the command name itself (argv[0])
                dq      arg1                 ; Pointer to the first argument (argv[1])
                dq      0                   ; Null-terminator for the argument array

; The environment array (envp) must also be a null-terminated array of 64-bit pointers (dq).
environment     dq      0h                   ; Null-terminator for the environment array (we pass no environment variables)

SECTION .text
global  _start

_start:
    ; 1. Set up the three arguments (in order: RDI, RSI, RDX)
    mov     rdi, command        ; RDI = Address of the file to execute (command)
    mov     rsi, arguments      ; RSI = Address of the arguments array (argv)
    mov     rdx, environment    ; RDX = Address of the environment variables array (envp)

    ; 2. Invoke the 64-bit EXECVE syscall
    mov     rax, 59             ; RAX = 59 (The 64-bit kernel opcode for SYS_EXECVE)
    syscall                     ; Execute the syscall.

; The program process is replaced by /bin/echo and never reaches this point.
; If execve fails, the program will continue here (and likely crash or exit abnormally).

; Since execve replaces the entire process, no explicit 'quit' or 'theEnd' is needed.