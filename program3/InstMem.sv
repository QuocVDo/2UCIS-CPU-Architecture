module InstMem (
  input       [9:0]   Address, // 10  bit wide address to address a memory of size 2^10
  output logic[8:0]   Instruction  // Each instruction is 9 bits wide
);

  //The INST MEMORY
  logic [8:0] IM[1023:0];

  //get outupt
  assign Instruction = IM[Address];

  //initalize instruction mem
  initial begin
    $readmemb("machinecode.txt", IM);
    //IM[0] = 9'b111000001;
    //IM[1] = 9'b111001001;
    //IM[2] = 9'b000001000;

  end

//There is no writing to instruction mem.
endmodule