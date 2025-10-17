**Phase 4: SIMPLE BOOTLOADER**
----------
-----
The core purpose of this phase is to confirm we can successfully write code that meets the strict requirements of the BIOS, load it into a virtual machine, and have it execute directly on the bare metal. This bootloader is not yet complex enough to load a kernel; it only proves the boot process works.


Click [here](../src/assembly_language_practice/bootSectorPractice.asm) to access the simple bootloader.

Comments are added to the program so as for better understanding so less will be discussed here.

How to run the bootloader.
---
Since the bootloader should be in a hard disk or flash drive in another computer, we are using qemu as our virtual computer (machine). We do this by first converting our bootloader (that is the boot sector program) to machine language. Enter this command in your command promt which can be done inside VS Code terminal.

    nasm -f bin bootSectorPractice.asm -o boot.bin

'**nasm**' is our does the assembly.

'**-f bin**' indicates our output file. That is, it is a binary file.

'**bootSectorPractice.asm**' is the file we want to assemble.

'-**o boot.bin**' indicates the output file name.


This next command is to launch our bootloader in qemu.

    qemu-system-i386 -drive format=raw,file=boot.bin

'**qemu-system-i386**' starts the QEMU emulator for a 32-bit Intel processor (it simulates a real computer).

'**-drive**' tells QEMU to attach a virtual storage drive (like a hard disk or floppy).

'**format=raw**' shows that the drive uses raw binary format (just bytes).

'**file=boot.bin**' is the file the QEMU should treat as disk. In this case, our output file 'boot.bin'.
