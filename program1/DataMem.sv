module DataMem #(parameter W=8, A=8) (
  input                 Clk,
                        WriteEn,
  input       [A-1:0]   Address, // A-bit-wide pointer to 256-deep memory
  input       [W-1:0]   DataIn,      // W-bit-wide data path, also
  output logic[W-1:0]   DataOut
);

//The DATA MEMORY
logic [W-1:0] Core[0:2**A-1];

assign DataOut = Core[Address];

//Place holder, read data mem from a file to the internal DM
//initial begin
//  $readmemb("data_mem.txt", Core);
//end

// writes are sequential no preloading of constants, no reset signal necessary for datamem
always_ff @ (posedge Clk)
  if(WriteEn)
    Core[Address] <= DataIn;
endmodule