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


//I believe the AUTOGRADER is messing up somehow for most of the test cases,
//These are the first 5 fails that we got (copy pasted from gradescope)

//FAILED: program 1 0111001010110001 /= 1000000101110001, input 01110011010
//FAILED: program 1 1111000001011010 /= 1000000101110001, input 11110000101
//FAILED: program 1 1101101101111110 /= 1000000101110001, input 11011010111
//FAILED: program 1 0011001100000000 /= 1000000101110001, input 00110010000
//FAILED: program 1 0000100111111001 /= 1000000101110001, input 00001001111
  

  //FAILED: program 1 0111001010110001 /= 1000000101110001, input 01110011010
  DUT.DM1.Core[0] = 'b10011010;
  DUT.DM1.Core[1] = 'b00000011;


  //FAILED: program 1 1111000001011010 /= 1000000101110001, input 11110000101
  DUT.DM1.Core[2] = 'b10000101;
  DUT.DM1.Core[3] = 'b00000111;

  //FAILED: program 1 1101101101111110 /= 1000000101110001, input 11011010111
  DUT.DM1.Core[4] = 'b11010111;
  DUT.DM1.Core[5] = 'b00000110;


  //FAILED: program 1 0011001100000000 /= 1000000101110001, input 00110010000
  DUT.DM1.Core[6] = 'b10010000;
  DUT.DM1.Core[7] = 'b00000001;


  //FAILED: program 1 0000100111111001 /= 1000000101110001, input 00001001111
  DUT.DM1.Core[8] = 'b01001111;
  DUT.DM1.Core[9] = 'b00000000;


  //FILL WITH 0's just care about the first 5 test cases
  DUT.DM1.Core[10] = 'b00000000;
  DUT.DM1.Core[11] = 'b00000000;
  DUT.DM1.Core[12] = 'b00000000;
  DUT.DM1.Core[13] = 'b00000000;
  DUT.DM1.Core[14] = 'b00000000;
  DUT.DM1.Core[15] = 'b00000000;
  DUT.DM1.Core[16] = 'b00000000;
  DUT.DM1.Core[17] = 'b00000000;
  DUT.DM1.Core[18] = 'b00000000;
  DUT.DM1.Core[19] = 'b00000000;
  DUT.DM1.Core[20] = 'b00000000;
  DUT.DM1.Core[21] = 'b00000000;
  DUT.DM1.Core[22] = 'b00000000;
  DUT.DM1.Core[23] = 'b00000000;
  DUT.DM1.Core[24] = 'b00000000;
  DUT.DM1.Core[25] = 'b00000000;
  DUT.DM1.Core[26] = 'b00000000;
  DUT.DM1.Core[27] = 'b00000000;
  DUT.DM1.Core[28] = 'b00000000;
  DUT.DM1.Core[29] = 'b00000000;
  

  // launch program in DUT
  #10 Req = 0;

  //#20000 $stop;

  // Wait for done flag, then display results
  wait (Ack);
  $display("TEST\n");
  $display("%b%b", DUT.DM1.Core[31],  DUT.DM1.Core[30]); //DISPLAY FORMAT: MSW LSW
  $display("%b%b", DUT.DM1.Core[33],  DUT.DM1.Core[32]);
  $display("%b%b", DUT.DM1.Core[35],  DUT.DM1.Core[34]);
  $display("%b%b", DUT.DM1.Core[37],  DUT.DM1.Core[36]);
  $display("%b%b", DUT.DM1.Core[39],  DUT.DM1.Core[38]);


  

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
