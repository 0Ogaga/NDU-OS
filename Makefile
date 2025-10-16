
	
# FILE: Makefile
# DESCRIPTION: Manages the compilation and creation of the combined kernel image.
# =========================================================================

# --- Configuration ---
ASM = nasm

# CRITICAL: Path to your Windows QEMU executable (in WSL format)
# If your path is different, update this line.
QEMU = /mnt/c/Program\ Files/qemu/qemu-system-x86_64.exe

BOOTSTRAP_FILE = bootstrap2.asm
KERNEL_FILE = simple_kernel2.asm
KERNEL_IMAGE = kernel.img

# --- Targets ---

.PHONY: all build run clean

# Default target
all: run

# Combine the bootloader and kernel into a single disk image.
build: $(BOOTSTRAP_FILE) $(KERNEL_FILE)
	# 1. Compile the bootloader (creates bootstrap.o)
	$(ASM) -f bin $(BOOTSTRAP_FILE) -o bootstrap.o
	
	# 2. Compile the simple kernel (creates kernel.o)
	$(ASM) -f bin $(KERNEL_FILE) -o kernel.o
	
	# 3. Create the final image: Write the bootloader (512 bytes) to the 1st sector.
	# The line below uses a TAB for indentation.
	dd if=bootstrap.o of=$(KERNEL_IMAGE)
	
	# 4. Append the kernel: Write the kernel to the 2nd sector (seek=1) and sync blocks.
	# The line below uses a TAB for indentation.
	dd seek=1 conv=sync if=kernel.o of=$(KERNEL_IMAGE) bs=512

# Run the final image in the emulator.
run: build
	# -fda: Boots the image as a virtual floppy disk.
	# The line below MUST start with a TAB character.
	$(QEMU) -fda $(KERNEL_IMAGE)

# Clean target: Removes generated files.
clean:
	# The line below uses a TAB for indentation.
	rm -f bootstrap.o kernel.o $(KERNEL_IMAGE)
