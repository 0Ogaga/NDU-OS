**Phase 1: CONFIGURATION OF TOOLS**
--------------------
This phase details the necessary steps taken to configure the development environment.

**1. Setting Up the Linux Environment (WSL)**
----------
Since professional OS development relies heavily on Unix-like tools, we use WSL (Windows Subsystem for Linux) to bring a complete Linux environment (Ubuntu) directly onto the Windows laptop. We need Ubuntu (which is a software that acts as another OS in our OS) because it provides the standard toolchain (that is, collection of tools like, GCC, make, etc.) required for cross-compiling the kernel. Developing directly on Windows is unnecessarily complex.

WSL allows us to run the high-performance Linux environment without dual-booting or restarting, ensuring a smooth workflow on the host machine.

a. Press Windows key + R

b. Type in 'optionalfeatures.exe' and press enter.

c. Scroll down and look for 'Windows Subsystem for Linux' and click (check) the box.

d. The click 'ok'

e. You will be asked to restart your system (laptop) after the loading process is complete. Go ahead and restart you system.

**2. Install WSL Distribution (Ubuntu).**
---

a. Go to Microsoft Store and search for 'Ubuntu', then click on 'Ubuntu' when it appears. I selected the one without any number in front of it. It's just 'Ubuntu'.

b. Click on it to install.

c. After installation, Ubuntu window will automatically open and prompt you to create a user account. Ensure you have ENOUGH data before you start the installation process. ENOUGH data oooooo. About..................

d. Enter Username: Choose a simple username (e.g., osdev).

e. Enter Password: Create a password. This password will be needed anytime you use the sudo command (for administrative privileges). Note that when you type the password, there may be no sign or proof that you are typing anything. Just keep typing. Believe that what you are typing is recognized by the system. Press enter when you are done.

f. You will be asked to enter the password again. Ensure you type exactly the same thing even if you can't see your coursor moving. Press enter when you are done.

g. Allow the loading process to continue and ensure you are connected to the internet all through the process.

**3. Update the System**
---
It is essential to update all software packages immediately after installation to prevent compatibility issues.

a. Open the Ubuntu terminal (if it's not already open).

b. Run the update and upgrade commands one after the other. Press enter after each command:
    sudo apt-get update && sudo apt-get install nasm build-essential

    Note that the above command updates the wsl and also intall the what is required for nasm to work.

    sudo apt install qemu-system-x86

The command above installs what is required for QEMU to work properly. If this does not install properly, you can try the other option of installing qemu in your windows system instead of in the Linux environment. Then, add the path in which the QEMU is installed in the Makefile in order to run it. Click [here](Challenges_and_how_they_where_resolved.md) for more details on this and how order challenges where resolved.
    
c. Enter your password (the password you created) when you are prompted to.

**4. Setting QEMU**
---
QEMU is a System Emulator. It simulates the physical x86 computer hardware (the CPU, BIOS, and hard drive) entirely in software. This allows us to test our OS kernel as if it were running on a real machine, without the risk of damaging our host system.

a. Go to the website https://qemu.weilnetz.de/w64/2025/ and download it. Note that my system runs on 64-bit architecture. If your runs on 32-bit, then download the one of 32-bit from the same site.

b. Simply click on it and complete the installation process.


**5. Setting NASM (Netwide Assembler). THIS IS OPTIONAL**
---
This is the tool that converts our instructions using mnemonics into machine language.

a. Go to the website https://www.nasm.us/pub/nasm/releasebuilds/3.01rc9/ and download it. Note that my system runs on 64-bit architecture. If your runs on 32-bit, then download the one of 32-bit from the same site. 

b. Simply click on it and complete the installation process.
