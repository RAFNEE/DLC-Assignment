`timescale 1ns/100ps

module tb_register8_r;
	reg clk, reset_n;
	reg [7:0] d;
	wire [7:0] q;

	_register8_r Unit_register8_r(.clk(clk), .reset_n(reset_n), .d(d), .q(q));

	always begin

	#5; clk = ~clk; // generate clock
	  
	end

	initial begin

	// initialize signals
	clk = 0; reset_n = 0; d = 8'b00000000;

	// release reset
	#10; reset_n = 1; d = 8'b10101010;

	#10; d = 8'b11001100;

	#10; d = 8'b11110000;

	// finish the simulation
	#10; $finish;
	  
	end
 
endmodule
