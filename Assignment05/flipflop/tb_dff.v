`timescale 1ns/100ps

module tb_dff;
	reg clk;
	reg d;
	wire q;
	wire q_bar;
	
	// instance d-flipflop
	_dff Unit_dff(.clk(clk), .d(d), .q(q), .q_bar(q_bar));
	
	always begin
	
	#5 clk = ~clk; // generate clock
	
	end

	initial begin
	
	// initialize signals
	clk = 0; d = 0;
	
	// check q and q_bar when clk is 1
	#14; d = 1;
	#7; d = 0;
	#7; d = 1;
	#14; d = 0;
	
	// finish the simulation
	#10; $finish;
	
	end
	
endmodule
