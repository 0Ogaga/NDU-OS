**Phase 3: LEARNING ASSEMBLY LANGUAGE FROM ASMTUTOR**
| ---
This phase documents the foundational knowledge acquired using ASMTutor.

Why Learn Assembly for OS Development?
---
Mastering Assembly is mandatory for our OS project because it is the only language that can handle bootstrapping (the entire process of booting) and direct hardware interaction where no existing operating system environment exists.

Assembly Language Practice:
-----
[Asmtutor](https://asmtutor.com/) was the website sent to us by our IT coordinator for practicing assembly language. It contians 36 lessons, so we studied all 36. Note that my laptop runs on 64-bit architecture and the programs in Asmtutor were written for in 32-bit. I had an issue with this initially. Click [here](Challenges_and_how_they_where_resolved.md) for more details on this and how order challenges where resolved. 

Going through all 36 lessons, mine are written in 64-bit so therefore, the compile instruction (nasm -f elf64 filename.asm) and linker instruction (ld filename.o -o filename) are for 64 bit system. The run instruction (./filename) remains the same for both. The following are some other differences...
|  | 32-bit | 64-bit |
| --- | --- | --- |
| Some registers | eax, ebx, ecx, edx | rax, rdi, rsi, rdx |
| Some instructions | int 80h | syscall |

Lessson 1
---
Click [here](https://asmtutor.com/#lesson1) for Asmtutor's lesson with code and explanation (in 32-bits).

Click [here](src/assembly_language_practice/lesson1.asm) for mine with code and explanation in the form of comments (in 64-bits).
