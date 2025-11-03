**Phase 1: CONFIGURATION OF TOOLS**
--------------------
This phase details the necessary steps taken to configure the development environment.You need about 2 GB of data to for the download process.

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

c. After installation, Ubuntu window will automatically open and prompt you to create a user account. Ensure you have ENOUGH data before you start the installation process. ENOUGH data oooooo.

d. Enter Username: Choose a simple username (e.g., ogaga).

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

**6. Visual Sudio Code (VS Code)**
---
VS Code is our primary code editor and project manager. It provides a user-friendly interface with features like syntax highlighting, file navigation, and project search, making large-scale code management much easier than using a basic terminal editor.

a. Go to the official VS Code website (https://code.visualstudio.com/) and download the installer for Windows.

b. Click and follow the process to complete the installation.

c. After installation, open VS Code, go to the extension (ensure you are connected to the internet), type and install the following;

i. C/C++ (the one bearing Microsoft).

ii. C/C++ Build Task.

iii. C/C++ Compile Run.

iv. C/C++ Extension Pack.

v. C/C++ Runner.

vi. Code Runner.

vii. Hex Editor (the one bearing Microsoft).

viii. Makefile Tools (the one bearing Microsoft).

ix. NASM X86 Assembly Language.

x. Nasm x86_64 syntax highlighting.


**7. Setting up Bochs**
----------
Adding Bochs to the list of development tools is necessary because, as your experience showed, it was the only emulator that correctly handled the 16-bit BIOS INT 13h disk-read routine required by your bootloader, unlike QEMU.

Bochs is a highly accurate System Emulator known for its precise simulation of the x86 architecture. It is essential for older OS development tasks, that rely on complex BIOS services for disk reading, where QEMU often fails.

Bochs Success: Bochs accurately emulates the older BIOS environment, allowing the INT 13h calls and the sequential memory loading logic (add bx,512) to execute without error.

**Setting up Bochs Emulator**

**a. Installation:** Go to the official Bochs website or search for a direct download link (e.g., from SourceForge).Download the Windows installer (e.g., Bochs-2.7-win64.exe). Run the installer and complete the process. Make a note of the installation path, as you'll need it for the Makefile (e.g., /mnt/c/Program\ Files/Bochs-2.7/bochs.exe).b. Configuration: The bochsrc.txt FileBochs requires a configuration file named bochsrc.txt to tell it what kind of machine to emulate, how much RAM to use, and where to find your operating system disk image. Create a file named bochsrc.txt in your project's root directory and add the following content (in Ubuntu environment):

Global Settings

        config_interface: textconfig

Standard for running Bochs on Windows

        megs: 32

A stable, generic CPU model for early OS dev

        cpu: model=bx_generic

Instruct BIOS to boot from the floppy drive

        boot: floopy

Floppy Disk Drive (Our Kernel Image)

        floppya: 1_44=kernel.img, status=inserted

Logging
        log: bochsout.txt

        error: action=report

        panic: action=ask

        info: action=ignore
        
        display_library: win32
        
        cpu: model=pentium, count=1
        
        keyboard_send_eoi: enabled=1

        
        
Use the shorcut shown in the command environment to exit.
