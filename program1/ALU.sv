// Create Date:    2018.10.15
// Module Name:    ALU 
// Project Name:   CSE141L
//
// Revision 2022.04.30
// Additional Comments: 
//   combinational (unclocked) ALU
import Definitions::*;			         // includes package "definitions"
module ALU #(parameter W=8)(
  input        [W-1:0] InputA,           // Reg1
                       InputB,           // Reg2, Immediate, or LutAND 
  input        [  2:0] OP,		         // ALUOp
  output logic [W-1:0] Out,		         // or:  output reg [7:0] OUT,
  output logic         Zero              // output = zero flag
           // you may provide additional status flags, if desired
    );				    
  op_mne opmne;
  assign opmne = op_mne'(OP);
 

  always_comb begin
    Out = 0;  
    Zero = 0;                  
    case(OP)
        XOR : Out = InputA ^ InputB;
        RXOR : Out = ^InputB;
        OR : Out = InputA | InputB;
        BEQ : Zero = (InputA == InputB);
        LAND : Out = InputA & InputB;
        MA : Out = 0;
        BS : begin
            if (InputB[2] == 1)
                Out = InputA >> InputB[1:0];
            else
                Out = InputA << InputB[1:0];
        end
        ADDI : Out = InputA + InputB;
    endcase
  end



endmodule

