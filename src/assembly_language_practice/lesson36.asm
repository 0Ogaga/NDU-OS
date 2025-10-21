; Web Crawler Client in 64-bit Assembly - STRICT ASM TUTOR PATTERN

%include 'function16.asm'       ; Your 64-bit functions library

SECTION .data
; --- HTTP REQUEST STRING ---
request_string:
    db 'GET / HTTP/1.1', 0Dh, 0Ah
    db 'Host: 139.162.39.66:80', 0Dh, 0Ah, 0Dh, 0Ah, 0h
request_len equ 43              ; Length of the request string.

; --- ADDRESS STRUCTURE FOR CONNECTION ---
sockaddr_in:
    dw      2                   ; AF_INET
    dw      0x5000              ; Port 80 (reversed bytes: 0x0050)
    dd      0x4227a28b          ; IP: 139.162.39.66 (little endian)
    dq      0                   ; Padding
sockaddr_len equ 16             ; Length of the structure (16 bytes).

SECTION .bss
buffer  resb 1                  ; Reserve 1 byte for response

SECTION .text
global _start

_start:
    ; Setup
    xor     rax, rax
    xor     rdi, rdi
    mov     r12, 0              ; R12 will hold the Connected FD

_socket:
    ; --- 1. CREATE THE SOCKET (SYS_SOCKET, RAX=41) ---
    mov     rdi, 2              ; PF_INET
    mov     rsi, 1              ; SOCK_STREAM
    mov     rdx, 6              ; IPPROTO_TCP
    mov     rax, 41             ; SYS_SOCKET
    syscall
    mov     r12, rax            ; Save FD in R12

_connect:
    ; --- 2. CONNECT TO REMOTE SERVER (SYS_CONNECT, RAX=42) ---
    mov     rdi, r12            ; Socket FD
    mov     rsi, sockaddr_in    ; Pointer to sockaddr
    mov     rdx, sockaddr_len   ; Length = 16
    mov     rax, 42             ; SYS_CONNECT
    syscall

_write:
    ; --- 3. SEND HTTP REQUEST (SYS_WRITE, RAX=1) ---
    mov     rdi, r12            ; Socket FD
    mov     rsi, request_string ; Buffer
    mov     rdx, request_len    ; Length
    mov     rax, 1              ; SYS_WRITE
    syscall

_read:
    ; --- 4. READ RESPONSE (SYS_READ, RAX=0) LOOP ---
    mov     rdx, 1              ; Read 1 byte
    mov     rsi, buffer         ; Buffer
    mov     rdi, r12            ; FD
    mov     rax, 0              ; SYS_READ
    syscall

    cmp     rax, 0              ; EOF?
    jz      _close

    ; Print 1-byte response
    mov     rax, buffer
    call    displaySomething              ; Must be 64-bit safe in function16.asm
    jmp     _read

_close:
    ; --- 5. CLOSE THE SOCKET (SYS_CLOSE, RAX=3) ---
    mov     rdi, r12
    mov     rax, 3              ; SYS_CLOSE
    syscall

_exit:
    call    theEnd                ; Exit function
