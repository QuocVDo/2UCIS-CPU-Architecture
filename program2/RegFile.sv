module RegFile (
  input  logic         Clk,
  input  logic         Reset,
  input  logic         WriteEn,
  input  logic [2:0] Raddr1,    // address pointers
  input  logic [2:0] Raddr2,    // address pointers
  input  logic [2:0] Waddr,     // address pointers
  input  logic [7:0] DataIn,    // data for registers
  output logic [7:0] DataOut1,  //   showing two different ways to handle
  output logic [7:0] DataOut2,   //   DataOutX, for pedagogic reasons only
  output logic [7:0] Reg0,  //   DataOutX, for pedagogic reasons only
  output logic [7:0] Reg7  //   DataOutX, for pedagogic reasons only
);

  //8 bit wide reigsters, 8 registers tottal
  logic[7:0] Registers[8];

  //Data out is equal to the Regiseters array at the read adress
  assign DataOut1 = Registers[Raddr1];
  assign DataOut2 = Registers[Raddr2];
  assign Reg7 = Registers[7];
  assign Reg0 = Registers[0];

  initial begin
    $readmemb("reg_preset.txt", Registers);
  end

  always_ff @ (posedge Clk) begin
    if (WriteEn) begin
      Registers[Waddr] <= DataIn;
    end
  end
  
endmodule