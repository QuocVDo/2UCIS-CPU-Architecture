# 2UCIS Archictecture Design

2UCIS is a compact RISC-type CPU archictecture with support for a customized instruction set. It was developed as a part of the coursework for at UCSD, and uploaded to Github after the course's completion. 

# Custom Assembler
Assembler.py is a simple string parsing assembler that allows us to convert our MIPS-inspired assembly code into machine code that the 2UIC processor can run. Run by using:
>     python assembler.py <assembly.txt> <instructioncode.txt>
This terminal command will turn your assembly code (in assembly.txt) into a machine code file with the specified name for <instructioncode.txt>

# Program Support
This CPU Archictecture has robust support for single-bit forward error correction and double-bit error detection using Hamming Codes.  This program also supports bitstring pattern detection.

# Archictecture Specifications
Our processor design is a RISC processor with an instruction set that is based on MIPS. However, unlike MIPS our processor is highly compact and specialized for the three programs that we were targeting (explained above). All instructions fit within the 9-bit machine code. Our processor design supports 8 different instructions and  8 registers. 

<div align="center">

|Instruction      | Description |
| ----------- | ----------- |
| XOR      | Bitwise XOR two registers       |
|RXOR   | Reduction XOR the contents of a single register       |
| OR      | Bitwise OR two registers |
| BEQ| Branch if Equal |
| LAND      | Short for LUT AND, perform bit masking to extract a certain pattern of bits as specified within LUT (lookup table)|
| MA   | Memory Access, can specify whether we want to store or load into R0        |
| BS      | Bit shift the contents of a specified register       |
| ADDI   | Add immediate        |
</div>

# RTL Schematics
## Top Level
![image](https://user-images.githubusercontent.com/56616495/181809210-f2bdb0cb-6111-49d1-83af-170daf9af136.png)

## Instruction Memory and Data Memory
![image](https://user-images.githubusercontent.com/56616495/181809669-d14e335c-d3f4-4848-9095-9b92b5a6c496.png)
![image](https://user-images.githubusercontent.com/56616495/181809785-62db8784-8f97-4c06-a513-4abebce35e55.png)


## Register File
![image](https://user-images.githubusercontent.com/56616495/181809700-e02b008c-46a7-49c5-bb72-9d2ee9611113.png)

## ALU
![image](https://user-images.githubusercontent.com/56616495/181809735-544e9c17-e3fc-4a81-8c31-548f87234f08.png)


# Contributors
This project was developed in colloboration between me and Daniel Pak 
