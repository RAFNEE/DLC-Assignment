module rca4(a, b, ci, co, s);
	input [3:0] a,b;
	input ci;
	output [3:0] s;
	output co;
	
	wire [2:0] c;
	
	// connect with 4 full adders
	fa fa0(.a(a[0]), .b(b[0]), .ci(ci), .co(c[0]), .s(s[0]));
	fa fa1(.a(a[1]), .b(b[1]), .ci(c[0]), .co(c[1]), .s(s[1]));
	fa fa2(.a(a[2]), .b(b[2]), .ci(c[1]), .co(c[2]), .s(s[2]));
	fa fa3(.a(a[3]), .b(b[3]), .ci(c[2]), .co(co), .s(s[3]));
	
endmodule
