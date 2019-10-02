`include "FullAdder.v"
`include "HalfAdder.v"

module FullAdder(
		input [31:0] A,
		input [31:0] B,
		output reg [31:0] C
		);
wire [31:0] carryIn; 
wire carryOut;
genvar i;
generate
for (i = 0; i < 32; i = i + 1)
	begin
		if (i==0)
			begin
				half_adder hadd (A[i], B[i], C[i], carryIn[i]);
			end
		else
			begin
				full_adder fadd (A[i], B[i], C[i], carryIn[i-1], C[i], carryIn[i]);
			end
	end
assign carryOut = carryIn[31];
endgenerate			
endmodule
