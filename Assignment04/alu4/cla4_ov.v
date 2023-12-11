module cla4_ov(a, b, ci, s, c3, co);
	input [3:0] a, b;
	input ci;
	output [3:0] s;
	output c3, co;		// 2 outputs of carry
	
	wire c1, c2;
	
	// instance four full adder without carry out for cla4
	fa_v2 fa0 (.a(a[0]), .b(b[0]), .ci(ci), .s(s[0]));
	fa_v2 fa1 (.a(a[1]), .b(b[1]), .ci(c1), .s(s[1]));
	fa_v2 fa2 (.a(a[2]), .b(b[2]), .ci(c2), .s(s[2]));
	fa_v2 fa3 (.a(a[3]), .b(b[3]), .ci(c3), .s(s[3]));
	
	// modified cla4 for 2 outputs of carry
	clb4 Unit_clb4(.a(a), .b(b), .ci(ci), .c1(c1), .c2(c2), .c3(c3), .co(co));
	
endmodule
