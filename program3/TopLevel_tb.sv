// Create Date:   2017.01.25
// Design Name:   TopLevel Test Bench
// Module Name:   TopLevel_tb.v
// CSE141L

// This is NOT synthesizable; use for logic simulation only
// Verilog Test Fixture created for module: TopLevel

module TopLevel_tb;

// This defines what `#1` means, so later, when the clock is
// up wait `#5` then down wait `#5` we make a 100 MHz clock.
timeunit 1ns;
// This defines the precision of delays in the simulation.
// Convention is for this to be three orders of magnitude
// more precise unless you have a reason for it to be
// something else.
timeprecision 1ps;

// To DUT Inputs
bit Reset = 1'b1;
bit Req = 0;
bit Clk;

// From DUT Outputs
wire Ack;              // done flag

// Instantiate the Device Under Test (DUT)
TopLevel DUT (
  .Reset  (Reset),
  .Start  (Req ),
  .Clk    (Clk ),
  .Ack    (Ack )
);

// This is the important part of the testbench, where logic might be added
initial begin
  #10 $displayb(DUT.DM1.Core[0],
                DUT.DM1.Core[1],"_",
                DUT.DM1.Core[2],
                DUT.DM1.Core[3]);
                
  #10 Reset = 'b0;
  #10 Req   = 'b1;

  // TODO: FILL IN THE DUT.DM1.CoreORY LOCATIONS HERE.
  /*
  DUT.DM1.Core[0] = 'b01010101;
  DUT.DM1.Core[1] = 'b00000101;
  DUT.DM1.Core[2] = 'b01010101;
  DUT.DM1.Core[3] = 'b00000101;
  DUT.DM1.Core[4] = 'b01010101;
  DUT.DM1.Core[5] = 'b00000101;
  DUT.DM1.Core[6] = 'b01010101;
  DUT.DM1.Core[7] = 'b00000101;
  DUT.DM1.Core[8] = 'b01010101;
  DUT.DM1.Core[9] = 'b00000101;
  DUT.DM1.Core[10] = 'b01010101;
  DUT.DM1.Core[11] = 'b00000101;
  DUT.DM1.Core[12] = 'b01010101;
  DUT.DM1.Core[13] = 'b00000101;
  DUT.DM1.Core[14] = 'b01010101;
  DUT.DM1.Core[15] = 'b00000101;
  DUT.DM1.Core[16] = 'b01010101;
  DUT.DM1.Core[17] = 'b00000101;
  DUT.DM1.Core[18] = 'b01010101;
  DUT.DM1.Core[19] = 'b00000101;
  DUT.DM1.Core[20] = 'b01010101;
  DUT.DM1.Core[21] = 'b00000101;
  DUT.DM1.Core[22] = 'b01010101;
  DUT.DM1.Core[23] = 'b00000101;
  DUT.DM1.Core[24] = 'b01010101;
  DUT.DM1.Core[25] = 'b00000101;
  DUT.DM1.Core[26] = 'b01010101;
  DUT.DM1.Core[27] = 'b00000101;
  DUT.DM1.Core[28] = 'b01010101;
  DUT.DM1.Core[29] = 'b00000101;
  */
  
  DUT.DM1.Core[59] = 'b10101010; // case 1, no error
  DUT.DM1.Core[58] = 'b01011010;
  DUT.DM1.Core[57] = 'b10101011;// case 2, parity error (one bit error)
  DUT.DM1.Core[56] = 'b01011010;
  DUT.DM1.Core[55] = 'b10101010; // case 3, message error (one bit error)
  DUT.DM1.Core[54] = 'b01010010;
  DUT.DM1.Core[53] = 'b10101110; // case 4, double error
  DUT.DM1.Core[52] = 'b01111010;
  DUT.DM1.Core[51] = 'b10101010; // just do a bunch of case 1 from now on
  DUT.DM1.Core[50] = 'b01011010;
  DUT.DM1.Core[49] = 'b10101010;
  DUT.DM1.Core[48] = 'b01011010;
  DUT.DM1.Core[47] = 'b10101010;
  DUT.DM1.Core[46] = 'b01011010;
  DUT.DM1.Core[45] = 'b10101010;
  DUT.DM1.Core[44] = 'b01011010;
  DUT.DM1.Core[43] = 'b10101010;
  DUT.DM1.Core[42] = 'b01011010;
  DUT.DM1.Core[41] = 'b10101010;
  DUT.DM1.Core[40] = 'b01011010;
  DUT.DM1.Core[39] = 'b10101010;
  DUT.DM1.Core[38] = 'b01011010;
  DUT.DM1.Core[37] = 'b10101010;
  DUT.DM1.Core[36] = 'b01011010;
  DUT.DM1.Core[35] = 'b10101010;
  DUT.DM1.Core[34] = 'b01011010;
  DUT.DM1.Core[33] = 'b10101010;
  DUT.DM1.Core[32] = 'b01011010;
  DUT.DM1.Core[31] = 'b10101100;
  DUT.DM1.Core[30] = 'b01101111;



  /*
  DUT.DM1.Core[32] = 'b10101000; // the pattern is the most significant 5 bits (00000)
  DUT.DM1.Core[31] = 'b10101010;
  DUT.DM1.Core[30] = 'b10101010;
  DUT.DM1.Core[29] = 'b10101010;
  DUT.DM1.Core[28] = 'b10101010;
  DUT.DM1.Core[27] = 'b10101010;
  DUT.DM1.Core[26] = 'b10101010;
  DUT.DM1.Core[25] = 'b10101010;
  DUT.DM1.Core[24] = 'b10101010;
  DUT.DM1.Core[23] = 'b10101010;
  DUT.DM1.Core[22] = 'b10101010;
  DUT.DM1.Core[21] = 'b10101010;
  DUT.DM1.Core[20] = 'b10101010;
  DUT.DM1.Core[19] = 'b10101010;
  DUT.DM1.Core[18] = 'b10101010;
  DUT.DM1.Core[17] = 'b10101010;
  DUT.DM1.Core[16] = 'b10101010;
  DUT.DM1.Core[15] = 'b10101010;
  DUT.DM1.Core[14] = 'b10101010;
  DUT.DM1.Core[13] = 'b10101010;
  DUT.DM1.Core[12] = 'b10101010;
  DUT.DM1.Core[11] = 'b10101010;
  DUT.DM1.Core[10] = 'b10101010;
  DUT.DM1.Core[9] = 'b10101010;
  DUT.DM1.Core[8] = 'b10101010;
  DUT.DM1.Core[7] = 'b10101010;
  DUT.DM1.Core[6] = 'b10101010;
  DUT.DM1.Core[5] = 'b10101010;
  DUT.DM1.Core[4] = 'b10101010;
  DUT.DM1.Core[3] = 'b10101010;
  DUT.DM1.Core[2] = 'b10101010;
  DUT.DM1.Core[1] = 'b10101010;
  DUT.DM1.Core[0] = 'b10101010;
  */
  // launch program in DUT
  #10 Req = 0;

  //#20000 $stop;

  // Wait for done flag, then display results
  wait (Ack);
  $display("TEST\n");
  $display("%b %b", DUT.DM1.Core[31],  DUT.DM1.Core[30]);
  $display("%b %b", DUT.DM1.Core[33],  DUT.DM1.Core[32]);
  $display("%b %b", DUT.DM1.Core[35],  DUT.DM1.Core[34]);
  $display("%b %b", DUT.DM1.Core[37],  DUT.DM1.Core[36]);
  $display("%b %b", DUT.DM1.Core[39],  DUT.DM1.Core[38]);
  $display("%b %b", DUT.DM1.Core[41],  DUT.DM1.Core[40]);
  $display("%b %b", DUT.DM1.Core[43],  DUT.DM1.Core[42]);
  $display("%b %b", DUT.DM1.Core[45],  DUT.DM1.Core[44]);
  $display("%b %b", DUT.DM1.Core[47],  DUT.DM1.Core[46]);
  $display("%b %b", DUT.DM1.Core[49],  DUT.DM1.Core[48]);
  $display("%b %b", DUT.DM1.Core[51],  DUT.DM1.Core[50]);
  $display("%b %b", DUT.DM1.Core[53],  DUT.DM1.Core[52]);
  $display("%b %b", DUT.DM1.Core[55],  DUT.DM1.Core[54]);
  $display("%b %b", DUT.DM1.Core[57],  DUT.DM1.Core[56]);
  $display("%b %b", DUT.DM1.Core[59],  DUT.DM1.Core[58]);

  

  /*
  $display("%b\n", DUT.DM1.Core[32]);
  $display("%b\n", DUT.DM1.Core[33]);
  $display("%b\n", DUT.DM1.Core[34]);
  $display("%b\n", DUT.DM1.Core[35]);
  $display("%b\n", DUT.DM1.Core[36]);
  $display("%b\n", DUT.DM1.Core[37]);
  $display("%b\n", DUT.DM1.Core[38]);
  $display("%b\n", DUT.DM1.Core[39]);
  $display("%b\n", DUT.DM1.Core[40]);
  $display("%b\n", DUT.DM1.Core[41]); 
  $display("%b\n", DUT.DM1.Core[42]);
  $display("%b\n", DUT.DM1.Core[43]);
  $display("%b\n", DUT.DM1.Core[44]);
  $display("%b\n", DUT.DM1.Core[45]);
  $display("%b\n", DUT.DM1.Core[46]);
  $display("%b\n", DUT.DM1.Core[47]); 
  $display("%b\n", DUT.DM1.Core[48]);
  $display("%b\n", DUT.DM1.Core[49]);
  $display("%b\n", DUT.DM1.Core[50]);
  $display("%b\n", DUT.DM1.Core[51]);
  $display("%b\n", DUT.DM1.Core[52]);
  $display("%b\n", DUT.DM1.Core[53]); 
  $display("%b\n", DUT.DM1.Core[54]);
  $display("%b\n", DUT.DM1.Core[55]);
  $display("%b\n", DUT.DM1.Core[56]);
  $display("%b\n", DUT.DM1.Core[57]);
  $display("%b\n", DUT.DM1.Core[58]);
  $display("%b\n", DUT.DM1.Core[59]);
  */


  #200 $stop;



  
  #10 $display("------------------------------------------");
  if (DUT.DM1.Core[59] != 'b10101010) begin
    $display("ERROR, DUT.DM1.Core[59] should be %b, but is %b",8'b1010_1010, DUT.DM1.Core[59]);
  end
  if (DUT.DM1.Core[58] != 'b01011010) begin
    $display("ERROR, DUT.DM1.Core[58] should be %b, but is %b",8'b01011010, DUT.DM1.Core[58]);
  end

  // TODO keep writing checks here.

  //#10 $displayh(DUT.DM1.Core[0],
  //              DUT.DM1.Core[1],"_",
  //              DUT.DM1.Core[2],
  //              DUT.DM1.Core[3]);
  //    $display("last instruction = %d || sim time %t",DUT.counter,$time);
 
  // Note: $stop acts like a breakpoint, pausing the simulation
  // and allowing certain tools to interact with it more, in
  // contrast to $finish, which ends the simulation.
  //#10 $stop;
end

// This generates the system clock
always begin   // clock period = 10 Verilog time units
  #5 Clk = 1'b1;
  #5 Clk = 1'b0;
end
endmodule
