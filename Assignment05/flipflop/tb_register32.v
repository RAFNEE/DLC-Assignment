`timescale 1ns/100ps

module tb_register32;
	reg clk;
	reg [31:0] d;
	wire [31:0] q;
	
	_register32 Unit_register32(.clk(clk), .d(d[31:0]), .q(q[31:0]));
	
	always begin
	
	#5; clk = ~clk;		// generate clock
	
	end
	
	initial begin
	
	// initialize signals
	clk = 0; d = 32'h00000000;
	
	// check q value when clk is 1
	#7; d = 32'h0f18592c;
	#7; d = 32'hb230ae76;
	#10; d = 32'h758239d3;
	#4; d = 32'h920377ff;
	
	// finish the simulation
	#10; $finish;
	
	end
	
endmodule
