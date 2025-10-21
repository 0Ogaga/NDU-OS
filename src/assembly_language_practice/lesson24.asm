;-----------------------------------------------
; File I/O in 64-bit Assembly (Linux Syscalls)
;-----------------------------------------------
;  - Creates a file named "readme.txt"
;  - Writes "Hello world!" into it
;  - Re-opens the same file in read-only mode
;  - Prints the file descriptor returned (should be 4)
;
; Assemble: nasm -f elf64 open_write_read_64.asm -o open_write_read_64.o
; Link:     ld open_write_read_64.o -o open_write_read_64
; Run:      ./open_write_read_64
;
; Requires: function16.asm (with intDisNewLine and theEnd)
;-----------------------------------------------

%include 'function16.asm'   ; Custom utility file (for printing and exit)

SECTION .data
filename db 'readme.txt', 0h    ; The name of the file to create
contents db 'Hello world!', 0h  ; The text we’ll write to the file

SECTION .text
global _start

_start:

;----------------------------------------------------------
; 1. CREATE the file (SYS_CREAT)
;    syscall number: 85
;    arguments:
;       RDI = pointer to filename
;       RSI = file mode (permissions, e.g., 0777o = rwxrwxrwx)
;----------------------------------------------------------
    mov     rdi, filename       ; Arg1 → address of "readme.txt"
    mov     rsi, 0777o          ; Arg2 → file permission bits (octal)
    mov     rax, 85             ; Syscall number for SYS_CREAT
    syscall                     ; OS creates file, returns FD (e.g., 3) in RAX

;----------------------------------------------------------
; 2. WRITE to the file (SYS_WRITE)
;    syscall number: 1
;    arguments:
;       RDI = file descriptor (from previous syscall)
;       RSI = address of data buffer (contents)
;       RDX = number of bytes to write
;----------------------------------------------------------
    mov     rdi, rax            ; Arg1 → use the FD returned by SYS_CREAT (3)
    mov     rsi, contents       ; Arg2 → address of "Hello world!"
    mov     rdx, 12             ; Arg3 → number of bytes to write (12)
    mov     rax, 1              ; Syscall number for SYS_WRITE
    syscall                     ; Write data to file

;----------------------------------------------------------
; 3. OPEN the file again (SYS_OPEN)
;    syscall number: 2
;    arguments:
;       RDI = pointer to filename
;       RSI = flags (0 = O_RDONLY → open for read only)
;       RDX = mode (not used for read)
;----------------------------------------------------------
    mov     rdi, filename       ; Arg1 → address of the same filename
    mov     rsi, 0              ; Arg2 → flag 0 = read-only
    mov     rax, 2              ; Syscall number for SYS_OPEN
    syscall                     ; Open the file, new FD (e.g., 4) returned in RAX

;----------------------------------------------------------
; 4. DISPLAY the new file descriptor (using helper function)
;----------------------------------------------------------
    call    intDisNewLine       ; Print integer (the FD value, e.g., "4") + newline

;----------------------------------------------------------
; 5. EXIT the program (custom quit function)
;----------------------------------------------------------
    call    theEnd              ; Clean exit
