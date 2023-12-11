module _and2(a, b, y);		// 2 to 1 and gate
	input a, b;
	output y;
	
	assign y = a & b;
	
endmodule

module _nand2(a, b, y);		// 2 to 1 nand gate
	input a, b;
	output y;
	
	assign y = ~(a & b);
	
endmodule

module _or2(a, b, y);		// 2 to 1 or gate
	input a, b;
	output y;
	
	assign y = a | b;
	
endmodule

module _inv(a, y);		// inverter
	input a;
	output y;
	
	assign y = ~a;
	
endmodule

module _xor2(a, b, y);		// 2 to 1 exclusive or gate
	input a, b;
	output y;
	wire inv_a, inv_b;
	wire w0, w1;
	
	// inverting a and b
	_inv inv0(.a(a), .y(inv_a));
	_inv inv1(.a(b), .y(inv_b));
	
	// use two and gates for between a and not b or between not a and b
	_and2 ad20(a, inv_b, w0);
	_and2 ad21(b, inv_a, w1);
	
	// connect both result of two and gates with or gate
	_or2 or20(w0, w1, y);
	
endmodule

module _and3(a, b, c, y);		// 3 to 1 and gate
	input a, b, c;
	output y;
	
	assign y = a & b & c;
	
endmodule

module _and4(a, b, c, d, y);		// 4 to 1 and gate
	input a, b, c, d;
	output y;
	
	assign y = a & b & c & d;
	
endmodule

module _and5(a, b, c, d, e, y);		// 5 to 1 and gate
	input a, b, c, d, e;
	output y;
	
	assign y = a & b & c & d & e;
	
endmodule

module _or3(a, b, c, y);		// 3 to 1 or gate
	input a, b, c;
	output y;
	
	assign y = a | b | c;
	
endmodule

module _or4(a, b, c, d, y);		// 4 to 1 or gate
	input a, b, c, d;
	output y;
	
	assign y = a | b | c | d;
	
endmodule

module _or5(a, b, c, d, e, y);		// 5 to 1 or gate
	input a, b, c, d, e;
	output y;
	
	assign y = a | b | c | d | e;
	
endmodule
