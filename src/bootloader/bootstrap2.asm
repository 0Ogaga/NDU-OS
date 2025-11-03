[org 0x7c00]
bits 16

start:
	; Set DS to 07C0h to correctly address data (like strings)
	; mov ax, 07C0h
	; mov ds, ax
	
	; CRITICAL FIX: Save the boot drive number provided by the BIOS (DL)
	mov [boot_drive], dl 
	
	mov si, title_string
	call print_string
	
	mov si, message_string
	call print_string
	
	call load_kernel_from_disk
	
	; FIX 2: Correct Jump Target to STANDARD 0x1000h segment (0x10000 physical)
	jmp 1000h:0000 
	
load_kernel_from_disk:
    ; --- Simple Offset Setup ---
    mov bx, 0x0000 		; Start the offset at 0 within the ES segment (0x1000)
    mov ax, 1000h 		; FIX 1: Correct Load Segment to STANDARD 0x1000h
	mov es, ax
    
    ; --- Load Loop Start ---
load_loop:
    mov ah, 02h 		; INT 13h: Read sectors function
    mov al, 1h 			; Number of sectors to read (1 sector at a time)
    mov ch, 0h 			; Cylinder 0
    mov cl, [curr_sector_to_load] ; Starting sector number
    mov dh, 0h 			; Head 0
    mov dl, [boot_drive] 	; Load the preserved boot drive value
    
    ; The destination is ES:BX, which updates by 512 bytes per iteration

    int 13h
    
    jc kernel_load_error ; Jump if Carry Flag set (disk error)

    ; --- Loop Control Logic ---
    sub byte [number_of_sectors_to_load], 1
    add byte [curr_sector_to_load], 1
    
    ; *** CRITICAL FIX: Increment memory offset (BX) by 512 bytes for the next sector load ***
    add bx, 512 

    cmp byte [number_of_sectors_to_load], 0
    
    jne load_loop ; Continue loading the next sector

    ret
    
kernel_load_error:
	mov si, load_error_string
	call print_string
	
	jmp $ 
	
print_string:
	mov ah, 0Eh

print_char:
	lodsb
	
	cmp al, 0
	je printing_finished
	
	int 10h
	
	jmp print_char

printing_finished:
	mov al, 10d 
	int 10h
	
	; Reset cursor position
	mov ah, 03h
	mov bh, 0
	int 10h
	
	mov ah, 02h
	mov dl, 0
	int 10h
	
	ret

title_string db 'The Bootloader of 539kernel.', 0
message_string db 'The kernel is loading...', 0
load_error_string  db 'The kernel cannot be loaded', 0
number_of_sectors_to_load  db 5d ; MUST match the 'count=5' in Makefile
curr_sector_to_load  db 2d 
boot_drive db 0 ; Variable to store the BIOS boot drive (DL)

times 510-($-$$) db 0

dw 0xAA55
