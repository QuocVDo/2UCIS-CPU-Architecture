"""
usage: python assembler.py [assembly file] [machine code file]

requires python 3.x

This assembler is assuming the bit breakdown as follows:
R-Type: 3 bits opcode, 2 bits destination register, 2 bits operand 1 register, 2 bits operand 2 register
I-Type: 3 bits opcode, 2 bits destination register, 4 bits immediate
B-Type: 3 bits opcode, 2 bits address register, 2 bits operand 1 register, 2 bits operand 2 register
"""

import sys

# map registers to binary
registers = {
    "r0": "000",
    "r1": "001",
    "r2": "010",
    "r3": "011",
    "r4": "100",
    "r5": "101",
    "r6": "110",
    "r7": "111",
    }

# map opcode to binary
# NOTE: THIS WILL BE DIFFERENT FOR YOU!
opcode = {
    "xor": "000",
    "rxor": "001",
    "or": "010",
    "beq": "011",
    "land": "100",
    "ma": "101",
    "bs": "110",
    "addi": "111",
    }

# classify instructions into different types
# NOTE: THIS WILL BE DIFFERENT FOR YOU!
rtype = ['xor', 'rxor', 'or', 'beq']
ltype = ['land']
stype = ['ma', 'bs']
itype = ['addi']

# NOTE: THIS WILL BE DIFFERENT FOR YOU!
comment_char = '#'

with (
    open(sys.argv[1], "r") as read,
    open(sys.argv[2], "w") as write
):
# with automatically handles file (no need for open and close)
    line = read.readline() # read a line

    # for every line
    while(line):
        # strip takes away whitespace from left and right
        line = line.strip()

        if line == "done":
            writeline = '100000111'
            write.write(writeline)
            break

        # split your comments out
        line = line.split(comment_char, 1)

        # store instruction and comment
        inst = line[0].strip()
        comment = line[1].strip()

        # split instruction into arguments
        inst = inst.split()

        # initialize the string that contains the machine code binary
        writeline = ''

        # write the opcode
        if inst[0] in opcode:
            writeline += opcode[inst[0]]
        else:
            # if it an instruction that doesn't exist, exit
            sys.exit()

        # write the first register to binary (maybe you need checking on this)
        writeline += registers[inst[1]]

        # if it's r-type or b-type, then you know you have 2 args after (this might be different for you)
        if inst[0] in rtype:
            writeline += registers[inst[2]]
        elif inst[0] in itype:
            # immediate just goes straight in
            # writeline += inst[2]
            if (inst[2] == '-4'):
                writeline += "100"
            elif (inst[2] == '-3'):
                writeline += "101"
            elif (inst[2] == '-2'):
                writeline += "110"
            elif (inst[2] == '-1'):
                writeline += "111"
            elif (inst[2] == '0'):
                writeline += "000"
            elif (inst[2] == '1'):
                writeline += "001"
            elif (inst[2] == '2'):
                writeline += "010"
            elif (inst[2] == '3'):
                writeline += "011"
            else:
                sys.exit()
        elif inst[0] in ltype:
            if (inst[2] == '0'):
                writeline += "000"
            elif (inst[2] == '1'):
                writeline += "001"
            elif (inst[2] == '2'):
                writeline += "010"
            elif (inst[2] == '3'):
                writeline += "011"
            elif (inst[2] == '4'):
                writeline += "100"
            elif (inst[2] == '5'):
                writeline += "101"
            elif (inst[2] == '6'):
                writeline += "110"
            elif (inst[2] == '7'):
                writeline += "111"
            else:
                sys.exit()
        elif inst[0] in stype:
            if (inst[2] == 'l'):
                writeline += "0"
            elif (inst[2] == 's' or inst[2] == 'r'):
                writeline += "1"
            else:
                print("hi")
                sys.exit()
            
            if (inst[0] == 'bs'):
                if (inst[3] == '0'):
                    writeline += "00"
                elif (inst[3] == '1'):
                    writeline += "01"
                elif (inst[3] == '2'):
                    writeline += "10"
                elif (inst[3] == '3'):
                    writeline += "11"
            elif (inst[0] == 'ma'):
                writeline += "00"
            else:
                print(":D")
                sys.exit()
        
        else:
            sys.exit()

        # SystemVerilog ignores comments prepended with // with readmemb or readmemh
        writeline += ' //' + comment
        writeline += '\n'

        # write the line into the desired file
        write.write(writeline)

        # read the next line
        line = read.readline()
