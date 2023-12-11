module _dff_r(clk, reset_n, d, q);
	input clk, reset_n, d;
	output q;
	
	wire w_d, reset;
	
	_inv Unit_inv(.a(reset_n), .y(reset));		// inverting reset
	_and2 Unit_and2(.a(d), .b(reset), .y(w_d));		// and logic between d and reset
	_dff Unit_dff(.clk(clk), .d(w_d), .q(q));		// instance d-flipflop
	
endmodule
