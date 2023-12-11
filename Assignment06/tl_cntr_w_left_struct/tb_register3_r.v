`timescale 1ns/100ps

module tb_register3_r;
	reg clk, reset_n;
	reg [2:0] d;
	wire [2:0] q;
	
	_register3_r Unit_register3_r(.clk(clk), .reset_n(reset_n), .d(d), .q(q));
	
	always begin
	
	#5; clk = ~clk;		// generate clock
	
	end
	
	initial begin
	
	// initialize signals
	clk = 0; reset_n = 0; d = 3'b000;
	
	#10; d = 3'b001;
	#14; d = 3'b110;
	
	#6; reset_n = 1;
	#7; d = 3'b100;
	#8; d = 3'b010;
	#10; d = 3'b001;
	#8; d = 3'b101;
	#10; d = 3'b000;
	#2; d = 3'b111;
	
	#4; reset_n = 0;
	#6; d = 3'b011;
	
	#10; $finish;
	
	end
	
endmodule
