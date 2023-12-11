`timescale 1ns/100ps

module tb_tl_cntr;
	reg clk, reset_n, Ta, Tb;
	wire [1:0] La, Lb;
	
	tl_cntr Unit_tl_cntr(.clk(clk), .reset_n(reset_n), .Ta(Ta), .Tb(Tb), .La(La), .Lb(Lb));
	
	always begin
	
	#2; clk = ~clk;		// generate clock
	
	end
	
	initial begin
	
	// initialize signals
	clk = 0; reset_n = 0; Ta = 0; Tb = 0;
	#10; Ta = 0; Tb = 1;
	
	// test
	#6; Ta = 1; Tb = 0; reset_n = 1;
	#12; Ta = 0; Tb = 0;
	#7; Ta = 1; Tb = 1;
	#8; Tb = 0;
	#9; Ta = 1; Tb = 1;
	#3; Ta = 0;
	#7; Tb = 0;
	
	#10; $finish;
	
	end
	
endmodule
