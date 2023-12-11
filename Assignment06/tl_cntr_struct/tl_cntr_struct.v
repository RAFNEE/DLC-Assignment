module tl_cntr_struct(clk, reset_n, Ta, Tb, La, Lb);
	input clk, reset_n, Ta, Tb;
	output [1:0] La, Lb;
	
	wire [1:0] state, next_state;
	
	// instance structural traffic controller
	ns_logic Unit_ns_logic(.Ta(Ta), .Tb(Tb), .state(state), .next_state(next_state));
	_register2_r Unit_register2_r(.clk(clk), .reset_n(reset_n), .d(next_state), .q(state));
	o_logic Unit_o_logic(.state(state), .La(La), .Lb(Lb));
	
endmodule
