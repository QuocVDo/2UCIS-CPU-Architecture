`timescale 1ns/ 1ps

// Test bench
// Arithmetic Logic Unit

//
// INPUT: A, B
// op: 000, A ADD B
// op: 100, A_AND B
// ...
// Please refer to definitions.sv for support ops (make changes if necessary)
// OUTPUT A op B
// equal: is A == B?
// even: is the output even?
//

module ALU_tb;
import Definitions::*;
// Define signals to interface with the ALU module
logic [ 7:0] INPUTA;  // data inputs
logic [ 7:0] INPUTB;
logic [ 2:0] op;      // ALU opcode, part of microcode
logic [ 2:0] SHMT;
wire[ 7:0] OUT;
wire Zero;

// Define a helper wire for comparison
logic [ 7:0] expected;
logic [ 7:0] expectedZero;

int fi;
// Instatiate and connect the Unit Under Test
ALU uut(
  .InputA(INPUTA),
  .InputB(INPUTB),
  .Shmt(SHMT),
  .OP(op),
  .Out(OUT),
  .Zero(Zero)
);


// The actual testbench logic
initial begin
  fi = $fopen("alu_transcript.txt","w");
  INPUTA = 8'b00001111;
  INPUTB = 8'b11110000;
  op= 'b000; // XOR
  test_alu_func; // void function call
  #5;

  INPUTA = 8'b10101010;
  INPUTB = 8'b00000000;
  op= 'b001; // RXOR
  test_alu_func; // void function call
  #5;

  INPUTA = 8'b10101010;
  INPUTB = 8'b00000000;
  op= 'b010; // OR
  test_alu_func; // void function call
  #5;

  INPUTA = 8'b10101010;
  INPUTB = 8'b00000000;
  op= 'b011; // BEQ
  test_alu_func; // void function call
  #5;

  INPUTA = 8'b10101010;
  INPUTB = 8'b00000000;
  op= 'b100; // LAND
  test_alu_func; // void function call
  #5;

  INPUTA = 8'b10101010;
  INPUTB = 8'b00000000;
  op= 'b101; // MA
  test_alu_func; // void function call
  #5;

  INPUTA = 8'b10101010;
  INPUTB = 8'b00000000;
  SHMT = 3'b111;
  op= 'b110; // BS
  test_alu_func; // void function call
  #5;

  INPUTA = 8'b10101010;
  INPUTB = 8'b00000000;
  op= 'b111; // ADDI
  test_alu_func; // void function call
  #5;
end

task test_alu_func;
  expected = 0;  
  expectedZero = 0; 
  case (op)
    0 : expected = INPUTA ^ INPUTB;
    1 : expected = ^INPUTA;
    2 : expected = INPUTA | INPUTB;
    3 : expected = (INPUTA == INPUTB);
    4 : expected = INPUTA & INPUTB;
    5 : expectedZero = 0;
    6 : begin
        if (SHMT[2] == 1)
            expected = INPUTA >> SHMT[1:0];
        else
            expected = INPUTA << SHMT[1:0];
    end
    7 : expected = INPUTA + INPUTB;
  endcase
  #1;
  if(expected == OUT & expectedZero == Zero) begin
    $fdisplay(fi,"%t YAY!! inputs = %h %h, opcode = %b, Zero %b",$time, INPUTA,INPUTB,op, Zero);
  end else begin
    $fdisplay(fi,"%t FAIL! inputs = %h %h, opcode = %b, zero %b",$time, INPUTA,INPUTB,op, Zero);
  end
endtask

initial begin
  $dumpfile("alu.vcd");
  $dumpvars();
  $dumplimit(104857600); // 2**20*100 = 100 MB, plenty.
end

endmodule
