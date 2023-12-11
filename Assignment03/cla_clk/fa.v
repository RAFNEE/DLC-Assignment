module fa(a, b, ci, co, s);		// full adder
	input a, b, ci;		// 1-bit input a, b and cin
	output co, s;		// 1-bit output cout and sum
	wire c1, c2, sw;		// wire
	
	// connect 2 half adders
	ha ha0(.a(b), .b(ci), .co(c1), .s(sw));
	ha ha1(.a(a), .b(sw), .co(c2), .s(s));
	_or2 or20(.a(c1), .b(c2), .y(co));
	
endmodule
