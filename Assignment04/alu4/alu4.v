module alu4(a, b, op, result, c, n, z, v);
	input [3:0] a, b;
	input [2:0] op;
	output [3:0] result;
	output c, n, z, v;
	
	wire [3:0] w_add_b;
	wire [3:0] w_not_a, w_not_b, w_and, w_or, w_xor, w_xnor, w_add;
	wire c3_add, co_add;
	
	// inverting a, b in wire
	_inv_4bits a_inv_4bits (.a(a), .y(w_not_a));
	_inv_4bits b_inv_4bits (.a(b), .y(w_not_b));
	
	// instance logic gates
	_and2_4bits Unit_and2_4bits (.a(a), .b(b), .y(w_and));
	_or2_4bits Unit_or2_4bits (.a(a), .b(b), .y(w_or));
	_xor2_4bits Unit_xor2_4bits (.a(a), .b(b), .y(w_xor));
	_xnor2_4bits Unit_xnor2_4bits (.a(a), .b(b), .y(w_xnor));
	
	// instance 2 to 1 mux for cla input b
	mx2_4bits Unit_mx2_4bits (.d0(b), .d1(w_not_b), .s(op[0]), .y(w_add_b));
	
	// instance adder // 4-bit cla
	cla4_ov Unit_adder (.a(a), .b(w_add_b), .ci(op[0]), .s(w_add), .c3(c3_add), .co(co_add));
	
	// instance 8 to 1 mux to operate each logic by operation code
	mx8_4bits Unit_mx8_4bits (.a(w_not_a), .b(w_not_b), .c(w_and), .d(w_or), .e(w_xor), .f(w_xnor), .g(w_add), .h(w_add), .s2(op[2]), .s1(op[1]), .s0(op[0]), .y(result));
	
	// calculate 4 flags in operator
	cal_flags4 Unit_cal_flags4 (.op(op), .result(result), .co_add(co_add), .c3_add(c3_add), .c(c), .n(n), .z(z), .v(v));
	
endmodule
