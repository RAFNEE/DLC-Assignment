module tl_cntr_w_left_struct(clk, reset_n, Ta, Tal, Tb, Tbl, La, Lb);
	input clk, reset_n, Ta, Tal, Tb, Tbl;
	output [1:0] La, Lb;
	
	wire [2:0] state, next_state;
	
	// instance structural traffic controller with left
	ns_logic Unit_ns_logic(.Ta(Ta), .Tal(Tal), .Tb(Tb), .Tbl(Tbl), .state(state), .next_state(next_state));
	_register3_r Unit_register3_r(.clk(clk), .reset_n(reset_n), .d(next_state), .q(state));
	o_logic Unit_o_logic(.state(state), .La(La), .Lb(Lb));
	
endmodule
