module mux3_32bit(d0, d1, d2, s, y);
	input [31:0] d0, d1, d2;
	input s;
	output [31:0] y;
	
	wire [31:0] x;
	
	// instance mux2_32bit
	mux2_32bit U0_mux2(.d0(d0), .d1(d1), .s(s), .y(x));
	mux2_32bit U1_mux2(.d0(x), .d1(d2), .s(s), .y(y));
	
endmodule
