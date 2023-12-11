module ns_logic(Ta, Tal, Tb, Tbl, state, next_state);
	input Ta, Tal, Tb, Tbl;
	input [2:0] state;
	output [2:0] next_state;
	
	wire D0_w0, D0_w1, D0_w2, D0_w3;
	wire D1_w0, D1_w1, D1_w2;
	wire D2_w0, D2_w1, D2_w2;
	
	// instance D0
	_and4 D0_U0_and4(.a(~(state[0])), .b(~(state[1])), .c(~(state[2])), .d(~(Ta)), .y(D0_w0));
	_and4 D0_U1_and4(.a(~(state[0])), .b(state[1]), .c(~(state[2])), .d(~(Tal)), .y(D0_w1));
	_and4 D0_U2_and4(.a(~(state[0])), .b(~(state[1])), .c(state[2]), .d(~(Tb)), .y(D0_w2));
	_and4 D0_U3_and4(.a(~(state[0])), .b(state[1]), .c(state[2]), .d(~(Tbl)), .y(D0_w3));
	_or4 D0_U4_or4(.a(D0_w0), .b(D0_w1), .c(D0_w2), .d(D0_w3), .y(next_state[0]));
	
	// instance D1
	_and3 D1_U0_and3(.a(state[0]), .b(~(state[1])), .c(~(state[2])), .y(D1_w0));
	_and2 D1_U1_and2(.a(~(state[0])), .b(state[1]), .y(D1_w1));
	_and3 D1_U2_and3(.a(state[0]), .b(~(state[1])), .c(state[2]), .y(D1_w2));
	_or3 D1_U3_or3(.a(D1_w0), .b(D1_w1), .c(D1_w2), .y(next_state[1]));
	
	// instance D2
	_and3 D2_U0_and3(.a(state[0]), .b(state[1]), .c(~(state[2])), .y(D2_w0));
	_and2 D2_U1_and2(.a(~(state[1])), .b(state[2]), .y(D2_w1));
	_and3 D2_U2_and3(.a(~(state[0])), .b(state[1]), .c(state[2]), .y(D2_w2));
	_or3 D2_U3_or3(.a(D2_w0), .b(D2_w1), .c(D2_w2), .y(next_state[2]));
	
endmodule
