module Mux2to1(
		input [31:0] A,
		input [31:0] B,
		input AluOpcode,
		input clk,
		output reg [31:0] Out);

always @ (posedge clk)
	begin
		case(AluOpcode)
			1'b0: Out = A;
			1'b1: Out = B;
		endcase
	end
endmodule
