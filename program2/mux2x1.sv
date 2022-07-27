module mux2x1(
  input logic[7:0] in0, in1, 
  input logic sel, 
  output logic[7:0] out
); 
  always @(sel or in0 or in1)
  begin
     if(sel == 0)
       out = in0;
     else
       out = in1; 
  end
endmodule
 