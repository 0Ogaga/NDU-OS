**Phase 5: BOOTLOADER AND SIMPLER KERNEL**
----------
-----
This phase upgrades the simple bootloader to its real task: loading the OS kernel from disk into memory and transferring control to it. This requires a new file (kernel.asm). In this case, we are going to write a very simple kernel which only displays a message.


Click [here](../src/Simple%20OS%20practice/bootloader.asm) to access the updated bootloader.

Click [here](../src/Simple OS practice/simple_kernel.asm) to access the simplified kernel.


Comments are added to the program so as for better understanding so less will be discussed here.

How to run the bootloader.
---
Remember in our [simple bootloader](src/assembly_language_practice/bootSectorPractice.asm) file, We entered various commands in order to run it. We can actually put all those commands in one file (which is called Makefile). And then, simply type 'make run' in our command line so as order to run our programs. This becomes very important when we have differnet languages like assembly and C/C++.

Click [here](../src/Simple OS practice/Makefile) to access the Makefile.

When you have all three files, you are to simply type;

    make run

**This should be typed (entered) in your wsl (ubuntu) environment** 




After Successfully Running our Simple Operating System in Bochs...
----------
With what we have done so far, we have a working operating system, which can only be loaded into RAM for operation, but the only thing it can do now, is to display one predefined message. 

It can't manage processes, resources, file system and it has no driver. It is not also protected since it is still in 16-bit real mode. This present OS we have can be classified as a single-user single task Operating System known as NDU OS.

Obviously, we need to make our OS protected (32-bit mode) and add the features highlighted above.

To make this happen, we need to write more programs and include only their names inside the kernel program (that's calling the other programs inside the kernel program).
