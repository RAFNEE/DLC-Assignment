module _dff_en(clk, en, d, q);
	input clk, en, d;
	output q;
	
	wire w_d;
	
	mx2 Unit_mx2(.d0(q), .d1(d), .s(en), .y(w_d));		// select value with multiplexer
	_dff Unit_dff(.clk(clk), .d(w_d), .q(q));		// d-flipflop
	
endmodule
