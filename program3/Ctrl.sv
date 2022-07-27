// Project Name:   CSE141L
// Module Name:    Ctrl
// Create Date:    ?
// Last Update:    2022.01.13

// control decoder (combinational, not clocked)
// inputs from ... [instrROM, ALU flags, ?]
// outputs to ...  [program_counter (fetch unit), ?]

// n.b. This is an example / starter block
//      Your processor **will be different**!
module Ctrl (
  input  [2:0] Instruction,    // machine code, instruction [8:6]
                               // some designs use ALU inputs here
  output logic       BranchEn, 
                     RegWen,
                     DatWen,
                     MemToReg,
                     WaddrSel,
  output logic [1:0] ALUSrc,
  output logic [2:0] ALUOp
);


assign ALUOp = Instruction;

always_comb begin
  // No Op = default
  BranchEn = 0;
  RegWen = 0;
  DatWen = 0;
  MemToReg = 0;
  ALUSrc = 0;
  WaddrSel = 0;

  case(Instruction)
    3'b000: begin
      RegWen = 1;
      ALUSrc = 2'b00;
      MemToReg = 0;
    end
    3'b001: begin
      RegWen = 1;
      ALUSrc = 2'b00;
      MemToReg = 0;
    end
    3'b010: begin
      RegWen = 1;
      ALUSrc = 2'b00;
      MemToReg = 0;
    end
    3'b011: begin
      RegWen = 0;
      BranchEn = 1;
      ALUSrc = 2'b00;
      MemToReg = 0;
    end
    3'b100: begin
      RegWen = 1;
      ALUSrc = 2'b10;
      MemToReg = 0;
    end
    3'b101: begin
      DatWen = 1;
      RegWen = 1;
      MemToReg = 1;
    end
    3'b110: begin
      RegWen = 1;
      MemToReg = 1;
    end
    3'b111: begin
      RegWen = 1;
      ALUSrc = 2'b01;
    end
    default: begin
      BranchEn = 0;
      RegWen = 0;
      DatWen = 0;
      MemToReg = 0;
      ALUSrc = 0; 
    end
  endcase
end

endmodule
