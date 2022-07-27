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
  
// FAILED: program 2 0100001110010110 /= 0000010010011100, input 1111001001110010
// FAILED: program 2 0100010011000110 /= 0000011001000000, input 1101100101100110
// FAILED: program 2 0100011101011101 /= 0000011010000110, input 1100101111011000
// FAILED: program 2 0100011001101100 /= 0000000011100111, input 1101110011000011
// FAILED: program 2 0100001101111110 /= 0000010101000011, input 0110011111110110
// FAILED: program 2 0100001010011000 /= 0000011000011011, input 0101011110010000
// FAILED: program 2 0100010111110101 /= 0000011001110011, input 1011110001001110
// FAILED: program 2 0100001110010001 /= 0000000010110000, input 0111001100011011
// FAILED: program 2 0100001110001100 /= 0111000111000011, input 0111000101010100
// FAILED: program 2 0100001010000010 /= 0000000000000000, input 0101000001110110

  // FAILED: program 2 0100001110010110 /= 0000010010011100, input 11110010 01110010
  DUT.DM1.Core[31] = 'b11110010; 
  DUT.DM1.Core[30] = 'b01110010;

  // FAILED: program 2 0100010011000110 /= 0000011001000000, input 11011001 01100110
  DUT.DM1.Core[33] = 'b11011001;
  DUT.DM1.Core[32] = 'b01100110;

  // FAILED: program 2 0100011101011101 /= 0000011010000110, input 11001011 11011000
  DUT.DM1.Core[35] = 'b11001011; 
  DUT.DM1.Core[34] = 'b11011000;

  // FAILED: program 2 0100011001101100 /= 0000000011100111, input 11011100 11000011
  DUT.DM1.Core[37] = 'b11011100; 
  DUT.DM1.Core[36] = 'b11000011;

  // FAILED: program 2 0100001101111110 /= 0000010101000011, input 01100111 11110110
  DUT.DM1.Core[39] = 'b01100111; 
  DUT.DM1.Core[38] = 'b11110110;

  // FAILED: program 2 0100001010011000 /= 0000011000011011, input 01010111 10010000
  DUT.DM1.Core[41] = 'b01010111;
  DUT.DM1.Core[40] = 'b10010000;

  // FAILED: program 2 0100010111110101 /= 0000011001110011, input 10111100 01001110
  DUT.DM1.Core[43] = 'b10111100;
  DUT.DM1.Core[42] = 'b01001110;

  // FAILED: program 2 0100001110010001 /= 0000000010110000, input 01110011 00011011
  DUT.DM1.Core[45] = 'b01110011;
  DUT.DM1.Core[44] = 'b00011011;

  // FAILED: program 2 0100001110001100 /= 0111000111000011, input 01110001 01010100
  DUT.DM1.Core[47] = 'b01110001;
  DUT.DM1.Core[46] = 'b01010100;

  // FAILED: program 2 0100001010000010 /= 0000000000000000, input 01010000 01110110
  DUT.DM1.Core[49] = 'b01010000;
  DUT.DM1.Core[48] = 'b01110110;


  //ALL 0
  DUT.DM1.Core[59] = 'b00000000;
  DUT.DM1.Core[58] = 'b00000000;
  DUT.DM1.Core[57] = 'b00000000;
  DUT.DM1.Core[56] = 'b00000000;
  DUT.DM1.Core[55] = 'b00000000;
  DUT.DM1.Core[54] = 'b00000000;
  DUT.DM1.Core[53] = 'b00000000;
  DUT.DM1.Core[52] = 'b00000000;
  DUT.DM1.Core[51] = 'b00000000;
  DUT.DM1.Core[50] = 'b00000000;




  // launch program in DUT
  #10 Req = 0;

  //#20000 $stop;

  // Wait for done flag, then display results
  wait (Ack);
  $display("TEST\n");
  $display("%b%b", DUT.DM1.Core[1],  DUT.DM1.Core[0]);
  $display("%b%b", DUT.DM1.Core[3],  DUT.DM1.Core[2]);
  $display("%b%b", DUT.DM1.Core[5],  DUT.DM1.Core[4]);
  $display("%b%b", DUT.DM1.Core[7],  DUT.DM1.Core[6]);
  $display("%b%b", DUT.DM1.Core[9],  DUT.DM1.Core[8]);
  $display("%b%b", DUT.DM1.Core[11],  DUT.DM1.Core[10]);
  $display("%b%b", DUT.DM1.Core[13],  DUT.DM1.Core[12]);
  $display("%b%b", DUT.DM1.Core[15],  DUT.DM1.Core[14]);
  $display("%b%b", DUT.DM1.Core[17],  DUT.DM1.Core[16]);
  $display("%b%b", DUT.DM1.Core[19],  DUT.DM1.Core[18]);


  

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
