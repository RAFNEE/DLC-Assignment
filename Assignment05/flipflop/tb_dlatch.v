`timescale 1ns/100ps

module tb_dlatch;
	reg clk;
	reg d;
	wire q;
	wire q_bar;
	
	// instance dlatch
	_dlatch Unit_dlatch (.clk(clk), .d(d), .q(q), .q_bar(q_bar));
	
	always begin
	
	#5 clk = ~clk;		// generate clock
	 
	end
	
	initial begin
	
	// initialize signals
	clk = 0;
	d = 0;
	
	// input d is 0
	#7; d = 0;
	 
	// input d is 1
	#7; d = 1;
	#7; d = 0;
	#7; d = 1;
	#10; d = 0;
	 
	// finish the simulation
	#10; $finish;
	 
	end
	
endmodule
