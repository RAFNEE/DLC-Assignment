module rca32(a, b, ci, co, s); 
	input [31:0] a,b;
	input ci;
	output [31:0] s;
	output co;
	
	wire [6:0] w;
	
	//	instance 32-bit rca with 4-bit Ripple carry adders
	rca4 rca40(.a(a[3:0]), .b(b[3:0]), .ci(ci), .co(w[0]), .s(s[3:0]));
	rca4 rca41(.a(a[7:4]), .b(b[7:4]), .ci(w[0]), .co(w[1]), .s(s[7:4])); 
	rca4 rca42(.a(a[11:8]), .b(b[11:8]), .ci(w[1]), .co(w[2]), .s(s[11:8])); 
	rca4 rca43(.a(a[15:12]), .b(b[15:12]), .ci(w[2]), .co(w[3]), .s(s[15:12]));
	rca4 rca44(.a(a[19:16]), .b(b[19:16]), .ci(w[3]), .co(w[4]), .s(s[19:16]));
	rca4 rca45(.a(a[23:20]), .b(b[23:20]), .ci(w[4]), .co(w[5]), .s(s[23:20]));
	rca4 rca46(.a(a[27:24]), .b(b[27:24]), .ci(w[5]), .co(w[6]), .s(s[27:24]));
	rca4 rca47(.a(a[31:28]), .b(b[31:28]), .ci(w[6]), .co(co), .s(s[31:28]));
	
endmodule
