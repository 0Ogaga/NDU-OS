; Socket and Bind in 64-bit Assembly - ASM TUTOR PATTERN

%include "function16.asm"       ; Your functions (subroutines) library

SECTION .data
; --- The Address Structure for Binding ---
sockaddr_in:
    ; 1. Family: 2 bytes (AF_INET = 2)
    dw      2                   
    ; 2. Port: 2 bytes (Port 9001 in reversed bytes: 0x2329)
    dw      0x2923              
    ; 3. IP Address: 4 bytes (0.0.0.0 / INADDR_ANY)
    dd      0                   
    ; 4. Padding: 8 bytes 
    dq      0                   
    
sockaddr_len equ 16             ; Length of the structure (16 bytes).


SECTION .text
global _start
 
_start:
    ; (Keeping the original style of XORing registers, though not strictly required here)
    xor     rax, rax            
    xor     rdi, rdi            

_socket:
    ; --- BLOCK 1: CREATE THE SOCKET (SYS_SOCKET, RAX=41) ---
    ; This replaces the 32-bit SYS_SOCKETCALL (subroutine 1).
    
    mov     rdi, 2              ; RDI = Arg 1: PF_INET (Domain)
    mov     rsi, 1              ; RSI = Arg 2: SOCK_STREAM (Type)
    mov     rdx, 6              ; RDX = Arg 3: IPPROTO_TCP (Protocol)
    mov     rax, 41             ; RAX = SYS_SOCKET
    syscall                     
    
    ; Save the File Descriptor (FD) returned in RAX into RBX.
    mov     rbx, rax           
     
    ; Print the FD (optional check from Lesson 29)  
    call    intDisNewLine       

_bind:
    ; --- BLOCK 2: BIND THE SOCKET (SYS_BIND, RAX=49) ---
    ; This replaces the 32-bit SYS_SOCKETCALL (subroutine 2).
    
    ; Argument 1: Socket File Descriptor
    mov     rdi, rbx            ; RDI = The Socket FD (read from RBX)

    ; Argument 2: Address structure pointer
    mov     rsi, sockaddr_in    ; RSI = Address of the structure

    ; Argument 3: Address structure length
    mov     rdx, sockaddr_len   ; RDX = Length of the structure (16 bytes)

    ; Invoke SYS_BIND
    mov     rax, 49             ; RAX = SYS_BIND
    syscall                     ; Returns 0 on success.

; --- PROGRAM EXIT ---
_exit:
    call    theEnd              ; Call the quit function
