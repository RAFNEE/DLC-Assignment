module _register2_r(clk, reset_n, d, q);
	input clk, reset_n;
	input [1:0] d;
	output [1:0] q;
	
	// instance Asynchronous D flip-flop
	_dff_r_async U0_dff_r_async(.clk(clk), .reset_n(reset_n), .d(d[0]), .q(q[0]));
	_dff_r_async U1_dff_r_async(.clk(clk), .reset_n(reset_n), .d(d[1]), .q(q[1]));
	
endmodule
