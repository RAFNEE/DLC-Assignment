`timescale 1ns/100ps

module tb_tl_cntr_w_left_struct;
	reg clk, reset_n, Ta, Tal, Tb, Tbl;
	wire [1:0] La, Lb;
	
	tl_cntr_w_left_struct Unit_tl_cntr_w_left_struct(.clk(clk), .reset_n(reset_n), .Ta(Ta), .Tal(Tal), .Tb(Tb), .Tbl(Tbl), .La(La), .Lb(Lb));
	
	always begin
	
	#2; clk = ~clk;		// generate clock
	
	end
	
	initial begin
	
	// initialize signals
	clk = 0; reset_n = 0; Ta = 0; Tal = 0; Tb = 0; Tbl = 0;
	
	// test when reset is active-low
	#4; Ta = 0; Tal = 1; Tb = 0; Tbl = 1;
	#3; Ta = 1;
	
	// test
	#5; reset_n = 1;
	#6; Ta = 0;
	#8; Tal = 0; Tb = 1;
	#9; Tb = 0;
	#14; Tbl = 0; Ta = 1;
	#10; Ta = 0; Tb = 1;
	#8; Ta = 1;
	
	// finish the simulation
	#10; $finish;
	
	end

endmodule
