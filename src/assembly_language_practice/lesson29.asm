; Code: socket.asm
; Objective: Create a 64-bit IPv4 TCP socket and display its File Descriptor (FD).

%include 'function16.asm' ; LAYMAN: Include the helper file for printing/exiting.
                          ; PRO: Include external assembly routines for I/O and process control.

SECTION .text             ; LAYMAN: This is the main part where the CPU's instructions go.
global _start             ; PRO: Defines the entry point label for the linker.

_start:
    ; LAYMAN: Clear two key storage slots (registers) to zero before we start.
    xor rax, rax          ; PRO: Clears the RAX register.
    xor rdi, rdi          ; PRO: Clears the RDI register.

_socket:
    ; --- SET UP ARGUMENTS IN REGISTERS (The 64-bit Linux Syscall Convention) ---
    ; LAYMAN: We're writing our 'order ticket' in specific register slots (RDI, RSI, RDX).
    ; PRO: Linux x86_64 passes syscall arguments in the order RDI, RSI, RDX, R10, R8, R9.

    ; Argument 1: Domain (PF_INET = 2 for IPv4)
    mov rdi, 2            ; LAYMAN: Say we want to use the standard Internet (IPv4) addressing.
                          ; PRO: Sets RDI to PF_INET (Protocol Family Internet).

    ; Argument 2: Type (SOCK_STREAM = 1 for TCP)
    mov rsi, 1            ; LAYMAN: Say we want a reliable, connection-based connection (TCP).
                          ; PRO: Sets RSI to SOCK_STREAM.

    ; Argument 3: Protocol (IPPROTO_TCP = 6)
    mov rdx, 6            ; LAYMAN: Specify that the exact protocol is TCP.
                          ; PRO: Sets RDX to IPPROTO_TCP.

    ; --- INVOKE SYS_SOCKET ---
    mov rax, 41           ; LAYMAN: Put the 'Order Number 41' (Create Socket) into the special call register.
                          ; PRO: Sets RAX to 41 (SYS_SOCKET syscall number).

    syscall               ; LAYMAN: Hit the 'Execute' button to tell the Kernel to run the function.
                          ; PRO: Executes the kernel system call. The resulting File Descriptor (FD) is returned in RAX.

    ; --- PRINT RESULT ---  
    call intDisNewLine    ; LAYMAN: Show us the File Descriptor number the Kernel gave us.
                          ; PRO: Calls a routine to display the integer value of RAX to stdout.

_exit:
    call theEnd           ; LAYMAN: Cleanly stop the program and hand control back to the terminal.
                          ; PRO: Calls a routine that executes the SYS_EXIT syscall.