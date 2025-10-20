**Phase 5: BOOTLOADER AND SIMPLER KERNEL**
----------
-----
This phase upgrades the simple bootloader to its real task: loading the OS kernel from disk into memory and transferring control to it. This requires a new file (kernel.asm). In this case, we are going to write a very simple kernel which only displays a message.


Click [here](../src/bootloader/bootstrap2.asm) to access the updated bootloader.

Click [here](../src/kernel/simple_kernel2.asm) to access the simplified kernel.


Comments are added to the program so as for better understanding so less will be discussed here.

How to run the bootloader.
---
Remember in our [simple bootloader](src/assembly_language_practice/bootSectorPractice.asm) file, We entered various commands in order to run it. We can actually put all those commands in one file (which is called Makefile). And then, simply type 'make run' in our command line so as order to run our programs. This becomes very important when we have differnet languages like assembly and C/C++.

Click [here](../Makefile) to access the Makefile.

When you have all three files, you are to simply type;

    make run

**This should be typed (entered) in your wsl (ubuntu) environment** 
