
ASM = nasm
DD = dd
BOCHS = /mnt/c/Program\ Files/Bochs-2.7/bochs.exe

BOOTSTRAP_FILE = bootstrap2.asm
KERNEL_ASM_FILE = simple_kernel2.asm
BOOTSTRAP_BIN = bootstrap.bin
KERNEL_BIN = kernel.bin
DISK_IMAGE = kernel.img

build:
	$(ASM) -f bin $(BOOTSTRAP_FILE) -o $(BOOTSTRAP_BIN)
	$(ASM) -f bin $(KERNEL_ASM_FILE) -o $(KERNEL_BIN)

	$(DD) if=/dev/zero of=$(DISK_IMAGE) bs=512 count=2880

	$(DD) if=$(BOOTSTRAP_BIN) of=$(DISK_IMAGE) bs=512 count=1 conv=notrunc

	$(DD) if=$(KERNEL_BIN) of=$(DISK_IMAGE) bs=512 seek=1 conv=notrunc

run: build
	$(BOCHS) -f bochsrc.txt -q

clean:
	rm -f $(BOOTSTRAP_BIN) $(KERNEL_BIN) $(DISK_IMAGE)

.PHONY: all build run clean
all: run

