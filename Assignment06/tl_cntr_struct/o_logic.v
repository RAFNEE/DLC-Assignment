module o_logic(state, La, Lb);
	input [1:0] state;
	output [1:0] La, Lb;
	
	// instance La1
	assign La[1] = state[1];
	
	// instance La0
	_and2 U0_and2(.a(state[0]), .b(~(state[1])), .y(La[0]));
	
	// instance Lb1
	assign Lb[1] = ~state[1];
	
	// instance Lb0
	_and2 U1_and2(.a(state[0]), .b(state[1]), .y(Lb[0]));
	
endmodule
