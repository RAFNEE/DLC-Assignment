`timescale 1ns/100ps

module tb_mx4;
	reg d0, d1, d2, d3;
	reg [1:0] s;
	wire y;

	mx4 Unit_mx4(.d0(d0), .d1(d1), .d2(d2), .d3(d3), .s(s), .y(y));

	initial begin

	// initialize signals
	d0 = 1; d1 = 0; d2 = 0; d3 = 1; s= 2'b00;

	#10; s = 2'b00;		// y = d0
	#5; s = 2'b01;		// y = d1
	#5; s = 2'b10;		// y = d2
	#5; s = 2'b11;		// y = d3

	// finish the simulation
	#10; $finish;

	end
	 
endmodule
