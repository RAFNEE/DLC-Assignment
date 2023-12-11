module alu32(a, b, op, result, c, n, z, v);
	input [31:0] a, b;
	input [2:0] op;
	output [31:0] result;
	output c, n, z, v;
	
	wire [31:0] w_add_b;
	wire [31:0] w_not_a,w_not_b, w_and, w_or, w_xor, w_xnor, w_add;
	wire co_prev, co_add;
	
	// inverting a, b in wire
	_inv_32bits a_inv_32bits (.a(a), .y(w_not_a));
	_inv_32bits b_inv_32bits (.a(b), .y(w_not_b));
	
	// instance logic gates
	_and2_32bits Unit_and2_32bits (.a(a), .b(b), .y(w_and));
	_or2_32bits Unit_or2_32bits (.a(a), .b(b), .y(w_or));
	_xor2_32bits Unit_xor2_32bits (.a(a), .b(b), .y(w_xor));
	_xnor2_32bits Unit_xnor2_32bits (.a(a), .b(b), .y(w_xnor));
	
	// instance 2 to 1 mux for cla input b
	mx2_32bits Unit_mux_b (.d0(b), .d1(w_not_b), .s(op[0]), .y(w_add_b));
	
	// instance adder // 4-bit cla
	cla32_ov Unit_adder (.a(a), .b(w_add_b), .ci(op[0]), .s(w_add), .co_prev(co_prev), .co(co_add));
	
	// instance 8 to 1 mux to operate each logic by operation code
	mx8_32bits Unit_mx8_32bits (.a(w_not_a), .b(w_not_b), .c(w_and), .d(w_or), .e(w_xor), .f(w_xnor), .g(w_add), .h(w_add), .s2(op[2]), .s1(op[1]), .s0(op[0]), .y(result));
	
	// calculate 4 flags in operator
	cal_flags32 Unit_cal_flags32 (.op(op), .result(result), .co_add(co_add), .co_prev_add(co_prev), .c(c), .n(n), .z(z), .v(v));
	
endmodule
