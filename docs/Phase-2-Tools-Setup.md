Phase 1: Download and Installation (Toolchain Configuration) 🛠️
This phase details the necessary steps taken to configure the development environment, starting with the installation of the Windows Subsystem for Linux (WSL).

1. Setting Up the Linux Environment (WSL)
Since low-level OS development is typically performed on Unix-like systems, we used WSL to run Ubuntu directly on the Windows host machine.

Step 1: Check Windows Version
Requirement: WSL requires Windows 10 (version 2004 and higher, Build 19041 and higher) or Windows 11.

Action: Confirm the Windows version is supported. (For this project, the Windows laptop was supported.)

Step 2: Install WSL (The Simple Way)
The quickest method is to use a single command in an administrative terminal.

Open the Start Menu, search for "cmd" or "PowerShell".

Right-click the result and select "Run as administrator".

Execute the following command. This automatically enables the required Windows features (Virtual Machine Platform, WSL) and installs the latest Ubuntu distribution:

PowerShell

wsl --install
Action: The system will prompt you to restart your computer. Restart the machine to finalize the installation.

Step 3: Configure Ubuntu
After the restart, the Ubuntu window will automatically open and prompt you to create a user account.

Enter Username: Choose a simple username (e.g., osdev).

Enter Password: Create a password. This password will be needed anytime you use the sudo command (for administrative privileges).

Step 4: Update the System
It is essential to update all software packages immediately after installation to prevent compatibility issues.

Open the Ubuntu terminal (if it's not already open).

Run the update and upgrade commands:

Bash

sudo apt update
sudo apt upgrade
(Enter the password created in Step 3 when prompted.)

Result: The system is now running a fully updated Ubuntu distribution, providing a robust Unix environment ready for installing NASM, QEMU, and the other required build tools.
