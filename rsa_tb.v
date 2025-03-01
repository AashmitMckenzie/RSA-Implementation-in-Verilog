module rsa_tb;
	reg clk;
	reg rst;
	reg [31:0] plaintext;
	reg [31:0] exponent;
	reg [31:0] modulus;
	wire [31:0] cipertext;
	
	rsa uut(
		.clk(clk),
		.rst(rst),
		.plaintext(plaintext),
		.exponent(exponent),
		.modulus(modulus),
		.ciphertext(ciphertext)
	);
	
	initial begin
		clk=0;
		forever #5 clk = ~clk;
	end
	
	initial begin
		$monitor("Time=%0t | PLaintext=%d | Exponent=%d | Modulud=%d | Ciphertext=%d",
					$time, plaintext, exponent, modulus, cipertext);
		
		//test case 1: Basic
		rst = 1; #10;
		plaintext = 7;
		exponent = 3;
		modulus = 33;
		rst = 0;
		#100;
		
		//test case 2: Another
		rst = 1; #10;
		plaintext = 10;
		exponent = 3;
		modulus = 77;
		rst = 0;
		#100;
		
		//test case 1: Edge Case
		rst = 1; #10;
		plaintext = 2;
		exponent = 5;
		modulus = 11;
		rst = 0;
		#100;
		
		$finish;
	end
endmodule
