`timescale 1ns/100ps

module tb_rca4;
	reg [3:0] a, b;
	reg ci;
	wire [3:0] s;
	wire co;
	
	rca4 tb_rca40(a, b, ci, co, s);
	
	initial begin
	
	#0	a = 4'b0000; b = 4'b0000; ci = 1'b0;		// all zeros
	#10 a = 4'b0001; b = 4'b0000; ci = 1'b0;		// test s is 0001
	#10 a = 4'b0001; b = 4'b0101; ci = 1'b1;		// test s is 0111 and is test carry right
	#10 a = 4'b0011; b = 4'b0001; ci = 1'b1;		// test s is 0101 and is test carry right
	#10 a = 4'b1110; b = 4'b0001; ci = 1'b0;		// test s is 1111 and are all bits right
	#10 a = 4'b1001; b = 4'b0100; ci = 1'b1;		// test s is 1110 and is test carry right
	
	#10 a = 4'b1010; b = 4'b0101; ci = 1'b1;		// overflow and is test carry right / result is 0000 / in 5-bit 10000
	#10 a = 4'b1111; b = 4'b0001;	ci = 1'b0;		// overflow / s result is 0000 / in 5-bit 10000
	#10 a = 4'b1001; b = 4'b0111; ci = 1'b1;		// overflow / s result is 0001 / in 5-bit 10001
	
	#10 $finish;		// end testbench
	
	end
	
endmodule
