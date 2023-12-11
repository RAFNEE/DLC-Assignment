`timescale 1ns/100ps

module tb_dff_r_sync_async;
	reg clk, reset_n, d;
	wire q_sync, q_async;
	
	// instance dff_r_sync_async
	_dff_r_sync_async Unit_dff_r_sync_async(.clk(clk), .reset_n(reset_n), .d(d), .q_sync(q_sync), .q_async(q_async));
	
	always begin
	
	#5; clk = ~clk;		// generate clock
	
	end
	
	initial begin
	
	// initialize signals
	clk = 0; reset_n = 0; d = 0;
	
	// check q values
	#10; reset_n = 1; d = 1;
	#4; d = 0;
	#7; d = 1;
	#6; d = 0;
	#3; reset_n = 0;		// check the difference between synchronous and asynchronous
	
	// check q is converted by d while reset is active_low
	#10; d = 0;
	#3; d = 1;
	#6; d = 0;
	#7; d = 1;
	
	#4;reset_n = 1;
	
	#10; $finish;
	
	end
	
endmodule
