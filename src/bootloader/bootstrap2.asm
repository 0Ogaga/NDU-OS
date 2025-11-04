; ===============================================================
; BOOTLOADER - bootstrap2.asm
; ===============================================================

[org 0x7C00]
bits 16

start:
    ; --- Display title and loading message ---
    mov si, title_string
    call print_string

    ; --- Load kernel from disk ---
    call load_kernel_from_disk

    jmp 0900h:0000h    ; Jump to kernel start

; ===============================================================
; Load kernel from disk (one sector at 0900:0000)
; ===============================================================
load_kernel_from_disk:
    mov bx, 0000h    ; offset in memory
    mov ax, 0900h
    mov es, ax

    mov ah, 02h      ; BIOS read sectors
    mov al, 01h      ; number of sectors to read (1)
    mov ch, 0h       ; cylinder
    mov cl, 02h      ; sector number (2nd sector)
    mov dh, 0h       ; head
    mov dl, 0h       ; floppy disk (0h)
     
    int 13h          ; BIOS interrupt to read disk

    jc kernel_load_error
    ret

; ===============================================================
; Kernel load error handler
; ===============================================================
kernel_load_error:
    mov si, load_error_string
    call print_string
    jmp $

; ===============================================================
; Print string routine
; ===============================================================
print_string:
    mov ah, 0Eh
.print_char:
    lodsb
    cmp al, 0
    je .printing_finished
    int 10h
    jmp .print_char

.printing_finished:
    mov al, 10d
    int 10h
    mov ah, 03h
    mov bh, 0
    int 10h
    mov ah, 02h
    mov dl, 0
    int 10h
    ret

; ===============================================================
; Strings
; ===============================================================
title_string        db 'The bootloader is loaded successfully.', 0, 0xa
load_error_string   db 'The kernel cannot be loaded', 0

; ===============================================================
; Boot sector padding and signature
; ===============================================================
times 510 - ($ - $$) db 0
dw 0xAA55


