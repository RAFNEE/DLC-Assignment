module ha(a, b, co, s);		// half adder
	input a, b;
	output co, s;
	
	_xor2 xor20(a, b, s);		// s = a ^ b
	_and2 ad2(a, b, co);		// co = a & b
	
endmodule
