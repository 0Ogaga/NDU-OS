**PHASE 1** **- _OVERVIEW_**

Before any code was written, the initial phase was dedicated to gaining a high-level conceptual understanding of the operating system structure and identifying the necessary technical tools. This ensured the project had a clear path forward.

**1. Conceptual Overview (The "What" and "Why")**

The first step was to understand the fundamental components we planned to build:

**Operating System (OS)Concept:** An OS is the primary piece of software that manages all the computer's hardware and software resources. It acts as an intermediary between the user/applications and the physical hardware. We focused on the Kernel, which is the core of the OS. The kernel handles critical tasks like memory management, process scheduling, and interacting with hardware drivers. Our project's goal is to build this kernel.

**Bootloader Concept:** This is the first piece of code executed when a computer powers on. It is incredibly small (often exactly 512 bytes) and runs in the CPU's initial, limited 16-bit Real Mode.Key Function: The bootloader's sole job is to initialize the system, load the main OS kernel into memory, and transfer control to it. It is the bridge between the computer's BIOS (firmware) and our kernel.

**2. Tools and Materials Identification (The "How")**

Based on the goal of building a bare-metal kernel, the following required materials were identified

1. Netwide Assembler (NASM): To assemble our bootloader code since it will be written in assembly language being that assembly langauge gives us more hardware control.
2. Visual Studio Code (VS Code): To be used as our editor (writing of programs).
3. C/C++ extensions in VS Code: In writing of C/C++ programs.
4. Assembly language extensions in VS Code: For writing of assembly programs
5. QEMU: It is a simulator which acts like another machine (computer) inside your (our) machine (computer).
6. Ubuntu: This acts as another operating system inside your computer. You have to enable Windows Subsystem for Linux if you are using windows. NOTE THAT FOR THIS PROJECT, I AM WORKING WITH A WINDOWS LAPTOP.
7. MingW64: MinGW-w64 creates a raw, self-sufficient program that can run by itself on the empty computer hardware.
