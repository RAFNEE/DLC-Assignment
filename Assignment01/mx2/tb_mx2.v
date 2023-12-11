`timescale 1ns/100ps		// set timescale unit/precision

module tb_mx2;

	reg d0, d1, s;		// declare 3 inputs for 2 in 1 mux
	wire y;		// declare 1 output for 2 in 1 mux
	
	mx2 mx20(d0, d1, s, y);		// execute mx2
	
	initial begin		// for 8 cases with the tower of 2 to 3
	#0; d0 = 0; d1 = 0; s = 0;
	#10; d0 = 0; d1 = 0; s = 1;
	
	#10; d0 = 0; d1 = 1; s = 0;
	#10; d0 = 0; d1 = 1; s = 1;
	
	#10; d0 = 1; d1 = 0; s = 0;
	#10; d0 = 1; d1 = 0; s = 1;
	
	#10; d0 = 1; d1 = 1; s = 0;
	#10; d0 = 1; d1 = 1; s = 1;
	#10;
	
	end		// initial end
endmodule
