`timescale 1ns/100ps

module tb_multiplier;
	reg clk, reset_n, op_start, op_clear;
	reg [63:0] multiplier, multiplicand;
	wire op_done;
	wire [127:0] result;
	
	multiplier Unit_multiplier(.clk(clk), .reset_n(reset_n), .op_start(op_start), .op_clear(op_clear), .multiplier(multiplier), .multiplicand(multiplicand), .op_done(op_done), .result(result));
	
	always begin
	
	#5; clk = ~clk;		// generate clock
	
	end
	
	initial begin
	
	// initialize signals
	clk = 0;
	reset_n = 0;
	op_start = 0;
	op_clear = 0;
	multiplier = 64'b0; multiplicand = 64'b0;
	
	// start test
	// 1100 x (-10)
	#9; reset_n = 1; op_start = 1; multiplier = 64'd1100; multiplicand = ~(64'd9);
	#750; op_clear = 1; op_start = 0;
	
	// 7 x 7
	#30; op_clear = 0; op_start = 1; multiplier = 64'd7; multiplicand = 64'd7;
	#750; op_clear = 1; op_start = 0;
	
	// -19 x 10
	#30; op_clear = 0; op_start = 1; multiplier = ~(64'd18); multiplicand = 64'd10;
	#750; op_clear = 1; op_start = 0;
	
	// -54542311 x (-65536)
	#30; op_clear = 0; op_start = 1; multiplier = ~(64'd54542310); multiplicand = ~(64'd65535);
	#750; op_clear = 1; op_start = 0;
	
	// 9223372036854775807 x 1000000000000000000
	#30; op_clear = 0; op_start = 1; multiplier = 64'd922_3372_0368_5477_5807; multiplicand = 64'd100_0000_0000_0000_0000;
	#750; op_clear = 1; op_start = 0;
	
	// finish the simulation
	#10; $finish;
	
	end
	
endmodule
