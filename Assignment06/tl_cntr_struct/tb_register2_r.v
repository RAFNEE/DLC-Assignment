`timescale 1ns/100ps

module tb_register2_r;
	reg clk, reset_n;
	reg [1:0] d;
	wire [1:0] q;
	
	_register2_r Unit_register2_r(.clk(clk), .reset_n(reset_n), .d(d), .q(q));
	
	always begin
	
	#5; clk = ~clk;		// generate clock
	
	end
	
	initial begin
	
	// initialize signals
	clk = 0; reset_n = 0; d = 2'b00;
	
	#10; d = 2'b01;
	#14; d = 2'b11;
	
	#6; reset_n = 1;
	#7; d = 2'b10;
	#8; d = 2'b00;
	#10; d = 2'b01;
	#8; d = 2'b11;
	
	#4; reset_n = 0;
	#6; d = 2'b01;
	
	#10; $finish;
	
	end
	
endmodule
