**NDU-OS: INDUSTRIAL TRAINING PROJECT**

This project is a complete log of my industrial training, detailing the process of building an Operating System kernel from the ground up. It involves learning how a computer starts, how it manages memory, and how to write core code that runs before any major system like Windows or Linux has loaded. Essentially, we are making (writing, programming) the fundamental software that manages the hardware according to instructions which we'll write in our program.


**_Project Goal:_**

Building a minimal Operating System kernel from scratch as part of my Industrial Training.


**_Achievement Details:_**
1.  **Stage 1: Assembly Bootloader (512 Bytes):** A 16-bit Real Mode boot sector that uses BIOS interrupts (`INT 0x13`) to read the second stage from the disk.
2.  **Stage 2: Assembly Kernel:** A simple kernel loaded into memory that executes and prints a custom string message.
3.  **Simulation:** Verified functionality using the **BOCHS** emulator.


**_Full Documentation_**
*For a detailed log, see the **[Development Log](docs/DEVELOPMENT_LOG.md)**.*
