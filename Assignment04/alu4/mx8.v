module mx8(a, b, c, d, e, f, g, h, s2, s1 ,s0, y);
	input a, b, c, d, e, f, g, h;
	input s2, s1, s0;
	output y;
	
	wire w0, w1, w2, w3, w4 ,w5;
	
	// instance 2 to 1 mux
	mx2 mx20(.d0(a), .d1(b), .s(s0), .y(w0));
	mx2 mx21(.d0(c), .d1(d), .s(s0), .y(w1));
	mx2 mx22(.d0(e), .d1(f), .s(s0), .y(w2));
	mx2 mx23(.d0(g), .d1(h), .s(s0), .y(w3));
	
	mx2 mx24(.d0(w0), .d1(w1), .s(s1), .y(w4));
	mx2 mx25(.d0(w2), .d1(w3), .s(s1), .y(w5));
	
	mx2 mx26(.d0(w4), .d1(w5), .s(s2), .y(y));
	
endmodule
