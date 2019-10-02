module HalfAdder(
		input A,
		input B,
		input clk,
		output reg S,
		output reg Carry
		);
always @ (posedge clk)
	begin
		S = A ^ B;
		Carry = A & B;
	end
endmodule
