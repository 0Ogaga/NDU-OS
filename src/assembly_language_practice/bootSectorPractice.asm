; A SIMPLE BOOT SECTOR PROGRAM
; When you turn ON your computer, a program in the computer's processor (written by the manufacturer) called the BIOS is executed.
; The BIOS looks for a bootable device (like a hard drive or USB stick) and loads the first sector (512 bytes) of that device into memory at address 0x7C00.
; This first sector is called the "boot sector" and contains a small program that starts the operating system or does other tasks.
; The program in the boot sector is called the bootloader.
; Below is a simple boot sector program written in x86 assembly language.

[org 0x7c00]          ; Tell the assembler that this code will be loaded at memory address 0x7C00 (it is a physical address in memory that's the RAM).
                      ; The BIOS automatically loads the first sector of a bootable disk here.

[bits 16]             ; Use 16-bit mode (real mode), which is what the BIOS uses.

; --- Start of the program ---
_start:
    mov si, msg        ; Load the memory address of the message into register SI.
                       ; SI will point to the text we want to print.

    call print_string  ; Call (jump to) the "print_string" routine to display the message.

    jmp $              ; Jump to the same location forever ("$" means current address).
                       ; This keeps the computer from running into empty memory since we don't have a kernel for our bootloader to load in for now.

; Subroutine to print a string on the screen from the concept learned in asmtutor.
print_string:
    mov ah, 0x0E       ; Having hexadecimal value 0Eh (or 0x0E) in register AH makes the BIOS print characters in "teletype" mode.
.next_char:
    mov al, [si]       ; Load one character from the memory location pointed to by SI into AL.
    cmp al, 0          ; Compare that character to 0 (end of string marker).
    je .done           ; If it’s 0, jump to ".done" (end of printing).
    int 0x10           ; Call BIOS interrupt 10h (or 0x10) to print the character in AL on the screen.
    inc si             ; Move to the next character in the message.
    jmp .next_char     ; Repeat for the next character.
.done:
    ret                ; Return to the main code after finishing.

; Data (the message we want to display)
msg db 'NDU OS done dey boot! You go wait small...', 0  
; "db" means "define bytes" — this stores text directly in memory.
; The last 0 marks the end of the message.

; Boot sector padding and signature 
times 510-($-$$) db 0  ; Fill the rest of the boot sector (512 bytes total) with zeros.
dw 0xAA55              ; This 2-byte "signature" tells the BIOS that this is a valid boot sector.
                       ; Without this, the BIOS won’t try to boot from it.
