module DoneFlagComparator (
  input       [8:0]   Instruction,
  output logic        Ack
);

  assign  Ack = (Instruction == 9'b100000111);

//There is no writing to instruction mem.
endmodule