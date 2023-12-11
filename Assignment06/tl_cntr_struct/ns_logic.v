module ns_logic(Ta, Tb, state, next_state);
	input Ta, Tb;
	input [1:0] state;
	output [1:0] next_state;
	
	wire w0, w1;
	
	// instance D0
	_and3 U0_and3(.a(~(state[0])), .b(~(state[1])), .c(~(Ta)), .y(w0));
	_and3 U1_and3(.a(~(state[0])), .b(state[1]), .c(~(Tb)), .y(w1));
	_or2 U0_or2(.a(w0), .b(w1), .y(next_state[0]));
	
	// instance D1
	_xor2 U0_xor2(.a(state[0]), .b(state[1]), .y(next_state[1]));
	
endmodule
