module fa(a, b, ci, co, s);		// full adder
	input a, b, ci;		// 1-bit input a, b and cin
	output co, s;		// 1-bit output cout and sum
	wire c1, c2, sm;		// wire
	
	// connect 2 half adders
	ha ha0(b, ci, c1, sm);
	ha ha1(a, sm, c2, s);
	_or2 or20(c1, c2, co);
	
endmodule
