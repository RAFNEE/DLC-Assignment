`timescale 1ns/100ps

module tb_register3_r;
	reg clk, reset_n;
	reg [2:0] d;
	wire [2:0] q;

	_register3_r Unit_register3_r(.clk(clk), .reset_n(reset_n), .d(d), .q(q));

	always begin

	#5; clk = ~clk; // generate clock
	  
	end

	initial begin

	// initialize signals
	clk = 0; reset_n = 0; d = 3'b000;

	// release reset
	#10; reset_n = 1; d = 3'b010;

	#10; d = 3'b100;

	#10; d = 3'b111;

	// finish the simulation
	#10; $finish;
	  
	end
 
endmodule
