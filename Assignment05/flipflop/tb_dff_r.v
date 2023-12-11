`timescale 1ns/100ps

module tb_dff_r;
	reg clk, reset_n, d;
	wire q;
	
	// instance resetable d-flipflop
	_dff_r Unit_dff_r(.clk(clk), .reset_n(reset_n), .d(d), .q(q));
	
	always begin
	
	#5; clk = ~clk;		// generate clock
	
	end
	
	initial begin
	
	// initialize signals
	clk = 0; reset_n = 1; d = 0;
	
	// when reset is 0, check q values by d
	#8; reset_n = 0; d = 1;
	#6; d = 0;
	#3; d = 1;
	#9; d = 0;
	#6; d = 1;
	#7; d = 0;
	#4; d = 1;
	#5; d = 0;
	
	// finish the simulation
	#10; $finish;
	
	end
	
endmodule
