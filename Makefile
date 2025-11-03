# THIS IS THE ONE FOR SIMPLE KERNEL
# =========================================================================
# File: Makefile (Simple Kernel - Bochs / QEMU Compatible)
# =========================================================================
# This Makefile assembles the bootloader and kernel, creates a floppy image,
# and runs it in Bochs or QEMU.
# -------------------------------------------------------------------------

# --- 1. Configuration Variables ---
ASM = nasm
DD = dd

# Adjust this path if using Bochs on Windows (via WSL)
BOCHS = /mnt/c/Program\ Files/Bochs-2.7/bochs.exe

# File Definitions
BOOTSTRAP_FILE = bootstrap.asm
KERNEL_ASM_FILE = simple_kernel2.asm
BOOTSTRAP_BIN = bootstrap.bin
KERNEL_BIN = kernel.bin
DISK_IMAGE = kernel.img

# --- 2. Build Process (Compilation & Disk Image Creation) ---
build: $(BOOTSTRAP_FILE) $(KERNEL_ASM_FILE)
	# Assemble bootloader (512 bytes)
	$(ASM) -f bin $(BOOTSTRAP_FILE) -o $(BOOTSTRAP_BIN)
	
	# Assemble kernel
	$(ASM) -f bin $(KERNEL_ASM_FILE) -o $(KERNEL_BIN)
	
	# Create new disk image (floppy 1.44MB)
	$(DD) if=/dev/zero of=$(DISK_IMAGE) bs=512 count=2880
	
	# Write bootloader to sector 0
	$(DD) if=$(BOOTSTRAP_BIN) of=$(DISK_IMAGE) bs=512 count=1 conv=notrunc
	
	# Write kernel to sector 2 (start from sector 2)
	$(DD) if=$(KERNEL_BIN) of=$(DISK_IMAGE) bs=512 seek=1 conv=notrunc

# --- 3. Run Target (Bochs or QEMU) ---
run: build
	$(BOCHS) -f bochsrc.txt -q
# or you can use QEMU instead:
#	qemu-system-i386 -drive format=raw,file=$(DISK_IMAGE)

# --- 4. Clean Target ---
clean:
	rm -f $(BOOTSTRAP_BIN) $(KERNEL_BIN) $(DISK_IMAGE)

.PHONY: all build run clean
all: run

