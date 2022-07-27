module ProgCtr_tb;
  timeunit 1ns/1ps;

  bit Start;
  bit Reset;
  bit Clk;
  bit BranchEn;
  bit ZeroFlag;
  bit [9:0] Target;
  bit [9:0] ProgCtrOutput;

  ProgCtr uut (
    .Start,
    .Reset,
    .Clk,
    .BranchEn,
    .ZeroFlag,
    .Target,
    .ProgCtr(ProgCtrOutput)
  );

  
  integer  ClockCounter = 0;
  always @(posedge Clk)
    ClockCounter <= ClockCounter + 1;

  int fi;
  initial begin
    fi = $fopen("pc_transcript.txt","w");
    $fdisplay(fi,"Initalize Testbench");
    Reset = 1'b1;
    Clk = 1'b0;
    BranchEn = 1'b0;
    ZeroFlag = 1'b0;
    Target = 10'b0;

    //Advance to Simulation Time 1
    #1 Clk = 1'b1;

    // Advance to simulation time 2, check results, prepare next values
    #1 Clk = 1'b0;
    $fdisplay(fi,"Checking Reset behavior");
    assert (ProgCtrOutput == 'd0);
    Reset = '0;

    // Advance to simulation time 3, latch values
    #1 Clk = 1'b1;
    

    // Advance to simulation time 4, check results, prepare next values
    #1 Clk = '0;
    $fdisplay(fi,"Checking next value of PC - no start flag");
    assert(ProgCtrOutput == 'd0);
    Start = 1;

    // Advance to simulation time 5, latch values
    #1 Clk = '1;

    // Advance to simulation time 6, check results, prepare next values
    #1 Clk = '0;
    $fdisplay(fi,"Checking next value of PC - increment behavior");
    assert(ProgCtrOutput == 'd1);


    // Advance to simulation time 7, latch values
    #1 Clk = '1;

    // Advance to simulation time 8, check results, prepare next values
    #1 Clk = '0;
    $fdisplay(fi,"Checking next value of PC - increment behavior");
    assert(ProgCtrOutput == 'd2);
    BranchEn = '1;
    ZeroFlag = '1;
    Target = 'd100;

    // Advance to simulation time 9, latch values
    #1 Clk = '1;

    //Advance to  simulation 10, check results
    #1 Clk = '0;
    $fdisplay(fi,"Checking next value of PC - BRANCH Behavior");
    assert(ProgCtrOutput == 'd100);

    $fdisplay(fi,"All Checks passed");
  end


endmodule