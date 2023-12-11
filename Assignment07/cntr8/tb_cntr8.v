`timescale 1ns/100ps

module tb_cntr8;
	reg clk, reset_n, inc, load;
	reg [7:0] d_in;
	wire [7:0] d_out;
	wire [2:0] o_state;
	
	cntr8 Unit_cntr8(.clk(clk), .reset_n(reset_n), .inc(inc), .load(load), .d_in(d_in), .d_out(d_out), .o_state(o_state));
	
	always begin
	
	#2; clk = ~clk;		// generate clock
	
	end
	
	initial begin
	
	// initial begin
	clk = 0; reset_n = 0; inc = 0; load = 0; d_in = 8'h00;
	
	#7; inc = 1; d_in = 8'h0f;
	#2; reset_n = 1; inc = 0; load = 1;
	#5; inc = 1;
	#3; load = 0;
	#6; inc = 0;
	#8; load = 1; d_in = 8'hcd;
	#3; load = 0; inc = 1;
	#9; reset_n = 0;
	#4; reset_n = 1; inc = 0;
	
	// finish the simulation
	#10; $finish;
	
	end
	
endmodule