; BOOTLOADER PROGRAM    

;
start:
    ;
    mov     ax, 07c0h   ; The address 07c0h can't be moved directly to the data section (ds) so we move it to ax and move ax to ds. 
    mov     ds, ax

    ; Display messages.
    mov     si, title_string
    call    print_string
    mov     si, message_string
    call    print_string

    ;
    call    load_kernel_from_disk   ; This is the function that loads kernel from disk
    jmp     0900h:0000              ; The next action happens in this memory address.
    
    ; Function to load kernel into memory.
    load_kernel_from_disk:
        mov     ax, 0900h
        mov     es, ax              ; WHAT IS THE FULL MEANING OF EACH REGISTER AND HOW ARE THEY ACTUALLY ASSIGNED IN REALITY?

                                    ; DOES THE ORDER OF MOVE MATTER HERE?
        mov     ah, 02h             ; This service number specified in this register, makes the BIOS reads secors from the hard disk and loads them into the memory.             
        mov     al, 01h             ; The value in the register al is he number of sectors that we would like to read, in our case, beacuses the size of our temporary kernel (simple_kernel.asm) doesn't exceed 512 bytes we read only 1 sector. 
        mov     ch, 0h              ; The value in the register ch is the number of the track that we would like to read from, in our case, it is the track 0.
        mov     cl, 02h             ; The value in the register cl is the sector number that we would like to read its content, in our case, it is the second sector.
        mov     dh, 0h              ; The value in the register dh is the head number. 
        mov     dl, 80h             ; The value in the register dl specifies the type of disk that we would like to read from. 0h means floppy disk, while 80h means hard disk number 0, 81h for hard disk number 1.
        mov     bx, 0h              ; The value in the register bx is the memory address that the content will be loaded into.
        int     13h                 ; This tells the BIOS that we want to make use of its services.

        jc      kernel_load_error   ; jc (conditional jump)
        ret

    ; Display kernel error message.
    kernel_load_error:
        mov     si, load_error_string
        call    print_string

        jmp     $                   ; An infinite loop so the nothing else can be done due to the error of having the carry flag (CF) not equal to 0.
        
    ; Display function
    print_string:
        mov     ah, 0Eh             ; Move terminal character into ah

    print_char:
        lodsb                       ; Load single byte into al and increases the value of si by 1.
        cmp     al, 0
        je      printing_finished
        int     10h                 ; This instruction makes the BIOS print the content of the register al on the screen
        jmp     print_char

    printing_finished:
        mov     al, 10d             ; Print new line.
        int     10h

        ; Reading current cursor position
        mov     ah, 03h
        mov     bh, 0
        int     10h

        ; Move the cursor to the beginning
        mov     ah, 02h
        mov     dl, 0
        int     10h

        ret

; Message to display.
title_string        db 'The Bootloader of 539kernel.', 0
message_string      db 'The ernel is loading...', 0
load_error_string   db 'The kernel cannot be loaded', 0

; Fill the rest of the sector with zeros, up to byte 510.
times 510 - ($ - $$) db 0
; The boot signature (0x55AA) must be at the end of the sector.
dw 0xAA55
