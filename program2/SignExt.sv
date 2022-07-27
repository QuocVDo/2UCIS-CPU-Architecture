module SignExt #(parameter W=8) (                 
  input  signed     [2:0]   Immediate,         //Immediate Input is 3 bits, we need to sign extend to 8-bits
  output signed     [7:0]   SignExtImm        //Output
);
  assign SignExtImm = Immediate;
endmodule
