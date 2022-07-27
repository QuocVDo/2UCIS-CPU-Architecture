# 2UCIS Archictecture Design

2UCIS is a compact RISC-type CPU archictecture with support for a customized instruction set. It was developed as a part of the coursework for at UCSD, and uploaded to Github after the courses completion. 

# Custom Assembler
Assembler.py is a simple string parsing assembler that allows us to convert our MIPS-inspired assembly code into machine code that the 2UIC processor can run. Run by using:
>     python assembler.py <assembly.txt> <instructioncode.txt>
This terminal command will turn your assembly code (in assembly.txt) into a machine code file with the specified name for <instructioncode.txt>

# Program Support
This CPU Archictecture has robust support for single-bit forward error correction and double-bit error detection using Hamming Codes.  This program also supports bitstring pattern detection.

# Contributors
This project was developed in colloboration between me and Daniel Pak 
