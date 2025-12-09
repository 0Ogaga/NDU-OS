This repository captures my successful attempt to build a very simple 16-bit real-mode operating system that boots from a floppy-disk image. The project is intentionally minimal, using only three files—Makefile, bootloader.asm, and kernel.asm—to demonstrate the core concepts behind how a computer starts executing code before any modern OS features exist.

Throughout this work, I learned how:

1. The BIOS loads the first 512 bytes of a boot sector into memory

2. 16-bit real mode works and how instructions interact with hardware

3. A bootloader can print text, load another sector, and pass control to a kernel

4. A tiny kernel can run and display a message using direct memory writes


The kernel built runs correctly in emulators like Bochs/QEMU, but not on real hardware—mainly because modern systems no longer support floppy disk booting.

Even though this OS does not switch to protected mode, does not include drivers, and only prints a basic message, it represents the fundamental first step in operating system development: understanding how the CPU begins execution from raw machine code.

Thanks for staying through with me.
