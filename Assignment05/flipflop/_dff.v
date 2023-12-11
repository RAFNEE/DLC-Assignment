module _dff(clk, d, q, q_bar);
	input clk, d;
	output q, q_bar;
	wire clk_bar, w_q;
	
	_inv Unit_inv(.a(clk), .y(clk_bar));		// inverting clock
	
	// instance d-latch
	_dlatch U0_dlatch(.clk(clk_bar), .d(d), .q(w_q));		// get w_q to connect next d
	_dlatch U1_dlatch(.clk(clk), .d(w_q), .q(q), .q_bar(q_bar));
	
endmodule
