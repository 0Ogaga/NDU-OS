; Socket, Fork, Read, and Write in 64-bit Assembly - STRICT ASM TUTOR PATTERN

%include "function16.asm"        ; Your 64-bit functions library (MUST BE 64-bit ready)

SECTION .data
; --- CRITICAL: HTTP RESPONSE STRING ---
response_string:
    db 'HTTP/1.1 200 OK', 0Dh, 0Ah
    db 'Content-Type: text/html', 0Dh, 0Ah
    db 'Content-Length: 14', 0Dh, 0Ah, 0Dh, 0Ah
    db 'Hello World!', 0Dh, 0Ah, 0h
response_len equ 78             ; The total length of the response string.

; --- Address Structure for Binding ---
sockaddr_in:
    dw      2                   ; AF_INET
    dw      0x2923              ; Port 9001
    dd      0                   ; 0.0.0.0
    dq      0                   ; Padding
sockaddr_len equ 16             

SECTION .bss
buffer  resb 255                ; Reserve 255 bytes for the client request buffer

SECTION .text
global _start

_start:
    ; Setup 
    xor     rax, rax
    xor     rdi, rdi
    mov     r12, 0              ; R12 for Listening FD
    mov     r13, 0              ; R13 for Client FD

_socket:
    ; --- 1. CREATE THE SOCKET (RAX=41) ---
    mov     rdi, 2              ; PF_INET
    mov     rsi, 1              ; SOCK_STREAM
    mov     rdx, 6              ; IPPROTO_TCP
    mov     rax, 41             ; SYS_SOCKET
    syscall
    mov     r12, rax            ; Save listening FD

_bind:
    ; --- 2. BIND THE SOCKET (RAX=49) ---
    mov     rdi, r12
    mov     rsi, sockaddr_in
    mov     rdx, sockaddr_len
    mov     rax, 49             ; SYS_BIND
    syscall

_listen:
    ; --- 3. LISTEN ON THE SOCKET (RAX=50) ---
    mov     rdi, r12
    mov     rsi, 1
    mov     rax, 50             ; SYS_LISTEN
    syscall

_accept:
    ; --- 4. ACCEPT A CONNECTION (RAX=43) ---
    mov     rdi, r12
    mov     rsi, 0
    mov     rdx, 0
    mov     rax, 43             ; SYS_ACCEPT
    syscall
    mov     r13, rax            ; Save client FD

_fork:
    ; --- 5. FORK (RAX=57) ---
    mov     rax, 57             ; SYS_FORK
    syscall
    cmp     rax, 0
    je      _read

    ; --- Parent process ---
    jmp     _accept

_read:
    ; --- 6. READ FROM CLIENT (RAX=0) ---
    mov     rdi, r13
    mov     rsi, buffer
    mov     rdx, 255
    mov     rax, 0              ; SYS_READ
    syscall

    ; Save number of bytes read in r14
    mov     r14, rax
    mov     rax, buffer
    ; call    sprintLF          ; Optional: print request

_write:
    ; --- 7. WRITE RESPONSE TO CLIENT (RAX=1) ---
    mov     rdi, r13
    mov     rsi, response_string
    mov     rdx, response_len
    mov     rax, 1              ; SYS_WRITE
    syscall

    ; Close client FD
    mov     rdi, r13
    mov     rax, 3              ; SYS_CLOSE
    syscall

_exit:
    ; Child exits here
    call    theEnd
