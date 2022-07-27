// Project Name:   CSE141L
// Module Name:    ProgCtr
// Description:    instruction fetch (pgm ctr) for processor

// Parameters:
//  A: Number of address bits in instruction memory
module ProgCtr #(parameter A=10)(
  input               Start,
                      Reset,       // reset, init, etc. -- force PC to by test bench)
                      Clk,         // PC can change on pos. edges only
                      BranchEn,
                      ZeroFlag,
  input        [A-1:0] Target,      // jump ... "how high?"
  output logic [A-1:0] ProgCtr     // the program counter register itself

);

//logic [1:0] StartCount;
//logic start_r;

// program counter can clear to 0, increment, or jump
always_ff @(posedge Clk) begin

  if(Reset) begin
    ProgCtr <= 10'b0;                  // for first program; want different value for 2nd or 3rd

  end
  else if (BranchEn & ZeroFlag & Start)
    ProgCtr <= Target;
  else if(Start)
    ProgCtr <= ProgCtr + 1;
  else 
    ProgCtr <= ProgCtr;                //Freeze programm counter if no Start signal
end



endmodule
