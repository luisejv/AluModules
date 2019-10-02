`include "Mux2to1.v"
`include "Adder.v"

module ALU (
		input [31:0] A,
		input [31:0] B,
		input [3:0] AluOpCode,
		input clk, 
		output reg [31:0] Result,
		output reg Zero
		);

wire [31:0] NandOutput, OrOutput, AndOutput, XorOutput, NorOutput, MuxOut1, MuxOut2, MuxOut3, MuxOut4;

assign NandOutput = ~(A & B);
assign OrOutput = A | B;
assign XorOutput = NandOutput & OrOutput;
assign AndOutput = ~NandOutput;
assign NorOutput = ~OrOutput;
Mux2to1 mux1 (AndOutput, OrOutput, AluOpCode[0], clk, MuxOut1);
Mux2to1 mux2 (XorOutput, NorOutput, AluOpCode[0], clk, MuxOut2);
Mux2to1 mux3 (MuxOut1, MuxOut2, AluOpCode[1], clk, MuxOut3);
Mux2to1 mux4 (ArithOutput, MuxOut3, AlupOpCode[2], clk, Result);

//assign Zero =  
endmodule
