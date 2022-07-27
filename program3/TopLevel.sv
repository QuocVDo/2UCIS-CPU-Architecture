// Design Name:      CSE141L
// Module Name:      TopLevel

// you will have the same 3 ports
module TopLevel(
  input        Reset,      // init/reset, active high
               Start,      // start next program
               Clk,        // clock -- posedge used inside design
  output logic Ack         // done flag from DUT
);


// Declare all the connections between modules.
//
// Generally, naming signals to match where they came from works
// well, i.e. MODULEINSTANCE_SIGNAL_out. This is because there is
// generally only one driver of a connection (enforced by the
// `logic` keyword), but it may fan out to multiple uses.
//
// Note that signals are named after the *instance* of the module
// not the type of the module (because you might instantiate
// multiple copies of certain modules).
//
// It's useful to have all of the connections declared at the top,
// because sometimes wires will 'loop back' (i.e. be needed as an
// input to a module but driven by a module that hasn't been
// declared yet).
//
// Stylistically, try to keep these declarations in the same order
// as the modules below. This will make your life easier.


// InstMem outputs
wire [8:0] Instruction;  // the 9-bit instruction

// ProgCtr outputs
wire [9:0] ProgCtr;  // the program counter

// LUT outputs
wire [7:0] Target;  // operand for LUT AND

// Control block outputs
logic       BranchEn;   //to mux, enable jump
logic       RegWen;     //RegFile write enable
logic       DatWen;     //DataMem write enable
logic       MemToReg;   //DataMem read enable with mux
logic       RegDst;     //Controls the Register Destination for RegWrite
logic [1:0] ALUSrc;     //pick second operand source to ALU
//logic [2:0] ALUOp;    //ALU operation don't need this, we are just feeding OPCODE into ALU

// Register file outputs
logic [7:0] DataOut1; // Contents of first selected register
logic [7:0] DataOut2; // Contents of second selected register
logic [7:0] Reg0;
logic [7:0] Reg7;

//logic [7:0] InputA;

// ALU outputs
logic [7:0] ALUOut;
logic       ZeroFlag;

// Data Memory outputs
logic [7:0] MemoryDataOut;  // data out from data_memory

// RegMux (2x1)
logic [2:0] RegWaddr;

// ALUMux (4x1)
logic [7:0] InputA;
logic [7:0] InputB; // data in to reg file

// DataMux (2x1)
logic [7:0] RegWrData; // data to be written to register file

// SignExt
logic [7:0] SignExtImm;


//Internal Start Signal for Modules, initalize to 0
logic go = 0;

//Once we recieve negedge start (lower start flag), then we can allow 
//the program to proceed
always_ff @(negedge Start) begin 
  if(!Start & !Reset)
    go <= 1;
  else
    go <= 0;
end

// instruction ROM -- holds the machine code pointed to by program counter
InstMem IM1(
    .Address        (ProgCtr),         // output from PC jumping mux
    .Instruction    (Instruction)   // instruction to instruction memory to read
);


logic [9:0] BranchTarget;
assign BranchTarget = Reg7 << 2;
// this is the program counter module
ProgCtr PC1 (
    .Start       (go),                 //jdon't allow PC to proceed until internal "go" signal is HIGH
    .Reset       (Reset),              // reset to 0
    .Clk         (Clk),                // System CLK
    .BranchEn    (BranchEn),            // jump enable
    .ZeroFlag    (ZeroFlag),      
    .Target      (BranchTarget),    
    .ProgCtr     (ProgCtr)     // program count = index to instruction memory
);

DoneFlagComparator DFC1 (
    .Instruction    (Instruction),
    .Ack            (Ack)
);




/////////////////////////////////////////////////////////////////////// Fetch //



////////////////////////////////////////////////////////////////////////////////
// Decode = Control Decoder + Reg_file


// Control decoder
/*
Ctrl Ctrl1 (
  .Instruction  (Instruction[8:6]),
  .BranchEn     (BranchEn),
  .RegWen       (RegWen),
  .DatWen       (DatWen),
  .MemToReg     (MemToReg),
  .RegWaddrSel     (RegWaddrSel),
  .ALUSrc       (ALUSrc),
  .ALUOp        (ALUOp)
);
*/

