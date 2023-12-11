`timescale 1ns/100ps

module tb_dff_en;
	reg clk, en, d;
	wire q;
	
	// instance enabled d-flipflop
	_dff_en Unit_dff_en(.clk(clk), .en(en), .d(d), .q(q));
	
	always begin
	
	#5; clk = ~clk;		// generate clock
	
	end
	
	initial begin
	
	// initialize signals
	clk = 0; en = 1; d = 0;
	
	// check q is correct in random delay
	#3; d = 1;
	#4; d = 0;
	#2; d = 1;
	#7; d = 0;
	#10; d = 1;
	
	// enabled signal is 0
	#3; en = 0;
	#3; d = 1;
	#4; d = 0;
	#2; d = 1;
	#7; d = 0;
	#10; d = 1; en = 1;
	#6; d = 0;
	
	// finish the simulation
	#10; $finish;
	
	end
	
endmodule
	