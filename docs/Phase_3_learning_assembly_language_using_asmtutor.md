**Phase 3: LEARNING ASSEMBLY LANGUAGE FROM ASMTUTOR**
----------
-----
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
| Assemble | nasm -f elf filename.asm | nasm -f elf64 filenme.asm |
| Linker | ld -m elf_i386 filename.o -o filename | ld filename.o -o filename |

**Both assemble and linker commands should be typed (entered) in your wsl (ubuntu) environment. After you enter the assemble command, press enter. If there is no error, then enter the linker command and press enter. If there is no error, then enter the run command './filename' and press enter. Then you should see your output.**

Lessson 1
---
Click [here](https://asmtutor.com/#lesson1) for Asmtutor's lesson with code and explanation (in 32-bits).

Click [here](../src/assembly_language_practice/lesson1.asm) for mine with code and explanation in the form of comments (in 64-bits).


Lessson 2
---
Click [here](https://asmtutor.com/#lesson2) for Asmtutor's lesson with code and explanation (in 32-bits).

Click [here](../src/assembly_language_practice/lesson2.asm) for mine with code and explanation in the form of comments (in 64-bits).

Lessson 3
---
Click [here](https://asmtutor.com/#lesson3) for Asmtutor's lesson with code and explanation (in 32-bits).

Click [here](../src/assembly_language_practice/lesson3.asm) for mine with code and explanation in the form of comments (in 64-bits).


Lessson 4
---
Click [here](https://asmtutor.com/#lesson4) for Asmtutor's lesson with code and explanation (in 32-bits).

Click [here](../src/assembly_language_practice/lesson4.asm) for mine with code and explanation in the form of comments (in 64-bits).


Lessson 5
---
Click [here](https://asmtutor.com/#lesson5) for Asmtutor's lesson with code and explanation (in 32-bits).

Click [here](../src/assembly_language_practice/lesson5.asm) for mine with code and explanation in the form of comments (in 64-bits).


Lessson 6
---
Click [here](https://asmtutor.com/#lesson6) for Asmtutor's lesson with code and explanation (in 32-bits).

Click [here](../src/assembly_language_practice/lesson6.asm) for mine with code and explanation in the form of comments (in 64-bits).


Lessson 7
---
Click [here](https://asmtutor.com/#lesson7) for Asmtutor's lesson with code and explanation (in 32-bits).

Click [here](../src/assembly_language_practice/lesson7.asm) for mine with code and explanation in the form of comments (in 64-bits).


Lessson 8
---
Click [here](https://asmtutor.com/#lesson8) for Asmtutor's lesson with code and explanation (in 32-bits).

Click [here](../src/assembly_language_practice/lesson8.asm) for mine with code and explanation in the form of comments (in 64-bits).


Lessson 9
---
Click [here](https://asmtutor.com/#lesson9) for Asmtutor's lesson with code and explanation (in 32-bits).

Click [here](../src/assembly_language_practice/lesson9.asm) for mine with code and explanation in the form of comments (in 64-bits).


Lessson 10
---
Click [here](https://asmtutor.com/#lesson10) for Asmtutor's lesson with code and explanation (in 32-bits).

Click [here](../src/assembly_language_practice/lesson10.asm) for mine with code and explanation in the form of comments (in 64-bits).


Lessson 11
---
Click [here](https://asmtutor.com/#lesson11) for Asmtutor's lesson with code and explanation (in 32-bits).

Click [here](../src/assembly_language_practice/lesson11.asm) for mine with code and explanation in the form of comments (in 64-bits).


Lessson 12
---
Click [here](https://asmtutor.com/#lesson12) for Asmtutor's lesson with code and explanation (in 32-bits).

Click [here](../src/assembly_language_practice/lesson12.asm) for mine with code and explanation in the form of comments (in 64-bits).


Lessson 13
---
Click [here](https://asmtutor.com/#lesson13) for Asmtutor's lesson with code and explanation (in 32-bits).

Click [here](../src/assembly_language_practice/lesson13.asm) for mine with code and explanation in the form of comments (in 64-bits).


Lessson 14
---
Click [here](https://asmtutor.com/#lesson14) for Asmtutor's lesson with code and explanation (in 32-bits).

Click [here](../src/assembly_language_practice/lesson14.asm) for mine with code and explanation in the form of comments (in 64-bits).


Lessson 15
---
Click [here](https://asmtutor.com/#lesson15) for Asmtutor's lesson with code and explanation (in 32-bits).

Click [here](../src/assembly_language_practice/lesson15.asm) for mine with code and explanation in the form of comments (in 64-bits).


Lessson 16
---
Click [here](https://asmtutor.com/#lesson16) for Asmtutor's lesson with code and explanation (in 32-bits).

Click [here](../src/assembly_language_practice/lesson16.asm) for mine with code and explanation in the form of comments (in 64-bits).


Lessson 17
---
Click [here](https://asmtutor.com/#lesson17) for Asmtutor's lesson with code and explanation (in 32-bits).

Click [here](../src/assembly_language_practice/lesson17.asm) for mine with code and explanation in the form of comments (in 64-bits).


Lessson 18
---
Click [here](https://asmtutor.com/#lesson18) for Asmtutor's lesson with code and explanation (in 32-bits).

Click [here](../src/assembly_language_practice/lesson18.asm) for mine with code and explanation in the form of comments (in 64-bits).


Lessson 19
---
Click [here](https://asmtutor.com/#lesson19) for Asmtutor's lesson with code and explanation (in 32-bits).

Click [here](../src/assembly_language_practice/lesson19.asm) for mine with code and explanation in the form of comments (in 64-bits).


Lessson 20
---
Click [here](https://asmtutor.com/#lesson20) for Asmtutor's lesson with code and explanation (in 32-bits).

Click [here](../src/assembly_language_practice/lesson20.asm) for mine with code and explanation in the form of comments (in 64-bits).


Lessson 21
---
Click [here](https://asmtutor.com/#lesson21) for Asmtutor's lesson with code and explanation (in 32-bits).

Click [here](../src/assembly_language_practice/lesson21.asm) for mine with code and explanation in the form of comments (in 64-bits).


Lessson 22
---
Click [here](https://asmtutor.com/#lesson22) for Asmtutor's lesson with code and explanation (in 32-bits).

Click [here](../src/assembly_language_practice/lesson22.asm) for mine with code and explanation in the form of comments (in 64-bits).


Lessson 23
---
Click [here](https://asmtutor.com/#lesson23) for Asmtutor's lesson with code and explanation (in 32-bits).

Click [here](../src/assembly_language_practice/lesson23.asm) for mine with code and explanation in the form of comments (in 64-bits).


Lessson 24
---
Click [here](https://asmtutor.com/#lesson24) for Asmtutor's lesson with code and explanation (in 32-bits).

Click [here](../src/assembly_language_practice/lesson24.asm) for mine with code and explanation in the form of comments (in 64-bits).


Lessson 25
---
Click [here](https://asmtutor.com/#lesson25) for Asmtutor's lesson with code and explanation (in 32-bits).

Click [here](../src/assembly_language_practice/lesson25.asm) for mine with code and explanation in the form of comments (in 64-bits).


Lessson 26
---
Click [here](https://asmtutor.com/#lesson26) for Asmtutor's lesson with code and explanation (in 32-bits).

Click [here](../src/assembly_language_practice/lesson26.asm) for mine with code and explanation in the form of comments (in 64-bits).


Lessson 27
---
Click [here](https://asmtutor.com/#lesson27) for Asmtutor's lesson with code and explanation (in 32-bits).

Click [here](../src/assembly_language_practice/lesson27.asm) for mine with code and explanation in the form of comments (in 64-bits).


Lessson 28
---
Click [here](https://asmtutor.com/#lesson28) for Asmtutor's lesson with code and explanation (in 32-bits).

Click [here](../src/assembly_language_practice/lesson28.asm) for mine with code and explanation in the form of comments (in 64-bits).


Lessson 29
---
Click [here](https://asmtutor.com/#lesson29) for Asmtutor's lesson with code and explanation (in 32-bits).

Click [here](../src/assembly_language_practice/lesson29.asm) for mine with code and explanation in the form of comments (in 64-bits).


Lessson 30
---
Click [here](https://asmtutor.com/#lesson30) for Asmtutor's lesson with code and explanation (in 32-bits).

Click [here](../src/assembly_language_practice/lesson30.asm) for mine with code and explanation in the form of comments (in 64-bits).


Lessson 31
---
Click [here](https://asmtutor.com/#lesson31) for Asmtutor's lesson with code and explanation (in 32-bits).

Click [here](../src/assembly_language_practice/lesson31.asm) for mine with code and explanation in the form of comments (in 64-bits).


Lessson 32
---
Click [here](https://asmtutor.com/#lesson32) for Asmtutor's lesson with code and explanation (in 32-bits).

Click [here](../src/assembly_language_practice/lesson32.asm) for mine with code and explanation in the form of comments (in 64-bits).


Lessson 33
---
Click [here](https://asmtutor.com/#lesson33) for Asmtutor's lesson with code and explanation (in 32-bits).

Click [here](../src/assembly_language_practice/lesson33.asm) for mine with code and explanation in the form of comments (in 64-bits).


Lessson 34
---
Click [here](https://asmtutor.com/#lesson34) for Asmtutor's lesson with code and explanation (in 32-bits).

Click [here](../src/assembly_language_practice/lesson34.asm) for mine with code and explanation in the form of comments (in 64-bits).


Lessson 35
---
Click [here](https://asmtutor.com/#lesson35) for Asmtutor's lesson with code and explanation (in 32-bits).

Click [here](../src/assembly_language_practice/lesson35.asm) for mine with code and explanation in the form of comments (in 64-bits).


Lessson 36
---
Click [here](https://asmtutor.com/#lesson36) for Asmtutor's lesson with code and explanation (in 32-bits).

Click [here](../src/assembly_language_practice/lesson36.asm) for mine with code and explanation in the form of comments (in 64-bits).