//DECODE INSTRUCTION, MOVE CONTROL DECODE TO TOP LEVEL
always_comb begin

  //IF GO = 0, that  means the testbench hasn't signaled for us to start yet
  //Therefore you cannot proceed. Don't allow any control signals to write.
  if(!go) begin
    BranchEn = 0;
    RegWen = 0;
    DatWen = 0;
    MemToReg = 0;
    ALUSrc = 0;
    RegDst = 0;
  end
  //If Go = 1, then handle control signals via normal decoding.
  else begin
     BranchEn = 0;
    RegWen = 0;
    DatWen = 0;
    MemToReg = 0;
    ALUSrc = 0;
    RegDst = 0;
    case(Instruction[8:6])
      
      //XOR
      3'b000: begin
        RegWen = 1;
        ALUSrc = 2'b00;
      end
      
      //RXOR
      3'b001: begin
        RegWen = 1;
      
      //OR
      end
      3'b010: begin
        RegWen = 1;

      //BEQ  
      end
      3'b011: begin
        BranchEn = 1;
      end

      //LAND
      3'b100: begin
        RegWen = 1;
        ALUSrc = 2'b10;
      end
      
      //MA INSTRUCTION: select between load or store
      // (3 bit opcode) (3-bit operand which holds the addresss)(1-bit select)(2-bit shmt)
      3'b101: begin
        
        //Selector bit is instruction[2]. If this == 1 it is a STORE
        if(Instruction[2] == 1) begin
          DatWen = 1;
        end
        //Else it is a load, write to reg
        else begin
          RegWen = 1;
          MemToReg = 1;
          RegDst = 1;     
        end
      end

      //BS INSTRUCTIOn: select between left or right
      // (3 bit opcode) (3-bit operand which holds the addresss)(1-bit select)(2-bit shmt)
      3'b110: begin
        RegWen = 1;
        ALUSrc = 2'b11;
      end

      //ADDI
      3'b111: begin
        RegWen = 1;
        ALUSrc = 2'b01;
      end
    endcase
  end
 
end

// Register file
// A(3) makes this 2**3=8 elements deep
RegFile RF1 (
  .Clk       (Clk),
  .Reset     (Reset),
  .WriteEn   (RegWen),
  .Raddr1    (Instruction[5:3]),      // See example below on how 3 opcode bits
  .Raddr2    (Instruction[2:0]),      // could address 16 registers...
  .Waddr     (RegWaddr),                 // mux above
  .DataIn    (RegWrData),
  .DataOut1  (DataOut1),
  .DataOut2  (DataOut2),
  .Reg0      (Reg0),           //extra data out port used for STORE WORD (store Reg0 to mem)
  .Reg7      (Reg7)            //extra data out port used for BEQ (Target to Branch to Stored in Reg7 by convention) 
);

//RegDst = 0, then Write Address is the First Operand Register
//RegDst = 1, then Write Address = 0 (Write to Reg0 for Load)
//Using IF/ELSE logic to generate MUX because our Mux2x1 is 8 bits wide
always_comb begin
  if(RegDst == 1)
    RegWaddr = 3'b000;
  else 
    RegWaddr = Instruction[5:3];
end

SignExt SE1 (
    .Immediate      (Instruction[2:0]),
    .SignExtImm     (SignExtImm)
);

LUT LUTAND1 (
    .addr(Instruction[2:0]),
    .target(Target)
);

// Here's a neat trick:
//   one pointer, two adjacent read accesses:
//   (sample optional approach)
//	.RaddrA ({Active_InstOut[5:3],1'b0});
//	.RaddrB ({Active_InstOut[5:3],1'b1});InputA

// Also need to hook up the signal back to the testbench for when we're done.
////////////////////////////////////////////////////////////////////// Decode //




////////////////////////////////////////////////////////////////////////////////
// Execute + Memory = ALU + DataMem
//
// Note: You do not need to structure blocks in the same way as the sample code.
//       Your procesor may wish to do something else (but does not have to).

// You can declare local wires if it makes sense, for instance
// if you need an local mux for the inpu

//ALUSrcMux
//Choose what the Second Input to the ALU will be
// If ALUSrc = 00, then InputB = DataOut2
mux3x1 ALUSrcMux (
    .in0    (DataOut2),
    .in1    (SignExtImm),
    .in2    (Target),
    .in3    ({5'b0, Instruction[2:0]}),
    .sel    (ALUSrc),
    .out    (InputB)
);

//Another ALUSrc controller, switch INPUT A to be equal to Reg0
//IF we are doing a LUT AND
always_comb  begin
  if(ALUSrc == 2'b10)
    InputA = Reg0;
  else 
    InputA = DataOut1;
end

ALU ALU1 (
  .InputA  (InputA),
  .InputB  (InputB),
  .OP      (Instruction[8:6]),
  .Out     (ALUOut),
  .Zero    (ZeroFlag)
);


DataMem DM1(
  .Clk          (Clk),
  .WriteEn      (DatWen),
  .Address      (DataOut1),
  .DataIn       (Reg0),
  .DataOut      (MemoryDataOut)
);

//MemToReg MUX
//If MemToReg = 0 then RegWrData is ALUOut
//If MemToReg = 1, then RegWrData is MemoryDataOut
mux2x1  DataMux1 (
    .in0    (ALUOut),
    .in1    (MemoryDataOut),
    .sel    (MemToReg),
    .out    (RegWrData)
);

// An output mux from this block, are we using the ALU result or the memory
// result this cycle?  Controlled by Ctrl1 -- must be high for load from
// data_mem; otherwise usually low
//////////////////////////////////////////////////////////// Execute + Memory //


////////////////////////////////////////////////////////////////////////////////
// Extras

// count number of cycles executed
// not part of main design, potentially useful for performance measure...
// This one halts when Ack is high
endmodule

