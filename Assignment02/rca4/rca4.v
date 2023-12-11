module rca4(a, b, ci, co, s);
	input [3:0] a, b;		// 4-bit input a and b
	input ci;		// 1-bit input cin
	output co;		// 1-bit output cout
	output [3:0] s;		// 4-bit output sum
	wire [2:0] c;		// 3-bit wire
	
	// connect 4 full adders to imply rca 4-bit
	fa fa0(a[0], b[0], ci, c[0], s[0]);
	fa fa1(a[1], b[1], c[0], c[1], s[1]);
	fa fa2(a[2], b[2], c[1], c[2], s[2]);
	fa fa3(a[3], b[3], c[2], co, s[3]);
	
endmodule
