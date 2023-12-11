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

module _and5(a, b, c, d, e, y);		// 5 to 1 and gadte
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

module _inv_4bits(a, y);		// 4-bit inverter
	input [3:0] a;
	output [3:0] y;
	
	assign y = ~a;
	
endmodule

module _and2_4bits(a, b, y);		// 4-bit 2 to 1 and gate
	input [3:0] a, b;
	output [3:0] y;
	
	assign y = a & b;
	
endmodule

module _or2_4bits(a, b, y);		// 4-bit 2 to 1 or gate
	input [3:0] a, b;
	output [3:0] y;
	
	assign y = a | b;
	
endmodule

module _xor2_4bits(a, b, y);		// 4-bit 2 to 1 xor gate
	input [3:0] a, b;
	output [3:0] y;
	
	// instance 1-bit 2 to 1 xor gate
	_xor2 xor20(.a(a[0]), .b(b[0]), .y(y[0]));
	_xor2 xor21(.a(a[1]), .b(b[1]), .y(y[1]));
	_xor2 xor22(.a(a[2]), .b(b[2]), .y(y[2]));
	_xor2 xor23(.a(a[3]), .b(b[3]), .y(y[3]));
	
endmodule

module _xnor2_4bits(a, b, y);		// 4-bit 2 to 1 xnor gate
	input [3:0] a, b;
	output [3:0] y;
	wire [3:0] w;
	
	// use 4-bit 2 to 1 xor gate and inverting result with 4-bit inverter to get result of xnor
	_xor2_4bits xor20_4bits(.a(a), .b(b), .y(w));
	_inv_4bits inv_bits(.a(w), .y(y));
	
endmodule
	