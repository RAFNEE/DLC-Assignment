module o_logic(state, La, Lb);
	input [2:0] state;
	output [1:0] La, Lb;
	
	wire La1_w, Lb1_w;
	
	// instance La1
	_and2 La1_and2(.a(~(state[0])), .b(state[1]), .y(La1_w));
	_or2	La1_or2(.a(La1_w), .b(state[2]), .y(La[1]));
	
	// instance La0
	_or2 La0_or2(.a(state[0]), .b(state[2]), .y(La[0]));
	
	// instance Lb1
	_and2 Lb1_and2(.a(~(state[0])), .b(state[1]), .y(Lb1_w));
	_or2 Lb1_or2(.a(Lb1_w), .b(~(state[2])), .y(Lb[1]));
	
	// instance Lb0
	_or2 Lb0_or2(.a(state[0]), .b(~(state[2])), .y(Lb[0]));
	
endmodule
