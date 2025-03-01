module rsa(
	input clk,
	input rst,
	input [31:0] plaintext,
	input [31:0] exponent,
	input [31:0] modulus,
	output reg[31:0] ciphertext
);

	reg [31:0] result;
	reg [31:0] base;
	reg [31:0] exp;
	reg [31:0] mod;
	reg calculating;
	
	always @(posedge clk or posedge rst) begin
		if (rst) begin
			result <= 1;
			base <= 0;
			exp <= 0;
			mod <= 0;
			ciphertext <= 0;
			calculating <= 1;
			
		end else if (calculating)begin
			if(exp==0) begin
				ciphertext <= result;
				calculating <=0;
			end else begin
				if(exp[0] == 1) begin
					result <= (result * base)%mod;
				end
				base <= (base*base)%mod;
				exp <= exp >>1;	
			end
		end 
	end
endmodule
