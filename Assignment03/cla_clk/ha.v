module ha(a, b, co, s);
	input a, b;
	output co, s;
	
	// instance carry out and sum with assign
	assign co = a & b;
	assign s = a ^ b;
	
endmodule
