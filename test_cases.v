module test_cases(
	output reg [31:0] plaintext,
	output reg [31:0] exponent,
	output reg [31:0] modulus,
	input clk
);

	always @(posedge clk)begin
		plaintext <= 101;
		exponent <= 3;
		modulus <= 257;
	end
endmodule
