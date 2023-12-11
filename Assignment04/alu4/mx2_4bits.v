module mx2_4bits(d0, d1, s, y);
	input [3:0] d0, d1;
	input s;
	output [3:0] y;
	
	// instance 2 to 1 mux
	mx2 mux20(.d0(d0[0]), .d1(d1[0]), .s(s), .y(y[0]));
	mx2 mux21(.d0(d0[1]), .d1(d1[1]), .s(s), .y(y[1]));
	mx2 mux22(.d0(d0[2]), .d1(d1[2]), .s(s), .y(y[2]));
	mx2 mux23(.d0(d0[3]), .d1(d1[3]), .s(s), .y(y[3]));
	
endmodule
